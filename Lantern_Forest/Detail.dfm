object FDetail: TFDetail
  Left = 0
  Top = 0
  Caption = 'FDetail'
  ClientHeight = 481
  ClientWidth = 505
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  TextHeight = 13
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 505
    Height = 481
    Align = alClient
    TabOrder = 0
    object Label1: TLabel
      Left = 111
      Top = 233
      Width = 93
      Height = 33
      Caption = 'sensor1'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
    end
    object Label2: TLabel
      Left = 214
      Top = 233
      Width = 93
      Height = 33
      Caption = 'sensor2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label3: TLabel
      Left = 321
      Top = 233
      Width = 93
      Height = 33
      Caption = 'sensor3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -27
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object btnRegistration: TButton
      Left = 335
      Top = 32
      Width = 75
      Height = 25
      Caption = #50672#44208
      TabOrder = 0
      OnClick = btnRegistrationClick
    end
    object Edit1: TEdit
      Left = 16
      Top = 34
      Width = 313
      Height = 21
      TabOrder = 1
    end
    object ProgressBar1: TProgressBar
      Left = 111
      Top = 104
      Width = 89
      Height = 129
      Orientation = pbVertical
      TabOrder = 2
    end
    object ProgressBar2: TProgressBar
      Left = 214
      Top = 104
      Width = 89
      Height = 129
      Orientation = pbVertical
      TabOrder = 3
    end
    object ProgressBar3: TProgressBar
      Left = 321
      Top = 104
      Width = 89
      Height = 129
      Max = 1000
      Orientation = pbVertical
      TabOrder = 4
    end
    object edtABC1: TEdit
      Left = 111
      Top = 77
      Width = 89
      Height = 21
      TabOrder = 5
    end
    object edtABC2: TEdit
      Left = 214
      Top = 77
      Width = 89
      Height = 21
      TabOrder = 6
    end
    object edtABC3: TEdit
      Left = 321
      Top = 77
      Width = 89
      Height = 21
      TabOrder = 7
    end
    object Chart1: TChart
      Left = 16
      Top = 272
      Width = 398
      Height = 201
      AllowPanning = pmNone
      Title.Text.Strings = (
        'TChart')
      BottomAxis.Automatic = False
      BottomAxis.AutomaticMaximum = False
      BottomAxis.Maximum = 20.000000000000000000
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 100.000000000000000000
      View3D = False
      Zoom.Allow = False
      Zoom.MouseButton = mbRight
      TabOrder = 8
      DefaultCanvas = 'TGDIPlusCanvas'
      PrintMargins = (
        15
        19
        15
        19)
      ColorPaletteIndex = 13
      object Series1: TFastLineSeries
        HoverElement = []
        LinePen.Color = 10708548
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
      object Series2: TFastLineSeries
        HoverElement = []
        LinePen.Color = 3513587
        XValues.Name = 'X'
        XValues.Order = loAscending
        YValues.Name = 'Y'
        YValues.Order = loNone
      end
    end
  end
  object Memo1: TMemo
    Left = 16
    Top = 77
    Width = 89
    Height = 189
    Lines.Strings = (
      'Memo1')
    TabOrder = 1
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
    Left = 440
    Top = 8
  end
  object sgcWSPClient_MQTT1: TsgcWSPClient_MQTT
    OnMQTTPublish = sgcWSPClient_MQTT1MQTTPublish
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
    Left = 472
    Top = 8
  end
  object Timer1: TTimer
    Left = 440
    Top = 56
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 472
    Top = 56
  end
end
