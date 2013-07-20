object frmagendaVendedor: TfrmagendaVendedor
  Left = 79
  Top = 135
  Width = 1024
  Height = 548
  Caption = 'Agenda del Vendedor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  WindowState = wsMaximized
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnKeyUp = FormKeyUp
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object RzDBLabel11: TRzDBLabel
    Left = 88
    Top = 66
    Width = 79
    Height = 17
    Color = clBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentColor = False
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
    DataField = 'nombre'
    DataSource = dsoportunidades
  end
  object RzLabel4: TRzLabel
    Left = 4
    Top = 66
    Width = 28
    Height = 13
    Caption = 'Movil:'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object hojas: TRzPageControl
    Left = 0
    Top = 0
    Width = 1016
    Height = 514
    ActivePage = visualiza_eventos
    Align = alClient
    UseColoredTabs = True
    TabIndex = 0
    TabOrder = 0
    FixedDimension = 22
    object visualiza_eventos: TRzTabSheet
      Color = 15000804
      Caption = 'Actividades'
      OnEnter = visualiza_eventosEnter
      object Label1: TLabel
        Left = 656
        Top = 8
        Width = 114
        Height = 16
        Caption = 'Estatus del Evento:'
      end
      object gbdatos: TRzGroupBox
        Left = 11
        Top = 375
        Width = 777
        Height = 106
        BorderColor = clActiveCaption
        Caption = 'Datos de la Actividad'
        Color = clSilver
        Enabled = False
        FlatColor = clActiveCaption
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object RzLabel7: TRzLabel
          Left = 8
          Top = 16
          Width = 70
          Height = 16
          Caption = 'Actividad:'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel8: TRzLabel
          Left = 8
          Top = 56
          Width = 48
          Height = 16
          Caption = 'Fecha:'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel12: TRzLabel
          Left = 256
          Top = 16
          Width = 46
          Height = 16
          Caption = 'Notas:'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel14: TRzLabel
          Left = 158
          Top = 56
          Width = 39
          Height = 16
          Caption = 'Hora:'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object dtfecha: TRzDateTimeEdit
          Left = 8
          Top = 72
          Width = 143
          Height = 21
          EditType = etDate
          CharCase = ecUpperCase
          DisabledColor = clWhite
          Enabled = False
          FlatButtons = True
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FocusColor = 16776176
          FrameHotTrack = True
          FrameVisible = True
          ParentFont = False
          TabOrder = 1
          OnChange = edactividadChange
        end
        object rgrealizada: TRzRadioGroup
          Left = 586
          Top = 32
          Width = 89
          Height = 37
          Caption = 'Realizada'
          Color = 15000804
          Columns = 2
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ItemHotTrack = True
          ItemIndex = 0
          Items.Strings = (
            'NO'
            'SI')
          ParentFont = False
          TabOrder = 4
          OnClick = rgrealizadaClick
        end
        object btnguardar_act: TRzBitBtn
          Left = 686
          Top = 24
          Width = 80
          Caption = 'Guardar'
          Color = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          HotTrack = True
          ParentFont = False
          TabOrder = 5
          OnClick = btnguardar_actClick
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000730E0000730E00000001000000000000000000003300
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
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909
            090909090909090909E8E8E881818181818181818181818181E8E809101009E3
            1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
            1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
            1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
            E3E3E3E3E309101009E8E881ACAC81E3E3E3E3E3E381ACAC81E8E80910101009
            090909090910101009E8E881ACACAC818181818181ACACAC81E8E80910101010
            101010101010101009E8E881ACACACACACACACACACACACAC81E8E80910100909
            090909090909101009E8E881ACAC8181818181818181ACAC81E8E8091009D7D7
            D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E8091009D709
            0909090909D7091009E8E881AC81D7818181818181D781AC81E8E8091009D7D7
            D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E809E309D709
            0909090909D7090909E8E881E381D7818181818181D7818181E8E8091009D7D7
            D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E80909090909
            090909090909090909E8E88181818181818181818181818181E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
          NumGlyphs = 2
        end
        object mmobservacion: TRzMemo
          Left = 256
          Top = 33
          Width = 321
          Height = 59
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 3
          DisabledColor = clWhite
          FocusColor = 16776176
          FrameHotTrack = True
          FrameVisible = True
        end
        object btncancelar: TRzBitBtn
          Left = 686
          Top = 49
          Width = 80
          Caption = 'Cancelar'
          Color = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          HotTrack = True
          ParentFont = False
          TabOrder = 6
          Visible = False
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
        object dthora: TDateTimePicker
          Left = 159
          Top = 72
          Width = 89
          Height = 21
          Date = 38460.500000000000000000
          Time = 38460.500000000000000000
          Color = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Kind = dtkTime
          ParentFont = False
          TabOrder = 2
          OnChange = dthoraChange
          OnEnter = dthoraEnter
          OnExit = dthoraExit
        end
        object cboactividades: TRzComboBox
          Left = 8
          Top = 36
          Width = 241
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DisabledColor = clWhite
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          FlatButtons = True
          FocusColor = clSkyBlue
          FrameHotTrack = True
          FrameVisible = True
          ItemHeight = 13
          ParentCtl3D = False
          ParentFont = False
          TabOrder = 0
          OnChange = edactividadChange
          OnClick = cboactividadesClick
          OnNotInList = cboactividadesNotInList
          Items.Strings = (
            'VISITA'
            'LLAMADA')
        end
      end
      object cxrejilla_actividades: TcxGrid
        Left = 8
        Top = 208
        Width = 1000
        Height = 162
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        PopupMenu = pmmenu
        TabOrder = 1
        object vista1: TcxGridDBTableView
          DataController.DataSource = dsactividades
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnCellClick = vista1CellClick
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          OptionsView.CellAutoHeight = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object idevento: TcxGridDBColumn
            Caption = 'Id Evento'
            Options.Editing = False
            Options.Moving = False
            Width = 82
            DataBinding.FieldName = 'idevento'
          end
          object idvendedores: TcxGridDBColumn
            Caption = 'Id Vend'
            Options.Editing = False
            Options.Moving = False
            Width = 84
            DataBinding.FieldName = 'idvendedor'
          end
          object actividad: TcxGridDBColumn
            Caption = 'Actividad'
            Options.Editing = False
            Options.Moving = False
            Width = 179
            DataBinding.FieldName = 'actividad'
          end
          object observaciones: TcxGridDBColumn
            Caption = 'Observaciones'
            Options.Editing = False
            Options.Moving = False
            Width = 184
            DataBinding.FieldName = 'observaciones'
          end
          object realizada: TcxGridDBColumn
            Caption = 'Realizada'
            Options.Editing = False
            Options.Moving = False
            Width = 98
            DataBinding.FieldName = 'realizada'
          end
          object hora: TcxGridDBColumn
            Caption = 'Hora'
            Options.Editing = False
            Options.Moving = False
            Width = 74
            DataBinding.FieldName = 'hora'
          end
          object fecha: TcxGridDBColumn
            Caption = 'Fecha'
            Options.Editing = False
            Options.Moving = False
            Width = 74
            DataBinding.FieldName = 'fecha'
          end
        end
        object nivel1: TcxGridLevel
          GridView = vista1
        end
      end
      object cxrejilla_eventos: TcxGrid
        Left = 8
        Top = 32
        Width = 1000
        Height = 129
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        object cxrejilla_eventosvista: TcxGridDBTableView
          OnKeyUp = cxrejilla_eventosvistaKeyUp
          DataController.DataSource = dseventos
          DataController.Filter.Active = True
          DataController.Filter.AutoDataSetFilter = True
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnCellClick = cxrejilla_eventosvistaCellClick
          OptionsBehavior.IncSearch = True
          OptionsView.ColumnAutoWidth = True
          OptionsView.GroupByBox = False
          object cxprospecto: TcxGridDBColumn
            Caption = 'Id Oport'
            Options.Editing = False
            Options.Moving = False
            SortOrder = soAscending
            Width = 78
            DataBinding.FieldName = 'idoportunidad'
          end
          object cxnombre: TcxGridDBColumn
            Caption = 'Nombre'
            Options.Editing = False
            Options.Moving = False
            Width = 406
            DataBinding.FieldName = 'nombre'
          end
          object cxestatus: TcxGridDBColumn
            Caption = 'Estatus'
            Options.Editing = False
            Options.Moving = False
            Width = 199
            DataBinding.FieldName = 'status'
          end
          object cxvendedor: TcxGridDBColumn
            Options.Editing = False
            Options.Moving = False
            DataBinding.FieldName = 'Vendedor'
          end
          object cxidevento: TcxGridDBColumn
            Caption = 'Id Evento'
            Options.Editing = False
            Options.Moving = False
            Width = 87
            DataBinding.FieldName = 'idevento'
          end
          object cxrejilla_eventosvistaDBColumn1: TcxGridDBColumn
            Caption = 'Cuenta'
            DataBinding.FieldName = 'cuenta'
          end
        end
        object cxniveleventos: TcxGridLevel
          GridView = cxrejilla_eventosvista
        end
      end
      object btncrea_actividades: TRzBitBtn
        Left = 11
        Top = 176
        Width = 29
        Hint = 'Agendar Actividad'
        BiDiMode = bdLeftToRight
        HotTrack = True
        ParentBiDiMode = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btncrea_actividadesClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000330C0000330C00000001000000000000000000003300
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
          CEA3A3CEE8E8E8E8E8E8E8E8E8E8E8E8E28181E2E8E8E8E8E8E8E8E8A3A3A3A3
          A3CECEA3A3A3A3A3E8E8E8E88181818181E2E28181818181E8E8E8E8A3D5D7D2
          D2D2D2D2CECECEA3E8E8E8E881ACD7ACACACACACE2E2E281E8E8E8E8E8A3D5D7
          D2D2D2D2D2CEA3E8E8E8E8E8E881ACD7ACACACACACE281E8E8E8E8E8E8E8A3D2
          D2D2D2D2D2A3E8E8E8E8E8E8E8E881ACACACACACAC81E8E8E8E8E8E8E8E8A3D2
          D2D2D2D2D2A3E8E8E8E8E8E8E8E881ACACACACACAC81E8E8E8E8E8E8E8E8A3D2
          D2D2D2D2D2A3E8E8E8E8E8E8E8E881ACACACACACAC81E8E8E8E8E8E8E8E8A3D7
          D2D2D2D2D2A3E8E8E8E8E8E8E8E881D7ACACACACAC81E8E8E8E8E8E8E8E8CECE
          D7D2D2D2CECEE8E8E8E8E8E8E8E8E2E2D7ACACACE2E2E8E8E8E8E8E8E8E8E8A3
          D5D7D2D2A3E8E8E8E8E8E8E8E8E8E881ACD7ACAC81E8E8E8E8E8E8E8E8E8E8E8
          A3A3A3A3E8E8E8E8E8E8E8E8E8E8E8E881818181E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
      object lblactividades_evento: TcxLabel
        Left = 48
        Top = 176
        Width = 302
        Height = 24
        Caption = 'Detalle de actividades del Evento      '
        ParentColor = False
        ParentFont = False
        Style.BorderColor = clMaroon
        Style.BorderStyle = ebsNone
        Style.Color = 15000804
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -16
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 4
      end
      object lbleventos_vendedor: TcxLabel
        Left = 11
        Top = 6
        Width = 253
        Height = 24
        Caption = 'Eventos del Vendedor Actual   '
        ParentColor = False
        ParentFont = False
        Style.BorderColor = clMaroon
        Style.BorderStyle = ebsNone
        Style.Color = 15000804
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -16
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 5
      end
      object cbostatus: TRzComboBox
        Left = 792
        Top = 8
        Width = 217
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DisabledColor = clWhite
        DropDownCount = 20
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        FlatButtons = True
        FocusColor = clSkyBlue
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 6
        OnChange = edactividadChange
        OnClick = cbostatusClick
        OnExit = cbostatusExit
        OnNotInList = cbostatusNotInList
        Items.Strings = (
          'ASIGNADO AL VENDEDOR'
          'EN ATENCION POR EL VENDEDOR'
          'EN ESPERA DE AUTORIZACION'
          'RECHAZADA'
          'CANCELADA'
          'ACEPTADA')
      end
    end
    object datos_eventos: TRzTabSheet
      Color = clWhite
      Caption = 'Asignaci'#243'n de Eventos a Vendedores'
      object RzLabel1: TRzLabel
        Left = 0
        Top = 3
        Width = 148
        Height = 16
        Caption = 'Clave de la Oportunidad:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object gbdatos_prosp: TRzGroupBox
        Left = 8
        Top = 24
        Width = 777
        Height = 89
        Caption = 'Datos de la Oportunidad'
        Color = clWhite
        FlatColor = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object lblnombre: TRzLabel
          Left = 7
          Top = 16
          Width = 62
          Height = 13
          Caption = 'Nombre(s):'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblapaterno: TRzLabel
          Left = 5
          Top = 33
          Width = 98
          Height = 13
          Caption = 'Apellido Paterno:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblamaterno: TRzLabel
          Left = 5
          Top = 50
          Width = 100
          Height = 13
          Caption = 'Apellido Materno:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblcalle: TRzLabel
          Left = 254
          Top = 16
          Width = 33
          Height = 13
          Caption = 'Calle:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel2: TRzLabel
          Left = 253
          Top = 34
          Width = 48
          Height = 13
          Caption = 'Numero:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblciudad: TRzLabel
          Left = 526
          Top = 17
          Width = 44
          Height = 13
          Caption = 'Ciudad:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblestado: TRzLabel
          Left = 526
          Top = 34
          Width = 44
          Height = 13
          Caption = 'Estado:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblcolonia: TRzLabel
          Left = 253
          Top = 52
          Width = 47
          Height = 13
          Caption = 'Colonia:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel3: TRzLabel
          Left = 526
          Top = 52
          Width = 21
          Height = 13
          Caption = 'CP:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblmovil: TRzLabel
          Left = 254
          Top = 68
          Width = 42
          Height = 13
          Caption = 'Sector:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzDBLabel1: TRzDBLabel
          Left = 104
          Top = 16
          Width = 145
          Height = 17
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
          DataField = 'nombre'
          DataSource = dsoportunidades
        end
        object RzDBLabel2: TRzDBLabel
          Left = 104
          Top = 33
          Width = 137
          Height = 17
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
          DataField = 'apaterno'
          DataSource = dsoportunidades
        end
        object RzDBLabel3: TRzDBLabel
          Left = 104
          Top = 50
          Width = 145
          Height = 17
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
          DataField = 'amaterno'
          DataSource = dsoportunidades
        end
        object RzDBLabel4: TRzDBLabel
          Left = 294
          Top = 16
          Width = 227
          Height = 17
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
          DataField = 'dir'
          DataSource = dsoportunidades
        end
        object RzDBLabel5: TRzDBLabel
          Left = 302
          Top = 33
          Width = 91
          Height = 17
          Alignment = taRightJustify
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
          DataField = 'numero'
          DataSource = dsoportunidades
        end
        object RzDBLabel6: TRzDBLabel
          Left = 302
          Top = 53
          Width = 211
          Height = 17
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
          DataField = 'colonia'
          DataSource = dsoportunidades
        end
        object RzDBLabel7: TRzDBLabel
          Left = 570
          Top = 16
          Width = 201
          Height = 17
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
          DataField = 'ciudad'
          DataSource = dsoportunidades
        end
        object RzDBLabel8: TRzDBLabel
          Left = 570
          Top = 34
          Width = 200
          Height = 17
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
          DataField = 'estado'
          DataSource = dsoportunidades
        end
        object RzDBLabel9: TRzDBLabel
          Left = 567
          Top = 52
          Width = 66
          Height = 17
          Alignment = taRightJustify
          BiDiMode = bdLeftToRight
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentBiDiMode = False
          ParentColor = False
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
          DataField = 'cp'
          DataSource = dsoportunidades
        end
        object RzDBLabel10: TRzDBLabel
          Left = 296
          Top = 68
          Width = 89
          Height = 17
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
          DataField = 'sector'
          DataSource = dsoportunidades
        end
        object RzLabel5: TRzLabel
          Left = 486
          Top = 69
          Width = 103
          Height = 13
          Caption = 'Tipo Oportunidad:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzDBLabel12: TRzDBLabel
          Left = 589
          Top = 69
          Width = 159
          Height = 17
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
          DataField = 'estatus'
          DataSource = dsoportunidades
        end
        object RzLabel11: TRzLabel
          Left = 5
          Top = 69
          Width = 80
          Height = 13
          Caption = 'Razon Social:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblrsocial: TRzDBLabel
          Left = 105
          Top = 69
          Width = 142
          Height = 13
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
          DataField = 'rsocial'
          DataSource = dsoportunidades
        end
        object btntelefono: TRzBitBtn
          Left = 671
          Top = 47
          Width = 101
          Hint = 'Asignar telefono(s) a esta oportunidad'
          Caption = '&Telefonos'
          Color = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          HotTrack = True
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = btntelefonoClick
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
          ImageIndex = 4
          Images = DMAccesos.ilopciones
          NumGlyphs = 2
        end
      end
      object gbdatos_evento: TRzGroupBox
        Left = 8
        Top = 114
        Width = 777
        Height = 175
        BorderColor = 16776176
        Caption = 'Datos del Evento'
        Color = clWhite
        FlatColor = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object RzLabel10: TRzLabel
          Left = 614
          Top = 12
          Width = 148
          Height = 16
          Caption = 'Tipo de Oportunidad:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblfecha: TRzLabel
          Left = 4
          Top = 17
          Width = 33
          Height = 13
          Caption = 'fecha'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblhora: TRzLabel
          Left = 256
          Top = 17
          Width = 26
          Height = 13
          Caption = 'hora'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblvendedor: TRzLabel
          Left = 7
          Top = 41
          Width = 73
          Height = 16
          Caption = 'Vendedor:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblidvendedor: TRzLabel
          Left = 449
          Top = 17
          Width = 64
          Height = 13
          Cursor = crHandPoint
          Hint = 'Doble Clic para cambiar vendedor'
          Caption = 'idvendedor'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          OnDblClick = lblidvendedorDblClick
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
          TextStyle = tsRaised
        end
        object RzLabel6: TRzLabel
          Left = 4
          Top = 65
          Width = 91
          Height = 16
          Caption = 'Seguimiento:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lblFecSigLlam: TRzLabel
          Left = 344
          Top = 57
          Width = 181
          Height = 16
          Caption = 'Fecha Siguiente Llamada:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object cbonom_oportunidad: TRzComboBox
          Left = 614
          Top = 29
          Width = 145
          Height = 21
          CharCase = ecUpperCase
          Ctl3D = False
          DropDownCount = 20
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
          Sorted = True
          TabOrder = 0
          OnKeyPress = cbonom_oportunidadKeyPress
          OnSelect = cbonom_oportunidadSelect
          OnSelEndOk = cbonom_oportunidadSelEndOk
        end
        object mmobservaciones: TRzRichEdit
          Left = 5
          Top = 82
          Width = 604
          Height = 85
          TabOrder = 1
          DisabledColor = clWhite
          FocusColor = 16776176
          FrameColor = clActiveCaption
          FrameHotColor = clFuchsia
          FrameHotTrack = True
          FrameVisible = True
        end
        object btnnextel: TRzBitBtn
          Left = 104
          Top = 56
          Width = 113
          Caption = 'Contesto Nextel'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          HotTrack = True
          ParentFont = False
          TabOrder = 2
          Visible = False
          OnClick = btnnextelClick
          Glyph.Data = {
            36060000424D3606000000000000360400002800000020000000100000000100
            08000000000000020000930E0000930E00000001000000000000000000003300
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
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E85E5E5E5E
            5E5E5E5E5E5E5E5EE8E8E8E8818181818181818181818181E8E8E8E85ED7D7D7
            D7D7D7D7D7D7D75EE8E8E8E881ACACACACACACACACACAC81E8E8E8E85ED7D7D7
            09D7D7D7D7D7D75EE8E8E8E881ACACAC81ACACACACACAC81E8E8E8E85ED7D709
            0909D7D7D7D7D75EE8E8E8E881ACAC818181ACACACACAC81E8E8E8E85ED70909
            090909D7D7D7D75EE8E8E8E881AC8181818181ACACACAC81E8E8E8E85ED70909
            D7090909D7D7D75EE8E8E8E881AC8181AC818181ACACAC81E8E8E8E85ED709D7
            D7D7090909D7D75EE8E8E8E881AC81ACACAC818181ACAC81E8E8E8E85ED7D7D7
            D7D7D70909D7D75EE8E8E8E881ACACACACACAC8181ACAC81E8E8E8E85ED7D7D7
            D7D7D7D709D7D75EE8E8E8E881ACACACACACACAC81ACAC81E8E8E8E85ED7D7D7
            D7D7D7D7D7D7D75EE8E8E8E881ACACACACACACACACACAC81E8E8E8E85ED7D7D7
            D7D7D7D75E5E5E5EE8E8E8E881ACACACACACACAC81818181E8E8E8E85ED7D7D7
            D7D7D7D75EE35EE8E8E8E8E881ACACACACACACAC81AC81E8E8E8E8E85ED7D7D7
            D7D7D7D75E5EE8E8E8E8E8E881ACACACACACACAC8181E8E8E8E8E8E85E5E5E5E
            5E5E5E5E5EE8E8E8E8E8E8E8818181818181818181E8E8E8E8E8E8E8E8E8E8E8
            E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
          NumGlyphs = 2
        end
      end
      object btncerrar: TRzBitBtn
        Left = 597
        Top = 3
        Width = 92
        Caption = '&Cerrar'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 2
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
      object btnguardar: TRzBitBtn
        Left = 507
        Top = 3
        Width = 89
        Caption = '&Guardar'
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 3
        OnClick = btnguardarClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000730E0000730E00000001000000000000000000003300
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
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E809090909
          090909090909090909E8E8E881818181818181818181818181E8E809101009E3
          1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
          1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
          1009E3E3E309101009E8E881ACAC81E3AC81E3E3E381ACAC81E8E809101009E3
          E3E3E3E3E309101009E8E881ACAC81E3E3E3E3E3E381ACAC81E8E80910101009
          090909090910101009E8E881ACACAC818181818181ACACAC81E8E80910101010
          101010101010101009E8E881ACACACACACACACACACACACAC81E8E80910100909
          090909090909101009E8E881ACAC8181818181818181ACAC81E8E8091009D7D7
          D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E8091009D709
          0909090909D7091009E8E881AC81D7818181818181D781AC81E8E8091009D7D7
          D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E809E309D709
          0909090909D7090909E8E881E381D7818181818181D7818181E8E8091009D7D7
          D7D7D7D7D7D7091009E8E881AC81D7D7D7D7D7D7D7D781AC81E8E80909090909
          090909090909090909E8E88181818181818181818181818181E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
      object btnnuevo: TRzBitBtn
        Left = 413
        Top = 3
        Width = 92
        Caption = '&Limpiar'
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 4
        OnClick = btnnuevoClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000730E0000730E00000001000000000000000000003300
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
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E85E5E5E5E
          5E5E5E5E5E5E5E5EE8E8E8E8818181818181818181818181E8E8E8E85ED7D7D7
          D7D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3
          E3E3E3E3E3E3D75EE8E8E8E881E8ACACACACACACACACE881E8E8E8E85ED7D7D7
          D7D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3
          E3E3E3E3E3E3D75EE8E8E8E881E8ACACACACACACACACE881E8E8E8E85ED7D7D7
          D7D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3
          E3E3E3E3E3E3D75EE8E8E8E881E8ACACACACACACACACE881E8E8E8E85ED7D7D7
          D7D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3
          E3E3E3E3E3E3D75EE8E8E8E881E8ACACACACACACACACE881E8E8E8E85ED7D7D7
          D7D7D7D7D7D7D75EE8E8E8E881E8E8E8E8E8E8E8E8E8E881E8E8E8E85ED7E3E3
          E3E3E3D75E5E5E5EE8E8E8E881E8ACACACACACE881818181E8E8E8E85ED7D7D7
          D7D7D7D75EE35EE8E8E8E8E881E8E8E8E8E8E8E881E881E8E8E8E8E85ED7D7D7
          D7D7D7D75E5EE8E8E8E8E8E881E8E8E8E8E8E8E88181E8E8E8E8E8E85E5E5E5E
          5E5E5E5E5EE8E8E8E8E8E8E8818181818181818181E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
      object cxrejilla_vendedores: TcxGrid
        Left = 10
        Top = 291
        Width = 775
        Height = 174
        TabOrder = 5
        Visible = False
        object cxrejilla_vendedoresvista1: TcxGridDBTableView
          DataController.DataSource = DSVendedores
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnCellClick = cxrejilla_vendedoresvista1CellClick
          OptionsView.ColumnAutoWidth = True
          object idvendedor_rejilla: TcxGridDBColumn
            Caption = 'Id Vendedor'
            Options.Editing = False
            Options.ShowEditButtons = isebNever
            Options.Moving = False
            Width = 100
            DataBinding.FieldName = 'idusuario'
          end
          object nombre_vendedor: TcxGridDBColumn
            Caption = 'Nombre del Vendedor'
            Options.Editing = False
            Options.Moving = False
            Width = 381
            DataBinding.FieldName = 'Nombre'
          end
          object cxsector: TcxGridDBColumn
            Caption = 'Sector'
            Options.Editing = False
            Options.Grouping = False
            DataBinding.FieldName = 'idsector'
          end
        end
        object cxrejilla_vendedoresnivel1: TcxGridLevel
          GridView = cxrejilla_vendedoresvista1
        end
      end
      object cxlblvendedores: TcxLabel
        Left = 10
        Top = 298
        Width = 313
        Height = 24
        Caption = 'Vendedores activos                              '
        ParentColor = False
        ParentFont = False
        Style.BorderColor = clMaroon
        Style.BorderStyle = ebsNone
        Style.Color = clBtnShadow
        Style.Font.Charset = DEFAULT_CHARSET
        Style.Font.Color = clNavy
        Style.Font.Height = -16
        Style.Font.Name = 'MS Sans Serif'
        Style.Font.Style = [fsBold]
        TabOrder = 6
        Visible = False
      end
      object btnok: TRzButton
        Left = 344
        Top = 296
        Width = 65
        Caption = 'O.K.'
        Color = clWhite
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 7
        Visible = False
        OnClick = btnokClick
      end
      object btnocultar: TRzBitBtn
        Left = 411
        Top = 296
        Width = 94
        Caption = '&Ocultar'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        TabOrder = 8
        Visible = False
        OnClick = btnocultarClick
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
      object tbherramientas: TToolBar
        Left = 234
        Top = 0
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
        TabOrder = 9
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
      object edclave: TRzButtonEdit
        Left = 152
        Top = -2
        Width = 73
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
        TabOrder = 10
        OnChange = edclaveChange
        OnKeyPress = edclaveKeyPress
        OnKeyUp = edclaveKeyUp
        ButtonKind = bkFind
        ButtonShortCut = 119
        FlatButtons = True
        OnButtonClick = edclaveButtonClick
      end
      object btnimprimir: TRzBitBtn
        Left = 688
        Top = 3
        Width = 89
        Hint = 
          'Imprimir reporte de oportunidades que no han sido cerradas x ven' +
          'dedor en curso'
        Caption = '&Imprimir'
        Color = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        HotTrack = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 11
        OnClick = btnimprimirClick
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
        ImageIndex = 20
        Images = DMAccesos.ilopciones
        NumGlyphs = 2
      end
    end
  end
  object dsoportunidades: TDataSource
    DataSet = sqldatos_oportunidades
    Left = 113
    Top = 268
  end
  object sqldatos_oportunidades: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT '
      '  oportunidades.numero,oportunidades.estatus,'
      '  oportunidades.cp,'
      '  oportunidades.estado,'
      '  oportunidades.dir,'
      '  oportunidades.nombre,'
      '  oportunidades.ciudad,'
      '  oportunidades.apaterno,'
      '  oportunidades.amaterno,oportunidades.rsocial,'
      '  colonias.nombre AS colonia,'
      '  sectores.nombre AS sector,oportunidades.idtel'
      'FROM'
      'oportunidades'
      '  LEFT JOIN colonias ON (oportunidades.idcol = colonias.idcol)'
      '  LEFT JOIN col_sector ON (colonias.idcol = col_sector.idcol)'
      
        '  LEFT JOIN sectores ON (col_sector.idsector = sectores.idsector' +
        ')'
      'where oportunidades.idoportunidad = :prosp')
    AfterOpen = sqldatos_oportunidadesAfterOpen
    FetchAll = True
    Left = 113
    Top = 236
    ParamData = <
      item
        DataType = ftInteger
        Name = 'prosp'
        Value = 0
      end>
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    CachedUpdates = True
    FetchAll = True
    Left = 145
    Top = 236
  end
  object pmmenu: TPopupMenu
    OnPopup = pmmenuPopup
    Left = 146
    Top = 267
    object Modificar1: TMenuItem
      Caption = 'Modificar'
      Enabled = False
      OnClick = Modificar1Click
    end
    object Eliminar1: TMenuItem
      Caption = 'Eliminar'
      Enabled = False
      OnClick = Eliminar1Click
    end
  end
  object sqlactividades: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT '
      '  actividades_vendedores.hora,'
      '  actividades_vendedores.fecha,'
      '  if(actividades_vendedores.realizada, '#39'SI'#39', '#39'NO'#39') AS Realizada,'
      '  actividades_vendedores.observaciones,'
      '  actividades_vendedores.idevento,'
      '  tipos_actividades.nombre AS Actividad,'
      '  estatus_eventos.nombre AS Estatus,'
      '  actividades_vendedores.idactividades,'
      
        '  agenda_vendedores.idvendedor,actividades_vendedores.idtipo_act' +
        'ividad'
      'FROM'
      '  estatus_eventos'
      
        '  inner JOIN agenda_vendedores ON (estatus_eventos.idestatus = a' +
        'genda_vendedores.idestatus)'
      
        '  inner JOIN actividades_vendedores ON (agenda_vendedores.ideven' +
        'to = actividades_vendedores.idevento)'
      
        '  inner JOIN tipos_actividades ON (actividades_vendedores.idtipo' +
        '_actividad = tipos_actividades.idtipo_actividad)'
      
        'WHERE   (agenda_vendedores.idevento = :evento)  AND  (estatus_ev' +
        'entos.finaliza = '#39'NO'#39') '
      '')
    AfterOpen = sqlactividadesAfterOpen
    FetchAll = True
    Left = 81
    Top = 236
    ParamData = <
      item
        DataType = ftString
        Name = 'evento'
        Value = ''
      end>
  end
  object dsactividades: TDataSource
    DataSet = sqlactividades
    Left = 81
    Top = 268
  end
  object sqleventos: TMyQuery
    Connection = DMAccesos.conexion
    AfterOpen = sqleventosAfterOpen
    OnCalcFields = sqleventosCalcFields
    FetchAll = True
    Left = 17
    Top = 236
  end
  object dseventos: TDataSource
    DataSet = sqleventos
    Left = 17
    Top = 268
  end
  object sqlvendedores: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'SELECT usuarios.idusuario,concat(ifnull(usuarios.nombre,'#39' '#39'),'#39' '#39 +
        ',ifnull(usuarios.apaterno,'#39' '#39'),'#39' '#39',ifnull(usuarios.amaterno,'#39' '#39')' +
        ') AS Nombre,idsector '
      
        'FROM usuarios LEFT JOIN puestos ON (usuarios.idpuesto = puestos.' +
        'idpuesto) WHERE (puestos.nombre = '#39'VENDEDOR'#39' or usuarios.PuedeVe' +
        'nder=1) AND (usuarios.estatus = 1) and (usuarios.idsector <> 0)'
      ' ')
    CachedUpdates = True
    Filtered = True
    FetchAll = True
    Left = 49
    Top = 236
  end
  object DSVendedores: TDataSource
    DataSet = sqlvendedores
    Left = 49
    Top = 268
  end
  object FontDialog1: TFontDialog
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    Left = 384
    Top = 24
  end
end
