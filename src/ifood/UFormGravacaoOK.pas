unit UFormGravacaoOK;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, jpeg;

type
  T_frmGravacaoOK = class(TForm)
    Timer: TTimer;
    _imgFundo: TImage;
    _lblMsg: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure TimerTimer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;
  procedure ShowFormGravacaoOK;

var
  _frmGravacaoOK: T_frmGravacaoOK;

implementation

{$R *.dfm}

procedure ShowFormGravacaoOK;
begin
  try
    if _frmGravacaoOK = nil then
      _frmGravacaoOK := T_frmGravacaoOK.Create(Application);


  _frmGravacaoOK.ShowModal;

  finally
    FreeAndNil(_frmGravacaoOK);
  end;
end;

procedure T_frmGravacaoOK.FormCreate(Sender: TObject);
begin
  Timer.Enabled:= True;
end;

procedure T_frmGravacaoOK.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Release;
end;

procedure T_frmGravacaoOK.TimerTimer(Sender: TObject);
begin
  Close;
end;

end.
