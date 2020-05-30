object Form1: TForm1
  Left = 159
  Top = 191
  Width = 952
  Height = 322
  Caption = 'Espi'#227'o UDP'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Memo: TMemo
    Left = 8
    Top = 48
    Width = 929
    Height = 233
    ReadOnly = True
    ScrollBars = ssBoth
    TabOrder = 0
  end
  object porta: TLabeledEdit
    Left = 8
    Top = 16
    Width = 121
    Height = 21
    EditLabel.Width = 25
    EditLabel.Height = 13
    EditLabel.Caption = 'Porta'
    LabelPosition = lpAbove
    LabelSpacing = 3
    TabOrder = 1
    Text = '3002'
  end
  object Button1: TButton
    Left = 144
    Top = 16
    Width = 75
    Height = 25
    Caption = 'Trocar Porta'
    TabOrder = 2
    OnClick = Button1Click
  end
  object CheckBox1: TCheckBox
    Left = 232
    Top = 24
    Width = 121
    Height = 17
    Caption = 'Visualizar pacotes'
    TabOrder = 3
  end
  object UDP: TNMUDP
    RemotePort = 3002
    LocalPort = 3002
    ReportLevel = 1
    OnDataReceived = UDPDataReceived
    Left = 592
    Top = 16
  end
end
