object frmEnviarCorreo: TfrmEnviarCorreo
  Left = 260
  Top = 138
  Width = 649
  Height = 551
  AutoSize = True
  BorderIcons = [biSystemMenu]
  Caption = 'Pantalla de envio de correos'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel8: TRzLabel
    Left = 2
    Top = 0
    Width = 60
    Height = 16
    Caption = 'Enviar a :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel1: TRzLabel
    Left = 2
    Top = 48
    Width = 51
    Height = 16
    Caption = 'Asunto :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel2: TRzLabel
    Left = 1
    Top = 172
    Width = 118
    Height = 16
    Caption = 'Cuerpo del email :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel3: TRzLabel
    Left = 1
    Top = 92
    Width = 121
    Height = 16
    Caption = 'Archivos Adjuntos :'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object rgtipo: TRzRadioGroup
    Left = 2
    Top = 472
    Width = 343
    Height = 41
    Caption = 'Correos de :'
    Color = clWhite
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    GroupStyle = gsStandard
    ItemFrameColor = 8409372
    ItemHotTrack = True
    ItemHighlightColor = 2203937
    ItemHotTrackColor = 3983359
    ItemFont.Charset = DEFAULT_CHARSET
    ItemFont.Color = clWindowText
    ItemFont.Height = -11
    ItemFont.Name = 'MS Sans Serif'
    ItemFont.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Empleados'
      'Usuarios cuenta')
    LightTextStyle = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = False
    SpaceEvenly = True
    TabOrder = 2
    TextStyle = tsRecessed
    TransparentColor = clRed
    Visible = False
  end
  object edenviar: TRzEdit
    Left = 0
    Top = 18
    Width = 633
    Height = 24
    Hint = 'Numero de cheque '
    DisabledColor = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    FocusColor = 16776176
    FrameColor = clActiveCaption
    FrameVisible = True
    ParentFont = False
    TabOrder = 3
  end
  object edmensaje: TRzEdit
    Left = 0
    Top = 64
    Width = 633
    Height = 24
    Hint = 'Numero de cheque '
    DisabledColor = clWhite
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    FocusColor = 16776176
    FrameColor = clActiveCaption
    FrameVisible = True
    ParentFont = False
    TabOrder = 0
  end
  object MemoBody: TRzMemo
    Left = 2
    Top = 192
    Width = 631
    Height = 89
    TabOrder = 1
    FrameColor = clBlue
    FrameVisible = True
  end
  object Grid: TcxGrid
    Left = 2
    Top = 288
    Width = 631
    Height = 177
    Hint = 'Doble Click para seleccionar ese pedido'
    BorderWidth = 1
    Font.Charset = ANSI_CHARSET
    Font.Color = clBlue
    Font.Height = -11
    Font.Name = 'Arial'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    LookAndFeel.Kind = lfStandard
    LookAndFeel.NativeStyle = True
    object GridView1: TcxGridDBTableView
      OnDblClick = GridView1DblClick
      OnKeyUp = GridView1KeyUp
      DataController.DataSource = DS1
      DataController.Filter.Active = True
      DataController.Filter.AutoDataSetFilter = True
      DataController.Options = [dcoAssignGroupingValues, dcoAssignMasterDetailKeys, dcoSaveExpanding, dcoSortByDisplayText]
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'idpedido'
          Column = GridView1DBColumn1
        end
        item
          Format = '###,###,###,###,#00.00'
          Kind = skSum
          FieldName = 'Saldo'
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
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object GridView1DBColumn1: TcxGridDBColumn
        Caption = 'C'#243'digo'
        Options.Editing = False
        Width = 72
        DataBinding.FieldName = 'codigo'
      end
      object GridView1DBColumn2: TcxGridDBColumn
        Options.Editing = False
        Width = 137
        DataBinding.FieldName = 'Nombre'
      end
      object GridView1DBColumn3: TcxGridDBColumn
        Width = 210
        DataBinding.FieldName = 'Email'
      end
      object GridView1DBColumn4: TcxGridDBColumn
        Caption = 'Area'
        Width = 115
        DataBinding.FieldName = 'area'
      end
    end
    object DBGLevel1: TcxGridLevel
      Caption = 'Pruebas'
      GridView = GridView1
    end
  end
  object btnenviar: TRzBitBtn
    Left = 390
    Top = 476
    Width = 131
    Height = 33
    Hint = 'Salir'
    ModalResult = 1
    Caption = '&Enviar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
    OnClick = btnenviarClick
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
  object btnsalir: TRzBitBtn
    Left = 528
    Top = 476
    Width = 105
    Height = 33
    Hint = 'Enviar el correo al destinatario'
    ModalResult = 1
    Caption = '&Salir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
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
  object chkCorreoInterno: TRzCheckBox
    Left = 512
    Top = 0
    Width = 115
    Height = 17
    Caption = 'Correo Interno'
    Checked = True
    FillColor = clWhite
    FrameColor = clTeal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HighlightColor = clBlue
    HotTrack = True
    HotTrackColor = clYellow
    ParentFont = False
    ReadOnlyColor = clHotLight
    TextShadowColor = clBackground
    State = cbChecked
    TabOrder = 7
  end
  object adj: TRzMemo
    Left = 0
    Top = 112
    Width = 633
    Height = 57
    TabOrder = 8
    FrameHotTrack = True
    FrameVisible = True
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'select codigo,'
      
        'concat(if (u.nombre = '#39#39' or u.nombre is null,'#39#39',u.nombre),'#39' '#39',if' +
        ' (apaterno = '#39#39' or apaterno is null,'#39#39',apaterno),'#39' '#39',if (amatern' +
        'o = '#39#39' or amaterno is null,'#39#39',amaterno) ) as Nombre,'
      'email1 as Email, a.nombre as area '
      'from usuarios u '
      'left join areas a on a.idarea=u.idarea'
      'where u.estatus = 1')
    FetchRows = 1
    CachedUpdates = True
    FetchAll = True
    Left = 112
    Top = 192
  end
  object DS1: TDataSource
    DataSet = sqlgeneral
    Left = 168
    Top = 208
  end
end
