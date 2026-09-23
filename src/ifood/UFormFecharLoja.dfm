object _frmFecharLoja: T_frmFecharLoja
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Fechamento de Loja'
  ClientHeight = 373
  ClientWidth = 645
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object _btnFechar: TPraButtonStyle
    Left = 415
    Top = 297
    Width = 202
    Height = 41
    OnClick = _btnFecharClick
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindow
    Font.Height = -13
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentFont = False
    Pen.Style = psClear
    PenDown.Color = 8421631
    PenDown.Width = 3
    PenFocused.Style = psClear
    PenDisabled.Style = psClear
    Brush.Color = 3620600
    BrushDown.Color = 1186551
    BrushFocused.Color = 1186551
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
    Caption = 'Fechar Restaurante'
    TabOrder = 2
    Radius = 0
  end
  object _btnCancelar: TPraButtonStyle
    Left = 215
    Top = 297
    Width = 194
    Height = 41
    OnClick = _btnCancelarClick
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
    Caption = 'Cancelar'
    TabOrder = 3
    Radius = 0
  end
  object _radFechaPor: TRadioGroup
    Left = 24
    Top = 8
    Width = 185
    Height = 283
    Caption = '          Fecha por:          '
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      '15 min'
      '30 min'
      '1 hora'
      '3 horas'
      '6 horas'
      '12 horas'
      '24 horas')
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 0
  end
  object _radMotivoDe: TRadioGroup
    Left = 215
    Top = 8
    Width = 402
    Height = 283
    Caption = '          Pelo motivo de:          '
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = [fsBold]
    ItemIndex = 0
    Items.Strings = (
      'Muitos Pedidos'
      'Problema na Cozinha'
      'Falta de Entregador'
      'Outro')
    ParentBackground = False
    ParentColor = False
    ParentFont = False
    TabOrder = 1
  end
end
