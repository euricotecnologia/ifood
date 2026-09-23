unit AlertaMsg;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Imaging.pngimage, dxGDIPlusClasses;

type
  TFAlertaMsg = class(TForm)
    Panel1: TPanel;
    _lblLoja: TLabel;
    _lblAviso1: TLabel;
    Button1: TButton;
    Image1: TImage;
    Label2: TLabel;
    Image2: TImage;
    procedure FormActivate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FAlertaMsg: TFAlertaMsg;

implementation

{$R *.dfm}

procedure TFAlertaMsg.Button1Click(Sender: TObject);
begin
  Close;
end;


procedure TFAlertaMsg.FormActivate(Sender: TObject);
begin
  _lblLoja.Caption := Self.Caption;
  _lblAviso1.Caption := StringReplace(_lblAviso1.Caption, '@', IntToStr(Tag), [rfIgnoreCase]);
  Self.Caption := 'Atenção! Pedidos pendentes...';
end;

procedure TFAlertaMsg.Image1Click(Sender: TObject);
begin
  Close;
end;

end.
