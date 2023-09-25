object frmAlarme: TfrmAlarme
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Alarme (Ver.: 1.0.3)'
  ClientHeight = 440
  ClientWidth = 732
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poScreenCenter
  OnCreate = FormCreate
  TextHeight = 13
  object Label1: TLabel
    Left = 8
    Top = 102
    Width = 31
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '1'#170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 8
    Top = 129
    Width = 31
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '2'#170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 8
    Top = 156
    Width = 31
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '3'#170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 8
    Top = 183
    Width = 31
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '4'#170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label5: TLabel
    Left = 8
    Top = 210
    Width = 31
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '5'#170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label6: TLabel
    Left = 195
    Top = 102
    Width = 31
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '6'#170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label7: TLabel
    Left = 195
    Top = 129
    Width = 31
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '7'#170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label8: TLabel
    Left = 195
    Top = 156
    Width = 31
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '8'#170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label9: TLabel
    Left = 195
    Top = 183
    Width = 31
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '9'#170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label10: TLabel
    Left = 195
    Top = 210
    Width = 31
    Height = 21
    Alignment = taRightJustify
    AutoSize = False
    Caption = '10'#170
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object MediaPlayer1: TMediaPlayer
    Left = 288
    Top = 251
    Width = 29
    Height = 21
    EnabledButtons = [btPlay, btPause, btStop]
    VisibleButtons = [btPlay]
    DoubleBuffered = True
    ParentDoubleBuffered = False
    TabOrder = 1
  end
  object edRelegio: TEdit
    Left = 0
    Top = 0
    Width = 732
    Height = 88
    Align = alTop
    Alignment = taCenter
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -64
    Font.Name = 'Impact'
    Font.Style = [fsBold]
    ParentFont = False
    TabOrder = 2
    Text = '00:00:00'
  end
  object edBatida01: TEdit
    Left = 45
    Top = 102
    Width = 85
    Height = 21
    TabOrder = 3
    Text = '00:00:00'
  end
  object edBatida02: TEdit
    Left = 45
    Top = 129
    Width = 85
    Height = 21
    TabOrder = 4
    Text = '00:00:00'
  end
  object edBatida03: TEdit
    Left = 45
    Top = 156
    Width = 85
    Height = 21
    TabOrder = 5
    Text = '00:00:00'
  end
  object edBatida04: TEdit
    Left = 45
    Top = 183
    Width = 85
    Height = 21
    TabOrder = 6
    Text = '00:00:00'
  end
  object edBatida05: TEdit
    Left = 45
    Top = 210
    Width = 85
    Height = 21
    TabOrder = 7
    Text = '00:00:00'
  end
  object edBatida06: TEdit
    Left = 232
    Top = 102
    Width = 85
    Height = 21
    TabOrder = 8
    Text = '00:00:00'
  end
  object cbSom: TComboBox
    Left = 45
    Top = 251
    Width = 237
    Height = 21
    ItemIndex = 0
    TabOrder = 0
    Text = 'navio.wav'
    OnClick = cbSomClick
    Items.Strings = (
      'navio.wav'
      'campainha.mp3')
  end
  object edBatida07: TEdit
    Left = 232
    Top = 129
    Width = 85
    Height = 21
    TabOrder = 9
    Text = '00:00:00'
  end
  object edBatida08: TEdit
    Left = 232
    Top = 156
    Width = 85
    Height = 21
    TabOrder = 10
    Text = '00:00:00'
  end
  object edBatida09: TEdit
    Left = 232
    Top = 183
    Width = 85
    Height = 21
    TabOrder = 11
    Text = '00:00:00'
  end
  object edBatida10: TEdit
    Left = 232
    Top = 210
    Width = 85
    Height = 21
    TabOrder = 12
    Text = '00:00:00'
  end
  object TimePicker1: TTimePicker
    Left = 347
    Top = 94
    Width = 377
    Height = 75
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -20
    Font.Name = 'Segoe UI'
    Font.Style = []
    TabOrder = 13
    Time = 0.541666666666666600
    TimeFormat = 'AMPM h:nn'
  end
  object Timer1: TTimer
    OnTimer = Timer1Timer
    Left = 304
    Top = 24
  end
  object Timer2: TTimer
    OnTimer = Timer2Timer
    Left = 328
    Top = 184
  end
end
