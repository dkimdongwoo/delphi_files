object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 344
  ClientWidth = 480
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lblVclStyle: TLabel
    Left = 24
    Top = 109
    Width = 37
    Height = 13
    Caption = 'VclStyle'
  end
  object lblFormColor: TLabel
    Left = 232
    Top = 113
    Width = 49
    Height = 13
    Caption = 'FormColor'
  end
  object lblFrameDelay: TLabel
    Left = 232
    Top = 43
    Width = 77
    Height = 13
    Caption = 'FrameDelay(50)'
  end
  object AI: TActivityIndicator
    Left = 24
    Top = 8
  end
  object cbxVclStyles: TComboBox
    Left = 24
    Top = 128
    Width = 145
    Height = 21
    TabOrder = 1
    Text = 'cbxVclStyles'
    OnChange = cbxVclStylesChange
  end
  object grpIndicatorType: TRadioGroup
    Left = 29
    Top = 192
    Width = 137
    Height = 129
    Caption = 'IndicatorType'
    ItemIndex = 0
    Items.Strings = (
      'aitMomenturmDots'
      'aitRotatingSector'
      'aitSectorRing')
    TabOrder = 2
    OnClick = grpIndicatorTypeClick
  end
  object cbxFromColor: TColorBox
    Left = 224
    Top = 128
    Width = 145
    Height = 22
    TabOrder = 3
    OnChange = cbxFromColorChange
  end
  object trkFrameDelay: TTrackBar
    Left = 224
    Top = 62
    Width = 150
    Height = 45
    TabOrder = 4
    OnChange = trkFrameDelayChange
  end
  object chkAnimate: TCheckBox
    Left = 224
    Top = 8
    Width = 97
    Height = 17
    Caption = 'Animate'
    TabOrder = 5
    OnClick = chkAnimateClick
  end
  object grpIndicatorSize: TRadioGroup
    Left = 172
    Top = 192
    Width = 137
    Height = 129
    Caption = 'IndicatorSize'
    ItemIndex = 1
    Items.Strings = (
      'aisSmall'
      'aisMedium'
      'aisLarge'
      'aisXLarge')
    TabOrder = 6
    OnClick = grpIndicatorSizeClick
  end
  object grpIndicatorColor: TRadioGroup
    Left = 315
    Top = 192
    Width = 143
    Height = 129
    Caption = 'IndicatorColor'
    ItemIndex = 0
    Items.Strings = (
      'aicBlack'
      'aicWhite')
    TabOrder = 7
    OnClick = grpIndicatorColorClick
  end
end
