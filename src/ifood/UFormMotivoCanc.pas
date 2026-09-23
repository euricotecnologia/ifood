unit UFormMotivoCanc;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.ExtCtrls, Vcl.Grids,
  Vcl.DBGrids, PraButtonStyle, FireDAC.Stan.Param, Vcl.StdCtrls;

type
  T_frmMotivoCancelamento = class(TForm)
    DBGridStyles1: TDBGrid;
    Panel1: TPanel;
    Panel2: TPanel;
    DataSource1: TDataSource;
    _btnConfirmar: TPraButtonStyle;
    _btnCancelar: TPraButtonStyle;
    procedure DBGridStyles1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormActivate(Sender: TObject);
    procedure DBGridStyles1CellClick(Column: TColumn);
    procedure DBGridStyles1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure _btnConfirmarClick(Sender: TObject);
    procedure _btnCancelarClick(Sender: TObject);
  private
    { Private declarations }
    GetPedidoAceito: Char;
    GetResult: String;
  public
    { Public declarations }
  end;
  function MotivoCancelamento(aPedidoAceito: Char): String;

var
  _frmMotivoCancelamento: T_frmMotivoCancelamento;

implementation

{$R *.dfm}

uses UDM;

function MotivoCancelamento(aPedidoAceito: Char): String;
begin
  try
    if _frmMotivoCancelamento = nil then
      _frmMotivoCancelamento := T_frmMotivoCancelamento.Create(Application);

    _frmMotivoCancelamento.GetPedidoAceito := aPedidoAceito;

    _frmMotivoCancelamento.ShowModal;

    Result := _frmMotivoCancelamento.GetResult;
  finally
    {Destruindo o Formulario}
    FreeAndNil(_frmMotivoCancelamento);
  end;
end;


procedure T_frmMotivoCancelamento.DBGridStyles1CellClick(Column: TColumn);
begin
  if DM._qryMotivoCanc.Active then
  begin
    GetResult := DM._qryMotivoCanc.FieldByName('codigocancelamento').AsString + '|' + DM._qryMotivoCanc.FieldByName('motivocancelamento').AsString;
  end
  else
    GetResult := '';
end;

procedure T_frmMotivoCancelamento.DBGridStyles1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
  begin
    Close;
  end;
end;

procedure T_frmMotivoCancelamento.DBGridStyles1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if DM._qryMotivoCanc.Active then
  begin
    GetResult := DM._qryMotivoCanc.FieldByName('codigocancelamento').AsString + '|' + DM._qryMotivoCanc.FieldByName('motivocancelamento').AsString;
  end
  else
    GetResult := '';
end;

procedure T_frmMotivoCancelamento.FormActivate(Sender: TObject);
begin
  DM._qryMotivoCanc.Params[0].AsString := GetPedidoAceito;
  DM._qryMotivoCanc.Close;
  DM._qryMotivoCanc.Open;


  DM._qryMotivoCanc.First;
  GetResult := DM._qryMotivoCanc.FieldByName('codigocancelamento').AsString + '|' + DM._qryMotivoCanc.FieldByName('motivocancelamento').AsString;
end;

procedure T_frmMotivoCancelamento._btnCancelarClick(Sender: TObject);
begin
  GetResult := '';
  Close;
end;

procedure T_frmMotivoCancelamento._btnConfirmarClick(Sender: TObject);
begin
  Close;
end;

end.
