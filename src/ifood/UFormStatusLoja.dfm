object _frmStatusLoja: T_frmStatusLoja
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Status Loja no Ifood'
  ClientHeight = 297
  ClientWidth = 849
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object _btnFechar: TPraButtonStyle
    Left = 639
    Top = 245
    Width = 194
    Height = 41
    OnClick = _btnFecharClick
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Pen.Style = psClear
    PenDown.Color = 15655808
    PenDown.Width = 3
    PenFocused.Style = psClear
    PenDisabled.Style = psClear
    Brush.Color = 13483036
    BrushDown.Color = 11246871
    BrushFocused.Color = 11246871
    BrushDisabled.Color = 15461355
    FontDown.Charset = DEFAULT_CHARSET
    FontDown.Color = clWindow
    FontDown.Height = -13
    FontDown.Name = 'Segoe UI'
    FontDown.Style = [fsBold]
    FontFocused.Charset = DEFAULT_CHARSET
    FontFocused.Color = clWindow
    FontFocused.Height = -13
    FontFocused.Name = 'Segoe UI'
    FontFocused.Style = [fsBold]
    FontDisabled.Charset = DEFAULT_CHARSET
    FontDisabled.Color = clWindow
    FontDisabled.Height = -13
    FontDisabled.Name = 'Segoe UI'
    FontDisabled.Style = [fsBold]
    Caption = 'Fechar'
    TabOrder = 3
    Radius = 0
  end
  object GroupBox1: TGroupBox
    Left = 8
    Top = 158
    Width = 825
    Height = 81
    Caption = '          message          '
    TabOrder = 0
    object _lblmdescriptionC: TLabel
      Left = 16
      Top = 57
      Width = 96
      Height = 19
      Caption = 'description:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object _lblmsubtitleC: TLabel
      Left = 44
      Top = 38
      Width = 68
      Height = 19
      Caption = 'subtitle:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object _lblmtitleC: TLabel
      Left = 72
      Top = 19
      Width = 40
      Height = 19
      Caption = 'title:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object _lblmtitle: TLabel
      Left = 113
      Top = 19
      Width = 66
      Height = 19
      Caption = '_lblmtitle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object _lblmdescription: TLabel
      Left = 113
      Top = 57
      Width = 117
      Height = 19
      Caption = '_lblmdescription'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object _lblmsubtitle: TLabel
      Left = 113
      Top = 38
      Width = 91
      Height = 19
      Caption = '_lblmsubtitle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox2: TGroupBox
    Left = 8
    Top = 76
    Width = 825
    Height = 81
    Caption = '          validations          '
    TabOrder = 1
    object _lbldescriptionC: TLabel
      Left = 16
      Top = 57
      Width = 96
      Height = 19
      Caption = 'description:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object _lblsubtitleC: TLabel
      Left = 44
      Top = 38
      Width = 68
      Height = 19
      Caption = 'subtitle:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object _lbltitleC: TLabel
      Left = 72
      Top = 19
      Width = 40
      Height = 19
      Caption = 'title:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object _lbltitle: TLabel
      Left = 113
      Top = 19
      Width = 52
      Height = 19
      Caption = '_lbltitle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object _lbldescription: TLabel
      Left = 113
      Top = 57
      Width = 103
      Height = 19
      Caption = '_lbldescription'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object _lblsubtitle: TLabel
      Left = 113
      Top = 38
      Width = 77
      Height = 19
      Caption = '_lblsubtitle'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
  object GroupBox4: TGroupBox
    Left = 8
    Top = 11
    Width = 825
    Height = 64
    Caption = '          validations          '
    TabOrder = 2
    object _lblstateC: TLabel
      Left = 64
      Top = 38
      Width = 48
      Height = 19
      Caption = 'state:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object _lblavailableC: TLabel
      Left = 32
      Top = 19
      Width = 80
      Height = 19
      Caption = 'available:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object _lblavailable: TLabel
      Left = 113
      Top = 19
      Width = 87
      Height = 19
      Caption = '_lblavailable'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object _lblstate: TLabel
      Left = 113
      Top = 38
      Width = 59
      Height = 19
      Caption = '_lblstate'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
  end
end
