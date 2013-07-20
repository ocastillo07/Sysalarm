object frmAperturaCierre: TfrmAperturaCierre
  Left = 87
  Top = 179
  Width = 831
  Height = 538
  Caption = 'Horarios de Aperturas y Cierres de Clientes'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poDefault
  Visible = True
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object RzLabel1: TRzLabel
    Left = 66
    Top = 422
    Width = 383
    Height = 16
    Caption = 'De Clic derecho sobre la rejilla para ver mas opciones.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel2: TRzLabel
    Left = 2
    Top = 446
    Width = 800
    Height = 13
    Caption = 
      '* Lo diferencia entre OP Early y OP Normal indica el periodo de ' +
      'tiempo en que se puede Des-Armar y es tomado como Des-Armado Tem' +
      'prano'
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
    Left = 2
    Top = 462
    Width = 774
    Height = 13
    Caption = 
      '* Lo diferencia entre OP Normal y OP Late indica el periodo de t' +
      'iempo en que se puede Des-Armar y es tomado como Des-Armado Tard' +
      'e'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel4: TRzLabel
    Left = 2
    Top = 478
    Width = 369
    Height = 13
    Caption = 
      '* Los criterios anteriores aplican de igual forma para los Armad' +
      'os'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzLabel5: TRzLabel
    Left = 216
    Top = 0
    Width = 80
    Height = 20
    Caption = 'Aperturas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzSeparator1: TRzSeparator
    Left = 88
    Top = 24
    Width = 321
    Height = 9
    HighlightColor = clOlive
    HighlightLocation = hlUpperLeft
    ShowGradient = True
    ParentColor = False
  end
  object RzLabel6: TRzLabel
    Left = 552
    Top = 0
    Width = 58
    Height = 20
    Caption = 'Cierres'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object RzSeparator2: TRzSeparator
    Left = 424
    Top = 24
    Width = 313
    Height = 9
    HighlightColor = clBlue
    HighlightLocation = hlUpperLeft
    ShowGradient = True
    Color = 16776176
    ParentColor = False
  end
  object cxGrid1: TcxGrid
    Left = 0
    Top = 39
    Width = 809
    Height = 378
    PopupMenu = Submenu
    TabOrder = 0
    object tvapertura: TcxGridDBTableView
      OnKeyDown = tvaperturaKeyDown
      DataController.DataSource = dsaperturas
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      NavigatorButtons.First.Visible = False
      NavigatorButtons.PriorPage.Visible = False
      NavigatorButtons.Prior.Hint = 'Renglon Anterior'
      NavigatorButtons.Prior.Visible = True
      NavigatorButtons.Next.Hint = 'Siguiente Renglon'
      NavigatorButtons.NextPage.Visible = False
      NavigatorButtons.Last.Visible = False
      NavigatorButtons.Delete.Hint = 'Eliminar Renglon'
      NavigatorButtons.Edit.Hint = 'Editar Renglon'
      NavigatorButtons.Post.Hint = 'Guardar'
      NavigatorButtons.Cancel.Hint = 'Cancelar Edicion'
      NavigatorButtons.Refresh.Hint = 'Refrescar Datos'
      NavigatorButtons.SaveBookmark.Visible = False
      NavigatorButtons.GotoBookmark.Visible = False
      NavigatorButtons.Filter.Visible = False
      OptionsBehavior.AlwaysShowEditor = True
      OptionsData.Appending = True
      OptionsView.Navigator = True
      OptionsView.GroupByBox = False
      OptionsView.Indicator = True
      object cxdia: TcxGridDBColumn
        Caption = 'Dia'
        PropertiesClassName = 'TcxComboBoxProperties'
        Properties.ImmediatePost = True
        Properties.ImmediateUpdateText = True
        Properties.Items.Strings = (
          'Lunes'
          'Martes'
          'Miercoles'
          'Jueves'
          'Viernes '
          'Sabado'
          'Domingo')
        Width = 70
        DataBinding.FieldName = 'dia'
      end
      object cxope: TcxGridDBColumn
        Caption = 'OP Early'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.UseCtrlIncrement = True
        Properties.Use24HourFormat = False
        Width = 109
        DataBinding.FieldName = 'ok'
      end
      object cxOPNormal: TcxGridDBColumn
        Caption = 'OP Normal'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Use24HourFormat = False
        Width = 115
        DataBinding.FieldName = 'op'
      end
      object cxoplate: TcxGridDBColumn
        Caption = 'OP Late'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Use24HourFormat = False
        Width = 111
        DataBinding.FieldName = 'oj'
      end
      object cxclearly: TcxGridDBColumn
        Caption = 'CL Early'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Use24HourFormat = False
        Width = 112
        DataBinding.FieldName = 'ck'
      end
      object cxclnormal: TcxGridDBColumn
        Caption = 'CL Normal'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Use24HourFormat = False
        Width = 113
        DataBinding.FieldName = 'cl'
      end
      object cxcllate: TcxGridDBColumn
        Caption = 'CL Late'
        PropertiesClassName = 'TcxTimeEditProperties'
        Properties.Use24HourFormat = False
        Width = 100
        DataBinding.FieldName = 'cj'
      end
      object cxcliente: TcxGridDBColumn
        Visible = False
        Hidden = True
        DataBinding.FieldName = 'idcliente'
      end
      object cxNumDia: TcxGridDBColumn
        DataBinding.FieldName = 'NumDia'
      end
    end
    object cxGrid1Level1: TcxGridLevel
      GridView = tvapertura
    end
  end
  object btncerrar: TRzBitBtn
    Left = 0
    Top = 417
    Width = 65
    Caption = '&Cerrar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 1
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
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    Options.FullRefresh = True
    FetchAll = True
    Left = 240
    Top = 215
  end
  object sqlaperturas1: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'select * from AperturaCierre')
    Options.FullRefresh = True
    FetchAll = True
    Left = 240
    Top = 263
  end
  object dsaperturas: TDataSource
    DataSet = tblaperturas
    Left = 168
    Top = 248
  end
  object tblaperturas: TMyTable
    TableName = 'AperturaCierre'
    Connection = DMAccesos.conexion
    BeforePost = tblaperturasBeforePost
    AfterPost = tblaperturasAfterPost
    BeforeScroll = tblaperturasBeforeScroll
    Options.StrictUpdate = False
    FetchAll = True
    Left = 168
    Top = 192
    object tblaperturasidcliente: TIntegerField
      FieldName = 'idcliente'
    end
    object tblaperturasdia: TStringField
      FieldName = 'dia'
      Size = 10
    end
    object tblaperturasok: TTimeField
      FieldName = 'ok'
    end
    object tblaperturasop: TTimeField
      FieldName = 'op'
    end
    object tblaperturasoj: TTimeField
      FieldName = 'oj'
    end
    object tblaperturasck: TTimeField
      FieldName = 'ck'
    end
    object tblaperturascl: TTimeField
      FieldName = 'cl'
    end
    object tblaperturascj: TTimeField
      FieldName = 'cj'
    end
    object tblaperturasid: TIntegerField
      FieldName = 'id'
    end
    object tblaperturasNumDia: TSmallintField
      FieldName = 'NumDia'
    end
    object tblaperturasDiaSig: TSmallintField
      FieldName = 'DiaSig'
    end
  end
  object Submenu: TPopupMenu
    OnPopup = SubmenuPopup
    Left = 448
    Top = 112
    object InsertarRenglonIgualalSeleccionado1: TMenuItem
      Caption = 'Insertar Renglon Igual al Seleccionado'
      OnClick = InsertarRenglonIgualalSeleccionado1Click
    end
    object InsertarNrenglonesigualesalSeleccionado1: TMenuItem
      Caption = 'Insertar N renglones iguales al Seleccionado'
      OnClick = InsertarNrenglonesigualesalSeleccionado1Click
    end
    object EliminarRenglon1: TMenuItem
      Caption = 'Eliminar Renglon'
      OnClick = EliminarRenglon1Click
    end
  end
end
