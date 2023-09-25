object MyDModule: TMyDModule
  Height = 600
  Width = 800
  PixelsPerInch = 120
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 590
    Top = 160
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    FetchOptions.AssignedValues = [evMode, evRowsetSize]
    SQL.Strings = (
      '')
    Left = 460
    Top = 160
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=gpt3'
      'User_Name=sa'
      'Password=4krc123'
      'Server=DESKTOP-FOREST'
      'OSAuthent=No'
      'DriverID=MSSQL')
    FetchOptions.AssignedValues = [evMode]
    LoginPrompt = False
    Left = 330
    Top = 160
  end
end
