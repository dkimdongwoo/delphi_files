object DataModule1: TDataModule1
  Height = 480
  Width = 640
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=abcd'
      'User_Name=sa'
      'Password=krc123'
      'Server=61.32.227.98'
      'OSAuthent=No'
      'DriverID=MSSQL')
    Connected = True
    LoginPrompt = False
    Left = 304
    Top = 128
  end
  object FDQuery1: TFDQuery
    Active = True
    Connection = FDConnection1
    SQL.Strings = (
      'select * from abcd_table')
    Left = 200
    Top = 264
  end
  object FDQuery2: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'insert into abcd_table(abc1,abc2,data) values(:abc11,:abc22,:dat' +
        'a_str33)')
    Left = 336
    Top = 272
    ParamData = <
      item
        Name = 'ABC11'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ABC22'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATA_STR33'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
