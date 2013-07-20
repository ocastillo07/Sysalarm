object frmMinutaGerencial: TfrmMinutaGerencial
  Left = 296
  Top = 151
  Width = 1010
  Height = 621
  Caption = 'Minuta Corporativa'
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
  object PMinutas: TRzPageControl
    Left = 0
    Top = 0
    Width = 1000
    Height = 545
    ActivePage = TabActividades
    ActivePageDefault = TabActividades
    HotTrackColor = clNavy
    TabIndex = 0
    TabOrder = 0
    OnChange = PMinutasChange
    FixedDimension = 19
    object TabActividades: TRzTabSheet
      Color = clWhite
      Caption = 'Actividades'
      object RzLabel16: TRzLabel
        Left = 8
        Top = 32
        Width = 43
        Height = 13
        Caption = 'Estatus'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel17: TRzLabel
        Left = 280
        Top = 32
        Width = 33
        Height = 13
        Caption = 'Areas'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object GActiv: TcxGrid
        Left = 0
        Top = 80
        Width = 996
        Height = 442
        Align = alBottom
        TabOrder = 0
        object VActiv: TcxGridDBTableView
          OnDblClick = VActivDblClick
          DataController.DataSource = dsactividad
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OnCellClick = VActivCellClick
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          object VActivDBColumn1: TcxGridDBColumn
            Caption = 'Orden'
            Width = 58
            DataBinding.FieldName = 'orden'
          end
          object colidact: TcxGridDBColumn
            Caption = 'Clave'
            Width = 61
            DataBinding.FieldName = 'idactividad'
          end
          object coldesc: TcxGridDBColumn
            Caption = 'Descripcion'
            Width = 304
            DataBinding.FieldName = 'descripcion'
          end
          object colest: TcxGridDBColumn
            Caption = 'Estatus'
            Width = 96
            DataBinding.FieldName = 'esnom'
          end
          object colcrea: TcxGridDBColumn
            Caption = 'Creacion'
            Width = 81
            DataBinding.FieldName = 'fecha_creacion'
          end
          object colprom: TcxGridDBColumn
            Caption = 'Promesa'
            DataBinding.FieldName = 'fecha_promesa'
          end
          object colimp: TcxGridDBColumn
            Caption = 'Observaciones'
            Width = 174
            DataBinding.FieldName = 'observaciones'
          end
          object colarea: TcxGridDBColumn
            Caption = 'Area'
            SortOrder = soDescending
            Width = 191
            DataBinding.FieldName = 'anom'
          end
        end
        object LActiv: TcxGridLevel
          GridView = VActiv
        end
      end
      object cbfestatus: TRzComboBox
        Left = 8
        Top = 48
        Width = 249
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DisabledColor = clWhite
        FlatButtonColor = clWhite
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 1
      end
      object cbfareas: TRzComboBox
        Left = 280
        Top = 48
        Width = 305
        Height = 21
        CharCase = ecUpperCase
        Ctl3D = False
        DisabledColor = clWhite
        FlatButtonColor = clWhite
        FlatButtons = True
        FrameHotTrack = True
        FrameVisible = True
        ItemHeight = 13
        ParentCtl3D = False
        TabOrder = 2
        OnKeyPress = cbfareasKeyPress
      end
      object chkfinalizados: TRzCheckBox
        Left = 8
        Top = 8
        Width = 115
        Height = 17
        Caption = 'Finalizados'
        HotTrack = True
        HotTrackColor = clNavy
        State = cbUnchecked
        TabOrder = 3
        Visible = False
        OnClick = chkfinalizadosClick
      end
      object btnfiltro: TRzBitBtn
        Left = 608
        Top = 24
        Width = 145
        Height = 41
        Caption = 'Aplicar Filtro'
        HotTrack = True
        TabOrder = 4
        OnClick = btnfiltroClick
        Glyph.Data = {
          36060000424D3606000000000000360400002800000020000000100000000100
          08000000000000020000330B0000330B00000001000000000000000000003300
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
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E80909
          E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8E8091010
          09E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8E8E8E809101010
          1009E8E8E8E8E8E8E8E8E8E881ACACACAC81E8E8E8E8E8E8E8E8E80910101010
          101009E8E8E8E8E8E8E8E881ACACACACACAC81E8E8E8E8E8E8E8E80910100909
          10101009E8E8E8E8E8E8E881ACAC8181ACACAC81E8E8E8E8E8E8E8091009E8E8
          0910101009E8E8E8E8E8E881AC81E8E881ACACAC81E8E8E8E8E8E80909E8E8E8
          E80910101009E8E8E8E8E88181E8E8E8E881ACACAC81E8E8E8E8E8E8E8E8E8E8
          E8E80910101009E8E8E8E8E8E8E8E8E8E8E881ACACAC81E8E8E8E8E8E8E8E8E8
          E8E8E80910101009E8E8E8E8E8E8E8E8E8E8E881ACACAC81E8E8E8E8E8E8E8E8
          E8E8E8E809101009E8E8E8E8E8E8E8E8E8E8E8E881ACAC81E8E8E8E8E8E8E8E8
          E8E8E8E8E8091009E8E8E8E8E8E8E8E8E8E8E8E8E881AC81E8E8E8E8E8E8E8E8
          E8E8E8E8E8E80909E8E8E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
      object btnImprimir: TRzBitBtn
        Left = 768
        Top = 8
        Width = 145
        Caption = '&Imprimir'
        HotTrack = True
        HotTrackColor = clNavy
        TabOrder = 5
        OnClick = btnImprimirClick
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
          09090909090909E8E8E8E8E88181818181818181818181E8E8E8E85E89898989
          89898989895E5E09E8E8E8E2ACACACACACACACACACE2E281E8E85E5E5E5E5E5E
          5E5E5E5E5E5E095E09E8E2E2E2E2E2E2E2E2E2E2E2E281E281E85ED789898989
          8989898989895E0909E8E2E8ACACACACACACACACACACE28181E85ED789898989
          181289B490895E5E09E8E2E8ACACACACE281ACE281ACE2E281E85ED7D7D7D7D7
          D7D7D7D7D7D75E5E5E09E2E8E8E8E8E8E8E8E8E8E8E8E2E2E2815ED789898989
          8989898989895E5E5E09E2E8ACACACACACACACACACACE2E2E281E85E5E5E5E5E
          5E5E5E5E5E89895E5E09E8E2E2E2E2E2E2E2E2E2E2ACACE2E281E8E85ED7D7D7
          D7D7D7D7D75E89895E09E8E8E2E8E8E8E8E8E8E8E8E2ACACE281E8E8E85ED7E3
          E3E3E3E3D75E5E5E09E8E8E8E8E2E8ACACACACACE8E2E2E281E8E8E8E85ED7D7
          D7D7D7D7D7D75EE8E8E8E8E8E8E2E8E8E8E8E8E8E8E8E2E8E8E8E8E8E8E85ED7
          E3E3E3E3E3D75EE8E8E8E8E8E8E8E2E8ACACACACACE8E2E8E8E8E8E8E8E85ED7
          D7D7D7D7D7D7D75EE8E8E8E8E8E8E2E8E8E8E8E8E8E8E8E2E8E8E8E8E8E8E85E
          5E5E5E5E5E5E5E5EE8E8E8E8E8E8E8E2E2E2E2E2E2E2E2E2E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
      object btncorreo: TRzBitBtn
        Left = 768
        Top = 40
        Width = 145
        Caption = 'EnviarCorreo'
        HotTrack = True
        TabOrder = 6
        OnClick = btncorreoClick
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
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8815656565656
          565656565656565656568181818181818181818181818181818181D6D6D6D6D6
          D6D6D6D6D6D6D6D6D65681E8E8E8E8E8E8E8E8E8E8E8E8E8E88181D6D6D6D6D6
          D6D6D6D6D6D6D6D6D65681E8E8E8E8E8E8E8E8E8E8E8E8E8E88181D7D6D60909
          09090909D6D6D6D6D65681D7E8E8818181818181E8E8E8E8E88181D6D7D6D6D6
          D6D6D6D6D6D6D6D6D65681E8D7E8E8E8E8E8E8E8E8E8E8E8E88181D7D7D60909
          09090909D6D6D6D6D65681D7D7E8818181818181E8E8E8E8E88181D7D6D7D6D6
          D6D6D6D6D6D6D6D6D65681D7E8D7E8E8E8E8E8E8E8E8E8E8E88181D7D7D6D7D6
          D6D6D6D6D6D6906CD65681D7D7E8D7E8E8E8E8E8E8E88181E88181D7D7D7D7D6
          D6D6D6D6D6D6B690D65681D7D7D7D7E8E8E8E8E8E8E88181E88181D7D7D7D6D7
          D6D6D6D6D6D6D6D6D65681D7D7D7E8D7E8E8E8E8E8E8E8E8E881818181818181
          8181818181818181818181818181818181818181818181818181E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
          E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8}
        NumGlyphs = 2
      end
    end
    object TabDescripcion: TRzTabSheet
      Color = clWhite
      Caption = 'Descripcion'
      object RzLabel8: TRzLabel
        Left = 48
        Top = 208
        Width = 70
        Height = 13
        Caption = 'Seguimiento'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object lbufh: TRzLabel
        Left = 592
        Top = 216
        Width = 13
        Height = 13
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clMoneyGreen
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object GSeg: TcxGrid
        Left = 8
        Top = 256
        Width = 977
        Height = 172
        Enabled = False
        TabOrder = 1
        object VSeg: TcxGridDBTableView
          OnDblClick = VSegDblClick
          DataController.DataSource = dsseg
          DataController.Summary.DefaultGroupSummaryItems = <>
          DataController.Summary.FooterSummaryItems = <>
          DataController.Summary.SummaryGroups = <>
          NavigatorButtons.ConfirmDelete = False
          OptionsData.CancelOnExit = False
          OptionsData.Deleting = False
          OptionsData.DeletingConfirmation = False
          OptionsData.Editing = False
          OptionsData.Inserting = False
          object colclave: TcxGridDBColumn
            Caption = 'Clave'
            DataBinding.FieldName = 'iddetminuta'
          end
          object colactividad: TcxGridDBColumn
            Caption = 'Actividad'
            Width = 459
            DataBinding.FieldName = 'actividad'
          end
          object colfecha: TcxGridDBColumn
            Caption = 'Fecha'
            Width = 104
            DataBinding.FieldName = 'fecha_actividad'
          end
          object colrealizada: TcxGridDBColumn
            Caption = 'Realizada'
            Width = 88
            DataBinding.FieldName = 'r'
          end
          object colencargado: TcxGridDBColumn
            Caption = 'Encargado'
            Width = 253
            DataBinding.FieldName = 'enc'
          end
        end
        object LSeg: TcxGridLevel
          GridView = VSeg
        end
      end
      object PSeguimiento: TRzPanel
        Left = 8
        Top = 408
        Width = 977
        Height = 105
        BorderOuter = fsPopup
        Color = 14267315
        Enabled = False
        TabOrder = 2
        object RzLabel11: TRzLabel
          Left = 16
          Top = 8
          Width = 54
          Height = 13
          Caption = 'Actividad'
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel12: TRzLabel
          Left = 632
          Top = 8
          Width = 43
          Height = 13
          Caption = 'Realiza'
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel10: TRzLabel
          Left = 768
          Top = 56
          Width = 40
          Height = 13
          Caption = 'Fecha:'
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object lidseg: TRzLabel
          Left = 88
          Top = 8
          Width = 8
          Height = 13
          Caption = '0'
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel14: TRzLabel
          Left = 496
          Top = 8
          Width = 32
          Height = 13
          Caption = 'Inicio'
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel15: TRzLabel
          Left = 496
          Top = 56
          Width = 46
          Height = 13
          Caption = 'Termino'
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object rgrealizada: TRzRadioGroup
          Left = 632
          Top = 56
          Width = 105
          Height = 41
          Caption = 'Realizada'
          Color = clBlue
          Columns = 2
          FlatColor = clNavy
          ItemFrameColor = clBlue
          ItemHotTrack = True
          ItemHighlightColor = clBtnShadow
          ItemIndex = 0
          Items.Strings = (
            'No'
            'Si')
          TabOrder = 2
          Transparent = True
        end
        object edactividad: TRzMemo
          Left = 16
          Top = 24
          Width = 473
          Height = 73
          Color = clWhite
          TabOrder = 0
          OnKeyPress = edactividadKeyPress
          DisabledColor = clWhite
          FrameColor = clBlue
          FrameHotTrack = True
          FrameVisible = True
        end
        object cbrealiza: TRzComboBox
          Left = 632
          Top = 24
          Width = 241
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          Ctl3D = False
          DisabledColor = clWhite
          FlatButtons = True
          FrameColor = clBlue
          FrameHotTrack = True
          FrameVisible = True
          ItemHeight = 13
          ParentCtl3D = False
          TabOrder = 1
          OnKeyPress = cbrealizaKeyPress
        end
        object tpseguimiento: TRzDateTimePicker
          Left = 768
          Top = 72
          Width = 106
          Height = 21
          Date = 39204.643730648150000000
          Time = 39204.643730648150000000
          Color = clWhite
          TabOrder = 3
          OnKeyPress = tpseguimientoKeyPress
          FlatButtons = True
          DisabledColor = clWhite
          FrameColor = clBlue
          FrameHotTrack = True
          FrameVisible = True
        end
        object btnsave: TRzBitBtn
          Left = 880
          Top = 24
          Width = 90
          Height = 30
          Caption = 'G&uardar'
          Color = 16776176
          HotTrack = True
          HotTrackColor = clNavy
          TabOrder = 4
          OnClick = btnsaveClick
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
        object btncancel: TRzBitBtn
          Left = 880
          Top = 64
          Width = 90
          Height = 30
          Caption = 'C&ancelar'
          Color = 16776176
          HotTrack = True
          HotTrackColor = clNavy
          TabOrder = 5
          OnClick = btncancelClick
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
        object tpSegInicio: TRzDateTimePicker
          Left = 496
          Top = 24
          Width = 113
          Height = 21
          Date = 39205.474953333330000000
          Time = 39205.474953333330000000
          Color = clWhite
          Kind = dtkTime
          TabOrder = 6
          OnKeyPress = tpSegInicioKeyPress
          FlatButtonColor = clWhite
          FlatButtons = True
          DisabledColor = clWhite
          FrameHotTrack = True
          FrameVisible = True
        end
        object tpSegTermino: TRzDateTimePicker
          Left = 496
          Top = 72
          Width = 113
          Height = 21
          Date = 39205.475035625000000000
          Time = 39205.475035625000000000
          Color = clWhite
          Kind = dtkTime
          TabOrder = 7
          OnKeyPress = tpSegTerminoKeyPress
          FlatButtonColor = clWhite
          FlatButtons = True
          DisabledColor = clWhite
          FrameHotTrack = True
          FrameVisible = True
        end
      end
      object pdescripcion: TRzPanel
        Left = 8
        Top = 5
        Width = 977
        Height = 185
        BorderOuter = fsPopup
        Color = 16369354
        Enabled = False
        TabOrder = 0
        object RzLabel1: TRzLabel
          Left = 8
          Top = 8
          Width = 37
          Height = 13
          Caption = 'Clave:'
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel9: TRzLabel
          Left = 392
          Top = 64
          Width = 85
          Height = 13
          Caption = 'Observaciones'
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel2: TRzLabel
          Left = 64
          Top = 8
          Width = 51
          Height = 13
          Caption = 'Creacion'
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel3: TRzLabel
          Left = 168
          Top = 8
          Width = 49
          Height = 13
          Caption = 'Promesa'
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel5: TRzLabel
          Left = 272
          Top = 8
          Width = 31
          Height = 13
          Caption = 'Area:'
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel6: TRzLabel
          Left = 432
          Top = 136
          Width = 46
          Height = 13
          Caption = 'Impacto'
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel7: TRzLabel
          Left = 472
          Top = 8
          Width = 43
          Height = 13
          Caption = 'Estatus'
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel4: TRzLabel
          Left = 864
          Top = 88
          Width = 46
          Height = 13
          Caption = 'Termino'
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object RzLabel13: TRzLabel
          Left = 8
          Top = 48
          Width = 68
          Height = 13
          Caption = 'Descripcion'
          BlinkIntervalOff = 5000
          BlinkIntervalOn = 20
        end
        object Label1: TLabel
          Left = 672
          Top = 8
          Width = 74
          Height = 13
          Caption = 'Responsable'
        end
        object Label2: TLabel
          Left = 864
          Top = 8
          Width = 32
          Height = 13
          Caption = 'Inicio'
        end
        object Label3: TLabel
          Left = 864
          Top = 48
          Width = 44
          Height = 13
          Caption = 'Avance'
        end
        object Label4: TLabel
          Left = 940
          Top = 67
          Width = 14
          Height = 16
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edclave: TRzEdit
          Left = 8
          Top = 24
          Width = 49
          Height = 21
          Alignment = taRightJustify
          DisabledColor = clWhite
          Enabled = False
          FrameHotTrack = True
          FrameVisible = True
          TabOrder = 0
        end
        object tpcreacion: TRzDateTimePicker
          Left = 64
          Top = 24
          Width = 97
          Height = 21
          Date = 39388.640317743050000000
          Time = 39388.640317743050000000
          Color = clWhite
          TabOrder = 1
          OnKeyPress = tpcreacionKeyPress
          FlatButtons = True
          DisabledColor = clWhite
          FrameHotTrack = True
          FrameVisible = True
        end
        object tppromesa: TRzDateTimePicker
          Left = 168
          Top = 24
          Width = 97
          Height = 21
          Date = 39388.640340520830000000
          Time = 39388.640340520830000000
          Color = clWhite
          TabOrder = 2
          OnKeyPress = tppromesaKeyPress
          FlatButtons = True
          DisabledColor = clWhite
          FrameHotTrack = True
          FrameVisible = True
        end
        object cbarea: TRzComboBox
          Left = 272
          Top = 24
          Width = 193
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          Ctl3D = False
          DisabledColor = clWhite
          FlatButtonColor = clWhite
          FlatButtons = True
          FrameHotTrack = True
          FrameVisible = True
          ItemHeight = 13
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 3
          OnChange = cbareaChange
          OnExit = cbareaExit
          OnKeyPress = cbareaKeyPress
          OnNotInList = cbareaNotInList
        end
        object cbestatus: TRzComboBox
          Left = 472
          Top = 24
          Width = 193
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          Ctl3D = False
          DisabledColor = clWhite
          FlatButtonColor = clWhite
          FlatButtons = True
          FrameHotTrack = True
          FrameVisible = True
          ItemHeight = 13
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 4
          OnKeyPress = cbestatusKeyPress
          Items.Strings = (
            'PENDIENTE'
            'EN PROCESO'
            'TERMINADA')
          Values.Strings = (
            '0'
            '1'
            '2')
        end
        object tptermino: TRzDateTimePicker
          Left = 864
          Top = 104
          Width = 97
          Height = 21
          Date = 39388.640376689800000000
          Time = 39388.640376689800000000
          Color = clWhite
          TabOrder = 11
          OnKeyPress = tpterminoKeyPress
          FlatButtons = True
          DisabledColor = clWhite
          FrameHotTrack = True
          FrameVisible = True
        end
        object edobservaciones: TRzMemo
          Left = 488
          Top = 64
          Width = 369
          Height = 65
          TabOrder = 7
          OnKeyPress = edobservacionesKeyPress
          DisabledColor = clWhite
          FrameHotTrack = True
          FrameVisible = True
        end
        object edimpacto: TRzMemo
          Left = 488
          Top = 136
          Width = 473
          Height = 42
          TabOrder = 8
          OnKeyPress = edimpactoKeyPress
          DisabledColor = clWhite
          FrameHotTrack = True
          FrameVisible = True
        end
        object eddescripcion: TRzMemo
          Left = 8
          Top = 64
          Width = 377
          Height = 113
          Color = clWhite
          TabOrder = 6
          OnKeyPress = eddescripcionKeyPress
          DisabledColor = clWhite
          FrameHotTrack = True
          FrameVisible = True
        end
        object cbresponsable: TRzComboBox
          Left = 672
          Top = 24
          Width = 185
          Height = 21
          CharCase = ecUpperCase
          Color = clWhite
          Ctl3D = False
          DisabledColor = clWhite
          FlatButtonColor = clWhite
          FlatButtons = True
          FrameHotTrack = True
          FrameVisible = True
          ItemHeight = 13
          ParentCtl3D = False
          TabOnEnter = True
          TabOrder = 5
          OnNotInList = cbresponsableNotInList
        end
        object tpinicio: TRzDateTimePicker
          Left = 864
          Top = 24
          Width = 98
          Height = 21
          Date = 39387.485384837960000000
          Time = 39387.485384837960000000
          TabOrder = 9
          FlatButtonColor = clWhite
          FlatButtons = True
          FrameHotTrack = True
          FrameVisible = True
        end
        object edavance: TRzSpinEdit
          Left = 864
          Top = 64
          Width = 73
          Height = 21
          AllowKeyEdit = True
          FlatButtonColor = clWhite
          CharCase = ecUpperCase
          DisabledColor = clWhite
          Enabled = False
          FlatButtons = True
          FrameHotTrack = True
          FrameVisible = True
          TabOrder = 10
        end
      end
      object btnnuevo: TRzBitBtn
        Left = 8
        Top = 200
        Width = 33
        Hint = 'Nuevo Seguimiento'
        Color = clWhite
        Enabled = False
        HotTrack = True
        HotTrackColor = clNavy
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = btnnuevoClick
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
    end
  end
  object btnalta: TRzBitBtn
    Left = 8
    Top = 545
    Width = 200
    Height = 35
    Caption = '&Alta'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    HotTrackColor = clNavy
    ParentFont = False
    TabOrder = 1
    OnClick = btnaltaClick
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
  object btnborrar: TRzBitBtn
    Left = 208
    Top = 545
    Width = 200
    Height = 35
    Caption = '&Borrar'
    Color = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    HotTrackColor = clNavy
    ParentFont = False
    TabOrder = 2
    Visible = False
    Glyph.Data = {
      36060000424D3606000000000000360400002800000020000000100000000100
      08000000000000020000530D0000530D00000001000000000000000000003300
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
      0000000000000000000000000000000000000000000000000000E8D7E8D7D7E8
      E8E8E8E8E8E8E8E8E8E8E8D7E8D7D7E8E8E8E8E8E8E8E8E8E8E8D7D7D7D7D7D7
      D7E8E8E8E8E8E8E8E8E8D7D7D7D7D7D7D7E8E8E8E8E8E8E8E8E8D7D7D7D7D7DF
      6C6C6CE8E8E8E8E8E8E8D7D7D7D7D7DF565656E8E8E8E8E8E8E8D7D7D7D7DF90
      6C6C6C6CE8E8E8E8E8E8D7D7D7D7DF8156565656E8E8E8E8E8E8D7D7D7D79090
      906C6C6C6CE8E8E8E8E8D7D7D7D781818156565656E8E8E8E8E8D7E8D7E8B490
      90906C6C6C7EE8E8E8E8D7E8D7E8AC81818156565656E8E8E8E8E8E8E8E8B4B4
      9090906C7EA87EE8E8E8E8E8E8E8ACAC81818156568156E8E8E8E8E8E8E8E8B4
      B490907EA8A8A87EE8E8E8E8E8E8E8ACAC81815681818156E8E8E8E8E8E8E8E8
      B4D8A8D2D2A8A8A87EE8E8E8E8E8E8E8AC5681ACAC81818156E8E8E8E8E8E8E8
      E8A8D2D7DED2A8A8A87EE8E8E8E8E8E8E881ACD7DEAC81818156E8E8E8E8E8E8
      E8E8A8D2D7DED2A87E09E8E8E8E8E8E8E8E881ACD7DEAC815656E8E8E8E8E8E8
      E8E8E8A8D2D7D27E1009E8E8E8E8E8E8E8E8E881ACD7AC568156E8E8E8E8E8E8
      E8E8E8E8A8D2A8101010E8E8E8E8E8E8E8E8E8E881AC81818181E8E8E8E8E8E8
      E8E8E8E8E8A817171010E8E8E8E8E8E8E8E8E8E8E881ACAC8181E8E8E8E8E8E8
      E8E8E8E8E8E809171710E8E8E8E8E8E8E8E8E8E8E8E856ACAC81E8E8E8E8E8E8
      E8E8E8E8E8E8E8091717E8E8E8E8E8E8E8E8E8E8E8E8E856ACAC}
    NumGlyphs = 2
  end
  object btnmodificar: TRzBitBtn
    Left = 408
    Top = 545
    Width = 200
    Height = 35
    Caption = '&Editar'
    Color = clWhite
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    HotTrackColor = clNavy
    ParentFont = False
    TabOrder = 3
    OnClick = btnmodificarClick
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
  object btncancelar: TRzBitBtn
    Left = 800
    Top = 545
    Width = 200
    Height = 35
    Caption = '&Cerrar'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    HotTrackColor = clNavy
    ParentFont = False
    TabOrder = 4
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
  object rgViernes: TRzGroupBox
    Left = 376
    Top = 224
    Width = 185
    Caption = 'Minuta del Dia'
    Color = 16744576
    GroupStyle = gsBanner
    TabOrder = 5
    Visible = False
    object tpViernes: TRzDateTimePicker
      Left = 32
      Top = 40
      Width = 121
      Height = 21
      Date = 39388.643822152780000000
      Time = 39388.643822152780000000
      TabOrder = 0
      FlatButtons = True
      FrameHotTrack = True
      FrameVisible = True
    end
    object btnFechaMinuta: TRzBitBtn
      Left = 24
      Top = 72
      Width = 137
      FrameColor = 7617536
      Caption = 'Aplicar'
      Color = 15791348
      HotTrack = True
      TabOrder = 1
      OnClick = btnFechaMinutaClick
      Glyph.Data = {
        36060000424D3606000000000000360400002800000020000000100000000100
        08000000000000020000520B0000520B00000001000000000000000000003300
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
        0000000000000000000000000000000000000000000000000000E85858585858
        5858585858585858E8E8E881818181818181818181818181E8E8E858ADADD7D7
        D7D7D7D7D7D7D7D758E8E881ACACE8E8E8E8E8E8E8E8E8E881E8E858ADADD7AD
        ADADADADADADADD758E8E881ACACE8ACACACACACACACACE881E8E85858ADD7D7
        D7D7D7D7D7D7D7D758E8E88181ACE8E8E8E8E8E8E8E8E8E881E8E858ADADD7AD
        ADADADADADADADD758E8E881ACACE8ACACACACACACACACE881E8E858ADADD7D7
        D7D7D7D7D7D7D7D758E8E881ACACE8E8E8E8E8E8E8E8E8E881E8E858ADADD7AD
        ADADADADADADADD758E8E881ACACE8ACACACACACACACACE881E8E858ADADD7D7
        D7D7D7D7D7D7D7D758E8E881ACACE8E8E8E8E8E8E8E8E8E881E8E85858ADD7D7
        D76CD7D06C6CD0D758E8E88181ACE8E8E881E8AC8181ACE881E8E858ADADD7D7
        D76CD76CD7D76CD758E8E881ACACE8E8E881E881E8E881E881E8E858ADADD7D7
        D76CD7D7D7D76CD758E8E881ACACE8E8E881E8E8E8E881E881E8E858ADADD7D7
        D76CD76C6C6CD0D758E8E881ACACE8E8E881E8818181ACE881E8E858ADADD7D7
        6C6CD76CD7D7D7D758E8E881ACACE8E88181E881E8E8E8E881E8E85858ADD7D7
        D76CD76C6C6C6CD758E8E88181ACE8E8E881E881818181E881E8E858ADADD7D7
        D7D7D7D7D7D7D7D758E8E881ACACE8E8E8E8E8E8E8E8E8E881E8E85858585858
        5858585858585858E8E8E881818181818181818181818181E8E8}
      NumGlyphs = 2
    end
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 297
    Top = 436
  end
  object sqlactividad: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 168
    Top = 432
  end
  object dsseg: TDataSource
    DataSet = sqlseg
    Left = 225
    Top = 484
  end
  object dsactividad: TDataSource
    DataSet = sqlactividad
    Left = 153
    Top = 484
  end
  object sqlseg: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 225
    Top = 436
  end
end
