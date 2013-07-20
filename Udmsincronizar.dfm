object DMSincronizar: TDMSincronizar
  OldCreateOrder = False
  Left = 597
  Top = 255
  Height = 150
  Width = 427
  object ConexionLocal: TMyConnection
    Database = 'sysalarmmxl'
    Username = 'root'
    Password = 'kingdom'
    Server = '127.0.0.1'
    LoginPrompt = False
    Left = 24
    Top = 8
  end
  object sqlgeneral: TMyQuery
    Connection = ConexionLocal
    FetchAll = True
    Left = 96
    Top = 64
  end
  object sqlorigen: TMyQuery
    Connection = ConexionLocal
    FetchAll = True
    Left = 160
    Top = 8
  end
  object sqldestino: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 224
    Top = 64
  end
  object iniFile: TLMDIniCtrl
    IniFile = 'conexion.ini'
    IniPrefix = ppProgram
    Target = itIniFile
    Encoded = True
    CryptMode = icmTextKey
    Left = 96
    Top = 8
  end
  object sqldestino1: TMyQuery
    Connection = DMAccesos.conexion
    FetchAll = True
    Left = 288
    Top = 64
  end
  object sqlorigen1: TMyQuery
    Connection = ConexionLocal
    FetchAll = True
    Left = 224
    Top = 8
  end
  object sqlgeneral1: TMyQuery
    Connection = ConexionLocal
    FetchAll = True
    Left = 160
    Top = 64
  end
  object sqlorigen2: TMyQuery
    Connection = ConexionLocal
    FetchAll = True
    Left = 288
    Top = 8
  end
  object sqlorigen3: TMyQuery
    Connection = ConexionLocal
    FetchAll = True
    Left = 344
    Top = 8
  end
  object sqlorigen4: TMyQuery
    Connection = ConexionLocal
    FetchAll = True
    Left = 24
    Top = 64
  end
  object Lanzador: TRzLauncher
    Action = 'Open'
    Timeout = -1
    Left = 344
    Top = 64
  end
end
