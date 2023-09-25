object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 634
  ClientWidth = 506
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object ComboBox1: TComboBox
    Left = 56
    Top = 8
    Width = 145
    Height = 21
    TabOrder = 0
    Text = 'ComboBox1'
  end
  object PageControl1: TPageControl
    Left = 8
    Top = 304
    Width = 490
    Height = 305
    ActivePage = TabSheet1
    TabOrder = 2
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      ExplicitWidth = 281
      ExplicitHeight = 165
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      ExplicitWidth = 281
      ExplicitHeight = 165
    end
    object TabSheet3: TTabSheet
      Caption = 'TabSheet3'
      ImageIndex = 2
      ExplicitLeft = -84
      ExplicitTop = 56
      ExplicitWidth = 281
      ExplicitHeight = 165
    end
  end
  object RelativePanel1: TRelativePanel
    Left = 8
    Top = 56
    Width = 490
    Height = 225
    ControlCollection = <>
    TabOrder = 1
  end
end
