object FAlertaMsg: TFAlertaMsg
  Left = 0
  Top = 0
  BorderStyle = bsSizeToolWin
  Caption = 'Aten'#231#227'o! Pedidos pendentes...'
  ClientHeight = 164
  ClientWidth = 334
  Color = 7818788
  DefaultMonitor = dmPrimary
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 334
    Height = 164
    Align = alClient
    BevelOuter = bvNone
    Color = 7818788
    ParentBackground = False
    TabOrder = 0
    ExplicitWidth = 314
    ExplicitHeight = 201
    object Image1: TImage
      Left = 0
      Top = 0
      Width = 333
      Height = 201
      OnClick = Image1Click
    end
    object _lblLoja: TLabel
      Left = 11
      Top = 24
      Width = 54
      Height = 23
      Caption = 'Loja:'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object _lblAviso1: TLabel
      Left = 15
      Top = 56
      Width = 28
      Height = 35
      Caption = '@'
      Font.Charset = ANSI_CHARSET
      Font.Color = clRed
      Font.Height = -29
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 49
      Top = 64
      Width = 275
      Height = 25
      Caption = 'pedido(s) pendente(s).'
      Font.Charset = ANSI_CHARSET
      Font.Color = clYellow
      Font.Height = -21
      Font.Name = 'Verdana'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Image2: TImage
      Left = 259
      Top = 112
      Width = 52
      Height = 52
      AutoSize = True
      Center = True
      Picture.Data = {
        0B546478504E47496D61676589504E470D0A1A0A0000000D4948445200000034
        000000340806000000C5781BEB00000006624B474400FF00FF00FFA0BDA79300
        0002D4494441545809ED983B681541148677CD5388318210D18B8F2EA8602148
        C094A6F3858D0836E9522882A21642C0C2CAF28285D8A94D44B08B909010C122
        564A02168AB14F6512C57025E37760572E73677736F14E760676F9BF9C3BFB38
        73FE99D94972A3C8F1A194EA8737F0116E43A7E32EDDA6C7C02368D6248DD86D
        AF0EB353FC37D075D96197EE52E3E2149834E9AAD75DAE122779C792A88763FA
        09EFDB4CCB00AC824973AE0CB89CA1BB14BD074CFA643AE9ED39A6640836204B
        23DE16AF17868318A6214BCB4AA9587FCEDB36C58E439E26BC2D5E2F0C17B24D
        AF13B3F4930BFBF5E7BC6C4BA1B0ACF28FBA97C5EB45E1A10BE694FD38AE3FEB
        651B1F4FC0A62F5E16AF17858B0928A229FD59EFDAB8B80145B5B01306B6FDFB
        0017D728F00514FD6B4371EFB9388E6789FF449EDD348E465174040E410D0E26
        1C20AEC2223CE3D92562AEB665882286C93A0FDDB015FDE1E60FF00BFA414C0C
        128BA8C14D1731F596D83E61A61B3E43197A6D735274B934E7B94F6308CA50A7
        ADD32D19624A0E93F01E9425799772FB2E6C0833B2E65F91AD0FCAD2735BC756
        4318198631122DC019285337A9453692CC1AE2CC2BC90512A8E4A32F6183422E
        B0DB4D135B649DA19627CA3FD14309E360548886C4889892D842A8868CCB4DDC
        59F775B9C923E47D7E4A3D75302AB44DE13D9BC188D1497232B42577965DF771
        52BB31843643A989EBCCD4CBB4D11C439BA1B4F6F3E9073D866AE87B947184B8
        E4E6F1728925F783D8A2D066E8010E46B3CC702D8AE5471EEC2AB2F7E7DDB253
        D77ED3D13ECC48E4A35921CD502F16EE40AE8A1832AED5DCACEE2E8EDA525B0D
        31C50324912F436AC42B5087152843534E3AE5BDEA81AB30039BE05A0D3A7808
        D677FEBF0DD3490D6EC10CAC413BB54232F99AF944D142DBEA98CE3BE8F8249C
        06F9424590A52AC8FF307D9CEF82BD902EF7069FD7610DBE262C11DFC1224B7E
        9358A91A816A04AA11A846A01A816A04AA1168C308FC05653597632271BE7800
        00000049454E44AE426082}
    end
    object Button1: TButton
      Left = 117
      Top = 209
      Width = 75
      Height = 25
      Caption = 'Fechar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Visible = False
      OnClick = Button1Click
    end
  end
end
