object Form16: TForm16
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Mock-up Device Value Reader'
  ClientHeight = 346
  ClientWidth = 430
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 224
    Top = 24
    Width = 139
    Height = 19
    Caption = 'Press ESC to exit'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold, fsItalic]
    ParentFont = False
  end
  object ListBoxData: TListBox
    Left = 8
    Top = 70
    Width = 413
    Height = 265
    ItemHeight = 13
    TabOrder = 0
    OnDrawItem = ListBoxDataDrawItem
  end
  object Button1: TButton
    Left = 8
    Top = 8
    Width = 137
    Height = 25
    Caption = 'Start Monitoring'
    TabOrder = 1
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 39
    Width = 137
    Height = 25
    Caption = 'Stop Monitoring'
    TabOrder = 2
    OnClick = Button2Click
  end
  object Timer: TTimer
    Enabled = False
    OnTimer = TimerTimer
    Left = 176
    Top = 8
  end
end
