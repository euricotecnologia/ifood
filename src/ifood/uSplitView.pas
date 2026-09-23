//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

unit uSplitView;

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
  Vcl.DBCGrids, Data.DB;

type
  TSplitViewForm = class(TForm)
    ActionList1: TActionList;
    actHome: TAction;
    actLayout: TAction;
    actPower: TAction;
    imlIcons: TImageList;
    SV: TSplitView;
    catMenuItems: TCategoryButtons;
    pnlToolbar: TPanel;
    imgMenu: TImage;
    lblTitle: TLabel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    pnlSettings: TPanel;
    lblLog: TLabel;
    lblVclStyle: TLabel;
    grpDisplayMode: TRadioGroup;
    grpPlacement: TRadioGroup;
    grpCloseStyle: TRadioGroup;
    lstLog: TListBox;
    grpAnimation: TGroupBox;
    lblAnimationDelay: TLabel;
    lblAnimationStep: TLabel;
    chkUseAnimation: TCheckBox;
    trkAnimationDelay: TTrackBar;
    trkAnimationStep: TTrackBar;
    chkCloseOnMenuClick: TCheckBox;
    cbxVclStyles: TComboBox;
    DataSource1: TDataSource;
    RelativePanel1: TRelativePanel;
    RelativePanel2: TRelativePanel;
    RelativePanel3: TRelativePanel;
    Panel1: TPanel;
    Label1: TLabel;
    DBCtrlGrid1: TDBCtrlGrid;
    _shpBot: TShape;
    ShapeStatusPedido: TShape;
    _lblStatusPedido: TLabel;
    _lblNomeCliente: TLabel;
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
    _lblNomeLoja: TLabel;
    _lblNomeLojaC: TLabel;
    _lblAtendente: TLabel;
    _lblAtendenteC: TLabel;
    _lblUltAtualizacao: TLabel;
    Label19: TLabel;
    _lblVersaoSistemaC: TLabel;
    _lblVersaoSistema: TLabel;
    _imgStatusLoja: TImage;
    _lblStatusLojaC: TLabel;
    swVendeOffLine: TToggleSwitch;
    swAceiteAut: TToggleSwitch;
    Panel11: TPanel;
    Panel8: TPanel;
    Shape5: TShape;
    Label12: TLabel;
    Label13: TLabel;
    _lblNrPedidoC: TLabel;
    _lblNrPedido: TLabel;
    _lblSituacaoC: TLabel;
    _lblSituacao: TLabel;
    _lblCPFClienteC: TLabel;
    _lblCPFCliente: TLabel;
    SpinEdit4: TSpinEdit;
    _panProdutos: TPanel;
    Panel7: TPanel;
    Shape4: TShape;
    Label30: TLabel;
    SpinEdit3: TSpinEdit;
    _panProdutosTop: TPanel;
    Shape3: TShape;
    Label8: TLabel;
    Label9: TLabel;
    Label14: TLabel;
    SpinEdit2: TSpinEdit;
    Panel5: TPanel;
    Shape2: TShape;
    _lblReferenciaClienteC: TLabel;
    _lblLogradouroClienteC: TLabel;
    _lblComplementoClienteC: TLabel;
    _lblCepClienteC: TLabel;
    _lblAgendamentoClienteC: TLabel;
    _lblFoneClienteC: TLabel;
    _lblBairroClienteC: TLabel;
    _lblCidadeClienteC: TLabel;
    _lblCelularClienteC: TLabel;
    _lblCepCliente: TLabel;
    _lblLogradouroCliente: TLabel;
    _lblComplementoCliente: TLabel;
    _lblReferenciaCliente: TLabel;
    _lblBairroCliente: TLabel;
    _lblFoneCliente: TLabel;
    _lblAgendamentoCliente: TLabel;
    _lblCidadeCliente: TLabel;
    _lblCelularCliente: TLabel;
    SpinEdit1: TSpinEdit;
    DBCtrlGrid2: TDBCtrlGrid;
    Shape7: TShape;
    _panTopItensObs: TPanel;
    _lblObservacaoC: TLabel;
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
    _panPagamentosTop: TPanel;
    Shape1: TShape;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    SpinEdit5: TSpinEdit;
    Panel4: TPanel;
    _panPagamentos: TPanel;
    DBCtrlGrid3: TDBCtrlGrid;
    Shape6: TShape;
    _lblValor: TLabel;
    _lblTipoPagamento: TLabel;
    _panResumoPedido: TPanel;
    _lblSubTotalC: TLabel;
    _lblTaxaEntregaC: TLabel;
    _lblTaxaAdicionalC: TLabel;
    _lblDescontoC: TLabel;
    _lblRespDescontoC: TLabel;
    _lblValorPedidoC: TLabel;
    _lblTrocoParaC: TLabel;
    _lblSeuTrocoSeraC: TLabel;
    _lblAgendadoParaC: TLabel;
    _lblAgendadoPara: TLabel;
    _lblSeuTrocoSera: TLabel;
    _lblTrocoPara: TLabel;
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
    procedure grpDisplayModeClick(Sender: TObject);
    procedure grpPlacementClick(Sender: TObject);
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
  private
    procedure Log(const Msg: string);
  public
  end;

var
  SplitViewForm: TSplitViewForm;

implementation

{$R *.dfm}

uses UDM;

procedure TSplitViewForm.imgMenuClick(Sender: TObject);
begin
  if SV.Opened then
    SV.Close
  else
    SV.Open;
end;

procedure TSplitViewForm.grpDisplayModeClick(Sender: TObject);
begin
  SV.DisplayMode := TSplitViewDisplayMode(grpDisplayMode.ItemIndex);
end;

procedure TSplitViewForm.grpCloseStyleClick(Sender: TObject);
begin
  SV.CloseStyle := TSplitViewCloseStyle(grpCloseStyle.ItemIndex);
end;

procedure TSplitViewForm.grpPlacementClick(Sender: TObject);
begin
  SV.Placement := TSplitViewPlacement(grpPlacement.ItemIndex);
end;

procedure TSplitViewForm.SVClosed(Sender: TObject);
begin
  // When TSplitView is closed, adjust ButtonOptions and Width
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions - [boShowCaptions];
  if SV.CloseStyle = svcCompact then
    catMenuItems.Width := SV.CompactWidth;
end;

procedure TSplitViewForm.SVClosing(Sender: TObject);
begin
//
end;

procedure TSplitViewForm.SVOpened(Sender: TObject);
begin
  // When not animating, change size of catMenuItems when TSplitView is opened
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions + [boShowCaptions];
  catMenuItems.Width := SV.OpenedWidth;
end;

procedure TSplitViewForm.SVOpening(Sender: TObject);
begin
  // When animating, change size of catMenuItems at the beginning of open
  catMenuItems.ButtonOptions := catMenuItems.ButtonOptions + [boShowCaptions];
  catMenuItems.Width := SV.OpenedWidth;
end;

procedure TSplitViewForm.chkUseAnimationClick(Sender: TObject);
begin
  SV.UseAnimation := chkUseAnimation.Checked;
  lblAnimationDelay.Enabled := SV.UseAnimation;
  trkAnimationDelay.Enabled := SV.UseAnimation;
  lblAnimationStep.Enabled := SV.UseAnimation;
  trkAnimationStep.Enabled := SV.UseAnimation;
end;

procedure TSplitViewForm.FormActivate(Sender: TObject);
begin
  _dataPedido.DateTime := Now;
  DM.ListaPedidos(_dataPedido.DateTime, _dataPedido.DateTime, _combStatus.ItemIndex, StrToIntDef(_edtNrPedido.Text, 0), StrToIntDef(_edtSeqDelivery.Text, 0), _edtNomeTel.Text);
end;

procedure TSplitViewForm.trkAnimationDelayChange(Sender: TObject);
begin
  SV.AnimationDelay := trkAnimationDelay.Position * 5;
  lblAnimationDelay.Caption := 'Animation Delay (' + IntToStr(SV.AnimationDelay) + ')';
end;

procedure TSplitViewForm.trkAnimationStepChange(Sender: TObject);
begin
  SV.AnimationStep := trkAnimationStep.Position * 5;
  lblAnimationStep.Caption := 'Animation Step (' + IntToStr(SV.AnimationStep) + ')';
end;

procedure TSplitViewForm.actHomeExecute(Sender: TObject);
begin
  Log(actHome.Caption + ' Clicked');
  if SV.Opened and chkCloseOnMenuClick.Checked then
    SV.Close;
end;

procedure TSplitViewForm.actLayoutExecute(Sender: TObject);
begin
  Log(actLayout.Caption + ' Clicked');
  if SV.Opened and chkCloseOnMenuClick.Checked then
    SV.Close;
end;

procedure TSplitViewForm.actPowerExecute(Sender: TObject);
begin
  Log(actPower.Caption + ' Clicked');
  if SV.Opened and chkCloseOnMenuClick.Checked then
    SV.Close;
end;

procedure TSplitViewForm.catMenuItemsCategoryCollapase(Sender: TObject; const Category: TButtonCategory);
begin
  // Prevent the catMenuItems Category group from being collapsed
  catMenuItems.Categories[0].Collapsed := False;
end;

procedure TSplitViewForm.Log(const Msg: string);
var
  Idx: Integer;
begin
  Idx := lstLog.Items.Add(Msg);
  lstLog.TopIndex := Idx;
end;

end.
