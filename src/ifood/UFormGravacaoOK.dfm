object _frmGravacaoOK: T_frmGravacaoOK
  Left = 286
  Top = 215
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  ClientHeight = 141
  ClientWidth = 240
  Color = 7818788
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object _imgFundo: TImage
    Left = 0
    Top = 0
    Width = 241
    Height = 145
  end
  object _lblMsg: TLabel
    Left = 48
    Top = 48
    Width = 134
    Height = 58
    Alignment = taCenter
    Caption = 'GRAVA'#199#195'O OK!'
    Font.Charset = ANSI_CHARSET
    Font.Color = clWhite
    Font.Height = -24
    Font.Name = 'Arial'
    Font.Style = [fsBold]
    ParentFont = False
    Transparent = True
    WordWrap = True
  end
  object Timer: TTimer
    Enabled = False
    Interval = 500
    OnTimer = TimerTimer
    Left = 8
  end
end
