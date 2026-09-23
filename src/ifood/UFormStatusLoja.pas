unit UFormStatusLoja;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, PraButtonStyle, Vcl.StdCtrls;

type
  T_frmStatusLoja = class(TForm)
    GroupBox1: TGroupBox;
    _lblmdescriptionC: TLabel;
    _lblmsubtitleC: TLabel;
    _lblmtitleC: TLabel;
    _lblmtitle: TLabel;
    _lblmdescription: TLabel;
    _lblmsubtitle: TLabel;
    GroupBox2: TGroupBox;
    _lbldescriptionC: TLabel;
    _lblsubtitleC: TLabel;
    _lbltitleC: TLabel;
    _lbltitle: TLabel;
    _lbldescription: TLabel;
    _lblsubtitle: TLabel;
    GroupBox4: TGroupBox;
    _lblstateC: TLabel;
    _lblavailableC: TLabel;
    _lblavailable: TLabel;
    _lblstate: TLabel;
    _btnFechar: TPraButtonStyle;
    procedure _btnFecharClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
    available, state, title, subtitle, description, mtitle, msubtitle, mdescription: String;
  public
    { Public declarations }
  end;
  procedure StatusLoja(vavailable, vstate, vtitle, vsubtitle, vdescription,
    vmtitle, vmsubtitle, vmdescription: String);

var
  _frmStatusLoja: T_frmStatusLoja;

implementation

{$R *.dfm}

procedure StatusLoja(vavailable, vstate, vtitle, vsubtitle, vdescription,
  vmtitle, vmsubtitle, vmdescription: String);
begin
  try
    if _frmStatusLoja = nil then
      _frmStatusLoja := T_frmStatusLoja.Create(Application);

    _frmStatusLoja.available := vavailable;
    _frmStatusLoja.state := vstate;
    _frmStatusLoja.title := vtitle;
    _frmStatusLoja.subtitle := vsubtitle;
    _frmStatusLoja.description := vdescription;
    _frmStatusLoja.mtitle := vmtitle;
    _frmStatusLoja.msubtitle := vmsubtitle;
    _frmStatusLoja.mdescription := vmdescription;

    _frmStatusLoja.ShowModal;

  finally
    {Destruindo o Formulario}
    FreeAndNil(_frmStatusLoja);
  end;
end;

procedure T_frmStatusLoja.FormActivate(Sender: TObject);
begin
  _lblavailable.Caption := available;
  _lblstate.Caption := state;
  _lbltitle.Caption := title;
  _lblsubtitle.Caption := subtitle;
  _lbldescription.Caption := description;
  _lblmtitle.Caption := mtitle;
  _lblmsubtitle.Caption := msubtitle;
  _lblmdescription.Caption := mdescription;
end;

procedure T_frmStatusLoja._btnFecharClick(Sender: TObject);
begin
  Close;
end;

end.
