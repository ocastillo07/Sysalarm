object frmNoClientes: TfrmNoClientes
  Left = 207
  Top = 145
  Width = 811
  Height = 543
  Caption = 'Cuentas Disponibles (Para Reasignar)'
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
  WindowState = wsMaximized
  OnClose = FormClose
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object GNoClientes: TcxGrid
    Left = 0
    Top = 0
    Width = 803
    Height = 468
    Align = alClient
    TabOrder = 0
    object VNoClientes: TcxGridDBTableView
      DataController.DataSource = dsNoClientes
      DataController.Summary.DefaultGroupSummaryItems = <>
      DataController.Summary.FooterSummaryItems = <
        item
          Kind = skCount
          FieldName = 'idcliente'
          Column = CxCuenta
        end>
      DataController.Summary.SummaryGroups = <>
      NavigatorButtons.ConfirmDelete = False
      OptionsBehavior.IncSearch = True
      OptionsData.CancelOnExit = False
      OptionsData.Deleting = False
      OptionsData.DeletingConfirmation = False
      OptionsData.Editing = False
      OptionsData.Inserting = False
      OptionsView.CellAutoHeight = True
      OptionsView.Footer = True
      OptionsView.Indicator = True
      object CxCuenta: TcxGridDBColumn
        Caption = 'Cuenta'
        Options.Editing = False
        SortOrder = soAscending
        Width = 62
        DataBinding.FieldName = 'idcliente'
      end
      object cxnombre: TcxGridDBColumn
        Options.Editing = False
        Width = 269
        DataBinding.FieldName = 'Nombre'
      end
      object cxdir: TcxGridDBColumn
        Options.Editing = False
        Width = 434
        DataBinding.FieldName = 'Direccion'
      end
      object cxcp: TcxGridDBColumn
        Caption = 'CP'
        Options.Editing = False
        Width = 63
        DataBinding.FieldName = 'cp'
      end
      object CxGiro: TcxGridDBColumn
        Options.Editing = False
        DataBinding.FieldName = 'Giro'
      end
      object CxSector: TcxGridDBColumn
        Caption = 'Sector'
        Options.Editing = False
        DataBinding.FieldName = 'sector'
      end
    end
    object LNoClientes: TcxGridLevel
      GridView = VNoClientes
    end
  end
  object btnSalir: TRzBitBtn
    Left = 0
    Top = 468
    Width = 803
    Height = 41
    Align = alBottom
    Caption = '&Cerrar'
    Color = 16776176
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    HotTrack = True
    ParentFont = False
    TabOrder = 1
    OnClick = BtnSalirClick
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
  object dsNoClientes: TDataSource
    DataSet = sqlNoClientes
    Left = 200
    Top = 128
  end
  object sqlNoClientes: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'SELECT NoClientes.idcliente,if(NoClientes.rsocial is null or NoC' +
        'lientes.rsocial='#39#39',concat(ifnull(NoClientes.nombre,'#39#39'),'#39' '#39',ifnul' +
        'l(NoClientes.apaterno,'#39#39'),'#39' '#39',ifnull(NoClientes.amaterno,'#39#39')),No' +
        'Clientes.rsocial) as '
      
        '  Nombre,concat(ifnull(NoClientes.dir,'#39#39'),'#39' '#39',ifnull(NoClientes.' +
        'numero,'#39#39'),'#39' Col  '#39',ifnull(colonias.nombre,'#39#39'),'#39' '#39',ifnull(NoClie' +
        'ntes.ciudad,'#39#39'),'#39' '#39',ifnull(NoClientes.estado,'#39#39')) as Direccion,'
      
        'NoClientes.cp,NoClientes.sector,giros.nombre AS Giro, NoClientes' +
        '.idnocliente'
      
        'FROM NoClientes left JOIN colonias ON (NoClientes.idcol = coloni' +
        'as.idcol) left JOIN giros ON (NoClientes.idgiro = giros.idgiro) '
      'left join clientes as c on (c.idcliente=NoClientes.idcliente)'
      'where c.idcliente is null'
      'order by NoClientes.idcliente'
      '')
    ReadOnly = True
    FetchAll = True
    Left = 120
    Top = 128
  end
  object sqlgeneral: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      
        'SELECT NoClientes.idcliente,if(NoClientes.rsocial is null or NoC' +
        'lientes.rsocial='#39#39',concat(ifnull(NoClientes.nombre,'#39#39'),'#39' '#39',ifnul' +
        'l(NoClientes.apaterno,'#39#39'),'#39' '#39',ifnull(NoClientes.amaterno,'#39#39')),No' +
        'Clientes.rsocial) as   Nombre,concat(ifnull(NoClientes.dir,'#39#39'),'#39 +
        ' '#39',ifnull(NoClientes.numero,'#39#39'),'#39' Col  '#39',ifnull(colonias.nombre,' +
        #39#39'),'#39' '#39',ifnull(NoClientes.ciudad,'#39#39'),'#39' '#39',ifnull(NoClientes.estad' +
        'o,'#39#39')) as Direccion,'
      
        'NoClientes.cp,NoClientes.sector,NoClientes.email,giros.nombre AS' +
        ' Giro,categorias.nombre AS Categoria,protocolos.protocolo,NoClie' +
        'ntes.alarm,NoClientes.idfact,NoClientes.idtel,NoClientes.idnota,' +
        'NoClientes.idcontacto'
      
        'FROM NoClientes INNER JOIN colonias ON (NoClientes.idcol = colon' +
        'ias.idcol) INNER JOIN giros ON (NoClientes.idgiro = giros.idgiro' +
        ') INNER JOIN categorias ON (NoClientes.idcategoria = categorias.' +
        'idcategoria)'
      
        'INNER JOIN protocolos ON (NoClientes.idprotocolo = protocolos.id' +
        'protocolo) order by NoClientes.idcliente')
    FetchAll = True
    Left = 272
    Top = 136
  end
end
