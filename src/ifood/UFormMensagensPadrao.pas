unit UFormMensagensPadrao;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Buttons;

type
  TMyButtons = (mbSim, mbNao, mbOk);

type
  T_frmFormMensagensPadrao = class(TForm)
    pnlBotoes: TPanel;
    pnlIcones: TPanel;
    pnlMensagem: TPanel;
    _lblMensagem: TLabel;
    _btnSim: TBitBtn;
    _btnNao: TBitBtn;
    _btnOK: TBitBtn;
    _imgErro: TImage;
    _imgDeletar: TImage;
    _imgCuidado: TImage;
    _imgQuestao: TImage;
    _imgInformacao: TImage;
    _panTitulo: TPanel;
    procedure FormShow(Sender: TObject);
    procedure DoClose(var Action: TCloseAction); override;
    procedure KeyDown(var Key: Word; Shift: TShiftState); override;
  private
    { Private declarations }
  public
    class function Mensagem(Texto: String; Tipo: Char; Botoes: array of TMyButtons): Boolean;
  end;

var
  _frmFormMensagensPadrao: T_frmFormMensagensPadrao;
const
  LEFTBUTTONS : array[0..2] of Integer = (214, 134, 54);
  TITULOINFO : String = 'Mensagem do Sistema';
  TITULOHELP : String = 'Pergunta do Sistema';

implementation

{$R *.dfm}

{ T_frmFormMensagensPadrao }

procedure T_frmFormMensagensPadrao.DoClose(var Action: TCloseAction);
begin
  {}
end;

procedure T_frmFormMensagensPadrao.FormShow(Sender: TObject);
begin
  if Tag = 1 then
    _panTitulo.Caption := TITULOINFO
  else
    _panTitulo.Caption := TITULOHELP;
end;

procedure T_frmFormMensagensPadrao.KeyDown(var Key: Word; Shift: TShiftState);
begin
  {}
end;

class function T_frmFormMensagensPadrao.Mensagem(Texto: String; Tipo: Char;
  Botoes: array of TMyButtons): Boolean;
var
  i: Integer;
  frm : T_frmFormMensagensPadrao;
begin
  frm := T_frmFormMensagensPadrao.Create(nil);

  try
    frm._lblMensagem.Caption := Texto;

    for i := 0 to Length(Botoes) -1 do
    begin
      case (Botoes[i]) of
        mbOk: begin
                frm._btnOK.Visible := True;
                frm._btnOK.Left := LEFTBUTTONS[i];
                frm.Tag := 1;
              end;

        mbSim: begin
                 frm._btnSim.Visible := True;
                 frm._btnSim.Left := LEFTBUTTONS[i];
               end;

        mbNao: begin
                 frm._btnNao.Visible := True;
                 frm._btnNao.Left := LEFTBUTTONS[i];
               end;

        else begin
          frm._btnOK.Visible := True;
          frm._btnOK.Left := LEFTBUTTONS[i];
        end;
      end;
    end;

     case (Tipo) of
      'I': frm._imgInformacao.Visible := True; {Informação}
      'D': frm._imgDeletar.Visible := True;    {Deleção}
      'Q': frm._imgQuestao.Visible := True;    {Questão}
      'C': frm._imgCuidado.Visible := True;    {Cuidado}
      'E': frm._imgErro.Visible := True;       {Erro}
      else
        frm._imgInformacao.Visible := True;
    end;

     frm.ShowModal;

    case (frm.ModalResult) of
      mrOk, mrYes : result := True;
      else
        result := False;
    end;

  finally
    if (frm <> nil) then
      FreeAndNil(frm);
  end;
end;

end.
