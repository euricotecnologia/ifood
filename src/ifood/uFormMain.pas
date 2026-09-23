unit uFormMain;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  System.ImageList,
  System.Actions,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.ExtCtrls,
  Vcl.WinXCtrls,
  Vcl.StdCtrls,
  Vcl.CategoryButtons,
  Vcl.Buttons,
  Vcl.ImgList,
  Vcl.Imaging.PngImage,
  Vcl.ComCtrls,
  Vcl.ActnList,
  Vcl.Samples.Spin,
  Vcl.Mask,
  Vcl.DBCGrids,
  Data.DB,
  PraButtonStyle,
  System.Generics.Collections,
  Datasnap.DBClient,
  UIFoodRecord,
  StrUtils,
  REST.Authenticator.Basic,
  Winapi.ShellAPI,
  REST.Client,
  System.MaskUtils,
  UFormMensagensPadrao,
  REST.Types,
  System.JSON,
  REST.Json,
  Vcl.Grids,
  Vcl.DBGrids,
//  UDBGridStyles,
  System.DateUtils,
  System.IniFiles,
  FireDAC.Stan.Param,
  Thread.IFood, dxGDIPlusClasses;

type
  T_frmMain = class(TForm)
    ActionList1: TActionList;
    actHome: TAction;
    actLayout: TAction;
    actPower: TAction;
    imlIcons: TImageList;
    SV: TSplitView;
    catMenuItems: TCategoryButtons;
    pnlToolbar: TPanel;
    PageControl1: TPageControl;
    _tabMain: TTabSheet;
    _dsListaPedido: TDataSource;
    RelativePanel1: TRelativePanel;
    RelativePanel2: TRelativePanel;
    RelativePanel3: TRelativePanel;
    Panel1: TPanel;
    DBCtrlGrid1: TDBCtrlGrid;
    ShapeStatusPedido: TShape;
    _lblStatusPedido: TLabel;
    _lblCodigoPedidoIfood: TLabel;
    _lblAceitoAs: TLabel;
    _lblNomeEmpresa: TLabel;
    _imgStatus02: TImage;
    _imgStatus01: TImage;
    _lblDataPedido: TLabel;
    _imgStatusCan: TImage;
    ShapeStatusIntegrado: TShape;
    _lblStatusIntegrado: TLabel;
    _imgStatusAgen: TImage;
    Panel12: TPanel;
    Label3: TLabel;
    Label15: TLabel;
    Label49: TLabel;
    Label50: TLabel;
    _edtNomeTel: TLabeledEdit;
    _dataPedido: TDateTimePicker;
    _edtSeqDelivery: TLabeledEdit;
    _edtNrPedido: TLabeledEdit;
    _combStatus: TComboBox;
    _panControles: TPanel;
    swVendeOffLine: TToggleSwitch;
    swAceiteAut: TToggleSwitch;
    _panDadosPedido: TPanel;
    Panel8: TPanel;
    Shape5: TShape;
    Label12: TLabel;
    Label13: TLabel;
    SpinEdit4: TSpinEdit;
    _panProdutosPagamentos: TPanel;
    DBCtrlGrid2: TDBCtrlGrid;
    _panTopItensObs: TPanel;
    _lblObservacao: TLabel;
    _shpIntegrado: TShape;
    _panTopItens: TPanel;
    _lblDescricao: TLabel;
    _lblCodIfood: TLabel;
    _panTopValores: TPanel;
    _lblQuantidadeItem: TLabel;
    Label52: TLabel;
    _lblValorTotalItemUnitario: TLabel;
    _lblValorTotalItem: TLabel;
    Panel4: TPanel;
    _panResumoPedido: TPanel;
    _lblSubTotalC: TLabel;
    _lblTaxaEntregaC: TLabel;
    _lblTaxaAdicionalC: TLabel;
    _lblDescontoC: TLabel;
    _lblRespDescontoC: TLabel;
    _lblValorPedidoC: TLabel;
    _lblValorPedido: TLabel;
    _lblRespDesconto: TLabel;
    _lblDesconto: TLabel;
    _lblTaxaAdicional: TLabel;
    _lblTaxaEntrega: TLabel;
    _lblSubTotal: TLabel;
    Panel3: TPanel;
    Shape8: TShape;
    Label6: TLabel;
    SpinEdit6: TSpinEdit;
    Panel2: TPanel;
    Label7: TLabel;
    _lblStatusProducaoC: TLabel;
    _lblStatusProducao: TLabel;
    _lblStatusNovosC: TLabel;
    _lblStatusNovos: TLabel;
    _lblStatusEntregaC: TLabel;
    _lblStatusEntrega: TLabel;
    _lblStatusFinalizadosC: TLabel;
    _lblStatusFinalizados: TLabel;
    _lblStatusCanceladosC: TLabel;
    _lblStatusCancelados: TLabel;
    _btnReenviar: TPraButtonStyle;
    _bntAceitarPedido: TPraButtonStyle;
    _bntRecusarPedido: TPraButtonStyle;
    _bntSairEntrega: TPraButtonStyle;
    _btnDetalhar: TPraButtonStyle;
    _tabRepositorio: TTabSheet;
    _imgLojaON: TImage;
    _imgLojaOFF: TImage;
    _imgNaMesa: TImage;
    _imgiZAP: TImage;
    _imgVazio: TImage;
    _imgTablet: TImage;
    _imgAtendente: TImage;
    _imgWWW: TImage;
    _imgRetirada: TImage;
    _imgAgendado: TImage;
    _imgRecusado: TImage;
    _imgDelivery: TImage;
    _imgiFood: TImage;
    _lblSeqDeliveryC: TLabel;
    _lblSeqDelivery: TLabel;
    _dsListaPedidoItens: TDataSource;
    _dsListaPagamentos: TDataSource;
    DBCtrlGrid3: TDBCtrlGrid;
    _lblValor: TLabel;
    _shpBot: TShape;
    _lblCPFCliente: TLabel;
    _lblCPFClienteC: TLabel;
    _lblNrPedidoC: TLabel;
    _lblNrPedido: TLabel;
    _lblEndEntrega: TLabel;
    _lblFoneClienteC: TLabel;
    _lblFoneCliente: TLabel;
    _lblCelularClienteC: TLabel;
    _lblCelularCliente: TLabel;
    Label2: TLabel;
    _tabConfig: TTabSheet;
    GroupBox9: TGroupBox;
    _lblToken: TLabel;
    edtClientID: TLabeledEdit;
    edtClientSecret: TLabeledEdit;
    edtUsername: TLabeledEdit;
    edtPassword: TLabeledEdit;
    edtToken: TEdit;
    authorizationCodeVerifier: TLabeledEdit;
    accessToken: TLabeledEdit;
    refreshToken: TLabeledEdit;
    GroupBox15: TGroupBox;
    _btnAutorizarLoja: TButton;
    userCode: TLabeledEdit;
    verificationUrlComplete: TLabeledEdit;
    GroupBox16: TGroupBox;
    _imgConfigOK: TImage;
    _btnLiberarLoja: TButton;
    authorizationCode: TLabeledEdit;
    _edtMerchanIDLoja: TLabeledEdit;
    GroupBox13: TGroupBox;
    DBGridStyles4: TDBGrid;
    _edtCodigoLojaGCom: TLabeledEdit;
    _btnAtualizar: TButton;
    _btnBuscarMerchants: TButton;
    _checkLojaPrincipal: TCheckBox;
    _btnGravarConfig: TPraButtonStyle;
    _checkAceitaPedido: TCheckBox;
    _checkAdcComoProd: TCheckBox;
    _checkUtilizaIFood: TCheckBox;
    _checkImprimeViaEntregador: TCheckBox;
    Memo1: TMemo;
    Memo2: TMemo;
    _btnPesquisar: TPraButtonStyle;
    RelativePanel4: TRelativePanel;
    _dsLoja: TDataSource;
    grpAnimation: TGroupBox;
    lblAnimationDelay: TLabel;
    lblAnimationStep: TLabel;
    chkUseAnimation: TCheckBox;
    trkAnimationDelay: TTrackBar;
    trkAnimationStep: TTrackBar;
    grpCloseStyle: TRadioGroup;
    lstLog: TListBox;
    chkCloseOnMenuClick: TCheckBox;
    RelativePanel6: TRelativePanel;
    imgMenu: TImage;
    RelativePanel7: TRelativePanel;
    _imgStatusLoja: TImage;
    _lblStatusLoja: TLabel;
    _lblAtendenteC: TLabel;
    _lblAtendente: TLabel;
    _lblNomeLojaC: TLabel;
    _lblNomeLoja: TLabel;
    _lblVersaoSistemaC: TLabel;
    _lblUltAtualizacaoC: TLabel;
    _lblUltAtualizacao: TLabel;
    _lblVersaoSistema: TLabel;
    _tabDetalhar: TTabSheet;
    _pagControliFood: TPageControl;
    _tabCadastro: TTabSheet;
    GroupBox6: TGroupBox;
    DBGridStyles3: TDBGrid;
    GroupBox7: TGroupBox;
    _edtIDiFodd: TLabeledEdit;
    _edtCadPedidoIDiFood: TLabeledEdit;
    _edtCadCreatedAtiFood: TLabeledEdit;
    _edtCadDeliveryDateTimeiFood: TLabeledEdit;
    _edtCadSubTotaliFood: TLabeledEdit;
    _edtCadTaxasiFood: TLabeledEdit;
    _edtCadTotaliFood: TLabeledEdit;
    _edtCadiFoodIDiFood: TLabeledEdit;
    LabeledEdit14: TLabeledEdit;
    _edtCadPagamentoiFood: TLabeledEdit;
    _edtCadPrePagoiFood: TLabeledEdit;
    _edtCadTrocoiFood: TLabeledEdit;
    _edtCadValoriFood: TLabeledEdit;
    _tabItens: TTabSheet;
    GroupBox4: TGroupBox;
    DBGridStyles1: TDBGrid;
    GroupBox5: TGroupBox;
    DBGridStyles2: TDBGrid;
    _tabCliente: TTabSheet;
    GroupBox1: TGroupBox;
    _edtClientIDiFood: TLabeledEdit;
    _edtNomeiFood: TLabeledEdit;
    _edtEmailiFood: TLabeledEdit;
    _edtPhoneiFood: TLabeledEdit;
    _edtCPFCNPJiFood: TLabeledEdit;
    _edtOrderCountiFood: TLabeledEdit;
    GroupBox2: TGroupBox;
    Label20: TLabel;
    _edtEnderecoiFood: TLabeledEdit;
    _edtNroiFood: TLabeledEdit;
    _edtCEPiFood: TLabeledEdit;
    _edtLatitudeiFood: TLabeledEdit;
    _edtLongitudeiFood: TLabeledEdit;
    _edtCidadeiFood: TLabeledEdit;
    _edtEstadoiFood: TLabeledEdit;
    _edtBairroiFood: TLabeledEdit;
    _edtReferenciaiFood: TLabeledEdit;
    _edtPaisiFood: TLabeledEdit;
    _MemoEndFormatadoiFood: TMemo;
    _tabOrigem: TTabSheet;
    RelativePanel8: TRelativePanel;
    Panel16: TPanel;
    _lblRetiFood: TLabel;
    _memRetiFood: TMemo;
    Panel17: TPanel;
    _lblItensiFood: TLabel;
    _memItensiFood: TMemo;
    Panel18: TPanel;
    _lblMerchantiFood: TLabel;
    _lblPaymentsiFood: TLabel;
    _memMerchantiFood: TMemo;
    _memPaymentsiFood: TMemo;
    Panel19: TPanel;
    _lblAddressiFood: TLabel;
    _lblCustomeriFood: TLabel;
    _memCustomeriFood: TMemo;
    _memAddressiFood: TMemo;
    _tabLogs: TTabSheet;
    GroupBox12: TGroupBox;
    _lblEnviado: TLabel;
    _lblRecebido: TLabel;
    _gridLogs: TDBGrid;
    _memEnvio: TMemo;
    _memRecebido: TMemo;
    _dsPooling: TDataSource;
    _dsItensPedido: TDataSource;
    _dsAdicionaisPedido: TDataSource;
    _dsLogs: TDataSource;
    _cdsItensPedido: TClientDataSet;
    _cdsItensPedidoName: TStringField;
    _cdsItensPedidoQuantity: TCurrencyField;
    _cdsItensPedidoDiscount: TCurrencyField;
    _cdsItensPedidoPrice: TCurrencyField;
    _cdsItensPedidoTotalPrice: TCurrencyField;
    _cdsItensPedidoExternalCode: TIntegerField;
    _cdsItensPedidoAddition: TCurrencyField;
    _cdsItensPedidoNrItem: TIntegerField;
    _cdsAdicionaisPedido: TClientDataSet;
    _cdsAdicionaisPedidoName: TStringField;
    _cdsAdicionaisPedidoQuantity: TCurrencyField;
    _cdsAdicionaisPedidoAddition: TCurrencyField;
    _cdsAdicionaisPedidoDiscount: TCurrencyField;
    _cdsAdicionaisPedidoPrice: TCurrencyField;
    _cdsAdicionaisPedidoTotalPrice: TCurrencyField;
    _cdsAdicionaisPedidoExternalCode: TIntegerField;
    _cdsAdicionaisPedidoNrItem: TIntegerField;
    PraButtonStyle1: TPraButtonStyle;
    _edtPhoneLocalizer: TLabeledEdit;
    _edtNrPedidoGConnect: TLabeledEdit;
    _btnAtualizarNrPedido: TButton;
    _lblInfPagamento: TLabel;
    _lblInfPagamentoAux: TLabel;
    _spRowLinhaPedido: TSpinEdit;
    _spRowLinhaItens: TSpinEdit;
    _lblRowItens: TLabel;
    _lblRowPedidos: TLabel;
    _lblAgendadoParaC: TLabel;
    _lblAgendadoPara: TLabel;
    _lblDataPedidoC: TLabel;
    ShapeAgendado: TShape;
    _lblNomeCliente: TLabel;
    _lblAceitoAsC: TLabel;
    _tabLogGeral: TTabSheet;
    GroupBox3: TGroupBox;
    Label11: TLabel;
    Label16: TLabel;
    _edtDataFinal: TDateTimePicker;
    _edtDataIni: TDateTimePicker;
    _combLogGeral: TComboBox;
    PraButtonStyle2: TPraButtonStyle;
    Label1: TLabel;
    _memEnvioGeral: TMemo;
    Label4: TLabel;
    _memRecebidoGeral: TMemo;
    _gridLogsGeral: TDBGrid;
    _dsLogsGeral: TDataSource;
    actLogGeral: TAction;
    PraButtonStyle3: TPraButtonStyle;
    _lblTrocoParaC: TLabel;
    _lblTrocoPara: TLabel;
    _lblSeuTrocoSeraC: TLabel;
    _lblSeuTrocoSera: TLabel;
    Image1: TImage;
    Panel5: TPanel;
    procedure grpCloseStyleClick(Sender: TObject);
    procedure SVClosed(Sender: TObject);
    procedure SVClosing(Sender: TObject);
    procedure SVOpened(Sender: TObject);
    procedure SVOpening(Sender: TObject);
    procedure catMenuItemsCategoryCollapase(Sender: TObject; const Category: TButtonCategory);
    procedure imgMenuClick(Sender: TObject);
    procedure chkUseAnimationClick(Sender: TObject);
    procedure trkAnimationDelayChange(Sender: TObject);
    procedure trkAnimationStepChange(Sender: TObject);
    procedure actHomeExecute(Sender: TObject);
    procedure actLayoutExecute(Sender: TObject);
    procedure actPowerExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure DBCtrlGrid1Click(Sender: TObject);
    procedure DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure DBCtrlGrid2PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure DBCtrlGrid3PaintPanel(DBCtrlGrid: TDBCtrlGrid; Index: Integer);
    procedure DBCtrlGrid2Click(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure _bntAceitarPedidoClick(Sender: TObject);
    procedure _bntRecusarPedidoClick(Sender: TObject);
    procedure _bntSairEntregaClick(Sender: TObject);
    procedure _btnAutorizarLojaClick(Sender: TObject);
    procedure _btnLiberarLojaClick(Sender: TObject);
    procedure _btnAtualizarClick(Sender: TObject);
    procedure _btnBuscarMerchantsClick(Sender: TObject);
    procedure _btnGravarConfigClick(Sender: TObject);
    procedure swVendeOffLineClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure _btnPesquisarClick(Sender: TObject);
    procedure swAceiteAutClick(Sender: TObject);
    procedure _lblStatusLojaClick(Sender: TObject);
    procedure DBGridStyles4CellClick(Column: TColumn);
    procedure FormCreate(Sender: TObject);
    procedure _btnDetalharClick(Sender: TObject);
    procedure _gridLogsCellClick(Column: TColumn);
    procedure _pagControliFoodChange(Sender: TObject);
    procedure PraButtonStyle1Click(Sender: TObject);
    procedure _btnAtualizarNrPedidoClick(Sender: TObject);
    procedure _spRowLinhaItensChange(Sender: TObject);
    procedure _spRowLinhaPedidoChange(Sender: TObject);
    procedure _gridLogsGeralCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure actLogGeralExecute(Sender: TObject);
    procedure PraButtonStyle2Click(Sender: TObject);
    procedure _dataPedidoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _gridLogsGeralKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _btnReenviarClick(Sender: TObject);
  private
      {CdFuncionario, CdLoja: Integer;
      NomeLoja, NomeUsuario, vStatusLoja: String;}

      GetCdLoja_Merchan: Integer;

      FRestClient: TRESTClient;
      FRestRequest: TRESTRequest;
      FRestResponse: TRESTResponse;



      vTThreadIFOOD: TThreadNFe_NFCe;
      CdPedido, GetCdPedidoGCOM: Integer;

      GetStatusAceite, GetStatusCancelar, GetStatusEntrega, {LoginOK,} IsAgendado: Boolean;
      GetDataAgendamentoStart, GetDataAgendamentoEnd: TDateTime;

      PedidoAceito: Char;


      GetCorrelationId, GetShortReference, Get_Merchan_ID: String;

      DataExpiraFirsToken: TDateTime;

      FIFood: TIFoodRecord;

    procedure createComponents;
    procedure destroyComponents;
    procedure loadCredentials;

    procedure ConfirmaPedido(ID: String);
    procedure RecusarPedido(ID, CodigoCanc, MoticoCanc: String);
    procedure EntregaPedido(ID: String);
    procedure RetirarPedido(ID: String);
    procedure DeletarInterruption(MerchantID: String);
    procedure Interruption(vMerchantID, vData, vStart, vEnd, vDescription: String);
    procedure GravarConfigiFood(ExibeMSG: Boolean);
    procedure ListarMerchants;
    function VersaoExe: String;
    procedure ListaLogsGeral;
    procedure GetFirstToken;

    procedure Log(const Msg: string);
    procedure GetStatusPedidoSelecionado;
  public
  end;

var
  _frmMain: T_frmMain;

implementation

{$R *.dfm}

uses UDM, UFormMotivoCanc, UFormGravacaoOK, UFormStatusLoja, UFormFecharLoja;

function LPad(value: string; tamanho: integer; caractere: char): string;
var
  i: integer;
begin
  Result := value;
  if (Length(value) > tamanho) then
    exit;
  for i := 1 to (tamanho - Length(value)) do
    Result := caractere + Result;
end;

function RPad(value: string; tamanho: integer; caractere: char): string;
var
  i: integer;
begin
  Result := value;
  if (Length(value) > tamanho) then
    exit;
  for i := 1 to (tamanho - Length(value)) do
    Result := Result + caractere;
end;

procedure T_frmMain.imgMenuClick(Sender: TObject);
begin
  if SV.Opened then
    SV.Close
  else
    SV.Open;
end;

procedure T_frmMain.Interruption(vMerchantID, vData, vStart, vEnd,
  vDescription: String);
var
  parameter: TRESTRequestParameter;
  objeto: TJSONObject;
  MyIDInterruption: String;
  Envio, Body: String;
begin
  createComponents;
  try
    FRESTClient.BaseURL := 'https://merchant-api.ifood.com.br/merchant/v1.0';
    FRestClient.ContentType := 'application/json';
    FRestRequest.Accept := 'application/json';
    FRestRequest.Method := rmPOST;

    parameter := FRestRequest.Params.AddHeader('Authorization', 'Bearer ' + edtToken.Text);
    parameter.Options := [poDoNotEncode];

    FRESTRequest.Resource := '/merchants/' + vMerchantID + '/interruptions';

    objeto := TJSONObject.Create;
    try
      objeto.AddPair('description', vDescription);
      objeto.AddPair('start', vStart);
      objeto.AddPair('end', vEnd);
      FRestRequest.AddBody(TJson.JsonEncode(objeto), ctAPPLICATION_JSON);
      Body := objeto.ToString;

    finally
      objeto.Free;
    end;

    Envio :=    'BaseURL: '     + FRESTClient.BaseURL + #13 +
                'ContentType: ' + FRESTClient.ContentType + #13 +
                'Accept: '      + FRESTRequest.Accept + #13 +
                'Method: POST'  + #13 +
                'Body: '        + Body   + #13 +
                 //'Header: '      + parameter.ToString  + #13 +
                'Resource: '    + FRESTRequest.Resource;

    DM.InsertLogs(0,
                  2,
                  'Envio - Interruption',
                  Envio,
                  'IFOOD - Interruption',
                  'S',
                  '');

    FRestRequest.Execute;

    case FRestResponse.StatusCode of
      201: //OK
      begin

        DM.InsertLogs(0,
                      2,
                      'Resposta - Interruption',
                      '',
                      'IFOOD - Interruption',
                      'S',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'OK' + #13  +  #13  + FRestResponse.Content);



        MyIDInterruption := FRestResponse.JSONValue.GetValue<String>('id');

        DM._qryFechamentoLoja.Params[0].AsDateTime := StrToDateTime(vData); //DataAberturaFechamento
        DM._qryFechamentoLoja.Params[1].AsString := MyIDInterruption;       //IDFechamentoLoja
        DM._qryFechamentoLoja.Params[2].AsString := vDescription;           //MotivoFechamento
        DM._qryFechamentoLoja.ExecSQL;
        DM._qryFechamentoLoja.Connection.Commit;

        swVendeOffLine.ThumbColor := $000080FF;
        swVendeOffLine.StateCaptions.CaptionOn := 'Loja OFF';
        //_frmMain.Caption := _frmMain.Caption + ' Loja Fechada, Motivo do Fechamento: ' + vDescription;
        T_frmFormMensagensPadrao.Mensagem('Loja fechada com sucesso!', 'I', [mbOk]);
      end;
      400: //BadRequest. Some body parameter is missing, start and/or end aren't in ISO 8601 format, start is after end, etc.
      begin
        DM.InsertLogs(0,
                      2,
                      'Resposta - Interruption',
                      '',
                      'IFOOD - Interruption',
                      'N',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'BadRequest. Some body parameter is missing, start and/or end aren t in ISO 8601 format, start is after end, etc.' + #13  +  #13  + FRestResponse.Content);


        T_frmFormMensagensPadrao.Mensagem('Falha ao interromper a Loja!', 'E', [mbOk]);
      end;
      401: //Unauthorized. User is not authenticated at all, token is expired or token is invalid.
      begin
        DM.InsertLogs(0,
                      2,
                      'Resposta - Interruption',
                      '',
                      'IFOOD - Interruption',
                      'N',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Unauthorized. User is not authenticated at all, token is expired or token is invalid.' + #13  +  #13  + FRestResponse.Content);

        T_frmFormMensagensPadrao.Mensagem('Falha ao interromper a Loja!', 'E', [mbOk]);
      end;
      403: //Forbidden. User has no access to the given merchant.
      begin
        DM.InsertLogs(0,
                      2,
                      'Resposta - Interruption',
                      '',
                      'IFOOD - Interruption',
                      'N',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Forbidden. User has no access to the given merchant.' + #13  +  #13  + FRestResponse.Content);

        T_frmFormMensagensPadrao.Mensagem('Falha ao interromper a Loja!', 'E', [mbOk]);
      end;
      500: //InternalServerError. Something unexpected happened while creating the interruption.
      begin
        DM.InsertLogs(0,
                      2,
                      'Resposta - Interruption',
                      '',
                      'IFOOD - Interruption',
                      'N',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'InternalServerError. Something unexpected happened while creating the interruption.' + #13  +  #13  + FRestResponse.Content);

        T_frmFormMensagensPadrao.Mensagem('Falha ao interromper a Loja!', 'E', [mbOk]);
      end;

    end;

  finally
    destroyComponents;
  end;

end;

procedure T_frmMain.grpCloseStyleClick(Sender: TObject);
begin
  SV.CloseStyle := TSplitViewCloseStyle(grpCloseStyle.ItemIndex);
end;

procedure T_frmMain.SVClosed(Sender: TObject);
begin
  // When TSplitView is closed, adjust ButtonOptions and Width
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions - [boShowCaptions];
  if SV.CloseStyle = svcCompact then
    catMenuItems.Width := SV.CompactWidth;
end;

procedure T_frmMain.SVClosing(Sender: TObject);
begin
//
end;

procedure T_frmMain.SVOpened(Sender: TObject);
begin
  // When not animating, change size of catMenuItems when TSplitView is opened
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions + [boShowCaptions];
  catMenuItems.Width := SV.OpenedWidth;
end;

procedure T_frmMain.SVOpening(Sender: TObject);
begin
  // When animating, change size of catMenuItems at the beginning of open
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions + [boShowCaptions];
  catMenuItems.Width := SV.OpenedWidth;
end;

procedure T_frmMain.swAceiteAutClick(Sender: TObject);
var
  fileName: string;
  IniFile: TIniFile;
begin
  case swAceiteAut.State of
    TToggleSwitchState(0):
      begin
        swAceiteAut.ThumbColor := clRed;
        fileName := ExtractFilePath(GetModuleName(HInstance)) + 'IFOODConfig.ini';
        IniFile := TIniFile.Create(fileName);
        try
          _checkAceitaPedido.Checked := False;
          IniFile.WriteString('CONFIG_IFOOD', 'ACEITAPEDIDOAUTO', 'False');
        finally
          IniFile.Free;
        end;

      end;

    TToggleSwitchState(1):
      begin
        swAceiteAut.ThumbColor := clGreen;
        fileName := ExtractFilePath(GetModuleName(HInstance)) + 'IFOODConfig.ini';
        IniFile := TIniFile.Create(fileName);
        try
          _checkAceitaPedido.Checked := True;
          IniFile.WriteString('CONFIG_IFOOD', 'ACEITAPEDIDOAUTO', 'True');
        finally
          IniFile.Free;
        end;
      end;
  end;

end;

procedure T_frmMain.swVendeOffLineClick(Sender: TObject);
begin
  case swVendeOffLine.State of
    TToggleSwitchState(0):
      begin
        swVendeOffLine.ThumbColor := clRed;
        FreeAndNil(vTThreadIFOOD);
        _lblUltAtualizacao.Caption := '00/00/2000 00:00:00';
        _imgStatusLoja.Picture := _imgLojaOFF.Picture;
      end;

    TToggleSwitchState(1):
      begin
        if (accessToken.Text <> '') then
        begin
          swVendeOffLine.ThumbColor := clGreen;
          swVendeOffLine.StateCaptions.CaptionOn := 'Loja On';
          vTThreadIFOOD := TThreadNFe_NFCe.Create(False, Memo1, Memo2, edtToken, _lblUltAtualizacao, _lblStatusLoja, authorizationCode.Text, authorizationCodeVerifier.Text, refreshToken.Text, _edtMerchanIDLoja.Text, _imgStatusLoja);
        end
        else begin
          ShowMessage('Loja nao configurada! Faça a Configuração!');
        end;

    end;
  end

end;

procedure T_frmMain.chkUseAnimationClick(Sender: TObject);
begin
  SV.UseAnimation := chkUseAnimation.Checked;
  lblAnimationDelay.Enabled := SV.UseAnimation;
  trkAnimationDelay.Enabled := SV.UseAnimation;
  lblAnimationStep.Enabled := SV.UseAnimation;
  trkAnimationStep.Enabled := SV.UseAnimation;
end;

procedure T_frmMain.ConfirmaPedido(ID: String);
var
  parameter: TRESTRequestParameter;
  Envio: String;
begin
  createComponents;
  try
    FRESTClient.BaseURL := 'https://merchant-api.ifood.com.br/order/v1.0';
    FRESTClient.ContentType := 'application/json';
    FRESTRequest.Accept := 'application/json';
    FRESTRequest.Method := rmPOST;

    parameter := FRestRequest.Params.AddHeader('Authorization', 'Bearer ' + edtToken.Text);

    parameter.Options := [poDoNotEncode];

    FRESTRequest.Resource := '/orders/' + ID + '/confirm';

    Envio :=    'BaseURL: '     + FRESTClient.BaseURL + #13 +
                'ContentType: ' + FRESTClient.ContentType + #13 +
                'Accept: '      + FRESTRequest.Accept + #13 +
                'Method: POST'  + #13 +
                'Resource: '    + FRESTRequest.Resource;

    DM.InsertLogs(0,
                  2,
                  'Envio - ConfirmaPedido',
                  Envio,
                  'IFOOD - ConfirmaPedido',
                  'S',
                  '');

    FRestRequest.Execute;


    case FRestResponse.StatusCode of
      202: //Accepted
      begin
        DM.InsertLogs(0,
                      2,
                      'Resposta - ConfirmaPedido',
                      '',
                      'IFOOD - ConfirmaPedido',
                      'S',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Accepted' + #13  +  #13  + FRestResponse.Content);


         DM._qryUpdateStatusPedido.Params[0].AsString := 'PEA';
         DM._qryUpdateStatusPedido.Params[1].AsString := ID;
         DM._qryUpdateStatusPedido.ExecSQL;
         DM._qryUpdateStatusPedido.Connection.Commit;

         DM.ListaPedidos(_dataPedido.DateTime, _dataPedido.DateTime, _combStatus.ItemIndex, StrToIntDef(_edtNrPedido.Text, 0), StrToIntDef(_edtSeqDelivery.Text, 0), _edtNomeTel.Text);
      end;
      400: //Bad Request
      begin
        DM.InsertLogs(0,
                      2,
                      'Resposta - ConfirmaPedido',
                      '',
                      'IFOOD - ConfirmaPedido',
                      'N',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Bad Request' + #13  +  #13  + FRestResponse.Content);

        T_frmFormMensagensPadrao.Mensagem('Falha ao confirmar o pedido!', 'E', [mbOk]);
      end;
      404: //Not Found
      begin
        DM.InsertLogs(0,
                      2,
                      'Resposta - ConfirmaPedido',
                      '',
                      'IFOOD - ConfirmaPedido',
                      'N',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Not Found' + #13  +  #13  + FRestResponse.Content);

        T_frmFormMensagensPadrao.Mensagem('Falha ao confirmar o pedido!', 'E', [mbOk]);
      end;
      500: //Internal Server Error
      begin
        DM.InsertLogs(0,
                      2,
                      'Resposta - ConfirmaPedido',
                      '',
                      'IFOOD - ConfirmaPedido',
                      'N',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Internal Server Error' + #13  +  #13  + FRestResponse.Content);

        T_frmFormMensagensPadrao.Mensagem('Falha ao confirmar o pedido!', 'E', [mbOk]);
      end;

    end;

  finally
    destroyComponents;
  end;
end;

procedure T_frmMain.createComponents;
begin
  FRestClient := TRESTClient.Create(nil);
  FRestResponse := TRESTResponse.Create(nil);
  FRestRequest := TRESTRequest.Create(nil);

  FRestRequest.Client := FRestClient;
  FRestRequest.Response := FRestResponse;
end;

procedure T_frmMain.DBCtrlGrid1Click(Sender: TObject);
begin
  GetStatusPedidoSelecionado;
end;

procedure T_frmMain.DBCtrlGrid1PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
var
  Diff: Float32;
begin
  if not DM._qryListaPedido.IsEmpty then
  begin
    GetStatusPedidoSelecionado;
    _btnDetalhar.Visible := True;
    DBCtrlGrid1.SelectedColor := $00F0E4AE;
    DBCtrlGrid1.RowCount := 6;
    CdPedido := DM._qryListaPedido.FieldByName('CDPEDIDO').AsInteger;
    IsAgendado := DM._qryListaPedido.FieldByName('ISAGENDADO').AsString = 'S';

    GetCdPedidoGCOM := DM._qryListaPedido.FieldByName('CDPEDIDOGCOM').AsInteger;
    GetCorrelationId := DM._qryListaPedido.FieldByName('reference').AsString;
    GetShortReference := DM._qryListaPedido.FieldByName('SHORTREFERENCE').AsString;

    _lblSeqDelivery.Caption := FormatFloat('000', DM._qryListaPedido.FieldByName('SEQDELIVERY').AsInteger);
    _lblNomeCliente.Caption := DM._qryListaPedido.FieldByName('NOME').AsString;


    if DM._qryListaPedido.FieldByName('SHORTREFERENCE').AsString <> '' then
      _lblCodigoPedidoIfood.Caption := '#' + DM._qryListaPedido.FieldByName('SHORTREFERENCE').AsString
    else
      _lblCodigoPedidoIfood.Caption := '#' + DM._qryListaPedido.FieldByName('CDPEDIDO').AsString;

    _lblCelularCliente.Caption := DM._qryListaPedido.FieldByName('PHONEIFOOD').AsString + ' ' + DM._qryListaPedido.FieldByName('PHONE_LOCALIZER').AsString;
    _lblNrPedido.Caption := DM._qryListaPedido.FieldByName('SHORTREFERENCE').AsString;
    _lblFoneCliente.Caption := DM._qryListaPedido.FieldByName('FONECEL').AsString;

    {_lblCepCliente.Caption := DM._qryListaPedido.FieldByName('CEP').AsString;
    _lblLogradouroCliente.Caption := DM._qryListaPedido.FieldByName('LOGRADOURO').AsString;
    _lblComplementoCliente.Caption := DM._qryListaPedido.FieldByName('COMPLEMENTOENDERECO').AsString;
    _lblReferenciaCliente.Caption := DM._qryListaPedido.FieldByName('PONTOREFERENCIA').AsString;
    _lblBairroCliente.Caption := DM._qryListaPedido.FieldByName('BAIRRO').AsString;
    _lblCidadeCliente.Caption := DM._qryListaPedido.FieldByName('CIDADE').AsString;}

    _lblEndEntrega.Caption := DM._qryListaPedido.FieldByName('LOGRADOURO').AsString + ' ' +
                              DM._qryListaPedido.FieldByName('COMPLEMENTOENDERECO').AsString + ' ' +
                              DM._qryListaPedido.FieldByName('PONTOREFERENCIA').AsString + ' ' +
                              DM._qryListaPedido.FieldByName('BAIRRO').AsString + ' ' +
                              DM._qryListaPedido.FieldByName('CIDADE').AsString + ' ' +
                              'CEP: ' + DM._qryListaPedido.FieldByName('CEP').AsString;

    case Length(DM._qryListaPedido.FieldByName('CPF').AsString) of
      11: _lblCPFCliente.Caption := FormatmaskText('000\.000\.000\-00;0;', DM._qryListaPedido.FieldByName('CPF').AsString);
      14: _lblCPFCliente.Caption := FormatmaskText('00\.000\.000\/0000\-00;0;', DM._qryListaPedido.FieldByName('CPF').AsString);
      else
        _lblCPFCliente.Caption := '000.000.000-00';
    end;

    case DM._qryListaPedido.FieldByName('cdintegracao').AsInteger of
      0: _imgStatus01.Picture := _imgiFood.Picture;
      1: _imgStatus01.Picture := _imgiZAP.Picture;
    end;

    _lblNomeEmpresa.Caption := DM._qryListaPedido.FieldByName('NOMELOJA').AsString;

    // _lblValorTotal.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPedido.FieldByName('VALOR_TOTAL').AsCurrency);

    case AnsiIndexStr(DM._qryListaPedido.FieldByName('statuspedido').AsString,['PEA', 'PNA', 'PDF', 'PDE', 'PCC', 'PIN', 'PDR']) of
      0:begin
          ShapeStatusPedido.Brush.Color := $00947604;
          ShapeAgendado.Brush.Color := $00947604;

          _lblStatusPedido.Caption := 'EM PREPARO';
          _imgStatusCan.Visible := False;

          //ShapeStatusIntegrado.Visible := True;
          //_lblStatusIntegrado.Visible := True;

          if DM._qryListaPedido.FieldByName('STATUSPEDIDOINTEGRADO').AsString = 'S' then
          begin
            ShapeStatusIntegrado.Brush.Color := $0039C78C;
            _lblStatusIntegrado.Caption := '100%';

          end
          else
          begin
            ShapeStatusIntegrado.Brush.Color := $002B23CA;
            _lblStatusIntegrado.Caption := 'COM FALHA';
          end;

          case DM._qryListaPedido.FieldByName('tipoentrega').AsInteger of
            1: begin
                 _imgStatus02.Picture := _imgDelivery.Picture;
                 _bntSairEntrega.Caption := 'Sair p/ Entrega';
               end;
            2: begin
                 _imgStatus02.Picture := _imgRetirada.Picture;
                 _bntSairEntrega.Caption := 'Retirar Pedido';
               end;
            3: begin
                 _imgStatus02.Picture := _imgNaMesa.Picture;
                 _bntSairEntrega.Caption := 'Entregar Pedido';
               end;
          end;

          if IsAgendado then
          begin
            _imgStatusAgen.Picture := _imgAgendado.Picture;
            _lblAgendadoParaC.Visible := True;
            _lblAgendadoPara.Visible := True;
            ShapeAgendado.Visible := True;

            Diff := DaysBetween(StrToDate(FormatDateTime('dd/mm/yyyy', Now)), GetDataAgendamentoEnd);
            if  Diff > 0 then
              _lblAgendadoPara.Caption := FormatDateTime('dd/mm/yyyy hh:nn', GetDataAgendamentoStart) + ' - ' + FormatDateTime('hh:nn', GetDataAgendamentoEnd)
            else
              _lblAgendadoPara.Caption := FormatDateTime('hh:nn', GetDataAgendamentoStart) + ' - ' + FormatDateTime('hh:nn', GetDataAgendamentoEnd);
          end
          else begin
            _imgStatusAgen.Picture := _imgVazio.Picture;
            _lblAgendadoParaC.Visible := False;
            _lblAgendadoPara.Visible := False;
            ShapeAgendado.Visible := False;
          end;

          _bntAceitarPedido.Visible := False;
          //_bntRecusarPedido.Visible := False;
          _bntRecusarPedido.Visible := True;
          _bntSairEntrega.Visible := True;
          _btnReenviar.Visible := True;
          PedidoAceito := 'S';
        end;
      1:begin
          ShapeStatusPedido.Brush.Color := $00919593;
          ShapeAgendado.Brush.Color := $00919593;
          PedidoAceito := 'N';

          _lblStatusPedido.Caption := 'PENDENTE';
          _imgStatusCan.Visible := False;

          //ShapeStatusIntegrado.Visible := True;
          //_lblStatusIntegrado.Visible := True;

          if DM._qryListaPedido.FieldByName('STATUSPEDIDOINTEGRADO').AsString = 'S' then
          begin
            ShapeStatusIntegrado.Brush.Color := $0039C78C;
            _lblStatusIntegrado.Caption := '100%';

          end
          else
          begin
            ShapeStatusIntegrado.Brush.Color := $002B23CA;
            _lblStatusIntegrado.Caption := 'COM FALHA';
          end;

          case DM._qryListaPedido.FieldByName('tipoentrega').AsInteger of
            1: begin
                 _imgStatus02.Picture := _imgDelivery.Picture;
                 _bntSairEntrega.Caption := 'Sair p/ Entrega';
               end;
            2: begin
                 _imgStatus02.Picture := _imgRetirada.Picture;
                 _bntSairEntrega.Caption := 'Retirar Pedido';
               end;
            3: begin
                 _imgStatus02.Picture := _imgNaMesa.Picture;
                 _bntSairEntrega.Caption := 'Entregar Pedido';
               end;
          end;

          if IsAgendado then
          begin
            _imgStatusAgen.Picture := _imgAgendado.Picture;
            _lblAgendadoParaC.Visible := True;
            _lblAgendadoPara.Visible := True;
            ShapeAgendado.Visible := True;
            Diff := DaysBetween(StrToDate(FormatDateTime('dd/mm/yyyy', Now)), GetDataAgendamentoEnd);
            if  Diff > 0 then
              _lblAgendadoPara.Caption := FormatDateTime('dd/mm/yyyy hh:nn', GetDataAgendamentoStart) + ' - ' + FormatDateTime('hh:nn', GetDataAgendamentoEnd)
            else
              _lblAgendadoPara.Caption := FormatDateTime('hh:nn', GetDataAgendamentoStart) + ' - ' + FormatDateTime('hh:nn', GetDataAgendamentoEnd);
          end
          else begin
            _imgStatusAgen.Picture := _imgVazio.Picture;
            _lblAgendadoParaC.Visible := False;
            _lblAgendadoPara.Visible := False;
            ShapeAgendado.Visible := False;
          end;


          _bntRecusarPedido.Visible := True;
          _bntAceitarPedido.Visible := True;
          _bntSairEntrega.Visible := False;
          _btnReenviar.Visible := True;
        end;
      2:begin
          ShapeStatusPedido.Brush.Color := $0039C78C;
          ShapeAgendado.Brush.Color := $0039C78C;
          _lblStatusPedido.Caption := 'FINALIZADO';
          _imgStatusCan.Visible := False;

          //ShapeStatusIntegrado.Visible := True;
          //_lblStatusIntegrado.Visible := True;

          if DM._qryListaPedido.FieldByName('STATUSPEDIDOINTEGRADO').AsString = 'S' then
          begin
            ShapeStatusIntegrado.Brush.Color := $0039C78C;
            _lblStatusIntegrado.Caption := '100%';

          end
          else
          begin
            ShapeStatusIntegrado.Brush.Color := $002B23CA;
            _lblStatusIntegrado.Caption := 'COM FALHA';
          end;

          case DM._qryListaPedido.FieldByName('tipoentrega').AsInteger of
            1: _imgStatus02.Picture := _imgDelivery.Picture;
            2: _imgStatus02.Picture := _imgRetirada.Picture;
            3: _imgStatus02.Picture := _imgNaMesa.Picture;
          end;

          if IsAgendado then
          begin
            _imgStatusAgen.Picture := _imgAgendado.Picture;
            _lblAgendadoParaC.Visible := True;
            _lblAgendadoPara.Visible := True;
            ShapeAgendado.Visible := True;
            Diff := DaysBetween(StrToDate(FormatDateTime('dd/mm/yyyy', Now)), GetDataAgendamentoEnd);
            if  Diff > 0 then
              _lblAgendadoPara.Caption := FormatDateTime('dd/mm/yyyy hh:nn', GetDataAgendamentoStart) + ' - ' + FormatDateTime('hh:nn', GetDataAgendamentoEnd)
            else
              _lblAgendadoPara.Caption := FormatDateTime('hh:nn', GetDataAgendamentoStart) + ' - ' + FormatDateTime('hh:nn', GetDataAgendamentoEnd);
          end
          else begin
            _imgStatusAgen.Picture := _imgVazio.Picture;
            _lblAgendadoParaC.Visible := False;
            _lblAgendadoPara.Visible := False;
            ShapeAgendado.Visible := False;
          end;


          _bntAceitarPedido.Visible := False;
          //_bntRecusarPedido.Visible := False;
          _bntRecusarPedido.Visible := True;
          _bntSairEntrega.Visible := False;
          _btnReenviar.Visible := True;
          PedidoAceito := 'S';
        end;
      3:begin
          ShapeStatusPedido.Brush.Color := $00EE8419;
          ShapeAgendado.Brush.Color := $00EE8419;
          _lblStatusPedido.Caption := 'SAIU P/ ENTREGA';
          _imgStatusCan.Visible := False;

          //ShapeStatusIntegrado.Visible := True;
          //_lblStatusIntegrado.Visible := True;

          if DM._qryListaPedido.FieldByName('STATUSPEDIDOINTEGRADO').AsString = 'S'
          then
          begin
            ShapeStatusIntegrado.Brush.Color := $0039C78C;
            _lblStatusIntegrado.Caption := '100%';

          end
          else
          begin
            ShapeStatusIntegrado.Brush.Color := $002B23CA;
            _lblStatusIntegrado.Caption := 'COM FALHA';
          end;

          case DM._qryListaPedido.FieldByName('tipoentrega').AsInteger of
            1: _imgStatus02.Picture := _imgDelivery.Picture;
            2: _imgStatus02.Picture := _imgRetirada.Picture;
            3: _imgStatus02.Picture := _imgNaMesa.Picture;
          end;

          if IsAgendado then
          begin
            _imgStatusAgen.Picture := _imgAgendado.Picture;
            _lblAgendadoParaC.Visible := True;
            _lblAgendadoPara.Visible := True;
            ShapeAgendado.Visible := True;
            Diff := DaysBetween(StrToDate(FormatDateTime('dd/mm/yyyy', Now)), GetDataAgendamentoEnd);
            if  Diff > 0 then
              _lblAgendadoPara.Caption := FormatDateTime('dd/mm/yyyy hh:nn', GetDataAgendamentoStart) + ' - ' + FormatDateTime('hh:nn', GetDataAgendamentoEnd)
            else
              _lblAgendadoPara.Caption := FormatDateTime('hh:nn', GetDataAgendamentoStart) + ' - ' + FormatDateTime('hh:nn', GetDataAgendamentoEnd);
          end
          else begin
            _imgStatusAgen.Picture := _imgVazio.Picture;
            _lblAgendadoParaC.Visible := False;
            _lblAgendadoPara.Visible := False;
            ShapeAgendado.Visible := False;
          end;


          _bntAceitarPedido.Visible := False;
          //_bntRecusarPedido.Visible := False;
          _bntRecusarPedido.Visible := True;
          _bntSairEntrega.Visible := False;
          _btnReenviar.Visible := True;
          PedidoAceito := 'S';
        end;

      4:begin
          ShapeStatusPedido.Brush.Color := $002B23CA;
          ShapeAgendado.Brush.Color := $002B23CA;
          _lblStatusPedido.Caption := 'CANCELADO';
          _imgStatusCan.Visible := True;

          //ShapeStatusIntegrado.Visible := True;
          //_lblStatusIntegrado.Visible := True;

          if DM._qryListaPedido.FieldByName('STATUSPEDIDOINTEGRADO').AsString = 'S' then
          begin
            ShapeStatusIntegrado.Brush.Color := $0039C78C;
            _lblStatusIntegrado.Caption := '100%';

          end
          else
          begin
            ShapeStatusIntegrado.Brush.Color := $002B23CA;
            _lblStatusIntegrado.Caption := 'COM FALHA';
          end;

          case DM._qryListaPedido.FieldByName('tipoentrega').AsInteger of
            1: _imgStatus02.Picture := _imgDelivery.Picture;
            2: _imgStatus02.Picture := _imgRetirada.Picture;
            3: _imgStatus02.Picture := _imgNaMesa.Picture;
          end;

          if IsAgendado then
          begin
            _imgStatusAgen.Picture := _imgAgendado.Picture;
            _lblAgendadoParaC.Visible := True;
            _lblAgendadoPara.Visible := True;
            ShapeAgendado.Visible := True;
            Diff := DaysBetween(StrToDate(FormatDateTime('dd/mm/yyyy', Now)), GetDataAgendamentoEnd);
            if  Diff > 0 then
              _lblAgendadoPara.Caption := FormatDateTime('dd/mm/yyyy hh:nn', GetDataAgendamentoStart) + ' - ' + FormatDateTime('hh:nn', GetDataAgendamentoEnd)
            else
              _lblAgendadoPara.Caption := FormatDateTime('hh:nn', GetDataAgendamentoStart) + ' - ' + FormatDateTime('hh:nn', GetDataAgendamentoEnd);
          end
          else begin
            _imgStatusAgen.Picture := _imgVazio.Picture;
            _lblAgendadoParaC.Visible := False;
            _lblAgendadoPara.Visible := False;
            ShapeAgendado.Visible := False;
          end;


          _bntAceitarPedido.Visible := False;
          //_bntRecusarPedido.Visible := False;
          _bntRecusarPedido.Visible := True;
          _bntSairEntrega.Visible := False;
          PedidoAceito := 'S';
        end;

      5:begin
          ShapeStatusPedido.Brush.Color := $002B23CA;
          ShapeAgendado.Brush.Color := $002B23CA;
          _lblStatusPedido.Caption := 'NÃO PROCESSADO ou ERRO';
          _imgStatusCan.Visible := False;

          //ShapeStatusIntegrado.Visible := False;
          //_lblStatusIntegrado.Visible := False;

          _imgStatus02.Picture := _imgVazio.Picture;
          _imgStatusAgen.Picture := _imgVazio.Picture;

          _bntAceitarPedido.Visible := False;
          //_bntRecusarPedido.Visible := False;
          _bntRecusarPedido.Visible := True;
          _bntSairEntrega.Visible := False;
          _btnReenviar.Visible := False;
          PedidoAceito := 'N';
        end;
      6:begin
          ShapeStatusPedido.Brush.Color := $00EE8419;
          ShapeAgendado.Brush.Color := $00EE8419;
          _lblStatusPedido.Caption := 'PEDIDO RETIRADO';
          _imgStatusCan.Visible := False;

          //ShapeStatusIntegrado.Visible := True;
          //_lblStatusIntegrado.Visible := True;

          if DM._qryListaPedido.FieldByName('STATUSPEDIDOINTEGRADO').AsString = 'S'
          then
          begin
            ShapeStatusIntegrado.Brush.Color := $0039C78C;
            _lblStatusIntegrado.Caption := '100%';

          end
          else
          begin
            ShapeStatusIntegrado.Brush.Color := $002B23CA;
            _lblStatusIntegrado.Caption := 'COM FALHA';
          end;

          case DM._qryListaPedido.FieldByName('tipoentrega').AsInteger of
            1: _imgStatus02.Picture := _imgDelivery.Picture;
            2: _imgStatus02.Picture := _imgRetirada.Picture;
            3: _imgStatus02.Picture := _imgNaMesa.Picture;
          end;

          if IsAgendado then
          begin
            _imgStatusAgen.Picture := _imgAgendado.Picture;
            _lblAgendadoParaC.Visible := True;
            _lblAgendadoPara.Visible := True;
            ShapeAgendado.Visible := True;
            Diff := DaysBetween(StrToDate(FormatDateTime('dd/mm/yyyy', Now)), GetDataAgendamentoEnd);
            if  Diff > 0 then
              _lblAgendadoPara.Caption := FormatDateTime('dd/mm/yyyy hh:nn', GetDataAgendamentoStart) + ' - ' + FormatDateTime('hh:nn', GetDataAgendamentoEnd)
            else
              _lblAgendadoPara.Caption := FormatDateTime('hh:nn', GetDataAgendamentoStart) + ' - ' + FormatDateTime('hh:nn', GetDataAgendamentoEnd);
          end
          else begin
            _imgStatusAgen.Picture := _imgVazio.Picture;
            _lblAgendadoParaC.Visible := False;
            _lblAgendadoPara.Visible := False;
            ShapeAgendado.Visible := False;
          end;


          _bntAceitarPedido.Visible := False;
          //_bntRecusarPedido.Visible := False;
          _bntRecusarPedido.Visible := True;
          _bntSairEntrega.Visible := False;
          _btnReenviar.Visible := True;
          PedidoAceito := 'S';
        end;
    end;

  end
  else
  begin
    GetStatusPedidoSelecionado;
    DM._qryListaPedidoItens.Close;
    DM._qryListaPagamentos.Close;
    DBCtrlGrid1.SelectedColor := clWhite;
    DBCtrlGrid1.RowCount := 1;
    CdPedido := 0;
    IsAgendado := False;
    GetCdPedidoGCOM := 0;
    GetCorrelationId := '';
    GetShortReference := '';
    _btnDetalhar.Visible := False;
    _bntAceitarPedido.Visible := False;
    _bntRecusarPedido.Visible := False;
    _bntSairEntrega.Visible := False;
    _btnReenviar.Visible := False;

    _lblStatusPedido.Caption := 'SEM REGISTROS...';
    _lblFoneCliente.Caption := '-';
    _lblCodigoPedidoIfood.Caption := '';
    _lblInfPagamento.Caption := '';
    _lblInfPagamentoAux.Caption := '';
    {_lblCepCliente.Caption := '-';
    _lblLogradouroCliente.Caption := '-';
    _lblComplementoCliente.Caption := '-';
    _lblReferenciaCliente.Caption := '-';
    _lblBairroCliente.Caption := '-';
    _lblAgendamentoCliente.Caption := '-';
    _lblCidadeCliente.Caption := '-';}
    _lblEndEntrega.Caption := '-';
    _lblCelularCliente.Caption := '-';
    _lblNrPedido.Caption := '-';
    _lblCPFCliente.Caption := '000.000.000-00';
    _lblNomeEmpresa.Caption := '';
    _lblAceitoAs.Caption := '';
    _lblAceitoAsC.Visible := False;
    _lblDataPedidoC.Visible := False;
    _lblDataPedido.Caption := '';
    _lblValor.Caption := '';
    _lblCPFCliente.Caption := '';
    _lblRespDesconto.Caption := '';
    _lblSeqDelivery.Caption := '';

    ShapeStatusPedido.Brush.Color := clBlack;
    ShapeAgendado.Brush.Color := clWhite;
    ShapeStatusIntegrado.Visible := False;
    _lblStatusIntegrado.Visible := False;
    _lblAgendadoParaC.Visible := False;
    _lblAgendadoPara.Caption := '';
    ShapeAgendado.Visible := False;

    _imgStatus01.Picture := _imgVazio.Picture;
    _imgStatus02.Picture := _imgVazio.Picture;
    _imgStatusCan.Picture := _imgVazio.Picture;
    _imgStatusAgen.Picture := _imgVazio.Picture;
  end;

end;

procedure T_frmMain.DBCtrlGrid2Click(Sender: TObject);
begin
//
end;

procedure T_frmMain.DBCtrlGrid2PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
begin
  if (not DM._qryListaPedidoItens.IsEmpty) and (not DM._qryListaPedido.IsEmpty) then
  begin
    _lblObservacao.Caption := '';

    if DM._qryListaPedidoItens.FieldByName('statusintegrado').AsString = 'S' then
      _shpIntegrado.Brush.Color := $0039C78C
    else
      _shpIntegrado.Brush.Color := $002B23CA;

    _lblCodIfood.Caption := FormatFloat('0000', DM._qryListaPedidoItens.FieldByName('externalcode').AsInteger);

    if DM._qryListaPedidoItens.FieldByName('isauxiliar').AsString = 'N' then
    begin
      _lblDescricao.Caption := DM._qryListaPedidoItens.FieldByName('name').AsString;
      _lblDescricao.Font.Color := clNavy;

      if DM._qryListaPedidoItens.FieldByName('observations').AsString <> '' then
        _lblObservacao.Caption := 'Obs: ' + DM._qryListaPedidoItens.FieldByName('observations').AsString
      else
        _lblObservacao.Caption := '';

      _lblQuantidadeItem.Caption := FormatFloat('00', DM._qryListaPedidoItens.FieldByName('quantity').AsCurrency);
      _lblValorTotalItemUnitario.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPedidoItens.FieldByName('price').AsCurrency);
      _lblValorTotalItem.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPedidoItens.FieldByName('totalprice').AsCurrency);
    end
    else
    begin
      _lblDescricao.Caption := '   º ' + DM._qryListaPedidoItens.FieldByName('name').AsString;
      _lblDescricao.Font.Color := $00EE8419;

      _lblQuantidadeItem.Caption := FormatFloat('00', DM._qryListaPedidoItens.FieldByName('quantity').AsCurrency);
      _lblValorTotalItemUnitario.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPedidoItens.FieldByName('price').AsCurrency);
      _lblValorTotalItem.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPedidoItens.FieldByName('totalprice').AsCurrency);
    end;

  end
  else
  begin
    DBCtrlGrid2.Visible := False;
  end;
end;

procedure T_frmMain.DBCtrlGrid3PaintPanel(DBCtrlGrid: TDBCtrlGrid;
  Index: Integer);
var
  GetMethod, NewGetMethod, GetNamePagamento: String;
begin
  if not DM._qryListaPedido.IsEmpty then
  begin
    _lblTrocoParaC.Visible := False;
    _lblTrocoPara.Visible := False;
    _lblSeuTrocoSeraC.Visible := False;
    _lblSeuTrocoSera.Visible := False;

    //DBCtrlGrid3.Height := 80;

    GetNamePagamento := DM._qryListaPagamentos.FieldByName('name').AsString;
    _lblValor.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPagamentos.FieldByName('value').AsCurrency);

    _lblSubTotal.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPedido.FieldByName('subtotal').AsCurrency);
    _lblDesconto.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPedido.FieldByName('valordesconto').AsCurrency);
    _lblRespDesconto.Caption := DM._qryListaPedido.FieldByName('responsaveldesconto').AsString;
    _lblTaxaEntrega.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPedido.FieldByName('deliveryfee').AsCurrency);
    _lblTaxaAdicional.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPedido.FieldByName('taxaadicional').AsCurrency);
    _lblValorPedido.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPedido.FieldByName('totalprice').AsCurrency);

    GetMethod := DM._qryListaPagamentos.FieldByName('method').AsString;

    if DM._qryListaPagamentos.FieldByName('prepaid').AsString = 'true' then
    begin

      if GetNamePagamento = 'PAGAMENTO IFOOD' then
      begin
        _lblInfPagamento.Caption := 'Incentivos iFood';
        _lblInfPagamentoAux.Caption := 'O iFood pagará este valor para a sua loja'
      end
      else
      begin

        _lblInfPagamento.Caption := 'Pago via iFood - ' + GetNamePagamento;
        _lblInfPagamentoAux.Caption := 'O iFood já recebeu este valor e vamos repassar a sua loja.'
      end;
    end
    else begin

      {GetMethod = CREDIT, DEBIT, CASH}

      if GetMethod = 'CREDIT' then
      begin
        NewGetMethod := 'CRÉDITO';
        _lblInfPagamento.Caption := 'Cobrar do cliente - ' + NewGetMethod + ' - ' + GetNamePagamento +  ' (máquina) via loja.';
        _lblInfPagamentoAux.Caption := 'O entregador deve cobrar este valor no ato da entrega.'
      end
      else
        if GetMethod = 'DEBIT' then
        begin
          NewGetMethod := 'DÉBITO';
          _lblInfPagamento.Caption := 'Cobrar do cliente - ' + NewGetMethod + ' - ' + GetNamePagamento +  ' (máquina) via loja.';
          _lblInfPagamentoAux.Caption := 'O entregador deve cobrar este valor no ato da entrega.'
        end
        else
          if GetMethod = 'CASH' then
          begin
            //DBCtrlGrid3.Height := 120;
            NewGetMethod := 'DINHEIRO';
            _lblInfPagamento.Caption := 'Cobrar do cliente - ' + NewGetMethod + ' via loja.';
            _lblInfPagamentoAux.Caption := 'O entregador deve cobrar este valor no ato da entrega.';
            _lblTrocoParaC.Visible := True;
            _lblTrocoPara.Visible := True;
            _lblSeuTrocoSeraC.Visible := True;
            _lblSeuTrocoSera.Visible := True;
          end;

    end;


  end;
end;

procedure T_frmMain.DBGridStyles4CellClick(Column: TColumn);
begin
  if not DM._qryDadosLoja.IsEmpty then
  begin
    GetCdLoja_Merchan :=  DM._qryDadosLoja.FieldByName('cdloja').AsInteger;
    _edtCodigoLojaGCom.Text := DM._qryDadosLoja.FieldByName('cdloja_gconnect').AsInteger.ToString;
    Get_Merchan_ID := DM._qryDadosLoja.FieldByName('id').AsString;
    _btnAtualizar.Enabled := True;
  end;

end;

procedure T_frmMain.DeletarInterruption(MerchantID: String);
var
  parameter: TRESTRequestParameter;
  MyIDInterruption, Envio: String;
begin

  DM._qrySelectIDFechamento.Close;
  DM._qrySelectIDFechamento.Open;
  if DM._qrySelectIDFechamento.FieldByName('idfechamentoloja').AsString <> '' then
  begin

    MyIDInterruption := DM._qrySelectIDFechamento.FieldByName('idfechamentoloja').AsString;

    createComponents;
    try
      FRESTClient.BaseURL := 'https://merchant-api.ifood.com.br/merchant/v1.0';
      FRESTClient.ContentType := 'application/json';
      FRESTRequest.Accept := 'application/json';
      FRESTRequest.Method := rmDELETE;

      parameter := FRestRequest.Params.AddHeader('Authorization', 'Bearer ' + edtToken.Text);

      parameter.Options := [poDoNotEncode];

      FRESTRequest.Resource := '/merchants/' + MerchantID + '/interruptions/' + MyIDInterruption;

      Envio :=    'BaseURL: '      + FRESTClient.BaseURL + #13 +
                  'ContentType: '  + FRESTClient.ContentType + #13 +
                  'Accept: '       + FRESTRequest.Accept + #13 +
                  'Method: DELETE' + #13 +
                   //'Header: '      + parameter.ToString  + #13 +
                  'Resource: '     + FRESTRequest.Resource;

      DM.InsertLogs(0,
                    2,
                    'Envio - DeletarInterruption',
                    Envio,
                    'IFOOD - DeletarInterruption',
                    'S',
                    '');


      FRestRequest.Execute;

      case FRestResponse.StatusCode of
        204: //No Content. Interruption was deleted.
        begin
          DM.InsertLogs(0,
                        2,
                        'Retorno - DeletarInterruption',
                        '',
                        'IFOOD - DeletarInterruption',
                        'S',
                        'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'No Content. Interruption was deleted.' + #13  +  #13  + FRestResponse.Content);

          DM._qryCancelarFechamento.ExecSQL;
          DM._qryCancelarFechamento.Connection.Commit;
          swVendeOffLine.ThumbColor := clGreen;

          T_frmFormMensagensPadrao.Mensagem('Loja aberta com sucesso!', 'I', [mbOk]);
        end;
        401: //Unauthorized. User is not authenticated at all, token is expired or token is invalid.
        begin
          DM.InsertLogs(0,
                        2,
                        'Retorno - DeletarInterruption',
                        '',
                        'IFOOD - DeletarInterruption',
                        'N',
                        'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Unauthorized. User is not authenticated at all, token is expired or token is invalid.' + #13  +  #13  + FRestResponse.Content);

          T_frmFormMensagensPadrao.Mensagem('Falha ao deletar Interrupção da Loja!', 'E', [mbOk]);
        end;
        403: //Forbidden. User has no access to the given merchant.
        begin
          DM.InsertLogs(0,
                        2,
                        'Retorno - DeletarInterruption',
                        '',
                        'IFOOD - DeletarInterruption',
                        'N',
                        'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Forbidden. User has no access to the given merchant.' + #13  +  #13  + FRestResponse.Content);

          T_frmFormMensagensPadrao.Mensagem('Falha ao deletar Interrupção da Loja!', 'E', [mbOk]);
        end;
        500: //InternalServerError. Something unexpected happened while deleting the interruption.
        begin
          DM.InsertLogs(0,
                        2,
                        'Retorno - DeletarInterruption',
                        '',
                        'IFOOD - DeletarInterruption',
                        'N',
                        'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'InternalServerError. Something unexpected happened while deleting the interruption.' + #13  +  #13  + FRestResponse.Content);

          T_frmFormMensagensPadrao.Mensagem('Falha ao deletar Interrupção da Loja!', 'E', [mbOk]);
        end;

      end;

    finally
      destroyComponents;
    end;
  end
  else begin
    T_frmFormMensagensPadrao.Mensagem('A Loja nao está fechada!', 'E', [mbOk]);
  end;
end;

procedure T_frmMain.destroyComponents;
begin
  FRestResponse.Free;
  FRestRequest.Free;
  FRestClient.Free;
end;

procedure T_frmMain.EntregaPedido(ID: String);
var
  parameter: TRESTRequestParameter;
  Envio: String;
begin
  createComponents;
  try
    FRESTClient.BaseURL := 'https://merchant-api.ifood.com.br/order/v1.0';
    FRestClient.ContentType := 'application/json';
    FRestRequest.Accept := 'application/json';
    FRestRequest.Method := rmPOST;

    parameter := FRestRequest.Params.AddHeader('Authorization', 'Bearer ' + edtToken.Text);
    parameter.Options := [poDoNotEncode];

    FRESTRequest.Resource := '/orders/' + ID + '/dispatch';

    Envio :=    'BaseURL: '     + FRESTClient.BaseURL + #13 +
                'ContentType: ' + FRESTClient.ContentType + #13 +
                'Accept: '      + FRESTRequest.Accept + #13 +
                'Method: POST'  + #13 +
                 //'Header: '      + parameter.ToString  + #13 +
                'Resource: '    + FRESTRequest.Resource;

    DM.InsertLogs(0,
                  2,
                  'Envio - EntregaPedido',
                  Envio,
                  'IFOOD - EntregaPedido',
                  'S',
                  '');

    FRestRequest.Execute;

    case FRestResponse.StatusCode of
      202: //Accepted
      begin

        DM.InsertLogs(0,
                      2,
                      'Retorno - EntregaPedido',
                      '',
                      'IFOOD - EntregaPedido',
                      'S',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Accepted' + #13  +  #13  + FRestResponse.Content);

        DM._qryUpdateStatusPedidoEntrega.Params[0].AsString := 'PDE';
        DM._qryUpdateStatusPedidoEntrega.Params[1].AsString := ID;
        DM._qryUpdateStatusPedidoEntrega.ExecSQL;
        DM._qryUpdateStatusPedidoEntrega.Connection.Commit;

        DM.ListaPedidos(_dataPedido.DateTime, _dataPedido.DateTime, _combStatus.ItemIndex, StrToIntDef(_edtNrPedido.Text, 0), StrToIntDef(_edtSeqDelivery.Text, 0), _edtNomeTel.Text);

      end;
      400: //Bad Request
      begin
        DM.InsertLogs(0,
                      2,
                      'Retorno - EntregaPedido',
                      '',
                      'IFOOD - EntregaPedido',
                      'N',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Bad Request' + #13  +  #13  + FRestResponse.Content);

        T_frmFormMensagensPadrao.Mensagem('Falha ao confirmar entrega do pedido!','E', [mbOk]);
      end;
      404: //Not Found
      begin
        DM.InsertLogs(0,
                      2,
                      'Retorno - EntregaPedido',
                      '',
                      'IFOOD - EntregaPedido',
                      'N',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Not Found' + #13  +  #13  + FRestResponse.Content);

        T_frmFormMensagensPadrao.Mensagem('Falha ao confirmar entrega do pedido!','E', [mbOk]);
      end;
      500: //Internal Server Error
      begin
        DM.InsertLogs(0,
                      2,
                      'Retorno - EntregaPedido',
                      '',
                      'IFOOD - EntregaPedido',
                      'N',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Internal Server Error' + #13  +  #13  + FRestResponse.Content);

        T_frmFormMensagensPadrao.Mensagem('Falha ao confirmar entrega do pedido!','E', [mbOk]);
      end;

    end;

  finally
    destroyComponents;
  end;
end;

procedure T_frmMain.FormActivate(Sender: TObject);
begin
  DM._qryDadosLoja.Close;
  DM._qryDadosLoja.Open;


  loadCredentials;

  _lblUltAtualizacao.Caption := '00/00/0000 00:00:00';

  DM.FDConnection1.Open;
  DM.Tb_POLLING.Open;
  _dataPedido.DateTime := Now;
  DM.ListaPedidos(_dataPedido.DateTime, _dataPedido.DateTime, _combStatus.ItemIndex, StrToIntDef(_edtNrPedido.Text, 0), StrToIntDef(_edtSeqDelivery.Text, 0), _edtNomeTel.Text);


  swVendeOffLine.State := TToggleSwitchState(1);

  DM._qrySelectIDFechamento.Close;
  DM._qrySelectIDFechamento.Open;
  if DM._qrySelectIDFechamento.FieldByName('idfechamentoloja').AsString <> '' then
    actPower.Caption := 'Abrir Loja';

  DM._qryAtualizaNrGenerator.Params[0].AsString := 'S';
  DM._qryAtualizaNrGenerator.Params[1].AsString := 'GEN_IFOOD_PEDIDOSL_ID';
  DM._qryAtualizaNrGenerator.Params[2].AsInteger := 0;
  DM._qryAtualizaNrGenerator.Close;
  DM._qryAtualizaNrGenerator.Open;

  if not DM._qryAtualizaNrGenerator.IsEmpty then
    _edtNrPedidoGConnect.Text := DM._qryAtualizaNrGenerator.FieldByName('PVALOR').AsString;


  _lblValor.Left          :=  _lblValor.Left - _panResumoPedido.Width +10;
  _lblCodIfood.Left       :=  _lblCodIfood.Left - _panResumoPedido.Width +10;
  _shpIntegrado.Left      :=  _shpIntegrado.Left - _panResumoPedido.Width +10;
  _lblValorTotalItem.Left :=  _lblValorTotalItem.Left - _panResumoPedido.Width +10;
  _lblNomeCliente.Width   := _panDadosPedido.Width;

end;

procedure T_frmMain.FormCreate(Sender: TObject);
begin
  _lblVersaoSistema.Caption := VersaoExe;


  ReportMemoryLeaksOnShutdown := True;

  _tabMain.TabVisible := False;
  _tabRepositorio.TabVisible := False;
  _tabConfig.TabVisible := False;
  _tabDetalhar.TabVisible := False;
  _tabLogGeral.TabVisible := False;

  PageControl1.ActivePage := _tabMain;
end;

procedure T_frmMain.FormDestroy(Sender: TObject);
begin
  if Assigned(vTThreadIFOOD) then
    FreeAndNil(vTThreadIFOOD);
end;

procedure T_frmMain.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Mgs: TMsg;
begin
  if Key = VK_RETURN then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE); // Remove o beep do Delphi
    _btnPesquisarClick(Self);
  end;
end;

procedure T_frmMain.FormPaint(Sender: TObject);
begin
  _lblEndEntrega.Width := _panDadosPedido.Width - 10;
end;

procedure T_frmMain.FormShow(Sender: TObject);
begin
  _edtDataIni.DateTime   := Now;
  _edtDataFinal.DateTime := Now;
end;

procedure T_frmMain.GetFirstToken;
var
  vArray1: TArray<string>;
  DataBD: TDateTime;
  vResult, Envio: String;
  _expires_in: String;
begin
  accessToken.Text := '';
  authorizationCode.Text := '';
  authorizationCodeVerifier.Text := '';
  refreshToken.Text := '';
  _edtMerchanIDLoja.Text := '';

  DM._qryDeleteLoja.ExecSQL;
  DM._qryDeleteLoja.Connection.Commit;

  DM._qryDadosLoja.Close;
  DM._qryDadosLoja.Open;

  swVendeOffLine.State := TToggleSwitchState(0);

  vResult := DM.GetTokenBD(True);
  vArray1 := vResult.Split(['|']);

  DataBD := StrToDateTime(vArray1[2]);

   if DataBD > Now then
   begin
     authorizationCode.Text := vArray1[0];
     authorizationCodeVerifier.Text := vArray1[1];
     refreshToken.Text := vArray1[3];
     edtToken.Text := vArray1[4];
     accessToken.Text := vArray1[4];
   end
   else begin
      createComponents;
      try
        FRestClient.BaseURL := 'https://merchant-api.ifood.com.br/authentication/v1.0/oauth/userCode';
        FRestClient.ContentType := 'application/x-www-form-urlencoded';
        FRestRequest.Accept := 'application/json';
        FRestRequest.AddParameter('clientId', edtClientID.Text, TRESTRequestParameterKind.pkGETorPOST);

        FRestRequest.Method := rmPOST;

        Envio :=    'BaseURL: '     + FRESTClient.BaseURL + #13 +
                    'ContentType: ' + FRESTClient.ContentType + #13 +
                    'Accept: '      + FRESTRequest.Accept + #13 +
                    'Method: POST'  + #13 +
                    'Parameter: '   + 'clientId ' + edtClientID.Text;

        DM.InsertLogs(0,
                      2,
                      'IFOOD - Autorizar Loja',
                      Envio,
                      'Envio - Autorizar Loja',
                      'S',
                      '');

        FRestRequest.Execute;

        case FRestResponse.StatusCode of
          200:
          begin
            DM.InsertLogs(0,
                          2,
                          'IFOOD - Autorizar Loja',
                          '',
                          'Retorno - Autorizar Loja',
                          'S',
                          FRestResponse.Content);

            verificationUrlComplete.Text := FRestResponse.JSONValue.GetValue<String>('verificationUrlComplete');
            userCode.Text := FRestResponse.JSONValue.GetValue<String>('userCode');
            authorizationCodeVerifier.Text := FRestResponse.JSONValue.GetValue<String>('authorizationCodeVerifier');
            verificationUrlComplete.Text := FRestResponse.JSONValue.GetValue<String>('verificationUrlComplete');
            _expires_in := FRestResponse.JSONValue.GetValue<String>('expiresIn');

            DataExpiraFirsToken := IncSecond(Now,_expires_in.ToInteger - 30);

            _btnLiberarLoja.Enabled := True;


            ShellExecute(Handle,
                         'open',
                         PWideChar(verificationUrlComplete.Text),
                         nil,
                         nil,
                         SW_SHOWMAXIMIZED);

          end
          else begin
            DM.InsertLogs(0,
                          2,
                          'IFOOD - Autorizar Loja',
                          '',
                          'Retorno - Autorizar Loja',
                          'N',
                          FRestResponse.Content);

            raise Exception.CreateFmt(FRestResponse.Content, []);
          end;

        end;


      finally
        destroyComponents;
      end;
   end;
end;

procedure T_frmMain.GetStatusPedidoSelecionado;
begin
  CdPedido := DM._qryListaPedido.FieldByName('CDPEDIDO').AsInteger;
  IsAgendado := DM._qryListaPedido.FieldByName('ISAGENDADO').AsString = 'S';
  GetDataAgendamentoStart := DM._qryListaPedido.FieldByName('DELIVERYDATETIMESTART').AsDateTime;
  GetDataAgendamentoEnd   := DM._qryListaPedido.FieldByName('DELIVERYDATETIMEEND').AsDateTime;

  GetCdPedidoGCOM := DM._qryListaPedido.FieldByName('CDPEDIDOGCOM').AsInteger;

  GetStatusAceite := DM._qryListaPedido.FieldByName('StatusAceite').AsString = 'S';
  GetStatusCancelar := DM._qryListaPedido.FieldByName('StatusCancelar').AsString = 'S';
  GetStatusEntrega := DM._qryListaPedido.FieldByName('StatusEntrega').AsString = 'S';

  _lblDataPedidoC.Visible := True;
  _lblDataPedido.Caption := FormatDateTime('hh:nn', DM._qryListaPedido.FieldByName('DATAPEDIDO').AsDateTime);

  _lblAceitoAsC.Visible := True;

  if not DM._qryListaPedido.FieldByName('DATAACEITE').IsNull then
    _lblAceitoAs.Caption := FormatDateTime('hh:nn', DM._qryListaPedido.FieldByName('DATAACEITE').AsDateTime)
  else
    _lblAceitoAs.Caption := '00:00';

  DM._qryListaPedidoItens.Params[0].AsInteger := CdPedido;
  DM._qryListaPedidoItens.Close;
  DM._qryListaPedidoItens.Open;

  DM._qryListaPagamentos.Params[0].AsInteger := CdPedido;
  DM._qryListaPagamentos.Close;
  DM._qryListaPagamentos.Open;

  _lblValor.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPagamentos.FieldByName('value').AsCurrency);

  _lblSubTotal.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPedido.FieldByName('subtotal').AsCurrency);
  _lblTaxaEntrega.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPedido.FieldByName('deliveryfee').AsCurrency);
  _lblDesconto.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPedido.FieldByName('valordesconto').AsCurrency);
  _lblValorPedido.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPedido.FieldByName('totalprice').AsCurrency);

  if DM._qryListaPedido.FieldByName('changefor').AsCurrency > 0 then
  begin
    DBCtrlGrid3.Height := 140;

    _lblTrocoPara.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPedido.FieldByName('changefor').AsCurrency);
    _lblSeuTrocoSera.Caption := FormatFloat('R$ ###,###,##0.00', DM._qryListaPedido.FieldByName('changefor').AsCurrency -
      DM._qryListaPedido.FieldByName('totalprice').AsCurrency);
  end
  else
  begin
    DBCtrlGrid3.Height := 80;
    _lblTrocoPara.Caption := 'R$ 0,00';
    _lblSeuTrocoSera.Caption := 'R$ 0,00';
  end;

  if not DM._qryListaPedidoItens.IsEmpty then
  begin

    if DM._qryListaPedidoItens.RecordCount <= 5 then
      DBCtrlGrid2.RowCount := DM._qryListaPedidoItens.RecordCount
    else
      DBCtrlGrid2.RowCount := 5;

    DBCtrlGrid2.Visible := True;
    GetCorrelationId := DM._qryListaPedido.FieldByName('reference').AsString;
    GetShortReference := DM._qryListaPedido.FieldByName('SHORTREFERENCE').AsString;

    if DM._qryListaPedido.FieldByName('statuspedido').AsString = 'PEA' then
    begin
      // _btnAceitarPedido.Visible := True;
      // _btnEntregarPedido.Visible     := True;
      // _btnCancelamento.Visible := True;
      // _btnCancelamento.Left := 400;

      // FVenda.CdVenda := FDMemTableMesas.FieldByName('CDVENDA').AsInteger;
    end
    else

      if DM._qryListaPedido.FieldByName('statuspedido').AsString = 'PNA' then
      begin
        // _btnAceitarPedido.Visible := True;
        // _btnEntregarPedido.Visible     := True;
        // _btnCancelamento.Visible := True;

        // FVenda.CdVenda := FDMemTableMesas.FieldByName('CDVENDA').AsInteger;
      end
      else
        if DM._qryListaPedido.FieldByName('statuspedido').AsString = 'PDF' then
        begin
          // _btnAceitarPedido.Visible := True;
          // _btnEntregarPedido.Visible     := True;
          // _btnCancelamento.Visible := True;

          // _btnAceitarPedido.Left  := 100;
          // _btnEntregarPedido.Left := 200;
          // _btnCancelamento.Left := 300;
          // _btnReceber.Left      := 400;
          // _btnCancelamento.Left := 500;

        end
      { else begin
        //FVenda.CdVenda := 0;
          _btnNovo.Caption          := 'Novo Pedido';
          _btnNovo.Visible          := True;
          _btnVisualizar.Visible    := False;
          _btnAceitarPedido.Visible := False;
          _btnMudarMesa.Visible     := False;
          _btnReceber.Visible       := False;
          //_btnCancelamento.Visible := False;

          //_btnNovo.Left             := 0;
        end; }

    //NrMesa  := FormatFloat('00', DM._qryListaPedido.FieldByName('CDMESA').AsInteger);

  end
  else
  begin

    _lblValor.Caption := '';

    // DBCtrlGrid3.Visible := False;
    // DBCtrlGrid2.Visible := False;
    GetCorrelationId := '';
    GetShortReference := '';
    CdPedido := 0;
    GetCdPedidoGCOM := 0;
    IsAgendado := False;

  end;


end;

procedure T_frmMain.GravarConfigiFood(ExibeMSG: Boolean);
var
  fileName: string;
  IniFile: TIniFile;
begin
  fileName := ExtractFilePath(GetModuleName(HInstance)) + 'IFOODConfig.ini';
  IniFile := TIniFile.Create(fileName);
  try
    IniFile.WriteString('CONFIG_IFOOD', 'CLIENT_ID', edtClientID.Text);
    IniFile.WriteString('CONFIG_IFOOD', 'CLIENT_SECRET', edtClientSecret.Text);
    IniFile.WriteString('CONFIG_IFOOD', 'CLIENT_USERNAME', edtUsername.Text);
    IniFile.WriteString('CONFIG_IFOOD', 'CLIENT_PASSWORD', edtPassword.Text);
    IniFile.WriteString('CONFIG_IFOOD', 'MERCHANIDLOJA', _edtMerchanIDLoja.Text);

    if _checkAceitaPedido.Checked then
      IniFile.WriteString('CONFIG_IFOOD', 'ACEITAPEDIDOAUTO', 'True')
    else
      IniFile.WriteString('CONFIG_IFOOD', 'ACEITAPEDIDOAUTO', 'False');

    if _checkUtilizaIFood.Checked then
      IniFile.WriteString('CONFIG_IFOOD', 'UTILIZAIFOOD', 'True')
    else
      IniFile.WriteString('CONFIG_IFOOD', 'UTILIZAIFOOD', 'False');

    if _checkAdcComoProd.Checked then
      IniFile.WriteString('CONFIG_IFOOD', 'ADCCOMOPROD', 'True')
    else
      IniFile.WriteString('CONFIG_IFOOD', 'ADCCOMOPROD', 'False');

    if _checkImprimeViaEntregador.Checked then
      IniFile.WriteString('CONFIG_IFOOD', 'IMPRIMEVIAENTREGADORAUT', 'True')
    else
      IniFile.WriteString('CONFIG_IFOOD', 'IMPRIMEVIAENTREGADORAUT', 'False');

    {IniFile.WriteString('CONEXAOBD', 'DATABASE', _edtDataBase.Text);
    IniFile.WriteString('CONEXAOBD', 'USERNAME', _edtUserName.Text);
    IniFile.WriteString('CONEXAOBD', 'PASSWORD', _edtPassword.Text);
    IniFile.WriteString('CONEXAOBD', 'SERVER', _edtServer.Text);
    IniFile.WriteString('CONEXAOBD', 'PORT', _edtPort.Text);}

    if ExibeMSG then
      ShowFormGravacaoOK;
  finally
    IniFile.Free;
  end;
end;

procedure T_frmMain.trkAnimationDelayChange(Sender: TObject);
begin
  SV.AnimationDelay := trkAnimationDelay.Position * 5;
  lblAnimationDelay.Caption := 'Animation Delay (' + IntToStr(SV.AnimationDelay) + ')';
end;

procedure T_frmMain.trkAnimationStepChange(Sender: TObject);
begin
  SV.AnimationStep := trkAnimationStep.Position * 5;
  lblAnimationStep.Caption := 'Animation Step (' + IntToStr(SV.AnimationStep) + ')';
end;

function T_frmMain.VersaoExe: String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F: PFFI;
  Handle: Dword;
  Len: Longint;
  Data: Pchar;
  Buffer: Pointer;
  Tamanho: Dword;
  Parquivo: Pchar;
  Arquivo: String;
begin
  Arquivo := Application.ExeName;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data := StrAlloc(Len + 1);
    if GetFileVersionInfo(Parquivo, Handle, Len, Data) then
    begin
      VerQueryValue(Data, '\', Buffer, Tamanho);
      F := PFFI(Buffer);
      Result := Format('%d.%d.%d.%d', [HiWord(F^.dwFileVersionMs),
        LoWord(F^.dwFileVersionMs), HiWord(F^.dwFileVersionLs),
        LoWord(F^.dwFileVersionLs)]);
    end;
    StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;

procedure T_frmMain._bntAceitarPedidoClick(Sender: TObject);
begin
  if not GetStatusAceite then
  begin

    if DM._qryListaPedido.FieldByName('cdintegracao').AsInteger = 0 then
    begin

      try
        ConfirmaPedido(GetCorrelationId);

      except
        on e: Exception do
        begin
           DM.GravaLog( 'Falha ao Confirma pedido no IFOOD... ' + 'detalhes do erro: ' + e.Message);
        end;
      end;
    end;

    {try
      InserirPedidoGCOMWeb(CdPedido);

    except
      on e: Exception do
      begin
         DM.GravaLog( 'Falha ao Inserir o pedido no GCOMWEB... ' + 'detalhes do erro: ' + e.Message);
      end;
    end;}


    DM.ListaPedidos(_dataPedido.DateTime, _dataPedido.DateTime, _combStatus.ItemIndex, StrToIntDef(_edtNrPedido.Text, 0), StrToIntDef(_edtSeqDelivery.Text, 0), _edtNomeTel.Text);
  end
  else
  begin
    ShowMessage('Pedido já aceito!');
  end;
end;

procedure T_frmMain._bntRecusarPedidoClick(Sender: TObject);
var
  vArray1: TArray<string>;
  vResult: String;
begin
  if (not GetStatusCancelar) and (not GetStatusEntrega) then
  begin


    vResult := MotivoCancelamento(PedidoAceito);

    if vResult <> '' then
    begin
      vArray1 := vResult.Split(['|']);

      try
        RecusarPedido(GetCorrelationId, vArray1[0], vArray1[1]);

      except
        on e: Exception do
        begin
           DM.GravaLog( 'Falha ao Recusar o pedido... ' + 'detalhes do erro: ' + e.Message);
        end;
      end;


      DM.ListaPedidos(_dataPedido.DateTime, _dataPedido.DateTime, _combStatus.ItemIndex, StrToIntDef(_edtNrPedido.Text, 0), StrToIntDef(_edtSeqDelivery.Text, 0), _edtNomeTel.Text);
    end
    else
    begin
      ShowMessage('Cancelamento não processado!');
    end;
  end
  else
  begin
    ShowMessage('Pedido já recusado ou em rota de entrega!');
  end;
end;

procedure T_frmMain._bntSairEntregaClick(Sender: TObject);
begin
  if not GetStatusEntrega then
  begin

    if DM._qryListaPedido.FieldByName('cdintegracao').AsInteger = 0 then
    begin


      case DM._qryListaPedido.FieldByName('tipoentrega').AsInteger of
        1: begin

              if not IsAgendado  then
              begin

                try
                  EntregaPedido(GetCorrelationId);

                except
                  on e: Exception do
                  begin
                     DM.GravaLog( 'Falha ao Entregar pedido... ' + 'detalhes do erro: ' + e.Message);
                  end;
                end;

              end
              else begin

                if GetDataAgendamentoStart < Now then
                begin

                  try
                    EntregaPedido(GetCorrelationId);

                  except
                    on e: Exception do
                    begin
                       DM.GravaLog( 'Falha ao Entregar pedido... ' + 'detalhes do erro: ' + e.Message);
                    end;
                  end;

                end
                else begin
                  if T_frmFormMensagensPadrao.Mensagem('A data de agendamento da entrega esta prevista para: ' +  FormatDateTime('dd/mm/yyyy hh:nn',GetDataAgendamentoStart) + ' Deseja confirmar a entrega?', 'Q', [mbSim, mbNao]) = True then
                  begin

                    try
                      EntregaPedido(GetCorrelationId);

                    except
                      on e: Exception do
                      begin
                         DM.GravaLog( 'Falha ao Entregar pedido... ' + 'detalhes do erro: ' + e.Message);
                      end;
                    end;

                  end;
                end;

              end;

           end;
      2,3: begin

              if not IsAgendado  then
              begin

                try
                  RetirarPedido(GetCorrelationId);

                except
                  on e: Exception do
                  begin
                     DM.GravaLog( 'Falha ao Entregar pedido... ' + 'detalhes do erro: ' + e.Message);
                  end;
                end;

              end
              else begin

                if GetDataAgendamentoStart < Now then
                begin

                  try
                    RetirarPedido(GetCorrelationId);

                  except
                    on e: Exception do
                    begin
                       DM.GravaLog( 'Falha ao Entregar pedido... ' + 'detalhes do erro: ' + e.Message);
                    end;
                  end;

                end
                else begin
                  if T_frmFormMensagensPadrao.Mensagem('A data de agendamento da entrega esta prevista para: ' +  FormatDateTime('dd/mm/yyyy hh:nn',GetDataAgendamentoStart) + ' Deseja confirmar a entrega?', 'Q', [mbSim, mbNao]) = True then
                  begin

                    try
                      RetirarPedido(GetCorrelationId);

                    except
                      on e: Exception do
                      begin
                         DM.GravaLog( 'Falha ao Entregar pedido... ' + 'detalhes do erro: ' + e.Message);
                      end;
                    end;

                  end;
                end;

              end;

           end;
      end;


    end;

    try
      {DM._qryConsultaStatusPG.Params[0].AsInteger := GetCdPedidoGCOM;
      DM._qryConsultaStatusPG.Params[1].AsInteger := 1;
      DM._qryConsultaStatusPG.Params[2].AsInteger := 23;
      DM._qryConsultaStatusPG.Close;
      DM._qryConsultaStatusPG.Open; }

    except
      on e: Exception do
      begin
         DM.GravaLog( 'Falha ao Consultar Status pedido... ' + 'detalhes do erro: ' + e.Message);
      end;
    end;


    DM.ListaPedidos(_dataPedido.DateTime, _dataPedido.DateTime, _combStatus.ItemIndex, StrToIntDef(_edtNrPedido.Text, 0),
      StrToIntDef(_edtSeqDelivery.Text, 0), _edtNomeTel.Text);
  end
  else
  begin
    ShowMessage('Pedido já marcado para Entrega / Retirada!');
  end;

end;

procedure T_frmMain._btnAtualizarClick(Sender: TObject);
begin
  if (_edtCodigoLojaGCom.Text <> '') and (GetCdLoja_Merchan > 0) then
  begin

    DM._qryUpdateLoja.Params[0].AsInteger := StrToInt(_edtCodigoLojaGCom.Text); //CdLojaGConnect

    if _checkLojaPrincipal.Checked then
    begin
      DM._qryUpdateLoja.Params[1].AsString := 'S'; //StatusLojaPrincipal
      _edtMerchanIDLoja.Text := Get_Merchan_ID;
      GravarConfigiFood(False);
    end
    else
      DM._qryUpdateLoja.Params[1].AsString := 'N'; //StatusLojaPrincipal

    DM._qryUpdateLoja.Params[2].AsInteger := GetCdLoja_Merchan;  //CdLoja
    DM._qryUpdateLoja.ExecSQL;
    DM._qryUpdateLoja.Connection.Commit;

    _edtCodigoLojaGCom.Clear;

    _btnAtualizar.Enabled := False;


    DM._qryDadosLoja.Close;
    DM._qryDadosLoja.Open;
  end
  else begin
    T_frmFormMensagensPadrao.Mensagem('Dados obrigatório não preenchidos!', 'E', [mbOk]);

  end;
end;

procedure T_frmMain._btnAtualizarNrPedidoClick(Sender: TObject);
begin
  DM._qryAtualizaNrGenerator.Params[0].AsString := 'A';
  DM._qryAtualizaNrGenerator.Params[1].AsString := 'GEN_IFOOD_PEDIDOSL_ID';
  DM._qryAtualizaNrGenerator.Params[2].AsInteger := StrToIntDef(_edtNrPedidoGConnect.Text,0);
  DM._qryAtualizaNrGenerator.Close;
  DM._qryAtualizaNrGenerator.Open;
    ShowMessage('Número do pedido do CoreFood atualizado para: ' + _edtNrPedidoGConnect.Text + ' com Sucesso!');
end;

procedure T_frmMain._btnAutorizarLojaClick(Sender: TObject);
begin
  GetFirstToken;
end;

procedure T_frmMain._btnGravarConfigClick(Sender: TObject);
begin
  GravarConfigiFood(True);
  PageControl1.ActivePage := _tabMain;
end;

procedure T_frmMain._btnBuscarMerchantsClick(Sender: TObject);
begin
  ListarMerchants;
end;

procedure T_frmMain._btnDetalharClick(Sender: TObject);
var
  Json, getCaminhoArquivo: String;
  i, h, NrItem: Integer;
  GetTaxaEntrega: Currency;
  vTiposPagamentos, vItems, vSubItens: TJSONArray;
  vPedido, vPagamento, vCliente, vEndereco, vProduto, vSubProduto, vMercant,
  vCoordinates, vPhone, vPayments, vVethod, vDelivery, vTotal: TJSONObject;
begin
  _memRetiFood.Clear;
  _memItensiFood.Clear;
  _memMerchantiFood.Clear;
  _memPaymentsiFood.Clear;
  _memAddressiFood.Clear;
  _memCustomeriFood.Clear;

  // _pagControl.Visible := True;
  getCaminhoArquivo := ExtractFilePath(GetModuleName(HInstance)) + '\ArqLog\' + GetShortReference + '_' + GetCorrelationId + '.txt';
  if FileExists(getCaminhoArquivo) then
  begin
    PageControl1.ActivePage := _tabDetalhar;

    _pagControliFood.ActivePage := _tabCadastro;

    _memRetiFood.Lines.LoadFromFile(getCaminhoArquivo);

    Json := _memRetiFood.Lines.Text;

    vPedido := TJSONObject.ParseJSONValue(Json) as TJSONObject;
    try

      if (vPedido <> nil) then
      begin
        NrItem := 0;
        vCliente := vPedido.GetValue<TJSONObject>('customer') as TJSONObject;
        _memCustomeriFood.Lines.Text := vCliente.Format;

        DM._qryPolling_Correlation.Params[0].AsString := GetCorrelationId;
        DM._qryPolling_Correlation.Close;
        DM._qryPolling_Correlation.Open;

        vPedido.TryGetValue<string>('createdAt', FIFood.Pedido_createdAt);
        vPedido.TryGetValue<string>('id', FIFood.Pedido_id);
        vPedido.TryGetValue<string>('reference', FIFood.Pedido_reference);
        vPedido.TryGetValue<string>('shortReference', FIFood.Pedido_shortReference);
        vPedido.TryGetValue<string>('displayId', FIFood.Pedido_shortReference);

        vTotal := vPedido.GetValue<TJSONObject>('total') as TJSONObject;
        vTotal.TryGetValue<string>('deliveryFee', FIFood.Pedido_deliveryFee);
        vTotal.TryGetValue<string>('subTotal', FIFood.Pedido_subTotal);
        vTotal.TryGetValue<string>('orderAmount', FIFood.Pedido_totalPrice);


        _edtCadCreatedAtiFood.Text := DateTimeToStr(ISO8601ToDate(FIFood.Pedido_createdAt));
        _edtCadTaxasiFood.Text := FIFood.Pedido_deliveryFee;
        _edtIDiFodd.Text := FIFood.Pedido_shortReference;
        _edtCadPedidoIDiFood.Text := StringReplace(FIFood.Pedido_id, '-', '', [rfReplaceAll, rfIgnoreCase]);
        _edtCadiFoodIDiFood.Text := FIFood.Pedido_shortReference;
        _edtCadSubTotaliFood.Text := FIFood.Pedido_subTotal;
        _edtCadTotaliFood.Text := FIFood.Pedido_totalPrice;

        vCliente.TryGetValue<string>('id', FIFood.Cliente_id);
        vCliente.TryGetValue<string>('documentNumber', FIFood.Cliente_documentNumber);
        vCliente.TryGetValue<string>('id', FIFood.Cliente_uuid);
        vCliente.TryGetValue<string>('name', FIFood.Cliente_name);
        vPedido.TryGetValue<string>('ordersCountOnMerchant', FIFood.Cliente_ordersCountOnRestaurant);

        if vCliente.TryGetValue<TJSONObject>('phone', vPhone) then
        begin
          vPhone.TryGetValue<string>('number', FIFood.Cliente_phone);
          vPhone.TryGetValue<string>('localizer', FIFood.Cliente_phone_localizer);
        end;

        _edtClientIDiFood.Text := FIFood.Cliente_id;
        _edtNomeiFood.Text := FIFood.Cliente_name;
        _edtOrderCountiFood.Text := FIFood.Cliente_ordersCountOnRestaurant;
        _edtPhoneiFood.Text := FIFood.Cliente_phone;
        _edtPhoneLocalizer.Text := FIFood.Cliente_phone_localizer;

        _edtCPFCNPJiFood.Text := FIFood.Cliente_documentNumber;

        vMercant := vPedido.GetValue<TJSONObject>('merchant') as TJSONObject;
        _memMerchantiFood.Lines.Text := vMercant.Format;

        if vPedido.TryGetValue<TJSONObject>('delivery', vDelivery) then
        begin

          vEndereco := vDelivery.GetValue<TJSONObject>('deliveryAddress') as TJSONObject;
          _memAddressiFood.Lines.Text := vEndereco.Format;

          vEndereco.TryGetValue<string>('city', FIFood.Endereco_city);
          vEndereco.TryGetValue<string>('complement', FIFood.Endereco_complement);
          vEndereco.TryGetValue<string>('formattedAddress', FIFood.Endereco_formattedAddress);
          vEndereco.TryGetValue<string>('neighborhood', FIFood.Endereco_neighborhood);
          vEndereco.TryGetValue<string>('postalCode', FIFood.Endereco_postalCode);
          vEndereco.TryGetValue<string>('reference', FIFood.Endereco_reference);
          vEndereco.TryGetValue<string>('streetName', FIFood.Endereco_streetName);
          vEndereco.TryGetValue<string>('streetNumber', FIFood.Endereco_streetNumber);
          vEndereco.TryGetValue<string>('country', FIFood.Endereco_country);
          vEndereco.TryGetValue<string>('state', FIFood.Endereco_state);

          _edtCidadeiFood.Text := FIFood.Endereco_city;
          _edtPaisiFood.Text := FIFood.Endereco_country;
          _MemoEndFormatadoiFood.Text := FIFood.Endereco_formattedAddress;
          _edtBairroiFood.Text := FIFood.Endereco_neighborhood;
          _edtCEPiFood.Text := FIFood.Endereco_postalCode;
          _edtEstadoiFood.Text := FIFood.Endereco_state;
          _edtEnderecoiFood.Text := FIFood.Endereco_streetName;
          _edtNroiFood.Text := FIFood.Endereco_streetNumber;

          vEndereco.TryGetValue<TJSONObject>('coordinates', vCoordinates);
          vCoordinates.TryGetValue<string>('latitude', FIFood.Endereco_latitude);
          vCoordinates.TryGetValue<string>('longitude',FIFood.Endereco_longitude);

          _edtLatitudeiFood.Text := FIFood.Endereco_latitude;
          _edtLongitudeiFood.Text := FIFood.Endereco_longitude;
        end;

        vPayments := vPedido.GetValue<TJSONObject>('payments') as TJSONObject;
         _memPaymentsiFood.Lines.Add(vPayments.Format);


        vTiposPagamentos := vPayments.GetValue<TJSONArray>('methods') as TJSONArray;
        for i := 0 to vTiposPagamentos.Count -1 do
        begin
          vPagamento := vTiposPagamentos.Items[i] as TJSONObject;


          vPagamento.TryGetValue<string>('prepaid', FIFood.Payments_prepaid);
          vPagamento.TryGetValue<string>('method', FIFood.Payments_methods);
          vPagamento.TryGetValue<string>('value', FIFood.Payments_value);


          if FIFood.Payments_methods = 'CASH' then
          begin
            vVethod := vPagamento.GetValue<TJSONObject>('cash') as TJSONObject;
            FIFood.Payments_name := 'Dinheiro';

            vVethod.TryGetValue<string>('changeFor', FIFood.Payments_changeFor);
          end
          else begin //FIFood.Payments_methods = 'CREDIT', 'MEAL_VOUCHER', 'PIX'
            vVethod := vPagamento.GetValue<TJSONObject>('card') as TJSONObject;
            vVethod.TryGetValue<string>('brand', FIFood.Payments_name);
            FIFood.Payments_changeFor := ''; //Zerando Troco
          end;

        end;

        _edtCadTrocoiFood.Text := FIFood.Payments_changeFor;
        _edtCadPagamentoiFood.Text := FIFood.Payments_name;
        _edtCadPrePagoiFood.Text := FIFood.Payments_prepaid;
        _edtCadValoriFood.Text := FIFood.Payments_value;


        //Produtos
        vItems := vPedido.GetValue<TJSONArray>('items') as TJSONArray;
        _memItensiFood.Lines.Add(vItems.Format);

        if not _cdsItensPedido.Active then
          _cdsItensPedido.CreateDataSet
        else
          _cdsItensPedido.EmptyDataSet;

        if not _cdsAdicionaisPedido.Active then
          _cdsAdicionaisPedido.CreateDataSet
        else
          _cdsAdicionaisPedido.EmptyDataSet;

        for i := 0 to vItems.Count -1 do
        begin
          vProduto := vItems.Items[i] as TJSONObject;

          vProduto.TryGetValue<string>('discount', FIFood.Produto_discount);
          vProduto.TryGetValue<string>('externalCode', FIFood.Produto_externalCode);
          vProduto.TryGetValue<string>('name', FIFood.Produto_name);
          vProduto.TryGetValue<string>('observations', FIFood.Produto_observations);
          vProduto.TryGetValue<string>('unitPrice', FIFood.Produto_price);
          vProduto.TryGetValue<string>('quantity', FIFood.Produto_quantity);
          vProduto.TryGetValue<string>('totalPrice', FIFood.Produto_totalPrice);


          _cdsItensPedido.Insert;
          NrItem := NrItem + 1;

          _cdsItensPedidoNrItem.AsInteger := NrItem;
          _cdsItensPedidoName.AsString := FIFood.Produto_name;
          _cdsItensPedidoQuantity.AsCurrency :=  StrToInt(FIFood.Produto_quantity);
          _cdsItensPedidoPrice.AsCurrency := StrToCurr(StringReplace(StringReplace(FIFood.Produto_price, '.', ',', [rfReplaceAll, rfIgnoreCase]), '"', '', [rfReplaceAll, rfIgnoreCase]));
          _cdsItensPedidoDiscount.AsCurrency :=  StrToCurrDef(StringReplace(StringReplace(FIFood.Produto_discount, '.', ',', [rfReplaceAll, rfIgnoreCase]), '"', '', [rfReplaceAll, rfIgnoreCase]),0);
          _cdsItensPedidoTotalPrice.AsCurrency := StrToCurr(StringReplace(StringReplace(FIFood.Produto_totalPrice, '.', ',', [rfReplaceAll, rfIgnoreCase]), '"', '', [rfReplaceAll, rfIgnoreCase]));
          _cdsItensPedidoPrice.AsCurrency := StrToCurr(StringReplace(StringReplace(FIFood.Produto_price, '.', ',', [rfReplaceAll, rfIgnoreCase]), '"', '', [rfReplaceAll, rfIgnoreCase]));
          _cdsItensPedidoExternalCode.AsInteger :=  StrToIntDef(FIFood.Produto_externalCode,0);


          if vProduto.TryGetValue<TJSONArray>('options', vSubItens) then
          begin
            vSubItens := vProduto.GetValue<TJSONArray>('options') as TJSONArray;
            for h := 0 to vSubItens.Count -1 do
            begin
              _cdsAdicionaisPedido.Insert;
              vSubProduto := vSubItens.Items[h] as TJSONObject;

              vSubProduto.TryGetValue<string>('discount', FIFood.SubProduto_discount);
              vSubProduto.TryGetValue<string>('externalCode', FIFood.SubProduto_externalCode);
              vSubProduto.TryGetValue<string>('name', FIFood.SubProduto_name);
              vSubProduto.TryGetValue<string>('observations', FIFood.SubProduto_observations);
              vSubProduto.TryGetValue<string>('unitPrice', FIFood.SubProduto_price);
              vSubProduto.TryGetValue<string>('quantity', FIFood.SubProduto_quantity);
              vSubProduto.TryGetValue<string>('price', FIFood.SubProduto_totalPrice);


              _cdsAdicionaisPedidoNrItem.AsInteger := NrItem;
              _cdsAdicionaisPedidoName.AsString := FIFood.SubProduto_name;
              _cdsAdicionaisPedidoQuantity.AsCurrency := StrToInt(vSubProduto.GetValue<string>('quantity'));
              _cdsAdicionaisPedidoPrice.AsCurrency :=  StrToCurr(StringReplace(StringReplace(FIFood.SubProduto_price, '.', ',', [rfReplaceAll, rfIgnoreCase]), '"', '', [rfReplaceAll, rfIgnoreCase]));
              _cdsAdicionaisPedidoDiscount.AsCurrency := StrToCurrDef(StringReplace(StringReplace(FIFood.SubProduto_discount, '.', ',', [rfReplaceAll, rfIgnoreCase]), '"', '', [rfReplaceAll, rfIgnoreCase]),0);
              _cdsAdicionaisPedidoTotalPrice.AsCurrency := StrToCurr(StringReplace(StringReplace(FIFood.SubProduto_totalPrice, '.', ',', [rfReplaceAll, rfIgnoreCase]), '"', '', [rfReplaceAll, rfIgnoreCase]));
              _cdsAdicionaisPedidoPrice.AsCurrency := StrToCurr(StringReplace(StringReplace(FIFood.SubProduto_price, '.', ',', [rfReplaceAll, rfIgnoreCase]), '"', '', [rfReplaceAll, rfIgnoreCase]));
              _cdsAdicionaisPedidoExternalCode.AsInteger := StrToIntDef(FIFood.SubProduto_externalCode, 0);
              _cdsAdicionaisPedido.Post;


            end;



          _cdsItensPedido.Post;
          _cdsItensPedido.First;

          _cdsAdicionaisPedido.Filtered := False;
          _cdsAdicionaisPedido.Filter := 'NRITEM = ' + _cdsItensPedidoNrItem.AsInteger.ToString;
          _cdsAdicionaisPedido.Filtered := True;

          end;

        end;


      end;

    finally
      vPedido.Free;
    end;
  end
  else
  begin

    ShowMessage('Arquivo não encontrado!');
  end;
end;


procedure T_frmMain._btnLiberarLojaClick(Sender: TObject);
var
  _expires_in, Envio: String;
begin

  if DataExpiraFirsToken > Now then
  begin


    try

      createComponents;
      try
        //FRestClient.BaseURL := 'https://pos-api.ifood.com.br/oauth/token';
        FRestClient.BaseURL := 'https://merchant-api.ifood.com.br/authentication/v1.0/oauth/token';
        FRestClient.ContentType := 'application/x-www-form-urlencoded';
        FRestRequest.Accept := 'application/json';

        FRestRequest.AddParameter('grantType', 'authorization_code', TRESTRequestParameterKind.pkGETorPOST);
        FRestRequest.AddParameter('clientId', edtClientID.Text, TRESTRequestParameterKind.pkGETorPOST);
        FRestRequest.AddParameter('clientSecret', edtClientSecret.Text, TRESTRequestParameterKind.pkGETorPOST);
        FRestRequest.AddParameter('authorizationCode', authorizationCode.Text, TRESTRequestParameterKind.pkGETorPOST);
        FRestRequest.AddParameter('authorizationCodeVerifier', authorizationCodeVerifier.Text, TRESTRequestParameterKind.pkGETorPOST);

        FRestRequest.Method := rmPOST;

        Envio :=    'BaseURL: '     + FRESTClient.BaseURL + #13 +
                    'ContentType: ' + FRESTClient.ContentType + #13 +
                    'Accept: '      + FRESTRequest.Accept + #13 +
                    'Method: GET'   + #13 +
                    'Parameter: '    + 'grantType ' + 'authorization_code'  + #13 +
                    'Parameter: '    + 'clientId ' + edtClientID.Text  + #13 +
                    'Parameter: '    + 'clientSecret ' + edtClientSecret.Text  + #13 +
                    'Parameter: '    + 'authorizationCode ' + authorizationCode.Text  + #13 +
                    'Parameter: '    + 'authorizationCodeVerifier ' + authorizationCodeVerifier.Text;

        DM.InsertLogs(0,
                      2,
                      'IFOOD - Liberar Loja',
                      Envio,
                      'Envio - Liberar Loja',
                      'S',
                      '');

        FRestRequest.Execute;

        case FRestResponse.StatusCode of
          200: //OK
          begin
            DM.InsertLogs(0,
                          2,
                          'Retorno - Liberar Loja',
                          '',
                          'IFOOD - Liberar Loja',
                          'S',
                          'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'OK' + #13  +  #13  + FRestResponse.Content);

            edtToken.Text := FRestResponse.JSONValue.GetValue<String>('accessToken');
            accessToken.Text := FRestResponse.JSONValue.GetValue<String>('accessToken');
            refreshToken.Text := FRestResponse.JSONValue.GetValue<String>('refreshToken');
            _expires_in := FRestResponse.JSONValue.GetValue<String>('expiresIn');
            DM.InsertTokenBD(0, IncSecond(Now,_expires_in.ToInteger - 60),authorizationCode.Text, authorizationCodeVerifier.Text, refreshToken.Text, accessToken.Text);
            _imgConfigOK.Picture := _imgiFood.Picture;

            //Depois de pegar a autorização, é hora de configurar o merchants para o evento do status do merchants
            ShowMessage('Token de autenticação configurado com Sucesso, Configure agora os dados de Merchants!');

          end;
          401: //Unauthorized
          begin
            DM.InsertLogs(0,
                          2,
                          'Retorno - Liberar Loja',
                          '',
                          'IFOOD - Liberar Loja',
                          'S',
                          'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Unauthorized' + #13  +  #13  + FRestResponse.Content);

            raise Exception.CreateFmt(FRestResponse.Content, []);
          end;
          500: //Unexpected error
          begin
            DM.InsertLogs(0,
                          2,
                          'Retorno - Liberar Loja',
                          '',
                          'IFOOD - Liberar Loja',
                          'S',
                          'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Unexpected error' + #13  +  #13  + FRestResponse.Content);

            raise Exception.CreateFmt(FRestResponse.Content, []);
          end;
        end;

      finally
        destroyComponents;
      end;

    except
      on e: Exception do
      begin
        ShowMessage('Falha autorizar a loja... ' + 'detalhes do erro: ' + e.Message);
        _imgConfigOK.Picture := _imgRecusado.Picture;
        DM.GravaLog( 'Falha autorizar a loja... ' + 'detalhes do erro: ' + e.Message);

      end;

    end;
  end
  else begin
    ShowMessage('Token inicial expirado... será necessário validar novamente!');
    GetFirstToken;
  end;

end;

procedure T_frmMain._btnPesquisarClick(Sender: TObject);
begin
  DM.ListaPedidos(_dataPedido.DateTime, _dataPedido.DateTime, _combStatus.ItemIndex, StrToIntDef(_edtNrPedido.Text, 0), StrToIntDef(_edtSeqDelivery.Text, 0), _edtNomeTel.Text);
  _lblStatusNovos.Caption := '00';
end;

procedure T_frmMain._btnReenviarClick(Sender: TObject);
var
  DadosImpressao, DataAgenda, HoraAgenda: String;
  impressao_txt, produtos_txt, pagamentos_txt: TStringList;
  Result: String;
  vArrayResult: TArray<string>;
begin
  if CdPedido > 0 then
  begin

    impressao_txt := TStringList.Create;
    produtos_txt  := TStringList.Create;
    pagamentos_txt  := TStringList.Create;
    impressao_txt.Clear;
    produtos_txt.Clear;
    pagamentos_txt.Clear;

    try


      try


        impressao_txt.Clear;

        impressao_txt.LoadFromFile('C:\temp\modeloimpressao.txt');


        DM._qryListaPedidoExport_Entregador.Params[0].AsInteger := CdPedido;
        DM._qryListaPedidoExport_Entregador.Close;
        DM._qryListaPedidoExport_Entregador.Open;


        DataAgenda := IfThen(DM._qryListaPedidoExport_Entregador.FieldByName('deliverydatetimeend').AsString = '', '', FormatDateTime('dd/mm/yyyy', DM._qryListaPedidoExport_Entregador.FieldByName('deliverydatetimeend').AsDateTime));
        HoraAgenda := IfThen(DM._qryListaPedidoExport_Entregador.FieldByName('deliverydatetimeend').AsString = '', '', FormatDateTime('hh:nn', DM._qryListaPedidoExport_Entregador.FieldByName('deliverydatetimeend').AsDateTime));


        DM._qryPagamentosExport.Params[0].AsInteger := CdPedido;
        DM._qryPagamentosExport.Close;
        DM._qryPagamentosExport.Open;

        DM._qryListaPedidoExport_Entregador.First;
        while not DM._qryListaPedidoExport_Entregador.Eof do
        begin

          if DM._qryListaPedidoExport_Entregador.FieldByName('isauxiliar').AsString = 'N' then
          begin

            produtos_txt.Add('___________________________________________________________________________');
            //produtos_txt.Add('</linha_simples>');
            produtos_txt.Add((RPad(DM._qryListaPedidoExport_Entregador.FieldByName('name').AsString,48,' ')));

            produtos_txt.Add(LPAD(' ',20,' ') + LPAD(FormatFloat('0.000', DM._qryListaPedidoExport_Entregador.FieldByName('quantity').AsCurrency),7,' ')
                           + LPAD(FormatFloat('###,###,##0.00', DM._qryListaPedidoExport_Entregador.FieldByName('price').AsCurrency),9,' ')
                           + LPAD(FormatFloat('###,###,##0.00', DM._qryListaPedidoExport_Entregador.FieldByName('totalprice_item').AsCurrency),11,' '));

            if DM._qryListaPedidoExport_Entregador.FieldByName('observations').AsString <> '' then
              //produtos_txt.Add('OBS: <e>' + DM._qryListaPedidoExport_Entregador.FieldByName('observations').AsString + '</e>');
              produtos_txt.Add('OBS: ' + DM._qryListaPedidoExport_Entregador.FieldByName('observations').AsString);


          end
          else begin

            produtos_txt.Add(LPAD(' ',7,' ')
                                 + '(+) ' + FormatFloat('0.000', DM._qryListaPedidoExport_Entregador.FieldByName('quantity').AsCurrency)
                                 + ' - ' +  DM._qryListaPedidoExport_Entregador.FieldByName('name').AsString
                                 +  ' (' +  FormatFloat('###,###,##0.00', DM._qryListaPedidoExport_Entregador.FieldByName('totalprice_item').AsCurrency) + ')');

          end;


          DM._qryListaPedidoExport_Entregador.Next;
        end;


        DM._qryPagamentosExport.First;
        while not DM._qryPagamentosExport.Eof do
        begin

          if DM._qryPagamentosExport.FieldByName('prepaid').AsString <> 'true' then
          begin
            if DM._qryPagamentosExport.FieldByName('formapagamento').AsString = 'CASH' then
              pagamentos_txt.Add(RPad('DINHEIRO',36,'.') + ': ' + LPAD(FormatFloat('###,###,##0.00', DM._qryPagamentosExport.FieldByName('valorpagamento').AsCurrency),10,' '))
            else
              pagamentos_txt.Add(RPad(DM._qryPagamentosExport.FieldByName('formapagamento').AsString,36,'.') + ': ' + LPAD(FormatFloat('###,###,##0.00', DM._qryPagamentosExport.FieldByName('valorpagamento').AsCurrency),10,' '));
          end
          else
            pagamentos_txt.Add('***   PEDIDO PAGO ONLINE   ***');

          DM._qryPagamentosExport.Next;
        end;

        impressao_txt.Text := StringReplace(impressao_txt.Text, '%textoCabecalho%', 'Via do Entregador', [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%nomeLoja%', DM._qryListaPedidoExport_Entregador.FieldByName('nomeloja').AsString, [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%hoje%', FormatDateTime('hh:nn', Now), [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%dataPedido%', FormatDateTime('dd/mm/yyyy', DM._qryListaPedidoExport_Entregador.FieldByName('datapedido').AsDateTime), [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%dataAgenda%', DataAgenda, [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%horaAgenda%', HoraAgenda, [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%codigoPedido%', DM._qryListaPedidoExport_Entregador.FieldByName('shortreference').AsString, [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%seqControle%', DM._qryListaPedidoExport_Entregador.FieldByName('seqdelivery').AsString, [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%pedidoIfood%', DM._qryListaPedidoExport_Entregador.FieldByName('shortreference').AsString, [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%atendente%', 'USUARIO', [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%entregador%', 'Motoboy', [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%formaEntrega%', 'Delivery', [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%cpfCnpj%', DM._qryListaPedidoExport_Entregador.FieldByName('cpf').AsString, [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%nomeCliente%', DM._qryListaPedidoExport_Entregador.FieldByName('nome').AsString, [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%foneEntrega%', DM._qryListaPedidoExport_Entregador.FieldByName('foneifood').AsString, [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%celular%', DM._qryListaPedidoExport_Entregador.FieldByName('foneifood').AsString, [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%cep%', DM._qryListaPedidoExport_Entregador.FieldByName('cep').AsString, [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%endereco%', DM._qryListaPedidoExport_Entregador.FieldByName('logradouro').AsString, [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%complemento%', DM._qryListaPedidoExport_Entregador.FieldByName('complementoendereco').AsString, [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%bairro%', DM._qryListaPedidoExport_Entregador.FieldByName('bairro').AsString, [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%referencia%', DM._qryListaPedidoExport_Entregador.FieldByName('pontoreferencia').AsString, [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%itens%', produtos_txt.Text, [rfReplaceAll]);



        impressao_txt.Text := StringReplace(impressao_txt.Text, '%subTotal%', RPad('SubTotal',36,'.') + ': ' + LPAD(FormatFloat('###,###,##0.00', DM._qryListaPedidoExport_Entregador.FieldByName('subtotal').AsCurrency),10,' '),[rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%totalDesconto%', RPad('Total Desconto',36,'.') + ': ' + LPAD(FormatFloat('###,###,##0.00', DM._qryListaPedidoExport_Entregador.FieldByName('valordesconto').AsCurrency),10,' '),[rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%taxaEntrega%', RPad('Taxa de Entrega',36,'.') + ': ' + LPAD(FormatFloat('###,###,##0.00', DM._qryListaPedidoExport_Entregador.FieldByName('deliveryfee').AsCurrency),10,' '),[rfReplaceAll]);

        if DM._qryListaPedido.FieldByName('changefor').AsCurrency - DM._qryListaPedido.FieldByName('totalprice').AsCurrency > 0 then
        begin
          impressao_txt.Text := StringReplace(impressao_txt.Text, '%seuTrocoSera%', RPad('Seu troco será',36,'.') + ': ' + LPAD(FormatFloat('###,###,##0.00', DM._qryListaPedidoExport_Entregador.FieldByName('changefor').AsCurrency),10,' '),[rfReplaceAll]);
          impressao_txt.Text := StringReplace(impressao_txt.Text, '%TrocoPara%', RPad('Troco para',36,'.') + ': ' + LPAD(FormatFloat('###,###,##0.00', DM._qryListaPedidoExport_Entregador.FieldByName('changefor').AsCurrency - DM._qryListaPedido.FieldByName('totalprice').AsCurrency),10,' '),[rfReplaceAll]);
        end
        else
        begin
          impressao_txt.Text := StringReplace(impressao_txt.Text, '%seuTrocoSera%', RPad('Seu troco será',36,'.') + ': ' + LPAD(FormatFloat('###,###,##0.00', 0),10,' '),[rfReplaceAll]);
          impressao_txt.Text := StringReplace(impressao_txt.Text, '%TrocoPara%', RPad('Troco para',36,'.') + ': ' + LPAD(FormatFloat('###,###,##0.00', 0),10,' '),[rfReplaceAll]);
        end;

        impressao_txt.Text := StringReplace(impressao_txt.Text, '%totalGeral%', RPad('Total do Pedido',36,'.') + ': ' + LPAD(FormatFloat('###,###,##0.00', DM._qryListaPedidoExport_Entregador.FieldByName('totalprice').AsCurrency),10,' '),[rfReplaceAll]);
        //RPad('Total do Pedido',36,'.') + ': ' + LPAD(FormatFloat('###,###,##0.00', DM._qryListaPedidoExport_Entregador.FieldByName('totalprice').AsCurrency),10,' '))
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%observacao%', DM._qryListaPedidoExport_Entregador.FieldByName('obs').AsString, [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%codigoPedido%', DM._qryListaPedidoExport_Entregador.FieldByName('cdpedido').AsString, [rfReplaceAll]);
        impressao_txt.Text := StringReplace(impressao_txt.Text, '%pagamento%', pagamentos_txt.Text, [rfReplaceAll]);


        impressao_txt.SaveToFile('C:\temp\impressao.txt');

      except
        on e: Exception do
        begin
          DM.GravaLog( 'Consultar os dados de modelo de impressao... ' + 'detalhes do erro: ' + e.Message);
        end;
      end;

    finally
      impressao_txt.Free;
      produtos_txt.Free;
      pagamentos_txt.Free;
    end;

    DM.DataSetToJson(DM._qryListaPedidoExport_Entregador, DM._qryPagamentosExport, CdPedido);

  end
  else begin
    T_frmFormMensagensPadrao.Mensagem('Nenhum pedido selecionado, faça a correção','I',[mbOk]);
  end;

end;
procedure T_frmMain._dataPedidoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  Mgs: TMsg;
begin
  if Key = VK_RETURN then
  begin
    PeekMessage(Mgs, 0, WM_CHAR, WM_CHAR, PM_REMOVE); // Remove o beep do Delphi
    _btnPesquisarClick(Self);
  end;
end;

procedure T_frmMain._gridLogsCellClick(Column: TColumn);
begin
  if not DM._qryListaLogs.IsEmpty then
  begin
    _memEnvio.Text :=  DM._qryListaLogs.FieldByName('enviado').AsString;
    _memRecebido.Text :=  DM._qryListaLogs.FieldByName('recebido').AsString;
  end;
end;

procedure T_frmMain._gridLogsGeralCellClick(Column: TColumn);
begin
  if not DM._qryListaLogsGeral.IsEmpty then
  begin
    _memEnvioGeral.Text :=  DM._qryListaLogsGeral.FieldByName('enviado').AsString;
    _memRecebidoGeral.Text :=  DM._qryListaLogsGeral.FieldByName('recebido').AsString;
  end;
end;

procedure T_frmMain._gridLogsGeralKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if not DM._qryListaLogsGeral.IsEmpty then
  begin
    _memEnvioGeral.Text :=  DM._qryListaLogsGeral.FieldByName('enviado').AsString;
    _memRecebidoGeral.Text :=  DM._qryListaLogsGeral.FieldByName('recebido').AsString;
  end;
end;

procedure T_frmMain._lblStatusLojaClick(Sender: TObject);
var
  vArray1: TArray<string>;
  vResult: String;
begin
  vResult := _lblStatusLoja.Hint;
  if vResult <> '' then
  begin
    vArray1 := vResult.Split(['|']);
    StatusLoja(vArray1[0],vArray1[1],vArray1[2],vArray1[3],vArray1[4],vArray1[5],vArray1[6],vArray1[7]);
  end;
end;

procedure T_frmMain._pagControliFoodChange(Sender: TObject);
begin
  if _pagControliFood.ActivePage = _tabLogs then
  begin
    DM._qryListaLogs.Params[0].AsInteger := CdPedido;
    DM._qryListaLogs.Close;
    DM._qryListaLogs.Open;
  end;
end;

procedure T_frmMain._spRowLinhaItensChange(Sender: TObject);
begin
  DBCtrlGrid2.RowCount := _spRowLinhaItens.Value;
end;

procedure T_frmMain._spRowLinhaPedidoChange(Sender: TObject);
begin
  DBCtrlGrid1.RowCount := _spRowLinhaItens.Value;
end;

procedure T_frmMain.actHomeExecute(Sender: TObject);
begin
  Log(actHome.Caption + ' Clicked');
  if SV.Opened and chkCloseOnMenuClick.Checked then
    SV.Close;

  PageControl1.ActivePage := _tabMain;
end;

procedure T_frmMain.actLayoutExecute(Sender: TObject);
begin
  Log(actLayout.Caption + ' Clicked');
  if SV.Opened and chkCloseOnMenuClick.Checked then
    SV.Close;

  PageControl1.ActivePage := _tabConfig;
end;

procedure T_frmMain.actLogGeralExecute(Sender: TObject);
begin
  ListaLogsGeral;
end;

procedure T_frmMain.actPowerExecute(Sender: TObject);
var
  vArray1: TArray<string>;
  vResult: String;
begin

  if actPower.Caption = 'Fechar Loja' then
  begin
    vResult := FecharLoja;

    if vResult <> '' then
    begin
      vArray1 := vResult.Split(['|']);

      try

        Interruption(_edtMerchanIDLoja.Text,vArray1[0],vArray1[1],vArray1[2],vArray1[3]);
        actPower.Caption := 'Abrir Loja';

      except
        on e: Exception do
        begin
           DM.GravaLog( 'Falha ao Fechar a Loja... ' + 'detalhes do erro: ' + e.Message);
        end;
      end;

    end;

  end
  else begin
    actPower.Caption := 'Fechar Loja';
    DeletarInterruption(_edtMerchanIDLoja.Text);
  end;

  if SV.Opened and chkCloseOnMenuClick.Checked then
    SV.Close;


end;

procedure T_frmMain.catMenuItemsCategoryCollapase(Sender: TObject; const Category: TButtonCategory);
begin
  // Prevent the catMenuItems Category group from being collapsed
  catMenuItems.Categories[0].Collapsed := False;
end;

procedure T_frmMain.ListaLogsGeral;
var
  PegaDataInicial, PegaDataFinal: TDateTime;
begin
  PegaDataInicial := StrToDateTime(FormatDateTime('dd/mm/yyyy 00:00', _edtDataIni.DateTime));
  PegaDataFinal   := StrToDateTime(FormatDateTime('dd/mm/yyyy 23:59', _edtDataFinal.DateTime));

  if _combLogGeral.ItemIndex = 0 then
    DM._qryListaLogsGeral.Params[0].AsString := 'T'
  else
    DM._qryListaLogsGeral.Params[0].AsString := 'S';

  DM._qryListaLogsGeral.Params[1].AsDateTime := PegaDataInicial;
  DM._qryListaLogsGeral.Params[2].AsDateTime := PegaDataFinal;
  DM._qryListaLogsGeral.Params[3].AsInteger := _combLogGeral.ItemIndex;
  DM._qryListaLogsGeral.Close;
  DM._qryListaLogsGeral.Open;

  PageControl1.ActivePage := _tabLogGeral;
end;


procedure T_frmMain.ListarMerchants;
var
  parameter: TRESTRequestParameter;
  vEmpresa: TJSONObject;
  vArrayEmpresas: TJSONArray;
  id, name, corporateName, Envio: String;
  i: Integer;
begin
  createComponents;
  try
    FRESTClient.BaseURL := 'https://merchant-api.ifood.com.br/merchant/v1.0';
    FRESTClient.ContentType := 'application/json';
    FRESTRequest.Accept := 'application/json';
    FRESTRequest.Method := rmGET;

    parameter := FRestRequest.Params.AddHeader('Authorization', 'Bearer ' + edtToken.Text);

    parameter.Options := [poDoNotEncode];


    FRESTRequest.Resource := '/merchants';

    Envio :=    'BaseURL: '     + FRESTClient.BaseURL + #13 +
                'ContentType: ' + FRESTClient.ContentType + #13 +
                'Accept: '      + FRESTRequest.Accept + #13 +
                'Method: GET'   + #13 +
                 //'Header: '      + parameter.ToString  + #13 +
                'Resource: '    + FRESTRequest.Resource;


    DM.InsertLogs(0,
                  2,
                  'Envio - ListarMerchants',
                  Envio,
                  'IFOOD - ListarMerchants',
                  'S',
                  '');

    FRestRequest.Execute;

    case FRestResponse.StatusCode of
      200: //OK
      begin

        DM.InsertLogs(0,
                      2,
                      'Retorno - ListarMerchants',
                      '',
                      'IFOOD - ListarMerchants',
                      'S',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'OK' + #13  +  #13  + FRestResponse.Content);

        DM._qryDeleteLoja.ExecSQL;
        DM._qryDeleteLoja.Connection.Commit;

        vArrayEmpresas := FRestResponse.JSONValue.GetValue<TJSONArray>('');

        if vArrayEmpresas.Count = 1 then
        begin
          vEmpresa := vArrayEmpresas.Items[0] as TJSONObject;
          vEmpresa.TryGetValue<string>('id', id);
          vEmpresa.TryGetValue<string>('name', name);
          vEmpresa.TryGetValue<string>('corporateName', corporateName);

          DM._qryInsertLoja.Params[0].AsInteger := 1;            //CDLOJA_GCONNECT
          DM._qryInsertLoja.Params[1].AsString := id;            //ID
          DM._qryInsertLoja.Params[2].AsString := corporateName; //NOMECORPORACAO
          DM._qryInsertLoja.Params[3].AsString := name;          //NOMELOJA
          DM._qryInsertLoja.Params[4].AsString := 'S';           //STATUSLOJAPRINCIPAL
          DM._qryInsertLoja.ExecSQL;
          DM._qryInsertLoja.Connection.Commit;


          DM._qryDadosLoja.Close;
          DM._qryDadosLoja.Open;

          _edtMerchanIDLoja.Text := id;

          ShowMessage('Loja Configurada com Sucesso!');
          PageControl1.ActivePage := _tabMain;
          swVendeOffLine.State := TToggleSwitchState(1);
        end
        else begin

          for i := 0 to vArrayEmpresas.Count -1 do
          begin
            vEmpresa := vArrayEmpresas.Items[i] as TJSONObject;
            vEmpresa.TryGetValue<string>('id', id);
            vEmpresa.TryGetValue<string>('name', name);
            vEmpresa.TryGetValue<string>('corporateName', corporateName);

            DM._qryInsertLoja.Params[0].AsInteger := i;            //CDLOJA_GCONNECT
            DM._qryInsertLoja.Params[1].AsString := id;            //ID
            DM._qryInsertLoja.Params[2].AsString := corporateName; //NOMECORPORACAO
            DM._qryInsertLoja.Params[3].AsString := name;          //NOMELOJA
            DM._qryInsertLoja.Params[4].AsString := 'N';           //STATUSLOJAPRINCIPAL
            DM._qryInsertLoja.ExecSQL;
            DM._qryInsertLoja.Connection.Commit;
          end;

          DM._qryDadosLoja.Close;
          DM._qryDadosLoja.Open;
        end;

      end;
      401: //Unauthorized. User is not authenticated at all, token is expired or token is invalid.
      begin
        DM.InsertLogs(0,
                      2,
                      'Retorno - ListarMerchants',
                      '',
                      'IFOOD - ListarMerchants',
                      'N',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Unauthorized. User is not authenticated at all, token is expired or token is invalid.' + #13  +  #13  + FRestResponse.Content);
      end;
      500: //InternalServerError. Something unexpected went wrong while fetching the list of merchants associated with the token.
      begin

        DM.InsertLogs(0,
                      2,
                      'Retorno - ListarMerchants',
                      '',
                      'IFOOD - ListarMerchants',
                      'N',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'InternalServerError. Something unexpected went wrong while fetching the list of merchants associated with the token.' + #13  +  #13  + FRestResponse.Content);

      end;
    end;

  finally
    destroyComponents;
  end;
end;

procedure T_frmMain.loadCredentials;
var
  fileName: string;
  IniFile: TIniFile;
begin
  fileName := ExtractFilePath(GetModuleName(HInstance)) + 'IFOODConfig.ini';
  IniFile := TIniFile.Create(fileName);
  try
    edtClientID.Text := IniFile.ReadString('CONFIG_IFOOD', 'CLIENT_ID', '');
    edtClientSecret.Text := IniFile.ReadString('CONFIG_IFOOD', 'CLIENT_SECRET', '');
    edtUsername.Text := IniFile.ReadString('CONFIG_IFOOD', 'CLIENT_USERNAME', '');
    edtPassword.Text := IniFile.ReadString('CONFIG_IFOOD', 'CLIENT_PASSWORD', '');
    _edtMerchanIDLoja.Text := IniFile.ReadString('CONFIG_IFOOD', 'MERCHANIDLOJA', '');

    _checkAceitaPedido.Checked := IniFile.ReadString('CONFIG_IFOOD','ACEITAPEDIDOAUTO', '') = 'True';
    _checkUtilizaIFood.Checked := IniFile.ReadString('CONFIG_IFOOD','UTILIZAIFOOD', '') = 'True';

    _checkImprimeViaEntregador.Checked := IniFile.ReadString('CONFIG_IFOOD','IMPRIMEVIAENTREGADORAUT', '') = 'True';
    _checkAdcComoProd.Checked := IniFile.ReadString('CONFIG_IFOOD','ADCCOMOPROD', '') = 'True';

    if _checkAceitaPedido.Checked then
      swAceiteAut.State := tssOn
    else
      swAceiteAut.State := tssOff;

  finally
    IniFile.Free;
  end;
end;

procedure T_frmMain.Log(const Msg: string);
var
  Idx: Integer;
begin
  Idx := lstLog.Items.Add(Msg);
  lstLog.TopIndex := Idx;
end;

procedure T_frmMain.PraButtonStyle1Click(Sender: TObject);
begin
  PageControl1.ActivePage := _tabMain;
end;

procedure T_frmMain.PraButtonStyle2Click(Sender: TObject);
begin
  ListaLogsGeral;
end;

procedure T_frmMain.RecusarPedido(ID, CodigoCanc, MoticoCanc: String);
var
  parameter: TRESTRequestParameter;
  objeto: TJSONObject;
  Envio, Body: String;
begin
  createComponents;
  try
    FRESTClient.BaseURL := 'https://merchant-api.ifood.com.br/order/v1.0';
    FRestClient.ContentType := 'application/json';
    FRestRequest.Accept := 'application/json';
    FRestRequest.Method := rmPOST;

    parameter := FRestRequest.Params.AddHeader('Authorization', 'Bearer ' + edtToken.Text);
    parameter.Options := [poDoNotEncode];

    FRESTRequest.Resource := '/orders/' + ID + '/requestCancellation';

    objeto := TJSONObject.Create;
    try
      objeto.AddPair('cancellationCode', CodigoCanc);
      objeto.AddPair('reason', MoticoCanc);
      FRestRequest.AddBody(TJson.JsonEncode(objeto), ctAPPLICATION_JSON);
      Body := objeto.ToString;

    finally
      objeto.Free;
    end;



    Envio :=    'BaseURL: '     + FRESTClient.BaseURL + #13 +
                'ContentType: ' + FRESTClient.ContentType + #13 +
                'Accept: '      + FRESTRequest.Accept + #13 +
                'Method: POST'  + #13 +
                'Body: '        + Body   + #13 +
                 //'Header: '      + parameter.ToString  + #13 +
                'Resource: '    + FRESTRequest.Resource;

    DM.InsertLogs(0,
                  2,
                  'Envio - RecusarPedido',
                  Envio,
                  'IFOOD - RecusarPedido',
                  'S',
                  '');

    FRestRequest.Execute;

    case FRestResponse.StatusCode of
      202: //Accepted
      begin
        //No proximo pooling se for aceito o cancelamento ele cancela o pedido
        DM.InsertLogs(0,
                      2,
                      'Resposta - RecusarPedido',
                      '',
                      'IFOOD - RecusarPedido',
                      'S',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Accepted' + #13  +  #13  + FRestResponse.Content);

      end;
      400: //Bad Request
      begin
        DM.InsertLogs(0,
                      2,
                      'Resposta - RecusarPedido',
                      '',
                      'IFOOD - RecusarPedido',
                      'S',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Bad Request' + #13  +  #13  + FRestResponse.Content);

        T_frmFormMensagensPadrao.Mensagem('Falha ao cancelar o pedido!', 'E', [mbOk]);
      end;
      404: //Not Found
      begin
        DM.InsertLogs(0,
                      2,
                      'Resposta - RecusarPedido',
                      '',
                      'IFOOD - RecusarPedido',
                      'S',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Not Found' + #13  +  #13  + FRestResponse.Content);

        T_frmFormMensagensPadrao.Mensagem('Falha ao cancelar o pedido!', 'E', [mbOk]);
      end;
      500: //Internal Server Error
      begin
        DM.InsertLogs(0,
                      2,
                      'Resposta - RecusarPedido',
                      '',
                      'IFOOD - RecusarPedido',
                      'S',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Internal Server Error' + #13  +  #13  + FRestResponse.Content);

        T_frmFormMensagensPadrao.Mensagem('Falha ao cancelar o pedido!', 'E', [mbOk]);
      end;

    end;

  finally
    destroyComponents;
  end;

end;

procedure T_frmMain.RetirarPedido(ID: String);
var
  parameter: TRESTRequestParameter;
  Envio: String;
begin

  createComponents;
  try
    FRestClient.ContentType := 'application/json';
    FRESTClient.BaseURL := 'https://merchant-api.ifood.com.br/order/v1.0';
    FRestRequest.Method := rmPOST;
    FRESTRequest.Resource := '/orders/' + ID + '/readyToPickup';

    parameter := FRestRequest.Params.AddHeader('Accept', 'application/json');
    parameter.Options := [poDoNotEncode];

    parameter := FRestRequest.Params.AddHeader('Content-Type', 'application/json');
    parameter.Options := [poDoNotEncode];

    parameter := FRestRequest.Params.AddHeader('Authorization', 'Bearer ' + edtToken.Text);
    parameter.Options := [poDoNotEncode];

    Envio :=    'BaseURL: '     + FRESTClient.BaseURL + #13 +
                'ContentType: ' + FRESTClient.ContentType + #13 +
                'Accept: '      + FRESTRequest.Accept + #13 +
                'Method: POST'  + #13 +
                 //'Header: '      + parameter.ToString  + #13 +
                'Resource: '    + FRESTRequest.Resource;

    DM.InsertLogs(0,
                  2,
                  'Envio - RetirarPedido',
                  Envio,
                  'IFOOD - RetirarPedido',
                  'S',
                  '');

    FRestRequest.Execute;


    case FRestResponse.StatusCode of
      202: //Accepted
      begin

        DM.InsertLogs(0,
                      2,
                      'Retorno - RetirarPedido',
                      '',
                      'IFOOD - RetirarPedido',
                      'S',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Accepted' + #13  +  #13  + FRestResponse.Content);


        DM._qryUpdateStatusPedidoEntrega.Params[0].AsString := 'PDR';
        DM._qryUpdateStatusPedidoEntrega.Params[1].AsString := ID;
        DM._qryUpdateStatusPedidoEntrega.ExecSQL;
        DM._qryUpdateStatusPedidoEntrega.Connection.Commit;

        DM.ListaPedidos(_dataPedido.DateTime, _dataPedido.DateTime, _combStatus.ItemIndex, StrToIntDef(_edtNrPedido.Text, 0), StrToIntDef(_edtSeqDelivery.Text, 0), _edtNomeTel.Text);
      end;
      400: //Bad Request
      begin
        DM.InsertLogs(0,
                      2,
                      'Retorno - RetirarPedido',
                      '',
                      'IFOOD - RetirarPedido',
                      'N',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Bad Request' + #13  +  #13  + FRestResponse.Content);

        T_frmFormMensagensPadrao.Mensagem('Falha ao confirmar retirada do pedido!','E', [mbOk]);
      end;
      404: //Not Found
      begin
        DM.InsertLogs(0,
                      2,
                      'Retorno - RetirarPedido',
                      '',
                      'IFOOD - RetirarPedido',
                      'N',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Not Found' + #13  +  #13  + FRestResponse.Content);

        T_frmFormMensagensPadrao.Mensagem('Falha ao confirmar retirada do pedido!','E', [mbOk]);
      end;
      500: //Internal Server Error
      begin
        T_frmFormMensagensPadrao.Mensagem('Falha ao confirmar retirada do pedido!','E', [mbOk]);
        DM.InsertLogs(0,
                      2,
                      'Retorno - RetirarPedido',
                      '',
                      'IFOOD - RetirarPedido',
                      'N',
                      'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Internal Server Error' + #13  +  #13  + FRestResponse.Content);
      end;
    end;

  finally
    destroyComponents;
  end;
end;


end.
