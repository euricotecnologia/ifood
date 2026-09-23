unit UFormNotificaMensagem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TTipoNotificacao = (tnAviso, tnAdvertencia, tnErro);
  TTipoEfeito= (teDeslizando);

  T_frmNotificaMensagem = class(TForm)
    PanelMensagem: TPanel;
    PanelTitulo: TPanel;
    LabelTitulo: TLabel;
    TimerClose: TTimer;
    LabelMensagem: TLabel;
    LabelClose: TLabel;
    Timer1: TTimer;
    procedure LabelCloseClick(Sender: TObject);
    procedure LabelCloseMouseLeave(Sender: TObject);
    procedure LabelCloseMouseEnter(Sender: TObject);
    procedure TimerCloseTimer(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
  private
    procedure sair;
    { Private declarations }
  public
    { Public declarations }
  end;

  procedure notificaMensagem(mensagem        : String;
                             Titulo          : String;
                             tipoNotificacao : TTipoNotificacao = tnAviso;
                             tipoEfeito      : TTipoEfeito = teDeslizando;
                             tempoVida       : Longint = 5000);

var
  FormNotifica : TForm;

  _frmNotificaMensagem: T_frmNotificaMensagem;

implementation

{$R *.dfm}

uses UDM;
procedure notificaMensagem(mensagem        : String;
                           Titulo          : String;
                           tipoNotificacao : TTipoNotificacao = tnAviso;
                           tipoEfeito      : TTipoEfeito = teDeslizando;
                           tempoVida       : Longint = 5000);
  procedure Delay;
  var
    iStart, iStop: DWORD;
  begin
    iStart := GetTickCount;
    repeat
      iStop := GetTickCount;

      Sleep(1);
    until (iStop - iStart) >= 100;

  end;

var
  iCount       : integer;
  xinitop      : integer;
begin
  xinitop := 0;
  if not Assigned(FormNotifica) then
  begin

    FormNotifica := T_frmNotificaMensagem.Create(Application);
    with T_frmNotificaMensagem(FormNotifica) do
    begin

      //Joga a mensagem para frente, resolvendo o problema de foco
      SetForegroundWindow(Application.Handle);

      //Configura cor do panel
      if tipoNotificacao = tnAdvertencia then
      begin
        PanelTitulo.Color      := clYellow; //Amarelo
        LabelTitulo.Font.Color := clBlack;
        PanelTitulo.AlignWithMargins := True; //mostra uma borda no panelTitulo
      end
      else if tipoNotificacao = tnErro then
      begin
        PanelTitulo.Color      := clRed; //Vermelho
        LabelTitulo.Font.Color := clWhite;
      end
      else
      begin
        PanelTitulo.Color      := $00C48766; //Azul
        LabelTitulo.Font.Color := clWhite;
      end;

      LabelMensagem.Caption := mensagem;

      LabelTitulo.Caption   := Titulo;
      Left    := Screen.Width - 305; //_frmNotificaMensagem.Width;

      if tipoEfeito = teDeslizando then
      begin
        xinitop := (Screen.Height) - 85;
      end;

      Top := xinitop;

      for iCount := 0 to 15 do
      begin
        top := Top - iCount;

        show;
        Update;
        Delay;
      end;

      //Evitando que o usuário coloque tempo menor que 1 segundo.
      if tempoVida < 1000 then
        tempoVida := 3000;

      TimerClose.Interval := tempoVida;
      TimerClose.Enabled  := True;
    end;

  end;

end;

procedure T_frmNotificaMensagem.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  FreeAndNil(FormNotifica);
end;

procedure T_frmNotificaMensagem.LabelCloseClick(Sender: TObject);
begin
  //sair;
  Close;
end;

procedure T_frmNotificaMensagem.LabelCloseMouseEnter(Sender: TObject);
begin
  LabelClose.Font.Color := clYellow;
end;

procedure T_frmNotificaMensagem.LabelCloseMouseLeave(Sender: TObject);
begin
  LabelClose.Font.Color := clWhite;
end;

procedure T_frmNotificaMensagem.sair;
begin
  TimerClose.Enabled := False;
  //Close;
end;

procedure T_frmNotificaMensagem.Timer1Timer(Sender: TObject);
begin
  DM.TocarBip;
end;

procedure T_frmNotificaMensagem.TimerCloseTimer(Sender: TObject);
begin
  sair;
end;

end.
