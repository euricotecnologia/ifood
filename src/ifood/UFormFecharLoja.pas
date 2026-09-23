unit UFormFecharLoja;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, System.DateUtils,
  PraButtonStyle;

type
  T_frmFecharLoja = class(TForm)
    _radFechaPor: TRadioGroup;
    _radMotivoDe: TRadioGroup;
    _btnFechar: TPraButtonStyle;
    _btnCancelar: TPraButtonStyle;
    procedure _btnFecharClick(Sender: TObject);
    procedure _btnCancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    GetResult: String;
  public
    { Public declarations }
  end;
  function FecharLoja: String;

var
  _frmFecharLoja: T_frmFecharLoja;

implementation

{$R *.dfm}

function FecharLoja: String;
begin
  try
    if _frmFecharLoja = nil then
      _frmFecharLoja := T_frmFecharLoja.Create(Application);


    _frmFecharLoja.ShowModal;

    Result := _frmFecharLoja.GetResult;
  finally
    {Destruindo o Formulario}
    FreeAndNil(_frmFecharLoja);
  end;
end;

procedure T_frmFecharLoja._btnFecharClick(Sender: TObject);
begin
  case _radFechaPor.ItemIndex of
    0: begin
         //15 min
         GetResult :=  DateTimeToStr(IncMinute(Now,15)) + '|' + DateToISO8601(Now) + '|' + DateToISO8601(IncMinute(Now,15)) + '|';
       end;
    1: begin
         //30 min
         GetResult :=  DateTimeToStr(IncMinute(Now,30)) + '|' + DateToISO8601(Now) + '|' + DateToISO8601(IncMinute(Now,30)) + '|';
       end;
    2: begin
         //1 hora
         GetResult :=  DateTimeToStr(IncMinute(Now,60)) + '|' + DateToISO8601(Now) + '|' + DateToISO8601(IncMinute(Now,60)) + '|';
       end;
    3: begin
         //3 horas
         GetResult :=  DateTimeToStr(IncMinute(Now,180)) + '|' + DateToISO8601(Now) + '|' + DateToISO8601(IncMinute(Now,180)) + '|';
       end;
    4: begin
         //6 horas
         GetResult :=  DateTimeToStr(IncMinute(Now,360)) + '|' + DateToISO8601(Now) + '|' + DateToISO8601(IncMinute(Now,360)) + '|';
       end;
    5: begin
         //12 horas
         GetResult :=  DateTimeToStr(IncMinute(Now,720)) + '|' + DateToISO8601(Now) + '|' + DateToISO8601(IncMinute(Now,720)) + '|';
       end;
    6: begin
         //24 horas
         GetResult :=  DateTimeToStr(IncMinute(Now,1440)) + '|' + DateToISO8601(Now) + '|' + DateToISO8601(IncMinute(Now,1440)) + '|';
       end;
  end;

  case _radMotivoDe.ItemIndex of
    0: begin
         //Muitos Pedidos
         GetResult := GetResult + 'Muitos Pedidos';
       end;
    1: begin
         //Problema na Cozinha
         GetResult := GetResult + 'Problema na Cozinha';
       end;
    2: begin
         //Falta de Entregador
         GetResult := GetResult + 'Falta de Entregador';
       end;
    3: begin
         //Outro
         GetResult := GetResult + 'Outro';
       end;
  end;

  Close;

end;

procedure T_frmFecharLoja.FormCreate(Sender: TObject);
begin
  GetResult := '';
end;

procedure T_frmFecharLoja._btnCancelarClick(Sender: TObject);
begin
  GetResult := '';
end;

end.
