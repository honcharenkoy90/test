object connection_module: Tconnection_module
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 312
  Width = 445
  object connection: TUniConnection
    Database = 'metro'
    SpecificOptions.Strings = (
      'SQL Server.Authentication=auWindows')
    LoginPrompt = False
    Left = 56
    Top = 40
  end
  object SQLServerUniProvider1: TSQLServerUniProvider
    Left = 56
    Top = 136
  end
end
