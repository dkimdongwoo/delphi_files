object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 822
  ClientWidth = 1016
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OldCreateOrder = True
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 15
  object lblAbc1: TLabel
    Left = 392
    Top = 252
    Width = 34
    Height = 15
    Caption = 'Label1'
  end
  object lblAbc2: TLabel
    Left = 664
    Top = 252
    Width = 34
    Height = 15
    Caption = 'Label1'
  end
  object SpeedButton1: TSpeedButton
    Left = 584
    Top = 64
    Width = 39
    Height = 41
    OnClick = SpeedButton1Click
  end
  object DBGrid1: TDBGrid
    Left = 328
    Top = 276
    Width = 505
    Height = 237
    DataSource = DataSource1
    Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'seq'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abc1'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abc2'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'abc3'
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'data'
        Visible = True
      end>
  end
  object btsStart: TButton
    Left = 56
    Top = 104
    Width = 75
    Height = 25
    Caption = #50672#44208
    TabOrder = 1
    OnClick = btsStartClick
  end
  object btnClose: TButton
    Left = 176
    Top = 104
    Width = 75
    Height = 25
    Caption = #50672#44208#54644#51228
    TabOrder = 2
    OnClick = btnCloseClick
  end
  object Memo1: TMemo
    Left = 32
    Top = 252
    Width = 185
    Height = 389
    Lines.Strings = (
      'Memo1')
    TabOrder = 3
  end
  object edtAbc1: TEdit
    Left = 392
    Top = 48
    Width = 121
    Height = 23
    TabOrder = 4
    Text = 'abcd/abc1'
  end
  object edtAbc2: TEdit
    Left = 664
    Top = 48
    Width = 121
    Height = 23
    TabOrder = 5
    Text = 'abcd/abc2'
  end
  object ProgressBar1: TProgressBar
    Left = 392
    Top = 104
    Width = 89
    Height = 142
    Max = 1023
    Orientation = pbVertical
    TabOrder = 6
  end
  object ProgressBar2: TProgressBar
    Left = 664
    Top = 96
    Width = 89
    Height = 150
    Max = 1023
    Orientation = pbVertical
    TabOrder = 7
  end
  object btnTime: TButton
    Left = 56
    Top = 208
    Width = 75
    Height = 25
    Caption = #51200#51109
    TabOrder = 8
    OnClick = btnTimeClick
  end
  object btnDtime: TButton
    Left = 176
    Top = 208
    Width = 75
    Height = 25
    Caption = #51200#51109#54644#51116
    TabOrder = 9
    OnClick = btnDtimeClick
  end
  object btnChart: TButton
    Left = 328
    Top = 560
    Width = 75
    Height = 25
    Caption = #52264#53944#47564#46308#44592
    TabOrder = 10
    OnClick = btnChartClick
  end
  object Chart1: TChart
    Left = 536
    Top = 519
    Width = 400
    Height = 250
    Title.Text.Strings = (
      'TChart')
    BottomAxis.Automatic = False
    BottomAxis.AutomaticMaximum = False
    BottomAxis.Maximum = 20.000000000000000000
    LeftAxis.Automatic = False
    LeftAxis.AutomaticMaximum = False
    LeftAxis.AutomaticMinimum = False
    LeftAxis.Maximum = 1023.000000000000000000
    View3D = False
    TabOrder = 11
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TFastLineSeries
      LinePen.Color = 10708548
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Y'
      YValues.Order = loNone
    end
  end
  object sgcWebSocketClient1: TsgcWebSocketClient
    Port = 80
    ConnectTimeout = 0
    ReadTimeout = -1
    WriteTimeout = 0
    TLS = False
    Proxy.Enabled = False
    Proxy.Port = 8080
    Proxy.ProxyType = pxyHTTP
    HeartBeat.Enabled = False
    HeartBeat.Interval = 300
    HeartBeat.Timeout = 0
    IPVersion = Id_IPv4
    Authentication.Enabled = False
    Authentication.URL.Enabled = True
    Authentication.Session.Enabled = False
    Authentication.Basic.Enabled = False
    Authentication.Token.Enabled = False
    Authentication.Token.AuthName = 'Bearer'
    Extensions.DeflateFrame.Enabled = False
    Extensions.DeflateFrame.WindowBits = 15
    Extensions.PerMessage_Deflate.Enabled = False
    Extensions.PerMessage_Deflate.ClientMaxWindowBits = 15
    Extensions.PerMessage_Deflate.ClientNoContextTakeOver = False
    Extensions.PerMessage_Deflate.MemLevel = 9
    Extensions.PerMessage_Deflate.ServerMaxWindowBits = 15
    Extensions.PerMessage_Deflate.ServerNoContextTakeOver = False
    Options.CleanDisconnect = False
    Options.FragmentedMessages = frgOnlyBuffer
    Options.Parameters = '/'
    Options.RaiseDisconnectExceptions = True
    Options.ValidateUTF8 = False
    Specifications.Drafts.Hixie76 = False
    Specifications.RFC6455 = True
    NotifyEvents = neAsynchronous
    LogFile.Enabled = False
    QueueOptions.Binary.Level = qmNone
    QueueOptions.Ping.Level = qmNone
    QueueOptions.Text.Level = qmNone
    WatchDog.Attempts = 0
    WatchDog.Enabled = False
    WatchDog.Interval = 10
    Throttle.BitsPerSec = 0
    Throttle.Enabled = False
    LoadBalancer.Enabled = False
    LoadBalancer.Port = 0
    TLSOptions.VerifyCertificate = False
    TLSOptions.VerifyDepth = 0
    TLSOptions.Version = tlsUndefined
    TLSOptions.IOHandler = iohOpenSSL
    TLSOptions.OpenSSL_Options.APIVersion = oslAPI_1_0
    TLSOptions.OpenSSL_Options.LibPath = oslpNone
    TLSOptions.OpenSSL_Options.UnixSymLinks = oslsSymLinksDefault
    TLSOptions.SChannel_Options.CertStoreName = scsnMY
    TLSOptions.SChannel_Options.CertStorePath = scspStoreCurrentUser
    Left = 80
    Top = 32
  end
  object sgcWSPClient_MQTT1: TsgcWSPClient_MQTT
    OnMQTTConnect = sgcWSPClient_MQTT1MQTTConnect
    OnMQTTPublish = sgcWSPClient_MQTT1MQTTPublish
    OnMQTTDisconnect = sgcWSPClient_MQTT1MQTTDisconnect
    Client = sgcWebSocketClient1
    Authentication.Enabled = False
    HeartBeat.Enabled = True
    HeartBeat.Interval = 300
    HeartBeat.Timeout = 0
    LastWillTestament.Enabled = False
    LastWillTestament.QoS = mtqsAtMostOnce
    LastWillTestament.Retain = False
    LastWillTestament.WillProperties.MessageExpiryInterval = 0
    LastWillTestament.WillProperties.PayloadFormat = mqpfUnspecified
    LastWillTestament.WillProperties.WillDelayInterval = 0
    QoS.Level = mtqsAtMostOnce
    QoS.Interval = 60
    QoS.Timeout = 300
    ConnectProperties.Enabled = False
    ConnectProperties.MaximumPacketSize = 2147483647
    ConnectProperties.ReceiveMaximum = 65535
    ConnectProperties.RequestProblemInformation = True
    ConnectProperties.RequestResponseInformation = False
    ConnectProperties.SessionExpiryInterval = 0
    ConnectProperties.TopicAliasMaximum = 0
    MQTTVersion = mqtt311
    Left = 232
    Top = 32
  end
  object DataSource1: TDataSource
    Left = 544
    Top = 184
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = Timer1Timer
    Left = 136
    Top = 152
  end
  object Timer2: TTimer
    Enabled = False
    OnTimer = Timer2Timer
    Left = 464
    Top = 584
  end
end
