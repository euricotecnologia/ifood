//---------------------------------------------------------------------------

// This software is Copyright (c) 2015 Embarcadero Technologies, Inc.
// You may only use this software if you are an authorized licensee
// of an Embarcadero developer tools product.
// This software is considered a Redistributable as defined under
// the software license agreement that comes with the Embarcadero Products
// and is subject to that software license agreement.

//---------------------------------------------------------------------------

program CoreFood;

uses
  Vcl.Forms,
  Vcl.Themes,
  Vcl.Styles,
  UFormMensagensPadrao in 'UFormMensagensPadrao.pas' {_frmFormMensagensPadrao},
  UFuncoes in 'UFuncoes.pas',
  UIFoodRecord in 'UIFoodRecord.pas',
  uFormMain in 'uFormMain.pas' {_frmMain},
  UFormNotificaMensagem in 'UFormNotificaMensagem.pas' {_frmNotificaMensagem},
  UDM in 'UDM.pas' {DM: TDataModule},
  UFormMotivoCanc in 'UFormMotivoCanc.pas' {_frmMotivoCancelamento},
  UFormGravacaoOK in 'UFormGravacaoOK.pas' {_frmGravacaoOK},
  Thread.IFood in 'Thread.IFood.pas',
  AlertaMsg in 'AlertaMsg.pas' {FAlertaMsg},
  UFormStatusLoja in 'UFormStatusLoja.pas' {_frmStatusLoja},
  UFormFecharLoja in 'UFormFecharLoja.pas' {_frmFecharLoja};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.Title := 'CoreFood';
  Application.CreateForm(TDM, DM);
  Application.CreateForm(T_frmMain, _frmMain);
  Application.Run;
end.
