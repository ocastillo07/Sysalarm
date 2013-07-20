object frmFacturacionLotesFECus: TfrmFacturacionLotesFECus
  Left = 303
  Top = 221
  Width = 761
  Height = 492
  AutoSize = True
  Caption = 'Facturacion Electronica por lotes Personalizada'
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
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object lblregistros: TRzLabel
    Left = 196
    Top = 380
    Width = 72
    Height = 13
    Caption = '                        '
    Visible = False
    BlinkIntervalOff = 5000
    BlinkIntervalOn = 20
  end
  object btnfacturar: TRzBitBtn
    Left = 312
    Top = 5
    Width = 105
    Caption = 'Facturar'
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 0
    OnClick = btnfacturarClick
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
      0000000000000000000000000000000000000000000000000000E81710101010
      1010101010E8E8E8E8E8E8AC818181818181818181E8E8E8E8E81710D7D7D7D7
      D7D7D7D7D710E8E8E8E8AC81D7D7D7D7D7D7D7D7D781E8E8E8E81710E3E3E3E3
      E3E3E3E3E310E8E8E8E8AC81E3E3E3E3E3E3E3E3E381E8E8E8E81710D7D7D7D7
      D7D7D7D7D710E8E8E8E8AC81D7D7D7D7D7D7D7D7D781E8E8E8E81710E3E3E3E3
      ACACACACAC10E8E8E8E8AC81E3E3E3E3ACACACACAC81E8E8E8E81710D7D7D7D7
      E3E3E3E3E310E8E8E8E8AC81D7D7D7D7E3E3E3E3E381E8E8E8E81710E3E3E3AC
      ACACACACAC10E8E8E8E8AC81E3E3E3ACACACACACAC81E8E8E8E81710D7D7D7E3
      E3E3E3E3E310E8E8E8E8AC81D7D7D7E3E3E3E3E3E381E8E8E8E81710E3E3ACAC
      10101010101010101010AC81E3E3ACAC818181818181818181811710D7D7E310
      17101010101010101010AC81D7D7E381AC8181818181818181811710E3AC1717
      171717101010101010E8AC81E3ACACACACACAC818181818181E81710D7175F5F
      1717171717101010E8E8AC81D7ACE3E3ACACACACAC818181E8E81710175F5F5F
      5F5F1717171710E8E8E8AC81ACE3E3E3E3E3ACACACAC81E8E8E817175F5F5F5F
      5F5F5F5F1710E8E8E8E8ACACE3E3E3E3E3E3E3E3AC81E8E8E8E8E81781D781D7
      81D781D781D7E8E8E8E8E8AC81D781D781D781D781D7E8E8E8E8E8E881AC81AC
      81AC81AC81E8E8E8E8E8E8E881AC81AC81AC81AC81E8E8E8E8E8}
    NumGlyphs = 2
  end
  object btnsalir: TRzBitBtn
    Left = 656
    Top = 5
    Width = 81
    Caption = '&Salir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 1
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
  object DBGrid1: TDBGrid
    Left = 193
    Top = 32
    Width = 552
    Height = 345
    DataSource = dspedidos
    TabOrder = 2
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'idpedido'
        Title.Alignment = taCenter
        Title.Caption = 'Venta'
        Width = 87
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'TotMn'
        Width = 103
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'idcliente'
        Title.Alignment = taCenter
        Title.Caption = 'Cliente'
        Width = 89
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'FechaLiquidacion'
        Title.Caption = 'Fecha Pago'
        Width = 76
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'sector'
        Title.Caption = 'Sector'
        Visible = True
      end>
  end
  object btnconsultar: TRzBitBtn
    Left = 200
    Top = 5
    Width = 113
    Caption = '&Consultar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 3
    OnClick = btnconsultarClick
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
      E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E8
      E8B4D8E8E8E8E8E8E8E8E8E8E8E8E8E8E8E281E8E8E8E8E8E8E8E8E8E8E8E8E8
      B46C6CD8E8E8E8E8E8E8E8E8E8E8E8E8E2818181E8E8E8E8E8E8E8E8E8E8E8E8
      B46CD86CD8E8E8E8E8E8E8E8E8E8E8E8E281818181E8E8E8E8E8E8E8E8E8E8E8
      B46C6CD86CD8E8E8E8E8E8E8E8E8E8E8E28181818181E8E8E8E8E8E8E8E8E8D7
      5E6C6C6CB46CD8E8E8E8E8E8E8E8E8D781818181E28181E8E8E8E8E8E8E8E8D7
      89896CB4B4B46CD8E8E8E8E8E8E8E8D7ACAC81E2E2E28181E8E8E8E8E8E8D789
      89D7D7B4C7C7C76CE8E8E8E8E8E8D7ACACD7D7E2ACACAC81E8E8E8E8E8D78989
      D7D7D7D76C6C6CE8E8E8E8E8E8D7ACACD7D7D7D7818181E8E8E8E8E8D78989D7
      D7D75E5EE8E8E8E8E8E8E8E8D7ACACD7D7D78181E8E8E8E8E8E8E8D78989D7D7
      D75EE8E8E8E8E8E8E8E8E8D7ACACD7D7D781E8E8E8E8E8E8E8E8D78989D7D7D7
      5EB4E8E8E8E8E8E8E8E8D7ACACD7D7D781E2E8E8E8E8E8E8E8E85E89D7D7D75E
      B4E8E8E8E8E8E8E8E8E881ACD7D7D781E2E8E8E8E8E8E8E8E8E8E85ED7D75EE8
      E8E8E8E8E8E8E8E8E8E8E881D7D781E8E8E8E8E8E8E8E8E8E8E8E8E85E5EE8E8
      E8E8E8E8E8E8E8E8E8E8E8E88181E8E8E8E8E8E8E8E8E8E8E8E8}
    NumGlyphs = 2
  end
  object RzGroupBar1: TRzGroupBar
    Left = 0
    Top = 0
    Width = 193
    Height = 454
    GradientColorStart = clBtnFace
    GradientColorStop = clBtnShadow
    GroupBorderSize = 8
    Color = clBlue
    ParentColor = False
    TabOrder = 4
    object Gfechas: TRzGroup
      Color = clGradientActiveCaption
      ColorDefault = False
      Items = <>
      Opened = True
      OpenedHeight = 73
      DividerVisible = True
      Caption = 'Rango de Fechas'
      ParentColor = False
      object RzLabel1: TRzLabel
        Left = 3
        Top = 48
        Width = 38
        Height = 13
        Caption = 'Hasta:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel5: TRzLabel
        Left = 3
        Top = 24
        Width = 41
        Height = 13
        Caption = 'Desde:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = True
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object dtphasta: TRzDateTimeEdit
        Left = 48
        Top = 48
        Width = 97
        Height = 21
        Hint = 'Fecha final'
        Date = 41274.000000000000000000
        EditType = etDate
        Alignment = taRightJustify
        FlatButtons = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        FocusColor = 16776176
        FrameColor = clOlive
        FrameHotTrack = True
        FrameHotStyle = fsFlat
        FrameVisible = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOnEnter = True
        TabOrder = 1
      end
      object dtpdesde: TRzDateTimeEdit
        Left = 48
        Top = 23
        Width = 97
        Height = 21
        Hint = 'Fecha de inicio'
        Date = 32874.000000000000000000
        EditType = etDate
        Alignment = taRightJustify
        FlatButtons = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        FocusColor = 16776176
        FrameColor = clOlive
        FrameHotTrack = True
        FrameVisible = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOnEnter = True
        TabOrder = 0
      end
    end
    object Gfact: TRzGroup
      Color = clGradientActiveCaption
      ColorDefault = False
      Items = <>
      Opened = True
      OpenedHeight = 80
      DividerVisible = True
      Caption = 'Fecha Facturacion'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      object dtpFecFact: TRzDateTimeEdit
        Left = 40
        Top = 43
        Width = 105
        Height = 21
        Hint = 'Fecha de inicio'
        Date = 41274.000000000000000000
        EditType = etDate
        Alignment = taRightJustify
        FlatButtons = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        FocusColor = 16776176
        FrameColor = clOlive
        FrameHotTrack = True
        FrameVisible = True
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOnEnter = True
        TabOrder = 0
      end
    end
    object Gventas: TRzGroup
      Color = clGradientActiveCaption
      ColorDefault = False
      Items = <>
      Opened = True
      OpenedHeight = 77
      DividerVisible = True
      Caption = 'Serie de Facturacion'
      ParentColor = False
    end
  end
  object cbprinters: TRzComboBox
    Left = 424
    Top = 8
    Width = 217
    Height = 21
    Ctl3D = False
    FlatButtons = True
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 5
  end
  object cbSeries: TRzComboBox
    Left = 40
    Top = 216
    Width = 129
    Height = 21
    Ctl3D = False
    FlatButtons = True
    FrameHotTrack = True
    FrameVisible = True
    ItemHeight = 13
    ParentCtl3D = False
    TabOrder = 6
  end
  object sqltemp: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'select DetPresupuesto.cveart,articulos.nombre,DetPresupuesto.can' +
        't,DetPresupuesto.piezas,articulos.iva/100 as Iva,articulos.desc_' +
        'esp/100 as descuento,articulos.aplica_desc,'
      
        'truncate(if (DetPresupuesto.utilidad = '#39'A'#39',articulos.precioa,if ' +
        '(DetPresupuesto.utilidad = '#39'B'#39',articulos.preciob,if (DetPresupue' +
        'sto.utilidad = '#39'C'#39',articulos.precioc,if (DetPresupuesto.utilidad' +
        ' = '#39'D'#39',articulos.preciod,'#39#39')))),3) as precio,  '
      
        'truncate(if (DetPresupuesto.utilidad = '#39'A'#39',if (articulos.aplica_' +
        'desc = '#39'True'#39','
      
        '(((articulos.precioa-(articulos.precioa*articulos.desc_esp/100))' +
        ' +((articulos.precioa-(articulos.precioa*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPresupuesto.cant) +'
      
        '((((articulos.precioa/articulos.piezas_envase)-((articulos.preci' +
        'oa/articulos.piezas_envase)*articulos.desc_esp/100)) +(((articul' +
        'os.precioa/articulos.piezas_envase)-((articulos.precioa/articulo' +
        's.piezas_envase)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPresupuesto.piezas) ,'
      
        '((articulos.precioa+(articulos.precioa*articulos.iva/100))*DetPr' +
        'esupuesto.cant) + if (articulos.piezas_envase>0,(((articulos.pre' +
        'cioa/articulos.piezas_envase)+((articulos.precioa/articulos.piez' +
        'as_envase)*articulos.iva/100))*DetPresupuesto.piezas),0)),'
      ''
      ''
      
        'if (DetPresupuesto.utilidad = '#39'B'#39',if (articulos.aplica_desc = '#39'T' +
        'rue'#39','
      
        '(((articulos.preciob-(articulos.preciob*articulos.desc_esp/100))' +
        ' +((articulos.preciob-(articulos.preciob*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPresupuesto.cant) +'
      
        '((((articulos.preciob/articulos.piezas_envase)-((articulos.preci' +
        'ob/articulos.piezas_envase)*articulos.desc_esp/100)) +(((articul' +
        'os.preciob/articulos.piezas_envase)-((articulos.preciob/articulo' +
        's.piezas_envase)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPresupuesto.piezas) ,'
      
        '((articulos.preciob+(articulos.preciob*articulos.iva/100))*DetPr' +
        'esupuesto.cant) + if (articulos.piezas_envase>0,(((articulos.pre' +
        'ciob/articulos.piezas_envase)+((articulos.preciob/articulos.piez' +
        'as_envase)*articulos.iva/100))*DetPresupuesto.piezas),0)),'
      ''
      
        'if (DetPresupuesto.utilidad = '#39'C'#39',if (articulos.aplica_desc = '#39'T' +
        'rue'#39','
      
        '(((articulos.precioc-(articulos.precioc*articulos.desc_esp/100))' +
        ' +((articulos.precioc-(articulos.precioc*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPresupuesto.cant) +'
      
        '((((articulos.precioc/articulos.piezas_envase)-((articulos.preci' +
        'oc/articulos.piezas_envase)*articulos.desc_esp/100)) +(((articul' +
        'os.precioc/articulos.piezas_envase)-((articulos.precioc/articulo' +
        's.piezas_envase)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPresupuesto.piezas) ,'
      
        '((articulos.precioc+(articulos.precioc*articulos.iva/100))*DetPr' +
        'esupuesto.cant) + if (articulos.piezas_envase>0,(((articulos.pre' +
        'cioc/articulos.piezas_envase)+((articulos.precioc/articulos.piez' +
        'as_envase)*articulos.iva/100))*DetPresupuesto.piezas),0)),'
      ''
      
        'if (DetPresupuesto.utilidad = '#39'D'#39',if (articulos.aplica_desc = '#39'T' +
        'rue'#39','
      
        '(((articulos.preciod-(articulos.preciod*articulos.desc_esp/100))' +
        ' +((articulos.preciod-(articulos.preciod*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPresupuesto.cant) +'
      
        '((((articulos.preciod/articulos.piezas_envase)-((articulos.preci' +
        'od/articulos.piezas_envase)*articulos.desc_esp/100)) +(((articul' +
        'os.preciod/articulos.piezas_envase)-((articulos.preciod/articulo' +
        's.piezas_envase)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPresupuesto.piezas) ,'
      
        '((articulos.preciod+(articulos.preciod*articulos.iva/100))*DetPr' +
        'esupuesto.cant) +if (articulos.piezas_envase>0,(((articulos.prec' +
        'iod/articulos.piezas_envase)+((articulos.preciod/articulos.pieza' +
        's_envase)*articulos.iva/100))*DetPresupuesto.piezas),0))'
      ',0)))),3)  as Total,'
      ''
      
        'articulos.piezas_envase,ROUND((articulos.tinstalacion*DetPresupu' +
        'esto.cant),3)  as tinstalacion,DetPresupuesto.utilidad'
      
        'from DetPresupuesto inner join articulos on DetPresupuesto.cvear' +
        't = articulos.cod_cve'
      'where DetPresupuesto.idpresupuesto= :idpresupuesto')
    ReadOnly = True
    FetchAll = True
    Left = 224
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
      end>
  end
  object SqlGeneral: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'select DetPresupuesto.cveart,articulos.nombre,DetPresupuesto.can' +
        't,DetPresupuesto.piezas,articulos.iva/100 as Iva,articulos.desc_' +
        'esp/100 as descuento,articulos.aplica_desc,'
      
        'truncate(if (DetPresupuesto.utilidad = '#39'A'#39',articulos.precioa,if ' +
        '(DetPresupuesto.utilidad = '#39'B'#39',articulos.preciob,if (DetPresupue' +
        'sto.utilidad = '#39'C'#39',articulos.precioc,if (DetPresupuesto.utilidad' +
        ' = '#39'D'#39',articulos.preciod,'#39#39')))),3) as precio,  '
      
        'truncate(if (DetPresupuesto.utilidad = '#39'A'#39',if (articulos.aplica_' +
        'desc = '#39'True'#39','
      
        '(((articulos.precioa-(articulos.precioa*articulos.desc_esp/100))' +
        ' +((articulos.precioa-(articulos.precioa*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPresupuesto.cant) +'
      
        '((((articulos.precioa/articulos.piezas_envase)-((articulos.preci' +
        'oa/articulos.piezas_envase)*articulos.desc_esp/100)) +(((articul' +
        'os.precioa/articulos.piezas_envase)-((articulos.precioa/articulo' +
        's.piezas_envase)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPresupuesto.piezas) ,'
      
        '((articulos.precioa+(articulos.precioa*articulos.iva/100))*DetPr' +
        'esupuesto.cant) + if (articulos.piezas_envase>0,(((articulos.pre' +
        'cioa/articulos.piezas_envase)+((articulos.precioa/articulos.piez' +
        'as_envase)*articulos.iva/100))*DetPresupuesto.piezas),0)),'
      ''
      ''
      
        'if (DetPresupuesto.utilidad = '#39'B'#39',if (articulos.aplica_desc = '#39'T' +
        'rue'#39','
      
        '(((articulos.preciob-(articulos.preciob*articulos.desc_esp/100))' +
        ' +((articulos.preciob-(articulos.preciob*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPresupuesto.cant) +'
      
        '((((articulos.preciob/articulos.piezas_envase)-((articulos.preci' +
        'ob/articulos.piezas_envase)*articulos.desc_esp/100)) +(((articul' +
        'os.preciob/articulos.piezas_envase)-((articulos.preciob/articulo' +
        's.piezas_envase)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPresupuesto.piezas) ,'
      
        '((articulos.preciob+(articulos.preciob*articulos.iva/100))*DetPr' +
        'esupuesto.cant) + if (articulos.piezas_envase>0,(((articulos.pre' +
        'ciob/articulos.piezas_envase)+((articulos.preciob/articulos.piez' +
        'as_envase)*articulos.iva/100))*DetPresupuesto.piezas),0)),'
      ''
      
        'if (DetPresupuesto.utilidad = '#39'C'#39',if (articulos.aplica_desc = '#39'T' +
        'rue'#39','
      
        '(((articulos.precioc-(articulos.precioc*articulos.desc_esp/100))' +
        ' +((articulos.precioc-(articulos.precioc*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPresupuesto.cant) +'
      
        '((((articulos.precioc/articulos.piezas_envase)-((articulos.preci' +
        'oc/articulos.piezas_envase)*articulos.desc_esp/100)) +(((articul' +
        'os.precioc/articulos.piezas_envase)-((articulos.precioc/articulo' +
        's.piezas_envase)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPresupuesto.piezas) ,'
      
        '((articulos.precioc+(articulos.precioc*articulos.iva/100))*DetPr' +
        'esupuesto.cant) + if (articulos.piezas_envase>0,(((articulos.pre' +
        'cioc/articulos.piezas_envase)+((articulos.precioc/articulos.piez' +
        'as_envase)*articulos.iva/100))*DetPresupuesto.piezas),0)),'
      ''
      
        'if (DetPresupuesto.utilidad = '#39'D'#39',if (articulos.aplica_desc = '#39'T' +
        'rue'#39','
      
        '(((articulos.preciod-(articulos.preciod*articulos.desc_esp/100))' +
        ' +((articulos.preciod-(articulos.preciod*articulos.desc_esp/100)' +
        ')*articulos.iva/100))*DetPresupuesto.cant) +'
      
        '((((articulos.preciod/articulos.piezas_envase)-((articulos.preci' +
        'od/articulos.piezas_envase)*articulos.desc_esp/100)) +(((articul' +
        'os.preciod/articulos.piezas_envase)-((articulos.preciod/articulo' +
        's.piezas_envase)*articulos.desc_esp/100))*articulos.iva/100))*De' +
        'tPresupuesto.piezas) ,'
      
        '((articulos.preciod+(articulos.preciod*articulos.iva/100))*DetPr' +
        'esupuesto.cant) +if (articulos.piezas_envase>0,(((articulos.prec' +
        'iod/articulos.piezas_envase)+((articulos.preciod/articulos.pieza' +
        's_envase)*articulos.iva/100))*DetPresupuesto.piezas),0))'
      ',0)))),3)  as Total,'
      ''
      
        'articulos.piezas_envase,ROUND((articulos.tinstalacion*DetPresupu' +
        'esto.cant),3)  as tinstalacion,DetPresupuesto.utilidad'
      
        'from DetPresupuesto inner join articulos on DetPresupuesto.cvear' +
        't = articulos.cod_cve'
      'where DetPresupuesto.idpresupuesto= :idpresupuesto')
    ReadOnly = True
    FetchAll = True
    Left = 272
    Top = 56
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'idpresupuesto'
      end>
  end
  object sqlpedidos: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'select pedidos.TotMn,pedidos.estatus,pedidos.idUnidadNegocio,ped' +
        'idos.idpedido,pedidos.idcliente,pedidos.FechaLiquidacion,cliente' +
        's.sector'
      
        'from pedidos inner join clientes on clientes.idcliente=pedidos.i' +
        'dcliente'
      
        'where pedidos.saldado = 1 and  pedidos.FechaLiquidacion between ' +
        #39'2006/05/01'#39'  and  '#39'2006/05/25'#39' and pedidos.estatus = 3 order by' +
        ' pedidos.FechaLiquidacion')
    ReadOnly = True
    AfterOpen = sqlpedidosAfterOpen
    AfterClose = sqlpedidosAfterClose
    FetchAll = True
    Left = 224
    Top = 104
  end
  object dspedidos: TDataSource
    DataSet = sqlpedidos
    Left = 280
    Top = 104
  end
end
