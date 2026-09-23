object SplitViewForm: TSplitViewForm
  Left = 0
  Top = 0
  Caption = 'TSplitView'
  ClientHeight = 830
  ClientWidth = 1122
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  WindowState = wsMaximized
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 15
  object SV: TSplitView
    Left = 0
    Top = 50
    Width = 145
    Height = 730
    Color = clBlack
    OpenedWidth = 200
    Placement = svpLeft
    TabOrder = 0
    OnClosed = SVClosed
    OnClosing = SVClosing
    OnOpened = SVOpened
    OnOpening = SVOpening
    ExplicitHeight = 700
    object catMenuItems: TCategoryButtons
      Left = 0
      Top = -20
      Width = 194
      Height = 177
      BorderStyle = bsNone
      ButtonFlow = cbfVertical
      ButtonHeight = 40
      ButtonWidth = 100
      ButtonOptions = [boFullSize, boShowCaptions, boCaptionOnlyBorder]
      Categories = <
        item
          Color = clNone
          Collapsed = False
          Items = <
            item
              Action = actHome
            end
            item
              Action = actLayout
            end
            item
              Action = actPower
            end>
        end>
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      HotButtonColor = 12477460
      Images = imlIcons
      RegularButtonColor = clNone
      SelectedButtonColor = clNone
      TabOrder = 0
      OnCategoryCollapase = catMenuItemsCategoryCollapase
    end
  end
  object pnlToolbar: TPanel
    Left = 0
    Top = 0
    Width = 1122
    Height = 50
    Align = alTop
    BevelOuter = bvNone
    Color = 12477460
    ParentBackground = False
    TabOrder = 1
    object imgMenu: TImage
      Left = 10
      Top = 10
      Width = 32
      Height = 32
      Cursor = crHandPoint
      Picture.Data = {
        0954506E67496D61676589504E470D0A1A0A0000000D49484452000000200000
        00200806000000737A7AF40000002B744558744372656174696F6E2054696D65
        0053756E20322041756720323031352031373A30353A3430202D30363030AB9D
        78EE0000000774494D4507DF0802160936B3167602000000097048597300002E
        2300002E230178A53F760000000467414D410000B18F0BFC61050000003B4944
        415478DAEDD3310100200C0341EA5F3454020BA1C3BD81DC925A9F2B00809180
        DD3D19EB00AE00C9000066BE00201900C0CC1700240300003859BE2421B37CDF
        370000000049454E44AE426082}
      OnClick = imgMenuClick
    end
    object lblTitle: TLabel
      Left = 68
      Top = 12
      Width = 201
      Height = 21
      Caption = 'TSplitView Demonstration'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PageControl1: TPageControl
    Left = 145
    Top = 50
    Width = 977
    Height = 730
    ActivePage = TabSheet2
    Align = alClient
    TabOrder = 2
    ExplicitLeft = 200
    ExplicitWidth = 922
    ExplicitHeight = 700
    object TabSheet1: TTabSheet
      Caption = 'TabSheet1'
      object pnlSettings: TPanel
        Left = 0
        Top = 0
        Width = 969
        Height = 700
        Align = alClient
        BevelOuter = bvNone
        ParentBackground = False
        TabOrder = 0
        ExplicitWidth = 914
        ExplicitHeight = 670
        object lblLog: TLabel
          Left = 20
          Top = 152
          Width = 20
          Height = 15
          Caption = 'Log'
        end
        object lblVclStyle: TLabel
          Left = 208
          Top = 300
          Width = 49
          Height = 15
          Caption = 'VCL Style'
        end
        object grpDisplayMode: TRadioGroup
          Left = 20
          Top = 20
          Width = 205
          Height = 53
          Caption = 'Display Mode'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Docked'
            'Overlay')
          TabOrder = 0
          OnClick = grpDisplayModeClick
        end
        object grpPlacement: TRadioGroup
          Left = 20
          Top = 88
          Width = 205
          Height = 53
          Caption = 'Placement'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Left'
            'Right')
          TabOrder = 2
          OnClick = grpPlacementClick
        end
        object grpCloseStyle: TRadioGroup
          Left = 244
          Top = 20
          Width = 205
          Height = 53
          Caption = 'Close Style'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Collapse'
            'Compact')
          TabOrder = 1
          OnClick = grpCloseStyleClick
        end
        object lstLog: TListBox
          Left = 20
          Top = 173
          Width = 205
          Height = 108
          ItemHeight = 15
          TabOrder = 4
        end
        object grpAnimation: TGroupBox
          Left = 244
          Top = 88
          Width = 205
          Height = 193
          Caption = 'Animation'
          TabOrder = 3
          object lblAnimationDelay: TLabel
            Left = 16
            Top = 56
            Width = 111
            Height = 15
            Caption = 'Animation Delay (15)'
          end
          object lblAnimationStep: TLabel
            Left = 16
            Top = 123
            Width = 105
            Height = 15
            Caption = 'Animation Step (20)'
          end
          object chkUseAnimation: TCheckBox
            Left = 16
            Top = 24
            Width = 97
            Height = 17
            Caption = 'Use Animation'
            Checked = True
            State = cbChecked
            TabOrder = 0
            OnClick = chkUseAnimationClick
          end
          object trkAnimationDelay: TTrackBar
            Left = 8
            Top = 77
            Width = 177
            Height = 36
            Max = 15
            Min = 1
            Position = 3
            TabOrder = 1
            OnChange = trkAnimationDelayChange
          end
          object trkAnimationStep: TTrackBar
            Left = 8
            Top = 144
            Width = 177
            Height = 33
            Max = 15
            Min = 1
            Position = 4
            TabOrder = 2
            OnChange = trkAnimationStepChange
          end
        end
        object chkCloseOnMenuClick: TCheckBox
          Left = 20
          Top = 300
          Width = 161
          Height = 17
          Caption = 'Close on Menu Click'
          TabOrder = 5
        end
        object cbxVclStyles: TComboBox
          Left = 270
          Top = 297
          Width = 179
          Height = 23
          Style = csDropDownList
          TabOrder = 6
        end
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'TabSheet2'
      ImageIndex = 1
      object RelativePanel1: TRelativePanel
        Left = 0
        Top = 0
        Width = 969
        Height = 120
        ControlCollection = <
          item
            Control = _panControles
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = True
            AlignVerticalCenterWithPanel = False
          end
          item
            Control = Panel4
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = _panControles
          end>
        Align = alTop
        Color = clActiveCaption
        ParentBackground = False
        TabOrder = 0
        DesignSize = (
          969
          120)
        object _panControles: TPanel
          AlignWithMargins = True
          Left = 6
          Top = 4
          Width = 957
          Height = 42
          Margins.Left = 5
          Margins.Right = 5
          BevelOuter = bvNone
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
          object _lblNomeLoja: TLabel
            AlignWithMargins = True
            Left = 275
            Top = 14
            Width = 3
            Height = 18
            Margins.Top = 14
            Margins.Bottom = 10
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8934686
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitHeight = 13
          end
          object _lblNomeLojaC: TLabel
            AlignWithMargins = True
            Left = 242
            Top = 14
            Width = 27
            Height = 18
            Margins.Left = 2
            Margins.Top = 14
            Margins.Bottom = 10
            Align = alLeft
            BiDiMode = bdLeftToRight
            Caption = 'Loja:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            ExplicitHeight = 13
          end
          object _lblAtendente: TLabel
            AlignWithMargins = True
            Left = 360
            Top = 14
            Width = 3
            Height = 18
            Margins.Top = 14
            Margins.Bottom = 10
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8934686
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitHeight = 13
          end
          object _lblAtendenteC: TLabel
            AlignWithMargins = True
            Left = 291
            Top = 14
            Width = 63
            Height = 18
            Margins.Left = 10
            Margins.Top = 14
            Margins.Bottom = 10
            Align = alLeft
            BiDiMode = bdLeftToRight
            Caption = 'Atendente:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            ExplicitHeight = 13
          end
          object _lblUltAtualizacao: TLabel
            AlignWithMargins = True
            Left = 833
            Top = 14
            Width = 119
            Height = 18
            Margins.Left = 0
            Margins.Top = 14
            Margins.Right = 5
            Margins.Bottom = 10
            Align = alRight
            BiDiMode = bdLeftToRight
            Caption = '01/01/2000 00:00:00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8934686
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            ExplicitLeft = 678
            ExplicitHeight = 13
          end
          object Label19: TLabel
            AlignWithMargins = True
            Left = 674
            Top = 14
            Width = 149
            Height = 18
            Margins.Top = 14
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alRight
            BiDiMode = bdLeftToRight
            Caption = #218'ltima Atualiza'#231#227'o(iFood):'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            ExplicitLeft = 519
            ExplicitHeight = 13
          end
          object _lblVersaoSistemaC: TLabel
            AlignWithMargins = True
            Left = 368
            Top = 14
            Width = 108
            Height = 18
            Margins.Left = 2
            Margins.Top = 14
            Margins.Bottom = 10
            Align = alLeft
            BiDiMode = bdLeftToRight
            Caption = 'Vers'#227'o do Sistema:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clGray
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            ExplicitHeight = 13
          end
          object _lblVersaoSistema: TLabel
            AlignWithMargins = True
            Left = 482
            Top = 14
            Width = 3
            Height = 18
            Margins.Top = 14
            Margins.Bottom = 10
            Align = alLeft
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 8934686
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            ExplicitHeight = 13
          end
          object _imgStatusLoja: TImage
            AlignWithMargins = True
            Left = 588
            Top = 3
            Width = 20
            Height = 36
            Cursor = crHandPoint
            Hint = 'Reabrir a Loja'
            Align = alRight
            AutoSize = True
            Center = True
            ParentShowHint = False
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000140000
              001408060000008D891D0D0000001974455874536F6674776172650041646F62
              6520496D616765526561647971C9653C0000032069545874584D4C3A636F6D2E
              61646F62652E786D7000000000003C3F787061636B657420626567696E3D22EF
              BBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B633964
              223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A6E73
              3A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F726520
              352E302D633036302036312E3133343737372C20323031302F30322F31322D31
              373A33323A30302020202020202020223E203C7264663A52444620786D6C6E73
              3A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30322F
              32322D7264662D73796E7461782D6E7323223E203C7264663A44657363726970
              74696F6E207264663A61626F75743D222220786D6C6E733A786D703D22687474
              703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C6E73
              3A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F
              312E302F6D6D2F2220786D6C6E733A73745265663D22687474703A2F2F6E732E
              61646F62652E636F6D2F7861702F312E302F73547970652F5265736F75726365
              526566232220786D703A43726561746F72546F6F6C3D2241646F62652050686F
              746F73686F70204353352057696E646F77732220786D704D4D3A496E7374616E
              636549443D22786D702E6969643A343837303345383634414535313145384142
              35344643413036413145373131332220786D704D4D3A446F63756D656E744944
              3D22786D702E6469643A34383730334538373441453531314538414235344643
              41303641314537313133223E203C786D704D4D3A4465726976656446726F6D20
              73745265663A696E7374616E636549443D22786D702E6969643A343837303345
              3834344145353131453841423534464341303641314537313133222073745265
              663A646F63756D656E7449443D22786D702E6469643A34383730334538353441
              45353131453841423534464341303641314537313133222F3E203C2F7264663A
              4465736372697074696F6E3E203C2F7264663A5244463E203C2F783A786D706D
              6574613E203C3F787061636B657420656E643D2272223F3E437BE5D5000003C3
              4944415478DAAD94DD6B1C5518C6DF331F3B9BD9C9EE26BB899BAA580B69A04D
              8B013F7A9155A8176D2A88B75E89FE055E6891D226669356DB881F08A221DD0D
              B55BC12B2F0282E08DA260509A6CC5166A6D2535B5219BDDCDCEECEECC9C99E3
              7BCECC26BB16EF5C389C999DC3EF3CEFF37E10C618FC9F3FC2814E650BEC4A19
              8844BA3E329F81EF79F8202ED570D94008488A8CDB83677B063301F0DADC14AC
              9ECD4124A1851F7DF0A9978C18C684319439114DC61F57A35ADC69B6AAAD4AF5
              A679EFFE92DB687C23A98AD506BBDB368CE78B21F0C224ACCCCE809654C17329
              A8B1D8CB0F3FF9C4747AEFD0B0E237519705BE8BE2540DFC480C6C1685CD5B6B
              D736AE964E798EBDC4153B3517B285CBDD0A155D86683A353372F499D35A6B03
              9CBBB7C06B98C03C548C2A7C6E019141EA31407D74182C88FB6BDFFFF4A66B9A
              EF7B0DDAA110812BB91CF4EE4DBFB13F7B784EF9FB06385BE8A9A20003222C44
              162057403DEA01755C505219F006F6C1FA72E9B5D6FD5A21BBD811F2EAB9D9D1
              03C7C796638DB51E6A9A0032C2F01B6B83C4CE93C4C43B5F1C2AF526801A7BAA
              F77E2C8D650BC53B02B8FAEE19F8333F971F39987A95D6AB987B59C0FC36882B
              44421BC4A154A805E139E94D41E56E79EEE90F0A2703E0F9A9BE8DC5B3BF3D94
              8966A0A31C388809C82ECCF3828B84428A2587EF16C56793DECC7E7CE970E8E1
              DB4F6D2E4C2FC707F49DF078E5F14404611301F7C2705DDCF97210E408B57849
              DDB59F9FBF322680BFBE37F5427921B7A4A774114AA0A6C3ABF099863E624E82
              6F2C3CC3FFAF39706CA1F86C1B787C633EF7B5007ABB076907987680772E0CFD
              15C9DA76D944FE4AB61DF2E8FAA7D32523AD131E8AC7FEA5EC3F607EA8CE4786
              64BAD6B18BC551012C5D98EAB9FD496E2539A8EF776970B81326C2EC80B5412C
              8481248166D93F1FFDAC7824009E9F84EB1FCECC0C3CD67FDAC1CEA0207529EC
              F294EDD6248449D362BD10D9ACBC3E3E5FFC68B7F5667383FD2343BF10D67CA4
              6562EF12E9C10485303E59583844228924C4185CA7EBE523E385E2762710B4BE
              E8097DCFE0579436D566A51A40783DFA64A7C019162607114906AD3FCD675A5D
              DE2A4FB875E787AE5E16E32B1EE17EBC141DCA5CF454B9BF55AB816359E062EA
              FDB00D254505C5302062C4416D36FE82F2E62BD80CDF768DAFD573A7E0EAF43B
              A0258282260C0E4871FD0C49245EF46555A77C3EE292D07C3EFF886DD749B5F2
              25B4DC599C1D77B897CE36C073972F05C03FBEC8C3EF9F2FE21C8CB4E7AFF009
              7F233871B24C51864192FB70CC94B1DF6EE0FE1D826F63DC3B6D4A2D070EBD35
              09FF00C451D5940826DA290000000049454E44AE426082}
            ShowHint = True
            ExplicitLeft = 537
            ExplicitHeight = 20
          end
          object _lblStatusLojaC: TLabel
            AlignWithMargins = True
            Left = 614
            Top = 14
            Width = 47
            Height = 18
            Margins.Top = 14
            Margins.Right = 10
            Margins.Bottom = 10
            Align = alRight
            BiDiMode = bdLeftToRight
            Caption = 'Loja OFF'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentBiDiMode = False
            ParentFont = False
            ExplicitLeft = 459
            ExplicitHeight = 13
          end
          object swVendeOffLine: TToggleSwitch
            AlignWithMargins = True
            Left = 2
            Top = 3
            Width = 98
            Height = 36
            Margins.Left = 2
            Align = alLeft
            StateCaptions.CaptionOn = 'Loja On'
            StateCaptions.CaptionOff = 'Loja Off'
            TabOrder = 0
            ThumbColor = clRed
            ExplicitHeight = 20
          end
          object swAceiteAut: TToggleSwitch
            AlignWithMargins = True
            Left = 105
            Top = 3
            Width = 132
            Height = 36
            Margins.Left = 2
            Align = alLeft
            StateCaptions.CaptionOn = 'Aceite aut. On'
            StateCaptions.CaptionOff = 'Aceite aut. Off'
            TabOrder = 1
            ThumbColor = clRed
            ExplicitHeight = 20
          end
        end
        object Panel4: TPanel
          AlignWithMargins = True
          Left = 6
          Top = 52
          Width = 957
          Height = 62
          Margins.Left = 5
          Margins.Right = 5
          Anchors = []
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
        end
      end
      object RelativePanel2: TRelativePanel
        Left = 0
        Top = 120
        Width = 393
        Height = 580
        ControlCollection = <
          item
            Control = DBCtrlGrid1
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = False
            AlignRightWithPanel = False
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
          end
          item
            Control = Panel12
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = True
            AlignVerticalCenterWithPanel = False
          end>
        Align = alLeft
        Color = clCream
        ParentBackground = False
        TabOrder = 1
        ExplicitTop = 54
        ExplicitHeight = 616
        object DBCtrlGrid1: TDBCtrlGrid
          Left = 1
          Top = 107
          Width = 391
          Height = 616
          Cursor = crHandPoint
          AllowDelete = False
          AllowInsert = False
          Color = clWhite
          DataSource = DataSource1
          PanelHeight = 154
          PanelWidth = 374
          ParentColor = False
          TabOrder = 0
          RowCount = 4
          SelectedColor = 8908027
          object _shpBot: TShape
            Left = 0
            Top = 150
            Width = 374
            Height = 4
            Align = alBottom
            Brush.Color = clSkyBlue
            Pen.Color = clMaroon
            ExplicitTop = 147
            ExplicitWidth = 353
          end
          object ShapeStatusPedido: TShape
            Left = 8
            Top = 42
            Width = 145
            Height = 23
            Brush.Color = 9729540
            Pen.Color = 9729540
            Shape = stRoundRect
          end
          object _lblStatusPedido: TLabel
            Left = 11
            Top = 45
            Width = 142
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = 'EM PREPARO'
            Color = 8908027
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object _lblNomeCliente: TLabel
            Left = 3
            Top = 0
            Width = 114
            Height = 19
            Caption = 'CONSUMIDOR'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblCodigoPedidoIfood: TLabel
            Left = 3
            Top = 125
            Width = 40
            Height = 19
            Caption = '0001'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 2827210
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblAceitoAs: TLabel
            Left = 272
            Top = 78
            Width = 74
            Height = 13
            Caption = 'aceito '#224's 00:00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object _lblNomeEmpresa: TLabel
            Left = 3
            Top = 78
            Width = 65
            Height = 13
            Caption = 'ASA GAUCHA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object _imgStatus02: TImage
            AlignWithMargins = True
            Left = 308
            Top = 90
            Width = 57
            Height = 58
            Margins.Right = 5
            Margins.Bottom = 5
            Anchors = [akRight, akBottom]
            Center = True
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000320000
              003208060000001E3F88B10000001974455874536F6674776172650041646F62
              6520496D616765526561647971C9653C0000032069545874584D4C3A636F6D2E
              61646F62652E786D7000000000003C3F787061636B657420626567696E3D22EF
              BBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B633964
              223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A6E73
              3A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F726520
              352E302D633036302036312E3133343737372C20323031302F30322F31322D31
              373A33323A30302020202020202020223E203C7264663A52444620786D6C6E73
              3A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30322F
              32322D7264662D73796E7461782D6E7323223E203C7264663A44657363726970
              74696F6E207264663A61626F75743D222220786D6C6E733A786D703D22687474
              703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C6E73
              3A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F
              312E302F6D6D2F2220786D6C6E733A73745265663D22687474703A2F2F6E732E
              61646F62652E636F6D2F7861702F312E302F73547970652F5265736F75726365
              526566232220786D703A43726561746F72546F6F6C3D2241646F62652050686F
              746F73686F70204353352057696E646F77732220786D704D4D3A496E7374616E
              636549443D22786D702E6969643A323041454146463033303039313145373939
              32344145334338383043433430372220786D704D4D3A446F63756D656E744944
              3D22786D702E6469643A32304145414646313330303931314537393932344145
              33433838304343343037223E203C786D704D4D3A4465726976656446726F6D20
              73745265663A696E7374616E636549443D22786D702E6969643A323041454146
              4545333030393131453739393234414533433838304343343037222073745265
              663A646F63756D656E7449443D22786D702E6469643A32304145414645463330
              30393131453739393234414533433838304343343037222F3E203C2F7264663A
              4465736372697074696F6E3E203C2F7264663A5244463E203C2F783A786D706D
              6574613E203C3F787061636B657420656E643D2272223F3E8693B7B100000823
              4944415478DADD5A5D76124B10AE1A864BDE2EAE40B202F1DCEBB3B802710592
              1598ACC06405C1373DF7216405212B085941F0399E13B202F1CD08337DBFEAAE
              1E7A861902893FD13E2732F47457D5D7F5DFC8C618FA13060B9067EF3FE1E9FE
              C4E651F5A1C4A965B7B4CECE1BEE5044CF214A1B2B9A9819CF4DFC0E9F93DF05
              481BF347986F17D763C53431F1D375C1FC3220B5549ECD1513B720C235310FF1
              7AC4A999E2C53E9E9F03CD817D7EC040DA00F216DFBA86CCC7A451EFD46E92A9
              BC061052206F1F329097F867177F1D3F2F26C4865E193623F64298870BA4D217
              1680CC044026FADC12934B8DD9C1D7C14F07A2275C368620FF527C8199AE28D0
              08369C1BB6D1EAEF02A1F3F956DCC5D3F4C10129ACFB22C21BE277D6C98D39B1
              5A31BCA34B4600B236DFEF0E44242C11A0197F9D4B54925C710D81F7398AA65E
              F8C4D4B76B3C9F5AAD187A212064D32F0752260480581E524840780210C75CD6
              9A78BB46B37D667E8DA9E364ABDE5B9BDF57FCD5663F0E48114C1148E4188E44
              4BE2D429D54731CFAFECBE46FC88D6F48D9F02240413020958D9302B7E9298DA
              6E4C730BCC7F5FC9670BF2DFCC0866B904E4905C8CBFCFE803C85E7152C07820
              05A01DCC9D49842217C9DC7772E646ABCA930A202E017D1F8D2C25310F645E5B
              8A69C82F7C210E8FE76D442C31BB81F51589744894650E6F0134EACB40FEFD70
              E96A1EE657203564D5FDAC0E016EE6A5F2E2C4A85E73EF9CDD73D7472111AAB8
              5E842C01828CCF7E928526460B116CEC2318808CD606F2ECC327E30E9304C418
              7F2305F211404A9D0E4C5B00F2588174C8A869A8501BE9300F84E02BEA3B08CD
              8DBA54C039192A81FCF3FEB217311F6DC07C85542C7DC492AF3199EA2D017801
              032068510CB4C24F841E84CCE819765BAA80C85B0BC6665C4363DDB45C3A2CB8
              67EB3046B63EB2B65D6E5A9E617184A66581E47A15BE506659925C09E4E97F97
              E80FE8CA176A88F103BFA9CA46841D873983E296E4010148AECB2B0089CB8078
              67FF28CF45D071C21A84CC18D5FD531CB4AAAF1A8823E8CA879626ABB58198C8
              AE5267A75379CE9B959A0CCF29CD13DC85020EFD9EA41167C2C95A4BDBD004F2
              3FB607CC3C5809C487DFD0BEF162238D505533A4043C10BB45C3227848CEE8F8
              723DDDCA8413EDBE512D75021E23631DDF8C00E4186BA745202EA322FC62F170
              21AD5909A400B30FC5BF09697070435302C46BF00B34D1A2D96C4AF57A13C21D
              C2C47BB4C6909C0320070032C9E511389A84BA71B8B8269D1D4714E1F84D1A10
              59BE46B2890CA6B35763EA876B4B807441E0486E4C647DFA57DC0710B4BF7422
              7228FD638AA26192D6C6D83751C93BA90B2A5DDF16D84B8AC8BCC8E511306351
              9308CFB470AC3C106B54455BCFEC5D1C9323DEC5DAF3021031178453EAB1FA90
              080BFFEA018868E2C22665E9E14DBD8B6A780220042099BF08EB54023C348AE0
              2189B36F1B36DB2E5B8D7CB2BD80AD6FA0A6758058E11AB9F2418491BEFBC9ED
              266143775FFA92A4265AE793F0220215ED1440C803B1114C1CD62CB88B866B02
              D0B892C601797F69BFC869CE23DA0190F13A406C358B7F92BF6A0B305F677D72
              AACFE51F77E54363C833820606A8BDA65AB2680886AF98B88D627022A579CC33
              049B888469828F22904CD38DB889EAE3B30BBF8349EE346DE1463C7461F17620
              91862FA9CD00C43A73D1F28C6E13790084E26FF01777F5A345A296EE5BBEE437
              21903680BC141FC10E7F1B991B1E889A46B22F9127300109756851A311849D38
              BBAF0662F7A454398A85A653B9B990DB151F68A2845CD3E580BC06C17D1F002A
              4D552E35022088E18920BBA5A437886A2C45DC18EBA6003211900190F3AA9D25
              85A69CACCD5B00C202420680A02F318755D747FE3A1535D9C07698887C3920F1
              8D2D21B2134289D0771D9B2D21681D47BEF3C089A44E45A5056C51786BF6C8F4
              928BA431F3E1B7B0C79D902FE8A48706C8337B42D2CDC9BDAC5B799069CF7579
              2B0BCD608DDC2E8ED3C886CD9E3D20148692233210016D3948778808468DFA0B
              71EE855CEEB912889C90652861191B6A379294D01F44D4F37519DEB582E0C62A
              647533E26B33E702042014A5546ECA217FB965E1D9101B9B09C51D5B9C16F8FB
              CC1E9218FB1302A15DCDA02310DB414499E2044EF05DA2C7A9E402E9B17DF56A
              5BD5CD81E03BBBF2C655CEE4BBC31CFF462CA50F55F15F5C3E2C86169034844D
              EE656D675E1E5B1F79A261A1784720F660B510BD13FF9CB3EB688A19C9667FDF
              24A50016BB0882A406223DE48137726B9E157D413B5AD5E7DF06442B853BF12F
              0342B56F89AD4C95F7109542DF8755969FC8527BFA1D2714BF42661F86FBEF09
              E44EFCAB80C847D7D6312B5A5D84BF1E89092C4A94EF056463FEAB80480D2597
              CFBB864D37285FE0583C9C6FC57DAC9BEABA1F016423FEFC47FD3CFD278C0C08
              3B7B7B1CBC13E71A91241DA2D7257B8F755E3E27C1BC2437C92B4F021A14D0F1
              EFAAE88543F64B15714D8B9FE03C9D73C8EE69E780C84580843869759BFABCAF
              C4CE743EBCF13BD0F9ECCE4987D17D3D9DF7BF40C9F723FD7EB4829E9FF73208
              8D4EC0C7CBB90DD9B3FD4520A41BFCC98A4092514F4A04EEDC02A4A9C23FD2F9
              133DCDBD8A7D65F43C2D7FBD74A074EC0547E816AB8078C2FBFA179EA03C9FDE
              0244DE5F285379FF59418C4B341CD2F3F32D3D0C2FCF857E0E9526DD15C88016
              BE70ADCFAB80C8E95D2963F10B31A76D15F06C053D996FEBBAF0BF70F8DF6FB2
              5FB3D605725FD33A50E65D7DDF56C1AAF685F3633D8489EE09E5C94AB9554036
              71F65315B46822BB0190B69AC454BFF70381ABE879803DD5E29EEE5B1B886CDC
              24FCFAD0188E6BA511865DDF6BF8307D1BBD309CFB9F13FC013CD703A906F2BB
              8FFF01131045B39887E3BE0000000049454E44AE426082}
            ExplicitLeft = 294
          end
          object _imgStatus01: TImage
            Left = 288
            Top = 20
            Width = 57
            Height = 54
            Center = True
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000310000
              00300806000000B8C092B9000000097048597300000B1300000B1301009A9C18
              00000C324944415478DABD9A095454F51EC7EF9D9D99611D9611040401B142D3
              8EC72CB3EC69CFEC654FAD50045FEE291A6E21EE9A288BA888964B209A825998
              F632B73AA586A62999A1B9B0C82ACBB0330BB3BFEFBDCD4C03CE0CC3C4F39E03
              33FCEFFFFEEFEFF3DBFFF742EA7FB82022FE3AC82E9F5DBF5B3ABA3B6FCFA1EF
              C1797DD731D20CA227003D1DB75770BD9DF33B811821BA02D82B646F58C192F0
              7A3BE6994028084F0700C86ECE3B22B82330264B787603604BF82765095BC0B4
              25BC1C00E82DE17B026315C408610BE049086F2F8C45106B103D057014EE6FA5
              5673086FE35FE5AB570DEB28295EAFD768861124D9C27471C90CCDCADE4E9DEB
              282D61D7ECDE3556555B1BA557AB9FC590103F4A96AB6BA668D2DB99EEE3C7B7
              D809654FE6B138AE287AC07AB47DDB14B5449204F9B41852877F79BC7F2788D2
              45B113216422A1D7D3190B10E9A1070EA652DFCBE23F1CADACAC5804C04138CF
              375EC370723A2E9AFCF626D1BF2736F49235ACC2B45DBA28ACCBCE7E5FDBDEB6
              CC38189EF7958F3904593C77F67C4D73731C847423188C5A8E8FCF96E05D1FE7
              556F4D0D97FE5A90020B0CA327B2D9052483D9A8D7693D99CECEDFF9CC9899ED
              3CE205692F5AC2E29CBA0399E2D61F2FC4EB14F2297F6A905116FE45DE702304
              7DD3D2B8456F699A9AFEA9D76ABD181CCE7D7E44448EF7B49892B2D52BE3B4AD
              ADCB0C0037F84F3DB5C9F9F911C5ED57AE84B1BCBC1AC4B3E794931C4E77FEED
              88153AFD5DBD7D5BA8F4FA2F9BA0CC51F8530D592E0F387A2CD21C8294171672
              558FAA795A8582052B28A15D197DE12FD776D16E44103AB6A7E7469F39738F0A
              22062920B8E9065A9994A157A96965901CB69EC1E6E8AD81E9552A52A75691A6
              F96CB68E2914EA2C09AF532AE9F93444DAD6218A7B77D3A0E40188890E06CFE9
              78D8E1234B29081F6A82B2A28253BB7FEF109D542626980C25C7D7B79C297456
              803C4AD3DA3A172EC6A3D6C4CD0E31DDDC6EE15CBDFBB871375D46BE2495DDBA
              E5D4F0F9D1E7D54D8D4F135AAD80E4706B79C1C137FC967F78C71244756A4A44
              4759D9733A65879864B1A41C6F9FDFFC1212AE3005426D57909A8F77F793FF71
              6738D615EA3A3A82B432D924C8E20A0829924A4648E6810C230459BBE79380B6
              CBF9AB61AA704CD020602F924CA60C00D3719129F871AE153F72A613FF873E0B
              176D6ABD74211010B3A1ADA7F53A9D0873592483A12098CC2AB6B7F7B1E0F48C
              3CE3A50D5F1CF36EF9FEBBA9DAF6F6D1844EE783F97CACA5C67DEA9802C145AF
              98FFEC711931A2DD68C1878BE3DE54D5D7BD0B8020BD5ECFC6DA5CFC7850D180
              EBDAA0E8F8E09DBB4E9A20CA12E247759496A663F13E74CCF0F95F401899562A
              9D61A61D0D82A9050B71586E6E596C1FF1756579792402ED2D4B1A87968B0543
              862CEEBB62E5EFB094B8F9BBF3B3B46D6D9174E2786C32D9CA118BB70426A77C
              0E8BE81E2E5DFC2FD5A3477170E3708BD14492124144448CFFBA0DB728083135
              56B2607EB4BA41B29CD21004AD841633983C2709D2EA1AF86008E54AD058154B
              243A40999A2DF27CD051F63046A7508CB715B9989FEABF7ACDBECACD89739034
              96520AB036974A1A819B3647369DFAA65FFBD59F3FB60A40CD65328B4413274D
              F69C32556282289A35231E5A9A859BB850139C060C4840067A20C9C9D901DF1D
              43BB188F772E3863772CCBDD5D5BF2FEDC79EAC6C68516B5FAD7A1430A3EE414
              1E7E5C76F3663A840AB131578FFB9679BC39614AF3F973CBA19C09B4FB585917
              2E971FB07EC374A701E14A1A021A623D5C12978CA0791713D8D0C8359717472E
              D36B351CA4D14C582218104A14BFECA0B4EDC9D2821BC2BAACCC43889FA184ED
              9AA0A3DC0EBECF411CBCD50DB016F72D849FEF575656AE834788ADCE446662F2
              F979FDF767AE6070B93A1AA221EF4BAFA61327B642E3AF5153185CDE69DFC54B
              E29A4E9F8A90DFBE9D4B672604335C2C3178C7CE23E5AB57BED6515E9E841B79
              11B60F3DC0B3A0D517001C4679970DC1D40C0E371F7124D1CA6513092A90ADCF
              6D837276877C9AB59B30F44EE2AAA4CDCF20C3A4C0DC946609A4D103A1073F5B
              FB70E992379515E57B0D174A9D42C3E6056E49BA5434E3BDF55A697B9479FB61
              098002471A3C8C0CF7AE21AB1036045333F9821350E42083DBD9029670FDFAAE
              0D4ADFF95F1344D987CBC6A24E6C84DB045173581E1E9B42F667EE85DFC7AA1B
              1A56D1173218F5A80991BE1FC4153F9816958D9B8DA6786DB9074C7D0D317119
              B1331F10429BC00C4603B47B106D0F1597EE842D3745E2113CFDCC02FFF51B0A
              4C1025F3E7CDC48D62E11EBEA05471FCFC9604A5A67D8D5E2A1129F63D1A9EC5
              BAED352D3A1A81D7783F6ACA51D485176DDE085D30B4B559A751F3D47575CBE9
              02657DAE02D5F77B96C8E307557575B28D80260CB2DC71FBC79819E81CAA4C10
              45EF4DDF80A07E8736394CC5EB1FB2D875D4CBBF498EE6A4C19F5FC7440DE224
              1FAE34931B18A87E1033ED538C8FB1657258E1328AE1DC8663C7C629ABAB36DA
              B40483F1086D4CAC5A521FA4AAA949B1190F140487F35360E2E6685E707FB509
              E2FED4C8AF0D1D2A49A557C1E0C11F305DDDDADAF27FDA4567203A1B08BE0E3D
              F4D9726A1154D289102CD95A4C20CBDCE40F1C98884274BD76EF9EE0D60B3F66
              C1CFFB5B01A8479FB6CD6F79FC97357B3E19D5515C74F0B1F520133E3870F7C0
              3F15C43B1D96933B9B30DB9E8AEF47BE730169D09FCA4298704E347972BCACF0
              F720F99D3BFBE80A4E92EDA80D7B112719D445681D5C254773637552E91B5838
              C04CA03AD4929FB901017981895B2E5143B030A37C55C264757DBD7133C534B8
              900CB0BFB13D44DF78CF9C75423874A85C72E4B06FD3E96FD3E1AA230C73E468
              7FCE62CDBB70EB97313E12630D88B323867D8E09C2A778CE2CAABCF3299343D8
              6B413B769E82B62740DB19748525C9466EDFBEEB317ED21807CDDF9EF2683E7B
              661C32CF3042AB7343D3D88AAC765B3864E8F7F0D5F2AEDA04C8AB70955700E2
              4BA7532EB714AEF9A3FFDAF5D73BCF5BF992B2AA7212D6742179DC62E1D0E772
              98CE4265FBD5AB6375325918C0EB397E7DF303367E74C37089DED43B192D47FD
              42FB4B962E5CB0089922C1A861F8EC6CFFB5EB6E9ACF331E54170B175410761C
              1DC5C51C761FB186EA8FAC4CD1A3F832F51A6C17BC7DD4E6E35DE7758530178C
              6C3977D645929BB306AE106D80A8C1F673BC57D43489B9AB9A5643BFEFE0A6E8
              31003BBE7702A00531DF14198543C7E98DFE650EFCF00D74B272085818B4755B
              BC4EA522D0325375C4D8F7DBFD94A37A5BDA404D638337C9E5CA519995B40275
              3A26C964A99DC2C26A4493269B2BC8AEE74D864F7DA7EDA9F1535A50C06F397F
              361885CE173959C5727397F45DB9EA6EE3C91322E9F5EB03D0785D35D3BC5D20
              E80A06CBFFB83B0F6EE24F05B5619881CCD3041FCFED979C72D1010082E8F2C8
              C6E643652A4EE0661E00992B1834F8789F05B1255D5CC8264CF399D3EEB8361A
              FE3EAF53E14351E405052DED979A76DE11007A091B10164150DD57C0C5D42E2F
              BF92EB1D33BDCE86DC8F41A1FB757A94BE63070AE51BA64954F51D337696CFEC
              39957602D884B0CB1AD55B5306C90B0BD3D95EDEFBFC56241CE7FAFB6BBAB382
              01808F2D702C52728C7933086B5E09D8F0D134C4858AE8D9E39C4E2F59BCBB5C
              60134471FF1EA7323131150DE048D4944CFF35EBB20C20562D50B16ECDF08EB2
              B26858609401C034877AF8167638E70347018C10F63C8BED74BE2A3969A0F4D7
              82431048806CF515F61917B07B7BE0FCFC0B12B648A495FD7E8B8F7D8818C532
              58DBD23218A97A388ADC7344D75E0BED3DAA6F36AA6F92A300841D0F94AD7E2F
              899D3F15ADC45A6AB74675B8A8C0B7504D6B505334A8FECE10DA1F3FA1684B42
              A927209D16C7D69224192DD83906305D5D4F86ECFB74AF83009D201ED3B63D20
              F463CF969699E8AFFC88EE0F6A93D44E3573E89293984241ABE2DEBD28864078
              A7FF277B72AD08DF2D002D500FDE143D0649B507151BD64DC07E6121343ED026
              0283518D7DF1697EC4A01CB4E84528A83E08F6118889A67E295BBBAB11DDBE29
              B2E79D9DD5B4DBFEF31561F3993303D1B48DD3C9E52301E38F61EAB18CD6A0F9
              0A087A93EDE5952F18FCEC5DF771AF3750159F4A106DF9F95E702D0D5275AD15
              01BB05305AC2DEB7A7F6BCAFEBCD57C076BD74345AC2DA7BEC27F91AD81EE12D
              02D00274F31F058EBCE2B207AAD75EC45B82B006F0FFFCD788BFFDDECE1284A3
              203D81B267EF6177A6A2203AB50156047992AF817BFC2EDB08614DB8EE82B837
              817A2ABC699C82307FDAE66846EACD98E8F1FF77FC0FA8476303E264EDCB0000
              000049454E44AE426082}
          end
          object _lblDataPedido: TLabel
            Left = 240
            Top = 78
            Width = 28
            Height = 13
            Caption = '00:00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object _imgStatusCan: TImage
            AlignWithMargins = True
            Left = 192
            Top = 91
            Width = 57
            Height = 58
            Margins.Right = 5
            Margins.Bottom = 5
            Anchors = [akRight, akBottom]
            Center = True
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000320000
              003208060000001E3F88B10000001974455874536F6674776172650041646F62
              6520496D616765526561647971C9653C0000032069545874584D4C3A636F6D2E
              61646F62652E786D7000000000003C3F787061636B657420626567696E3D22EF
              BBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B633964
              223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A6E73
              3A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F726520
              352E302D633036302036312E3133343737372C20323031302F30322F31322D31
              373A33323A30302020202020202020223E203C7264663A52444620786D6C6E73
              3A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30322F
              32322D7264662D73796E7461782D6E7323223E203C7264663A44657363726970
              74696F6E207264663A61626F75743D222220786D6C6E733A786D703D22687474
              703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C6E73
              3A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F
              312E302F6D6D2F2220786D6C6E733A73745265663D22687474703A2F2F6E732E
              61646F62652E636F6D2F7861702F312E302F73547970652F5265736F75726365
              526566232220786D703A43726561746F72546F6F6C3D2241646F62652050686F
              746F73686F70204353352057696E646F77732220786D704D4D3A496E7374616E
              636549443D22786D702E6969643A353131433346333833303039313145373939
              44444234413537373130383531442220786D704D4D3A446F63756D656E744944
              3D22786D702E6469643A35313143334633393330303931314537393944444234
              41353737313038353144223E203C786D704D4D3A4465726976656446726F6D20
              73745265663A696E7374616E636549443D22786D702E6969643A353131433346
              3336333030393131453739394444423441353737313038353144222073745265
              663A646F63756D656E7449443D22786D702E6469643A35313143334633373330
              30393131453739394444423441353737313038353144222F3E203C2F7264663A
              4465736372697074696F6E3E203C2F7264663A5244463E203C2F783A786D706D
              6574613E203C3F787061636B657420656E643D2272223F3E40BFE5DC0000089D
              4944415478DADD996B6C54C71580CFBD77EF3EE2D72ED8C65E03EB352D38B8C8
              4B9C6693D8CEAE4320694B0348E90F9448A5521AFE8002224A7EA451D22A95AA
              52352E692BD1460A3F12F1A34881C8A81448BCC64E1A1B39D8C190D80AD81B1A
              2FC6AFB517DBFBBAF7F6CCDD99E8B26C5CCFE285869146BB771E67CE37671E67
              66044DD3E0DB424F53D30DDF2AC624461963CC64024151409424500401444C53
              12893C90A4063516FB014AAD94ADD6EF9BAC5697248A85F8AD625BD1642C168C
              CFCE5E44195FA816CB2550940E499667886C0975515126CA00733209094C3361
              14D3F4F2B4B6DEA4ABB04820A5A8D04E54C25F5052F270FED2A5564B7E3EC816
              0B983092322468AA0AC9781CE2737310BB7E1DAE8F8F4723A3A31F637E00953F
              8820D7EE08082493165114F76892B4D3E174BA97AC5801B68202402B8084F944
              F174F9025A4F10455050D164340AB1D959181B1A82C9E1E141EC9883AAAA360B
              2653ECB6809831CE0A422D566E2E2C2BF33BABABE19EA2226C31D5A42E731EB9
              94280545CB130B0D7FFE394C0C0F0750EE5E1B361FCF2588A2FF51B7AB56EB5F
              2BAAABEDC56E370838143445815B09C44A049E580781A6211A7D1649FF21E50A
              24A169BBE5A2A2032B6A6AC0B17CB93EE61733E0C487C8C808043FFB2C110F87
              5F9005E1C0A28290211057D5A74C0EC7E1CABA3A53BEC3A18FF35C0402737D62
              0286BABB93CAE4E47659148F18B5E406396B00496A5AAD68B104DC7575769CD8
              7C10AC2C59203860A6D1328367CF8E26A2D10D58F33CCBFB61D6209A664D8AE2
              8915EBD6F9CA56AF866422B170081CFB02AE64BA984884CC2F2E986B972EC195
              DEDE3649511EC73913CB0AA473C30606F242FEB265FBBFE7F582862BCDFF5C91
              5840A50984BC79B3FE99686949C188E2C2EAD395ED7257174C87422F61CAEF49
              B2F7830FF8403ED9B891FC94A1B48FD7D4D7BBF3705EA81C3DAA83D8ED607EE6
              19FD33FECE3BA085C30B070152548459ACD3DFD13188BAD66352E8C153A7F840
              CEFAFDA088E22B4B5CAEDFB83C1ED0166A092308EE2FE6EDDB5320870F833635
              C505A22B8931D8DB0BE3C1E0AF0455FDED8381001F48E7A38F16A1058EAFF6F9
              EAD1EDD077EA3B0282E5D19D81FEB6B600FEDFFAD0871F4EF181F8FD3FB61517
              1F59E5F5DA4C66F39DB308CE13B25F5DEAEA9A9B191BDBF2506BEB4D636B7E90
              C6C6DD253535072AD6AE5D98DB91231036E943E8C2FCA7AF6F5F437BFB1FB940
              3A1E79E4EF550F3CF06C695555763BF86281602023E2DAE5CB645FF94B7D5BDB
              2E2E90CE8D1BFF89204FD8CBCBB3DBC517118478D3E821C36057578BF7F4E99F
              7281746FDEFC0582ACD197DD6C9CC2450421679A19745B704FE9AB3B7E7C1D17
              C8B9279FFC1A419C3654E6FF01646E7A9A8084D61F3BE6FC6E83605D04195EFF
              FEFB155C208B36B49E7E3A05F2EEBBB736B4262709487F5D4B4B3517084EF613
              555EEFE3F6B2B2AC273BA0AF65DEB2250572EC18008FAF650864B28743210272
              C27BEAD48FB8403EF2F9DE74DF7FFFAED255ABB23F40913D202F4FFFABCDCCF0
              EF4534B0E51741DE6A3873E6975C201D8D8DFB96D7D4FCA13CDB0D9104720111
              8DA61AB35AB3B206DB10872F5E846B172EECF6B6B7FF990BE4DF7EFFA6BCE2E2
              A359BB28585E20D7412E578A2918042D16D315E3E3A02E4A67E7DCDCD8D8566F
              2070920F049D4674148FAEF1F9FCD9388D1A366E42AF59DEB449FF4E9C3C09C9
              9E1E10CC663E10E2348E8EC2407BFB47E8D6FFC4CBEB347E822744CC7D796965
              E5EBAEDA5AE01E580822DD771FC88F3D9602397D1A944F3F05E005418B04CF9D
              838960F01509E075EE13223D58950BE460D5D050790F1E92B80E566C68B9DDFA
              A73A38C83DB4C8C16A060F5603A983D5C3987495FB606538EABE54E874FE0EF7
              14FE494FCA327832D179E60799E4581FDD77885CBDFA227EEF27C9DC475DC3E5
              834591A47FADACADF595E052ACF05C3EDC4220970F23030370E5FCF93693AA3E
              8120FAF297FD2D0AE857A51ED96A3D83562928282DCD398CBE01126FB7BB7B2A
              198BF96441E86579DC20E9177409557D4A6217744B96E40C864044D0D30D920B
              BA70F8D62FE8325E99023C6F2E2ADA8FC34C2E2C2959D4DB46FD521B7DAA29B4
              C4577D7D896424B24F0678337797D89AF633C1667BCBB9766DE1D2952BF549C9
              7D3191AE0879434119235F7E095707064684586C17CA3D92B34B6CF6AC80B3CE
              A38962B3A3BCDCE7BCF75E200F3BA44735E07B564809566116BDE2507F3F4C85
              426D98B1CBA6697D397D56600F3D71F290431E7A04618F6632ED745454B88BD1
              15B1A083485EA916F4D0837B0A392C4D5CB9927AE849260FAA9A76FB1E7A1808
              90A737A294282EC3FFCFE199A5893EBD5908906CB3E95E2B7B7A23671AE23325
              E6E6208E9E70647C3C469FDE5A4192FE26A9EA88BEE1DECEA7B7341010510EF6
              721E7679A39848542504A11A97EB1A047149926425FA288A328620C14434FA15
              367C5994E50B68B276B4DE8C8A964210C809C87729DC5D203801FD69E93D18C3
              183D18ED697901FA5B49E3108D24F80D75D3BF339537CA49AFC74298E61903CB
              67BA7C03926E1652994C9037D284EA7530EEA1792C3463DC8B51A3F55803EC7B
              0BADC3C22F301EA2FFDFC6B8232D2D5D9F43349F74EC7B149CE949DA3D640431
              2A700EE3510A41D27E6D10EAA1F9ACFC0E0AB51EE3E0B780B41A142540AF6274
              40CADA9334DD436518EB05A80EADF4FB790AD1442148276C25B28C20E9A66DA2
              0DB2E10086322C3F3DCC67911DB4737AE9EF1085FA392D3349417A32C869A5FF
              5FC3B88DD6BFA14D23C821DA435B0D85D93AC7040631BA3280D8296026906D34
              6F88F6BA8F42B9A965870C960D50CB2D148459B429D3D07A8F36E83608986F68
              BD4A1B70D0A1453A64AFA1DC362A930D2D96DE4C95EF3128E5A172260DF28DED
              B1A1C53AE78D4C438B55B453859A69CFFBD3864FA6C9FB1A85258ABD6D483F4A
              1B65B02C04A822610AC80269F74F70E34202C031D9FD70E31CA9A4310C372FBF
              0B5D4ED397CDF4747F86BA1E837558986FF9FD46E7BB6B43BC1BC27F0121DB2C
              80E52812AA0000000049454E44AE426082}
            ExplicitLeft = 178
          end
          object ShapeStatusIntegrado: TShape
            Left = 5
            Top = 94
            Width = 76
            Height = 23
            Brush.Color = 3786636
            Pen.Color = 9729540
            Shape = stRoundRect
          end
          object _lblStatusIntegrado: TLabel
            Left = 8
            Top = 97
            Width = 68
            Height = 13
            Alignment = taCenter
            AutoSize = False
            Caption = '100%'
            Color = 8908027
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentColor = False
            ParentFont = False
          end
          object _imgStatusAgen: TImage
            AlignWithMargins = True
            Left = 250
            Top = 91
            Width = 57
            Height = 58
            Margins.Right = 5
            Margins.Bottom = 5
            Anchors = [akRight, akBottom]
            Center = True
            Picture.Data = {
              0954506E67496D61676589504E470D0A1A0A0000000D49484452000000320000
              003208060000001E3F88B10000001974455874536F6674776172650041646F62
              6520496D616765526561647971C9653C0000032069545874584D4C3A636F6D2E
              61646F62652E786D7000000000003C3F787061636B657420626567696E3D22EF
              BBBF222069643D2257354D304D7043656869487A7265537A4E54637A6B633964
              223F3E203C783A786D706D65746120786D6C6E733A783D2261646F62653A6E73
              3A6D6574612F2220783A786D70746B3D2241646F626520584D5020436F726520
              352E302D633036302036312E3133343737372C20323031302F30322F31322D31
              373A33323A30302020202020202020223E203C7264663A52444620786D6C6E73
              3A7264663D22687474703A2F2F7777772E77332E6F72672F313939392F30322F
              32322D7264662D73796E7461782D6E7323223E203C7264663A44657363726970
              74696F6E207264663A61626F75743D222220786D6C6E733A786D703D22687474
              703A2F2F6E732E61646F62652E636F6D2F7861702F312E302F2220786D6C6E73
              3A786D704D4D3D22687474703A2F2F6E732E61646F62652E636F6D2F7861702F
              312E302F6D6D2F2220786D6C6E733A73745265663D22687474703A2F2F6E732E
              61646F62652E636F6D2F7861702F312E302F73547970652F5265736F75726365
              526566232220786D703A43726561746F72546F6F6C3D2241646F62652050686F
              746F73686F70204353352057696E646F77732220786D704D4D3A496E7374616E
              636549443D22786D702E6969643A334137464343413633303039313145373932
              35324636343141373236314539392220786D704D4D3A446F63756D656E744944
              3D22786D702E6469643A33413746434341373330303931314537393235324636
              34314137323631453939223E203C786D704D4D3A4465726976656446726F6D20
              73745265663A696E7374616E636549443D22786D702E6969643A334137464343
              4134333030393131453739323532463634314137323631453939222073745265
              663A646F63756D656E7449443D22786D702E6469643A33413746434341353330
              30393131453739323532463634314137323631453939222F3E203C2F7264663A
              4465736372697074696F6E3E203C2F7264663A5244463E203C2F783A786D706D
              6574613E203C3F787061636B657420656E643D2272223F3E5C02EEE70000086C
              4944415478DAE5997F8C554715C7CF99790F6C23ED16FF69FF30BBE0A236C6B8
              B06D0592EA126B2968A2FCD318931648D340D1C8126934296E6137A8F1179086
              B21BAB2CD634C698B4899105AA814A0C55BA6C4DE33FB22CDBA636FD47BA6824
              61F7CD8CDF997BEEEEBCF7EEBD2CEFEDD288B3997DF7CE9C99733E73E6F765E7
              1CDD0C81FF2F40960F8ED717B08EF4A421A7992C224D228D50077399C97420B7
              53B1BD1F499D8EDC322656BE1C9E2D9ECF4378D83A751AB2AF59A7CF313BEB1C
              EA5940A48C2346340B3439C575BA4736B5CD2B08C3F04791F308803E4789D57F
              8549C3781A83A1574292E35BF1B314329D80F95422C6C7F0FF5700FB0540DCFB
              07A278BD9E323F82375A61D00598D10F9163ECE89F78BE8C488A4D2887D60F9E
              43BC1D0EF810921E82F26D28BB1494174D59EF54D60DDD5890290363F8BBDE10
              98F62758D707A8E3CA58A934B476F2ECBB59F0883A1DDE7D27131BE10952E4D6
              21B107E92B51E741D4F914A02EDF08908F00E479945A05EB9EB4543AC4CAFD07
              36510C927084873F2725DDA743A2878C4004771153C57BE7FB783F0390470072
              615E40BC27105A01711C4F7759760FB3253C973048D0CA314875357F91DFFBD2
              8454630482BF0ABA2AAD558E7F83B47F00E60164BC1D7BA6791088605C2C86FB
              8FE2F16EE37417AC1ED1286B5D35487D87A057E577659CE832408C0E2FABB5E5
              13481F46F7DC80F17229ADB47190230282862E4D9A6760EED70DD38364CB2F93
              9AA27902F1612D608E21F599CA02FD0D5202B2B151909F8D8B905DAF8DFD1DCC
              DD69987F0C10AA038111E8767E74CF0AC4A398309365829036F42433FFC068B5
              DEB11A0A208F350A72288068CD953760E08475FC00DC7D2519052E9981D05C5A
              25D3B19AB294E1921C90D423680CD2C1ED2E2A8B09639162F7322694DB8C2B7D
              124966E4894641FAC761A67D146BC111C31A10EA0F94CE48D33313BA9DAB5041
              C805097E81F586746641AC549FD76C4E600DDA64491D19D9DA204867FFD82D68
              B163E83A8B2B0B43AB6486D2D5CACC54749D20DE2B361D04F54195A8F286657E
              17FE5F776ECBD2C94641EE8137CEA08F6EC762F56CAE366BA92014820418CE05
              F15D6F1BC6E83E786D1540CE3504B2A27F6C9B667B0010ED68F1370B943505E2
              988BCAB7C2C85178AE7B78EBD2830D81DC3330FA0206DD27F0E8B719FFCAA1B8
              563823BFAB72258A4F12B7219EC650FADB6B5BDABFDA10C8BDFDA37F87A17FC4
              807C3C575D11080705C3F2D659647041166661FA3904569FDDDAFEB1C64006CE
              5FC58CD18BC1B8374F065BF8BCAE554606FAB7FB9EBCEF84D8007E4D1D04808D
              CAB703597B10BF7576CBB20F340832EA33BB31631C68A02DDB104761A316293F
              472F431CCF6FFB3C23693B7EF69FDDD29EEBFFA640C299A49433E338F7616C6B
              DE9A79257FC0BA1BF1AD4CF982018F1C80B82640FA47AF626AECC58CB137AB76
              5A985B9454C5F4AA8ADD15662447EFE17F0F92FDC1ABBE6B51FEA218EA62FB94
              72B60763245763E3831D8EF027B92C403565F600A2C794551F86D0F338F55DE5
              3C4F44307936E2B8FC53087C06201F6D08A468FA350B75E6FC0F4FF4794FA0CB
              F5D9B2EE513816FBE3EBB567E9DCD0FCF48B95FD6B70EBFEB02052F58268CBAA
              16849531BBB171EC01C45E5BD2BB02D8543148A8A398B2F90571C5C0D80A4D16
              5B14DE0153AAB628CAD575F5C7109FB35AF701A4675AAE00C4435C6355972D8A
              C3164535B14519185B808A8694737756286C1AED8C023B7D43928AFB6816969F
              AB02CE03E1E43CE2F2378CA1F89C6C1A651BBF11060F42E95A283D11B7959F6B
              6A603076CAD5966480384EF667E160C5C90E38D338B65FD4647EDBF436BEE660
              750907AB07D115AE249600CB61550F572633755481F8194C06BB7F51FE244961
              4D990651D32035072BE20FA2117F3F3707ABFAA3EE3771D4FD497CD475E1A86B
              12EB62106F6CC585B1E459C31D964AA0639030449CBFC8AB5025728C76FC1D94
              EB9D9BA3EE2C2E1F3C88B7D457A30064CBA5E4120265ACF15E4886D57582CCF1
              E543ED75907347A1F3E3E8B36B9C5C07C520389686852D9988301D580E9BCAEB
              01C1EB6A65F9387ECFCDDD75507C41E7C23D682B06AFBF73BAD3B07B58C905DD
              5C81C0810FA14BFD1AD9EFD879B9A08B0BF82BD349F34BE85E098BBE0D906751
              CBBF9B04590410BF39EDC5EB2BA6AC3701A04EF97CDCC6B740D15EB9C4F64759
              6C2C79A81110C5EE0B143694EE3E143C88CC5DF0C6C40DFBAC60B5DFA2D07A5D
              313F84014B60DE05201C426D4300B904C9CB3920B743E56298B90E659E4099F6
              F059A1A47722FB2861A2B037F2FB4800F1B349F2A1672360BE82565E9B08D1EB
              F8378CAA2F222DF9D0437C2B009790FFD0E3A843D28E03C27FE8190C5FAC3CF3
              FB081216452C9448B1CBB1E5BF17EFF773F8F446CB98E50343F259E43CFE0190
              4F43E62C56EB111860A63FBDCD17C8FF52B87940A2E71644DF77C7A9FE82A043
              F2E3BCAE1A9909896D88A724AD2D2AD711C9D6EAC8D29DEA4CC329AA0E5D717A
              0CB209F130E220E2E648C1C91A23F623EEA0FAEB9353127723AE91E7A745E11E
              A9270E9B45579EEE93358DF5BAD4EB1BE745F94D1B70470C3222C2BED23B4420
              2DB0415ACAE7ED435C8E783132380D4F0BC8B8C86CAF01E148AE1B7189E8C9D2
              7D52EADE23369C14D00E795F2372BE01BE9C56DC2195DD21058E48CB3B8178A9
              C6D55EE97BF23B2169BE4CABAF54E4D2D6CE0221A93B35264B770C92C277494C
              6D9AAE2BADF8B0080CCA6F9BB4560C12BB7A4DD442E392F60AE26745E68078F3
              25812A02D998A37BB620BE7E7FDD943CD4749154F84BE289B46BA59E4B41B2BA
              5697A4BF28DE498D8941BA4536EDA259BAB747655B446FDCB5368837F7A55DAB
              5B0A2D892A3B2C85378B415D519EAF6C87C0D786DD11481BCDF4FDBCC1DE52A0
              BB85AE73B07744826968A3EA697436D32F495E4B545747949E35FD16E99EA0D9
              4DBF619CDE3C0BE2CD02F25F408A579C4AD824CA0000000049454E44AE426082}
            ExplicitLeft = 236
          end
        end
        object Panel12: TPanel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 385
          Height = 100
          Align = alTop
          Color = clWhite
          ParentBackground = False
          TabOrder = 1
          object Label3: TLabel
            Left = 446
            Top = 9
            Width = 66
            Height = 13
            Caption = 'CRIADO EM:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 516
            Top = 9
            Width = 68
            Height = 13
            Caption = '10/03/2021'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label49: TLabel
            Left = 3
            Top = 43
            Width = 48
            Height = 15
            Caption = 'Situa'#231#227'o:'
          end
          object Label50: TLabel
            Left = 254
            Top = -1
            Width = 27
            Height = 15
            Caption = 'Data:'
          end
          object _edtNomeTel: TLabeledEdit
            Left = 3
            Top = 16
            Width = 166
            Height = 27
            CharCase = ecUpperCase
            EditLabel.Width = 100
            EditLabel.Height = 15
            EditLabel.Caption = 'Nome ou Telefone:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
            Text = ''
          end
          object _dataPedido: TDateTimePicker
            Left = 251
            Top = 16
            Width = 121
            Height = 27
            Date = 36526.000000000000000000
            Time = 0.967548356478801000
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object _edtSeqDelivery: TLabeledEdit
            Left = 173
            Top = 16
            Width = 73
            Height = 27
            EditLabel.Width = 70
            EditLabel.Height = 15
            EditLabel.Caption = 'Seq. Delivery:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            NumbersOnly = True
            ParentFont = False
            TabOrder = 1
            Text = ''
          end
          object _edtNrPedido: TLabeledEdit
            Left = 170
            Top = 59
            Width = 76
            Height = 27
            EditLabel.Width = 71
            EditLabel.Height = 15
            EditLabel.Caption = 'Pedido Ifood:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            NumbersOnly = True
            ParentFont = False
            TabOrder = 4
            Text = ''
          end
          object _combStatus: TComboBox
            Left = 3
            Top = 59
            Width = 166
            Height = 27
            Style = csDropDownList
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ItemIndex = 0
            ParentFont = False
            TabOrder = 3
            Text = 'Todas'
            Items.Strings = (
              'Todas'
              'Em preparo'
              'Saiu para Entrega'
              'Finalizado'
              'Cancelado')
          end
        end
      end
      object RelativePanel3: TRelativePanel
        Left = 393
        Top = 120
        Width = 576
        Height = 580
        ControlCollection = <
          item
            Control = Panel11
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = Panel8
          end
          item
            Control = Panel8
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = True
            AlignVerticalCenterWithPanel = False
          end
          item
            Control = _panProdutos
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = Panel11
          end
          item
            Control = _panPagamentosTop
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = _panProdutos
          end
          item
            Control = _panPagamentos
            AlignBottomWithPanel = False
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = True
            AlignRightWithPanel = True
            AlignTopWithPanel = False
            AlignVerticalCenterWithPanel = False
            Below = _panPagamentosTop
          end
          item
            Control = _panResumoPedido
            AlignBottomWithPanel = True
            AlignHorizontalCenterWithPanel = False
            AlignLeftWithPanel = False
            AlignRightWithPanel = True
            AlignTopWithPanel = True
            AlignVerticalCenterWithPanel = False
          end>
        Align = alClient
        Color = clCream
        ParentBackground = False
        TabOrder = 2
        ExplicitLeft = 395
        ExplicitTop = 122
        ExplicitHeight = 550
        DesignSize = (
          576
          580)
        object Panel11: TPanel
          Left = 1
          Top = 37
          Width = 574
          Height = 30
          Align = alTop
          Color = clWhite
          ParentBackground = False
          TabOrder = 0
        end
        object Panel8: TPanel
          AlignWithMargins = True
          Left = 4
          Top = 4
          Width = 568
          Height = 30
          Align = alTop
          BevelOuter = bvNone
          Color = 8934686
          ParentBackground = False
          TabOrder = 1
          DesignSize = (
            568
            30)
          object Shape5: TShape
            Left = 0
            Top = 29
            Width = 568
            Height = 1
            Align = alBottom
            Pen.Color = clSilver
            ExplicitTop = -27
            ExplicitWidth = 994
          end
          object Label12: TLabel
            Left = 1624
            Top = 15
            Width = 34
            Height = 15
            Anchors = [akTop, akRight]
            Caption = 'Linhas'
            Visible = False
            ExplicitLeft = 1670
          end
          object Label13: TLabel
            Left = 1566
            Top = 15
            Width = 43
            Height = 15
            Anchors = [akTop, akRight]
            Caption = 'Colunas'
            Visible = False
            ExplicitLeft = 1612
          end
          object _lblNrPedidoC: TLabel
            Left = 5
            Top = 9
            Width = 45
            Height = 13
            Caption = 'PEDIDO:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblNrPedido: TLabel
            Left = 56
            Top = 9
            Width = 49
            Height = 13
            Caption = '0000000'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblSituacaoC: TLabel
            Left = 130
            Top = 9
            Width = 61
            Height = 13
            Caption = 'SITUA'#199#195'O:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblSituacao: TLabel
            Left = 197
            Top = 9
            Width = 61
            Height = 13
            Caption = 'EM ESPERA'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblCPFClienteC: TLabel
            Left = 278
            Top = 9
            Width = 56
            Height = 13
            Caption = 'CPF/CNPJ:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblCPFCliente: TLabel
            Left = 336
            Top = 9
            Width = 88
            Height = 13
            Caption = '000.000.000-00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpinEdit4: TSpinEdit
            Left = 1624
            Top = 32
            Width = 50
            Height = 24
            Anchors = [akTop, akRight]
            MaxValue = 9
            MinValue = 2
            TabOrder = 0
            Value = 2
            Visible = False
            ExplicitLeft = 1575
          end
        end
        object _panProdutos: TPanel
          Left = 1
          Top = 67
          Width = 574
          Height = 370
          Align = alLeft
          TabOrder = 2
          object Panel7: TPanel
            AlignWithMargins = True
            Left = 4
            Top = 6
            Width = 566
            Height = 30
            Margins.Top = 5
            Align = alTop
            BevelOuter = bvNone
            Color = clSilver
            ParentBackground = False
            TabOrder = 0
            ExplicitWidth = 511
            DesignSize = (
              566
              30)
            object Shape4: TShape
              Left = 0
              Top = 29
              Width = 566
              Height = 1
              Align = alBottom
              Pen.Color = clSilver
              ExplicitTop = -27
              ExplicitWidth = 994
            end
            object Label30: TLabel
              Left = 1
              Top = 10
              Width = 129
              Height = 13
              Caption = 'ENDERE'#199'O DE ENTREGA:'
              Color = 8934686
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8934686
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object SpinEdit3: TSpinEdit
              Left = 1367
              Top = 32
              Width = 50
              Height = 24
              Anchors = [akTop, akRight]
              MaxValue = 9
              MinValue = 2
              TabOrder = 0
              Value = 2
              Visible = False
              ExplicitLeft = 1312
            end
          end
          object _panProdutosTop: TPanel
            Left = 1
            Top = 140
            Width = 572
            Height = 30
            Align = alTop
            BevelOuter = bvNone
            Color = 10389598
            ParentBackground = False
            TabOrder = 1
            ExplicitTop = 219
            ExplicitWidth = 517
            DesignSize = (
              572
              30)
            object Shape3: TShape
              Left = 0
              Top = 29
              Width = 572
              Height = 1
              Align = alBottom
              Pen.Color = clSilver
              ExplicitTop = -27
              ExplicitWidth = 994
            end
            object Label8: TLabel
              Left = 1373
              Top = 15
              Width = 34
              Height = 15
              Anchors = [akTop, akRight]
              Caption = 'Linhas'
              Visible = False
              ExplicitLeft = 1215
            end
            object Label9: TLabel
              Left = 1315
              Top = 15
              Width = 43
              Height = 15
              Anchors = [akTop, akRight]
              Caption = 'Colunas'
              Visible = False
              ExplicitLeft = 1157
            end
            object Label14: TLabel
              Left = 4
              Top = 10
              Width = 64
              Height = 13
              Caption = 'PRODUTOS:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object SpinEdit2: TSpinEdit
              Left = 1373
              Top = 32
              Width = 50
              Height = 24
              Anchors = [akTop, akRight]
              MaxValue = 9
              MinValue = 2
              TabOrder = 0
              Value = 2
              Visible = False
              ExplicitLeft = 1318
            end
          end
          object Panel5: TPanel
            AlignWithMargins = True
            Left = 4
            Top = 42
            Width = 566
            Height = 95
            Align = alTop
            BevelOuter = bvNone
            Color = 16250871
            ParentBackground = False
            TabOrder = 2
            DesignSize = (
              566
              95)
            object Shape2: TShape
              Left = 0
              Top = 94
              Width = 566
              Height = 1
              Align = alBottom
              Pen.Color = clSilver
              ExplicitTop = -27
              ExplicitWidth = 994
            end
            object _lblReferenciaClienteC: TLabel
              Left = 22
              Top = 61
              Width = 70
              Height = 13
              Caption = 'REFER'#202'NCIA:'
              Color = 8934686
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8934686
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object _lblLogradouroClienteC: TLabel
              Left = 33
              Top = 23
              Width = 59
              Height = 13
              Caption = 'ENDERE'#199'O:'
              Color = 8934686
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8934686
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object _lblComplementoClienteC: TLabel
              Left = 7
              Top = 42
              Width = 85
              Height = 13
              Caption = 'COMPLEMENTO:'
              Color = 8934686
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8934686
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object _lblCepClienteC: TLabel
              Left = 69
              Top = 4
              Width = 23
              Height = 13
              Caption = 'CEP:'
              Color = 8934686
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8934686
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object _lblAgendamentoClienteC: TLabel
              Left = 286
              Top = 38
              Width = 86
              Height = 13
              Caption = 'AGENDAMENTO:'
              Color = 8934686
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8934686
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object _lblFoneClienteC: TLabel
              Left = 317
              Top = 19
              Width = 55
              Height = 13
              Caption = 'TELEFONE:'
              Color = 8934686
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8934686
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object _lblBairroClienteC: TLabel
              Left = 325
              Top = 0
              Width = 47
              Height = 13
              Caption = 'BAIRRO:'
              Color = 8934686
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8934686
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object _lblCidadeClienteC: TLabel
              Left = 327
              Top = 57
              Width = 45
              Height = 13
              Caption = 'CIDADE:'
              Color = 8934686
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8934686
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object _lblCelularClienteC: TLabel
              Left = 320
              Top = 76
              Width = 52
              Height = 13
              Caption = 'CELULAR:'
              Color = 8934686
              Font.Charset = DEFAULT_CHARSET
              Font.Color = 8934686
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object _lblCepCliente: TLabel
              Left = 98
              Top = 4
              Width = 4
              Height = 13
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object _lblLogradouroCliente: TLabel
              Left = 98
              Top = 23
              Width = 4
              Height = 13
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object _lblComplementoCliente: TLabel
              Left = 98
              Top = 42
              Width = 4
              Height = 13
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object _lblReferenciaCliente: TLabel
              Left = 98
              Top = 61
              Width = 4
              Height = 13
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object _lblBairroCliente: TLabel
              Left = 378
              Top = 0
              Width = 4
              Height = 13
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object _lblFoneCliente: TLabel
              Left = 378
              Top = 19
              Width = 4
              Height = 13
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object _lblAgendamentoCliente: TLabel
              Left = 378
              Top = 38
              Width = 4
              Height = 13
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object _lblCidadeCliente: TLabel
              Left = 378
              Top = 57
              Width = 4
              Height = 13
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object _lblCelularCliente: TLabel
              Left = 378
              Top = 76
              Width = 4
              Height = 13
              Caption = '-'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = []
              ParentFont = False
            end
            object SpinEdit1: TSpinEdit
              Left = 1367
              Top = 32
              Width = 50
              Height = 24
              Anchors = [akTop, akRight]
              MaxValue = 9
              MinValue = 2
              TabOrder = 0
              Value = 2
              Visible = False
              ExplicitLeft = 1312
            end
          end
          object DBCtrlGrid2: TDBCtrlGrid
            AlignWithMargins = True
            Left = 4
            Top = 173
            Width = 566
            Height = 186
            Align = alTop
            AllowInsert = False
            PanelHeight = 62
            PanelWidth = 549
            TabOrder = 3
            SelectedColor = 8908027
            object Shape7: TShape
              Left = 0
              Top = 58
              Width = 549
              Height = 4
              Align = alBottom
              Brush.Color = clSkyBlue
              Pen.Color = clMaroon
              ExplicitTop = 147
              ExplicitWidth = 353
            end
            object _panTopItensObs: TPanel
              Left = 0
              Top = 19
              Width = 549
              Height = 14
              Align = alTop
              BevelOuter = bvNone
              ParentBackground = False
              ParentColor = True
              TabOrder = 0
              ExplicitWidth = 494
              object _lblObservacaoC: TLabel
                Left = 0
                Top = 0
                Width = 29
                Height = 14
                Align = alLeft
                Caption = 'Obs:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ExplicitHeight = 16
              end
              object _lblObservacao: TLabel
                Left = 29
                Top = 0
                Width = 85
                Height = 14
                Align = alLeft
                Caption = 'OBSERVA'#199#195'O:'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clBlack
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
                ExplicitHeight = 16
              end
              object _shpIntegrado: TShape
                AlignWithMargins = True
                Left = 524
                Top = 0
                Width = 19
                Height = 14
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 6
                Margins.Bottom = 0
                Align = alRight
                Brush.Color = 3786636
                Pen.Color = 3786636
                Shape = stCircle
                ExplicitLeft = 370
              end
            end
            object _panTopItens: TPanel
              Left = 0
              Top = 0
              Width = 549
              Height = 19
              Align = alTop
              BevelOuter = bvNone
              ParentBackground = False
              ParentColor = True
              TabOrder = 1
              ExplicitWidth = 494
              object _lblDescricao: TLabel
                Left = 0
                Top = 0
                Width = 158
                Height = 19
                Align = alLeft
                Caption = 'DESCRI'#199#195'O DO PRODUTO'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ExplicitHeight = 16
              end
              object _lblCodIfood: TLabel
                AlignWithMargins = True
                Left = 515
                Top = 0
                Width = 24
                Height = 19
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 10
                Margins.Bottom = 0
                Align = alRight
                Caption = '000'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ExplicitLeft = 460
                ExplicitHeight = 16
              end
            end
            object _panTopValores: TPanel
              Left = 0
              Top = 33
              Width = 549
              Height = 19
              Align = alTop
              BevelOuter = bvNone
              ParentBackground = False
              ParentColor = True
              TabOrder = 2
              ExplicitWidth = 494
              object _lblQuantidadeItem: TLabel
                Left = 1
                Top = 2
                Width = 14
                Height = 16
                Caption = '00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object Label52: TLabel
                Left = 30
                Top = 2
                Width = 8
                Height = 16
                Caption = 'X'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object _lblValorTotalItemUnitario: TLabel
                Left = 57
                Top = 2
                Width = 51
                Height = 16
                Caption = 'R$ 00,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = []
                ParentFont = False
              end
              object _lblValorTotalItem: TLabel
                AlignWithMargins = True
                Left = 482
                Top = 0
                Width = 57
                Height = 19
                Margins.Left = 0
                Margins.Top = 0
                Margins.Right = 10
                Margins.Bottom = 0
                Align = alRight
                Caption = 'R$ 00,00'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -13
                Font.Name = 'Tahoma'
                Font.Style = [fsBold]
                ParentFont = False
                ExplicitLeft = 427
                ExplicitHeight = 16
              end
            end
          end
        end
        object _panPagamentosTop: TPanel
          Left = 1
          Top = 437
          Width = 574
          Height = 30
          Align = alTop
          BevelOuter = bvNone
          Color = 10389598
          ParentBackground = False
          TabOrder = 3
          DesignSize = (
            574
            30)
          object Shape1: TShape
            Left = 0
            Top = 29
            Width = 574
            Height = 1
            Align = alBottom
            Pen.Color = clSilver
            ExplicitTop = -27
            ExplicitWidth = 994
          end
          object Label2: TLabel
            Left = 1375
            Top = 15
            Width = 34
            Height = 15
            Anchors = [akTop, akRight]
            Caption = 'Linhas'
            Visible = False
            ExplicitLeft = 1215
          end
          object Label4: TLabel
            Left = 1317
            Top = 15
            Width = 43
            Height = 15
            Anchors = [akTop, akRight]
            Caption = 'Colunas'
            Visible = False
            ExplicitLeft = 1157
          end
          object Label5: TLabel
            Left = 4
            Top = 10
            Width = 79
            Height = 13
            Caption = 'PAGAMENTOS:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -11
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object SpinEdit5: TSpinEdit
            Left = 1375
            Top = 32
            Width = 50
            Height = 24
            Anchors = [akTop, akRight]
            MaxValue = 9
            MinValue = 2
            TabOrder = 0
            Value = 2
            Visible = False
            ExplicitLeft = 1373
          end
        end
        object _panPagamentos: TPanel
          Left = 1
          Top = 467
          Width = 574
          Height = 97
          Anchors = []
          TabOrder = 4
          object DBCtrlGrid3: TDBCtrlGrid
            AlignWithMargins = True
            Left = 4
            Top = 4
            Width = 566
            Height = 85
            Align = alTop
            AllowInsert = False
            PanelHeight = 42
            PanelWidth = 549
            TabOrder = 0
            RowCount = 2
            object Shape6: TShape
              Left = 0
              Top = 38
              Width = 549
              Height = 4
              Align = alBottom
              Brush.Color = clSkyBlue
              Pen.Color = clMaroon
              ExplicitTop = 111
              ExplicitWidth = 195
            end
            object _lblValor: TLabel
              Left = 8
              Top = 16
              Width = 57
              Height = 16
              Caption = 'R$ 99,99'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object _lblTipoPagamento: TLabel
              Left = 8
              Top = 1
              Width = 90
              Height = 16
              Caption = 'VISA CR'#201'DITO'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -13
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentFont = False
            end
          end
        end
        object _panResumoPedido: TPanel
          Left = 352
          Top = 1
          Width = 223
          Height = 578
          Margins.Top = 2
          Anchors = []
          Color = clCream
          ParentBackground = False
          TabOrder = 5
          object _lblSubTotalC: TLabel
            Left = 31
            Top = 37
            Width = 106
            Height = 16
            Caption = 'Valor do Pedido:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblTaxaEntregaC: TLabel
            Left = 12
            Top = 54
            Width = 125
            Height = 16
            Caption = '+ Taxa de Entrega:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblTaxaAdicionalC: TLabel
            Left = 21
            Top = 71
            Width = 112
            Height = 16
            Caption = '+ Taxa Adicional:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblDescontoC: TLabel
            Left = 61
            Top = 88
            Width = 76
            Height = 16
            Caption = '- Desconto:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblRespDescontoC: TLabel
            Left = 11
            Top = 104
            Width = 126
            Height = 16
            Caption = 'Respons'#225'vel Desc.:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblValorPedidoC: TLabel
            Left = 75
            Top = 121
            Width = 62
            Height = 25
            Caption = 'Total:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblTrocoParaC: TLabel
            Left = 62
            Top = 147
            Width = 75
            Height = 16
            Caption = 'Troco para:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblSeuTrocoSeraC: TLabel
            Left = 16
            Top = 165
            Width = 121
            Height = 16
            Caption = 'Seu troco ser'#225' de:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblAgendadoParaC: TLabel
            Left = 14
            Top = 182
            Width = 71
            Height = 16
            Caption = 'Agendado:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
            Visible = False
          end
          object _lblAgendadoPara: TLabel
            Left = 91
            Top = 182
            Width = 122
            Height = 16
            Caption = '01/01/2022 00:00:00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
            Visible = False
          end
          object _lblSeuTrocoSera: TLabel
            Left = 143
            Top = 165
            Width = 44
            Height = 16
            Caption = 'R$ 0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object _lblTrocoPara: TLabel
            Left = 143
            Top = 147
            Width = 44
            Height = 16
            Caption = 'R$ 0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object _lblValorPedido: TLabel
            Left = 143
            Top = 121
            Width = 70
            Height = 25
            Caption = 'R$ 0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -21
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object _lblRespDesconto: TLabel
            Left = 143
            Top = 104
            Width = 31
            Height = 16
            Caption = 'iFood'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object _lblDesconto: TLabel
            Left = 143
            Top = 88
            Width = 44
            Height = 16
            Caption = 'R$ 0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object _lblTaxaAdicional: TLabel
            Left = 143
            Top = 71
            Width = 44
            Height = 16
            Caption = 'R$ 0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object _lblTaxaEntrega: TLabel
            Left = 143
            Top = 54
            Width = 44
            Height = 16
            Caption = 'R$ 0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object _lblSubTotal: TLabel
            Left = 143
            Top = 37
            Width = 44
            Height = 16
            Caption = 'R$ 0,00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clNavy
            Font.Height = -13
            Font.Name = 'Tahoma'
            Font.Style = []
            ParentFont = False
          end
          object _lblStatusProducaoC: TLabel
            Left = 50
            Top = 239
            Width = 100
            Height = 19
            Caption = 'Em preparo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 9729540
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblStatusProducao: TLabel
            Left = 163
            Top = 239
            Width = 20
            Height = 19
            Caption = '00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 9729540
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblStatusNovosC: TLabel
            Left = 58
            Top = 260
            Width = 92
            Height = 19
            Caption = 'Pendentes:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 9541011
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblStatusNovos: TLabel
            Left = 163
            Top = 260
            Width = 20
            Height = 19
            Caption = '00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 9541011
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblStatusEntregaC: TLabel
            Left = 16
            Top = 282
            Width = 134
            Height = 19
            Caption = 'Saiu p/ Entrega:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15631385
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblStatusEntrega: TLabel
            Left = 163
            Top = 282
            Width = 20
            Height = 19
            Caption = '00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 15631385
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblStatusFinalizadosC: TLabel
            Left = 53
            Top = 305
            Width = 97
            Height = 19
            Caption = 'Finalizados:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 3786636
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblStatusFinalizados: TLabel
            Left = 163
            Top = 305
            Width = 20
            Height = 19
            Caption = '00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 3786636
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblStatusCanceladosC: TLabel
            Left = 52
            Top = 328
            Width = 98
            Height = 19
            Caption = 'Cancelados:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 2827210
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object _lblStatusCancelados: TLabel
            Left = 163
            Top = 328
            Width = 20
            Height = 19
            Caption = '00'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = 2827210
            Font.Height = -16
            Font.Name = 'Tahoma'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Panel3: TPanel
            AlignWithMargins = True
            Left = 4
            Top = 3
            Width = 215
            Height = 30
            Margins.Top = 2
            Align = alTop
            BevelOuter = bvNone
            Color = 8934686
            ParentBackground = False
            TabOrder = 0
            DesignSize = (
              215
              30)
            object Shape8: TShape
              Left = 0
              Top = 29
              Width = 215
              Height = 1
              Align = alBottom
              Pen.Color = clSilver
              ExplicitTop = -27
              ExplicitWidth = 994
            end
            object Label6: TLabel
              Left = 57
              Top = 8
              Width = 111
              Height = 13
              Caption = 'RESUMO DO PEDIDO'
              Color = 8934686
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
            object SpinEdit6: TSpinEdit
              Left = 1367
              Top = 32
              Width = 50
              Height = 24
              Anchors = [akTop, akRight]
              MaxValue = 9
              MinValue = 2
              TabOrder = 0
              Value = 2
              Visible = False
            end
          end
          object Panel2: TPanel
            Left = 4
            Top = 206
            Width = 215
            Height = 30
            Color = 8934686
            ParentBackground = False
            TabOrder = 1
            object Label7: TLabel
              Left = 57
              Top = 9
              Width = 96
              Height = 13
              Caption = 'STATUS PEDIDOS'
              Color = 8934686
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -11
              Font.Name = 'Tahoma'
              Font.Style = [fsBold]
              ParentColor = False
              ParentFont = False
            end
          end
        end
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 780
    Width = 1122
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    Color = 12477460
    ParentBackground = False
    TabOrder = 3
    ExplicitTop = 750
    object Label1: TLabel
      Left = 68
      Top = 12
      Width = 201
      Height = 21
      Caption = 'TSplitView Demonstration'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object ActionList1: TActionList
    Images = imlIcons
    Left = 80
    Top = 236
    object actHome: TAction
      Caption = 'Home'
      ImageIndex = 1
      OnExecute = actHomeExecute
    end
    object actLayout: TAction
      Caption = 'Layout Options'
      ImageIndex = 2
      OnExecute = actLayoutExecute
    end
    object actPower: TAction
      Caption = 'Power Settings'
      ImageIndex = 3
      OnExecute = actPowerExecute
    end
  end
  object imlIcons: TImageList
    ColorDepth = cd32Bit
    Height = 32
    Width = 32
    Left = 80
    Top = 316
    Bitmap = {
      494C010104008000040020002000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000800000004000000001002000000000000080
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFF000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFF00000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFF0000000000000000FFFFFFFFFFFFFFFFFFFFFFFF0000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFF00000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000FFFFFFFF0000000000000000FFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFF000000000000000000000000FFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFFFFFFFFFFFFFFFFFF0000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000FFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFF0000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFFFFFFFFFFFFFFFFFFFF00000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000FFFFFFFF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
      FFFF000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000080000000400000000100010000000000000400000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object DataSource1: TDataSource
    DataSet = DM._qryListaPedido
    Left = 516
    Top = 252
  end
end
