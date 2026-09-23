object _frmNotificaMensagem: T_frmNotificaMensagem
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = '_frmNotificaMensagem'
  ClientHeight = 160
  ClientWidth = 305
  Color = clGray
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  PixelsPerInch = 96
  TextHeight = 13
  object PanelMensagem: TPanel
    AlignWithMargins = True
    Left = 1
    Top = 24
    Width = 303
    Height = 135
    Margins.Left = 1
    Margins.Top = 0
    Margins.Right = 1
    Margins.Bottom = 1
    Align = alClient
    BevelOuter = bvNone
    Color = clWindow
    ParentBackground = False
    TabOrder = 0
    object LabelMensagem: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 3
      Width = 297
      Height = 129
      Align = alClient
      AutoSize = False
      Caption = 'TEXT'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Segoe UI Semibold'
      Font.Style = [fsBold]
      ParentFont = False
      WordWrap = True
      ExplicitLeft = 5
      ExplicitTop = 4
      ExplicitWidth = 293
      ExplicitHeight = 124
    end
  end
  object PanelTitulo: TPanel
    Left = 0
    Top = 0
    Width = 305
    Height = 24
    Margins.Left = 1
    Margins.Top = 1
    Margins.Right = 1
    Margins.Bottom = 1
    Align = alTop
    BevelOuter = bvNone
    Color = 12879718
    ParentBackground = False
    TabOrder = 1
    object LabelTitulo: TLabel
      Left = 8
      Top = 6
      Width = 98
      Height = 15
      Caption = 'Alerta Mensagem'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object LabelClose: TLabel
      Left = 285
      Top = 2
      Width = 10
      Height = 20
      Cursor = crHandPoint
      Alignment = taCenter
      Caption = 'X'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Segoe UI Emoji'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = LabelCloseClick
      OnMouseEnter = LabelCloseMouseEnter
      OnMouseLeave = LabelCloseMouseLeave
    end
  end
  object TimerClose: TTimer
    Enabled = False
    Interval = 5000
    OnTimer = TimerCloseTimer
    Left = 109
    Top = 40
  end
  object Timer1: TTimer
    Interval = 10000
    OnTimer = Timer1Timer
    Left = 65
    Top = 96
  end
end
