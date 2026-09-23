object _frmMotivoCancelamento: T_frmMotivoCancelamento
  Left = 0
  Top = 0
  BorderIcons = []
  ClientHeight = 531
  ClientWidth = 749
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poMainFormCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGridStyles1: TDBGrid
    Left = 0
    Top = 41
    Width = 749
    Height = 431
    Align = alClient
    DataSource = DataSource1
    DrawingStyle = gdsGradient
    GradientEndColor = clSkyBlue
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = DBGridStyles1CellClick
    OnKeyDown = DBGridStyles1KeyDown
    OnKeyUp = DBGridStyles1KeyUp
    Columns = <
      item
        Expanded = False
        FieldName = 'MOTIVOCANCELAMENTO'
        Title.Alignment = taCenter
        Title.Caption = 'Motivo do Cancelamento'
        Title.Font.Charset = DEFAULT_CHARSET
        Title.Font.Color = clWindowText
        Title.Font.Height = -16
        Title.Font.Name = 'Tahoma'
        Title.Font.Style = [fsBold]
        Width = 731
        Visible = True
      end>
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 749
    Height = 41
    Align = alTop
    TabOrder = 1
  end
  object Panel2: TPanel
    Left = 0
    Top = 472
    Width = 749
    Height = 59
    Align = alBottom
    TabOrder = 2
    object _btnConfirmar: TPraButtonStyle
      Left = 15
      Top = 6
      Width = 97
      Height = 41
      OnClick = _btnConfirmarClick
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Pen.Style = psClear
      PenDown.Color = 6935040
      PenDown.Width = 3
      PenFocused.Style = psClear
      PenDisabled.Style = psClear
      Brush.Color = 8572928
      BrushDown.Color = 6990336
      BrushFocused.Color = 6990336
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
      Caption = 'Confirmar'
      TabOrder = 1
      Radius = 0
    end
    object _btnCancelar: TPraButtonStyle
      Left = 118
      Top = 6
      Width = 97
      Height = 41
      OnClick = _btnCancelarClick
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      Pen.Style = psClear
      PenDown.Color = 6935040
      PenDown.Width = 3
      PenFocused.Style = psClear
      PenDisabled.Style = psClear
      Brush.Color = 2827210
      BrushDown.Color = 6990336
      BrushFocused.Color = 6990336
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
      TabOrder = 0
      Radius = 0
    end
  end
  object DataSource1: TDataSource
    DataSet = DM._qryMotivoCanc
    Left = 328
    Top = 152
  end
end
