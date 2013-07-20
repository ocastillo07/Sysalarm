object frmrep_oportu: Tfrmrep_oportu
  Left = 143
  Top = 201
  Width = 816
  Height = 502
  Align = alCustom
  AutoSize = True
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Reportes de Oportunidades'
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsMDIChild
  OldCreateOrder = False
  Position = poScreenCenter
  Visible = True
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object RzGroupBox1: TRzGroupBox
    Left = 0
    Top = 0
    Width = 805
    Height = 465
    Align = alCustom
    BorderColor = clBlue
    Caption = 'Reporte Contactos Pendientes'
    Color = clWhite
    FlatColor = clActiveCaption
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 0
    object btnalta: TRzBitBtn
      Left = 626
      Top = 328
      Width = 159
      Height = 49
      Hint = 'Dar click para generar el Reporte'
      ModalResult = 1
      Caption = '&Generar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 6
      OnClick = btnaltaClick
      ImageIndex = 10
      Images = DMAccesos.ilopciones
    end
    object periodo: TRzGroupBox
      Left = 16
      Top = 32
      Width = 217
      Height = 121
      Caption = 'Periodo'
      Color = cl3DLight
      TabOrder = 0
      object RzLabel4: TRzLabel
        Left = 16
        Top = 80
        Width = 46
        Height = 16
        Caption = 'Hasta:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel3: TRzLabel
        Left = 16
        Top = 40
        Width = 51
        Height = 16
        Caption = 'Desde:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object edfechafin: TRzDateTimeEdit
        Left = 72
        Top = 72
        Width = 129
        Height = 24
        Hint = 'Fecha final'
        EditType = etDate
        FlatButtons = True
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnKeyPress = edfechainiKeyPress
      end
      object edfechaini: TRzDateTimeEdit
        Left = 72
        Top = 32
        Width = 129
        Height = 24
        Hint = 'Fecha inicial'
        EditType = etDate
        FlatButtons = True
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnKeyPress = edfechainiKeyPress
      end
    end
    object vendedores: TRzGroupBox
      Left = 264
      Top = 32
      Width = 201
      Height = 121
      Caption = 'Vendedores'
      Color = cl3DLight
      TabOrder = 1
      object RzLabel2: TRzLabel
        Left = 16
        Top = 80
        Width = 46
        Height = 16
        Caption = 'Hasta:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel5: TRzLabel
        Left = 16
        Top = 40
        Width = 51
        Height = 16
        Caption = 'Desde:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object cboven1: TRzComboBox
        Left = 64
        Top = 32
        Width = 121
        Height = 24
        Hint = 'Desde el vendedor'
        CharCase = ecUpperCase
        Ctl3D = False
        FlatButtons = True
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ItemHeight = 16
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnKeyPress = edfechainiKeyPress
      end
      object cboven2: TRzComboBox
        Left = 64
        Top = 72
        Width = 121
        Height = 24
        Hint = 'Hasta el vendedor'
        CharCase = ecUpperCase
        Ctl3D = False
        FlatButtons = True
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ItemHeight = 16
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnKeyPress = edfechainiKeyPress
      end
    end
    object fuentes: TRzGroupBox
      Left = 488
      Top = 32
      Width = 305
      Height = 121
      Caption = 'Fuentes'
      Color = cl3DLight
      TabOrder = 2
      object RzLabel6: TRzLabel
        Left = 16
        Top = 80
        Width = 46
        Height = 16
        Caption = 'Hasta:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel7: TRzLabel
        Left = 16
        Top = 40
        Width = 51
        Height = 16
        Caption = 'Desde:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object cbofuen2: TRzComboBox
        Left = 64
        Top = 72
        Width = 225
        Height = 24
        Hint = 'Hasta la fuente'
        CharCase = ecUpperCase
        Ctl3D = False
        FlatButtons = True
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ItemHeight = 16
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnKeyPress = edfechainiKeyPress
      end
      object cbofuen1: TRzComboBox
        Left = 64
        Top = 32
        Width = 225
        Height = 24
        Hint = 'Desde la fuente'
        CharCase = ecUpperCase
        Ctl3D = False
        FlatButtons = True
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ItemHeight = 16
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnKeyPress = edfechainiKeyPress
      end
    end
    object giros: TRzGroupBox
      Left = 352
      Top = 168
      Width = 345
      Height = 121
      Caption = 'Tipos de Oportunidad'
      Color = cl3DLight
      TabOrder = 3
      object RzLabel10: TRzLabel
        Left = 8
        Top = 80
        Width = 46
        Height = 16
        Caption = 'Hasta:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel11: TRzLabel
        Left = 8
        Top = 40
        Width = 51
        Height = 16
        Caption = 'Desde:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object cbogiro2: TRzComboBox
        Left = 56
        Top = 72
        Width = 273
        Height = 24
        Hint = 'Hasta el giro'
        CharCase = ecUpperCase
        Ctl3D = False
        FlatButtons = True
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ItemHeight = 16
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnKeyPress = edfechainiKeyPress
      end
      object cbogiro1: TRzComboBox
        Left = 56
        Top = 32
        Width = 273
        Height = 24
        Hint = 'Desde el giro'
        CharCase = ecUpperCase
        Ctl3D = False
        FlatButtons = True
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ItemHeight = 16
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnKeyPress = edfechainiKeyPress
      end
    end
    object estatus: TRzGroupBox
      Left = 17
      Top = 168
      Width = 313
      Height = 121
      Caption = 'Estatus'
      Color = cl3DLight
      TabOrder = 4
      object RzLabel12: TRzLabel
        Left = 8
        Top = 80
        Width = 46
        Height = 16
        Caption = 'Hasta:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel13: TRzLabel
        Left = 8
        Top = 40
        Width = 51
        Height = 16
        Caption = 'Desde:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object cboesta2: TRzComboBox
        Left = 56
        Top = 72
        Width = 241
        Height = 24
        Hint = 'Hasta el estatus'
        CharCase = ecUpperCase
        Ctl3D = False
        FlatButtons = True
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ItemHeight = 16
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnKeyPress = edfechainiKeyPress
      end
      object cboesta1: TRzComboBox
        Left = 56
        Top = 32
        Width = 241
        Height = 24
        Hint = 'Desde el estatus'
        CharCase = ecUpperCase
        Ctl3D = False
        FlatButtons = True
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ItemHeight = 16
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnKeyPress = edfechainiKeyPress
      end
    end
    object origen: TRzGroupBox
      Left = 17
      Top = 304
      Width = 313
      Height = 121
      Caption = 'Origen'
      Color = cl3DLight
      TabOrder = 5
      object RzLabel1: TRzLabel
        Left = 8
        Top = 80
        Width = 46
        Height = 16
        Caption = 'Hasta:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object RzLabel14: TRzLabel
        Left = 8
        Top = 40
        Width = 51
        Height = 16
        Caption = 'Desde:'
        BlinkIntervalOff = 5000
        BlinkIntervalOn = 20
      end
      object cboorig2: TRzComboBox
        Left = 56
        Top = 72
        Width = 241
        Height = 24
        Hint = 'Hasta el origen'
        CharCase = ecUpperCase
        Ctl3D = False
        FlatButtons = True
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ItemHeight = 16
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnKeyPress = edfechainiKeyPress
      end
      object cboorig1: TRzComboBox
        Left = 56
        Top = 32
        Width = 241
        Height = 24
        Hint = 'Desde el origen'
        CharCase = ecUpperCase
        Ctl3D = False
        FlatButtons = True
        FrameColor = clActiveCaption
        FrameSides = [sdBottom]
        FrameVisible = True
        ItemHeight = 16
        ParentCtl3D = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnKeyPress = edfechainiKeyPress
      end
    end
    object btncerrar: TRzBitBtn
      Left = 626
      Top = 392
      Width = 159
      Height = 33
      Hint = 'Cerrar esta pantalla'
      ModalResult = 1
      Caption = '&Cerrar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      HotTrack = True
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btncerrarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFF1FFFFFFFFFF9FFFF7FFFFFFFFFF8FFF991FFFFFFF
        FFFFFF787FFFFFFFFFFFFF9B91FFFFFFF9FFFF7F87FFFFFFF8FFFFF999FFFFFF
        9FFFFFF7F7FFFFFF8FFFFFFF991FFFF91FFFFFFF787FFFF87FFFFFFFF991FF91
        FFFFFFFFF787FF87FFFFFFFFFF99191FFFFFFFFFFF78787FFFFFFFFFFFF991FF
        FFFFFFFFFFF787FFFFFFFFFFFF99191FFFFFFFFFFF78777FFFFFFFFFF991FF91
        FFFFFFFFF787FF77FFFFFFF9991FFFF91FFFFFF7887FFFF77FFFFF9B91FFFFFF
        91FFFF7F87FFFFFF77FFFF797FFFFFFFFF9FFF878FFFFFFFFF7FFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
      Images = DMAccesos.ilopciones
      NumGlyphs = 2
    end
    object rgReporte: TRzRadioGroup
      Left = 360
      Top = 312
      Width = 153
      Height = 73
      Caption = 'Incluir'
      Color = cl3DLight
      ItemHotTrack = True
      ItemIndex = 0
      Items.Strings = (
        'Todos'
        'Visitas Nuevas')
      TabOrder = 8
    end
  end
  object sqlgeneral2: TMyQuery
    Connection = DMAccesos.conexion
    SQL.Strings = (
      'SELECT '
      'agenda_vendedores.fecha_creacion,'
      'agenda_vendedores.hora_creacion,'
      'agenda_vendedores.idvendedor,'
      'actividades_vendedores.observaciones as seguimiento,'
      'oportunidades.idoportunidad,'
      
        'IF (oportunidades.nombre <> '#39#39' '#39#39', concat(oportunidades.nombre,'#39 +
        '  '#39',oportunidades.apaterno,'#39'  '#39',oportunidades.amaterno),rsocial)' +
        ' as COMPLETO,'
      'usuarios.codigo,'
      
        'concat(usuarios.nombre,'#39'  '#39',usuarios.apaterno,'#39'  '#39',usuarios.amat' +
        'erno) as nombre_ven,'
      'tipos_actividades.nombre as t_a_nombre,'
      'telefonos.telefono,'
      'telefonos.tipo_tel,'
      'fuentes.nombre as fuentes,'
      'origen.nombre as origen,'
      'colonias.nombre as colonia,'
      'tipos_actividades.nombre as tipo,'
      'estatus_eventos.nombre as estatus,'
      'giros.nombre as giro,'
      'max(actividades_vendedores.fecha) as PROX'
      ''
      'FROM'
      'agenda_vendedores '
      
        'LEFT JOIN oportunidades ON (agenda_vendedores.idoportunidad = op' +
        'ortunidades.idoportunidad ) '
      
        'LEFT JOIN actividades_vendedores ON (agenda_vendedores.idevento ' +
        '= actividades_vendedores.idevento)'
      
        'LEFT JOIN usuarios ON (agenda_vendedores.idvendedor = usuarios.i' +
        'dusuario)'
      
        'INNER JOIN tipos_actividades ON (actividades_vendedores.idtipo_a' +
        'ctividad=tipos_actividades.idtipo_actividad)'
      'LEFT JOIN telefonos ON (telefonos.idtel = oportunidades.idtel)'
      'LEFT JOIN fuentes ON (fuentes.idfuente = oportunidades.idfuente)'
      'LEFT JOIN origen ON (origen.idorigen=oportunidades.idorigen)'
      'LEFT JOIN colonias ON(colonias.idcol=oportunidades.idcol)'
      
        'LEFT JOIN estatus_eventos ON (estatus_eventos.idestatus=agenda_v' +
        'endedores.idestatus)'
      'LEFT JOIN giros ON (giros.idgiro=oportunidades.idgiro)'
      ''
      'WHERE'
      
        'agenda_vendedores.fecha_creacion between '#39'2005/09/01'#39'  and '#39'2005' +
        '/09/02'#39'  '
      'AND'
      'usuarios.codigo between  '#39'AHM'#39' and '#39'XXX'#39
      'AND'
      'fuentes.idfuente between 1 and 30'
      'AND'
      'tipos_actividades.idtipo_actividad between 1 and 5'
      'AND'
      'giros.idgiro between 1 and 4'
      'AND'
      'estatus_eventos.idestatus between 1 and 11'
      'AND'
      'origen.idorigen between  1 and 5'
      ' '
      'group by agenda_vendedores.idevento '
      'ORDER BY '
      'agenda_vendedores.hora_creacion '
      'ASC ')
    CachedUpdates = True
    FetchAll = True
    Left = 424
  end
end
