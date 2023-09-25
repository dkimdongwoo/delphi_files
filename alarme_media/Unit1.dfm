object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 487
  ClientWidth = 670
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  TextHeight = 15
  object edtTime: TEdit
    Left = 0
    Top = 0
    Width = 670
    Height = 75
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -50
    Font.Name = 'Segoe UI'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    ExplicitWidth = 615
  end
  object TimePicker1: TTimePicker
    Left = 0
    Top = 75
    Width = 670
    Height = 86
    Align = alTop
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 1
    Time = 0.541666666666666600
    TimeFormat = 'AMPM h:nn:ss'
    ExplicitWidth = 615
  end
  object ToggleSwitch1: TToggleSwitch
    Left = 552
    Top = 175
    Width = 73
    Height = 20
    TabOrder = 2
    OnClick = ToggleSwitch1Click
  end
  object MediaPlayer1: TMediaPlayer
    Left = 175
    Top = 256
    Width = 29
    Height = 30
    VisibleButtons = [btPlay]
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 3
  end
  object ComboBox1: TComboBox
    Left = 24
    Top = 256
    Width = 145
    Height = 23
    TabOrder = 4
    Text = 'ComboBox1'
    OnClick = ComboBox1Click
    Items.Strings = (
      'a'
      'b')
  end
  object Button1: TButton
    Left = 550
    Top = 216
    Width = 75
    Height = 25
    Caption = 'Button1'
    TabOrder = 5
    OnClick = Button1Click
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 320
    Top = 248
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 368
    Top = 240
  end
  object OpenDialog1: TOpenDialog
    Left = 504
    Top = 208
  end
end
