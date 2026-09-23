unit UDM;

interface

uses
  System.SysUtils, System.Classes, UFuncoes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, UFormMensagensPadrao, FireDAC.UI.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.DApt, Data.DB, Vcl.Dialogs,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, Vcl.Forms, System.JSON,
  FireDAC.Comp.UI, FireDAC.Phys.IBBase,  System.Generics.Collections, System.StrUtils;

type
  TDM = class(TDataModule)
    FDConnection1: TFDConnection;
    FDGUIxWaitCursor1: TFDGUIxWaitCursor;
    _qryInsertConfig: TFDQuery;
    _qryUpdateConfig: TFDQuery;
    _qryGetTokenBD: TFDQuery;
    _qryUpdateIntegrado: TFDQuery;
    _qryGetPedidos: TFDQuery;
    _qryInsertPedido: TFDQuery;
    _qryInsertPedidoItens: TFDQuery;
    _qryGetIDPedido: TFDQuery;
    _qryListaPedido: TFDQuery;
    _qryListaPedidoItens: TFDQuery;
    _qryUpdateStatusPedido: TFDQuery;
    _qryGetCdClienteCad: TFDQuery;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
    _qryGetPedidosCanc: TFDQuery;
    _qryPolling_Correlation: TFDQuery;
    _qryInsertPagamentos: TFDQuery;
    _qryListaPagamentos: TFDQuery;
    _qryGetSeqDelivery: TFDQuery;
    _qryInsertProduto: TFDQuery;
    _qryDeleteProdLocal: TFDQuery;
    _qryUpdateStatusPedidoEntrega: TFDQuery;
    _qryUpdateStatusPedidoCancelar: TFDQuery;
    _qryMotivoCanc: TFDQuery;
    _qryAtualizaPedido: TFDQuery;
    _qryInsertPedidobck: TFDQuery;
    _qryInsertImpressora: TFDQuery;
    _qryAtualizaPedidoIntegrado: TFDQuery;
    _qryUpdateStatusPedidoAceiteAut: TFDQuery;
    _qryGetStatusPedidos: TFDQuery;
    _qryAtualizaStatusFinal: TFDQuery;
    _qryPedidosNaoAceito: TFDQuery;
    _qryPagamentosExport: TFDQuery;
    _qryInsertLogs: TFDQuery;
    _qryListaLogs: TFDQuery;
    _qryInsertPedido_ZAP: TFDQuery;
    _qryInsertPedidoItens_ZAP: TFDQuery;
    _qryInsertClienteZAP: TFDQuery;
    _qryGetClienteCad: TFDQuery;
    _qryInsertLoja: TFDQuery;
    _qryDadosLoja: TFDQuery;
    _qryUpdateLoja: TFDQuery;
    _qryListaLogsGeral: TFDQuery;
    _qryListaLogsGeralACAO: TStringField;
    _qryListaLogsGeralENVIADO: TMemoField;
    _qryListaLogsGeralRECEBIDO: TMemoField;
    _qryListaLogsGeralDATAHORA: TSQLTimeStampField;
    _qryListaLogsGeralNOMESERVICO: TStringField;
    _qryListaLogsGeralSTATUSLOG: TStringField;
    _qryListaLogsGeralTIPOCHAMADA: TIntegerField;
    _qryDeletePolling: TFDQuery;
    _qryDeleteLogs: TFDQuery;
    _qryDeletePedidos: TFDQuery;
    _qryDeleteConfig: TFDQuery;
    _qryDeleteLoja: TFDQuery;
    _qryAtualizaPedidoIndoor: TFDQuery;
    _qryFechamentoLoja: TFDQuery;
    _qrySelectIDFechamento: TFDQuery;
    _qryCancelarFechamento: TFDQuery;
    _qryUpddateVal_Resp_Desc: TFDQuery;
    _qryPolling: TFDQuery;
    _qryUpdatepollingEnviado: TFDQuery;
    Tb_POLLING: TFDTable;
    _qryGetPedidosAceitos: TFDQuery;
    _qryUpdateStatusPedidoAceito: TFDQuery;
    _qryListaPedidoExport_Entregador: TFDQuery;
    _qryInsertClienteIfood: TFDQuery;
    _qryUpdateClienteIfood: TFDQuery;
    _qryListaPedidoExport: TFDQuery;
    _qryAtualizaNrGenerator: TFDQuery;
    _qryGetPedidosConfirmados: TFDQuery;
    _qryUpdateStatusPedidoConfirmado: TFDQuery;
    _qrySQL: TFDQuery;
    _qryCdLoja_by_MerchanID: TFDQuery;
    _qryUpdateStatusPedidoRetirado: TFDQuery;
    _qryGetPedidosRetirados: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
    procedure _qryListaLogsGeralTIPOCHAMADAGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
    procedure _qryListaLogsGeralSTATUSLOGGetText(Sender: TField;
      var Text: string; DisplayText: Boolean);
  private
    { Private declarations }
  public
    { Public declarations }
    Proc: TFuncAndProc;
    ConexaoOK: Boolean;
    PegaDataInicial, PegaDataFinal: TDateTime;

    { tela de mensagem dos avisos de pedidos }
    fAlertaMsn: TForm;

    class function DataSetToJson(pDataSetPedido, pDataSetPagamento: TDataSet; aCdPedido: Integer): String;

    procedure ChamarAlerta(vNomeCLiente: String);
    procedure TocarBip;
    procedure GravaLog(Msg: String);
    function InserirPedidoZAP(AceitaPedidoAut: Boolean; NomeJSON: String): Integer;

    function StrToCurrJson(param: String): Currency;
    function GetTokenBD(Reboot: Boolean = False): String;
    function ExecSQL(SQL: String): Boolean;
    function SetCadCliente(aBairro, aCEP, aCidade, aComplemento, aCPF, aFoneiFood, aLogradouro, aNome, aNrEndereco, aPhoneLozalizer, aPontoReferencia, aUuIdIfood: String; aIdIfood: Integer): Integer;

    procedure InsertTokenBD(pOperacao: Integer;  pDataExpiracao: TDateTime; pAutorizationCode, pAutorizationCodeVerifier,
      pRefreshToken, pToken: String);

    procedure InsertpagamentosiFood(pCdPedido: Integer; pMethod, pName, pPrepaid, pType: String;
      pValue: Currency);

    procedure InsertLogs(pCdPedido, pTipoChamada: Integer; pAcao, pEnviado, pNomeServico, pStatusLog, pRecebido: String);

    function ListaPedidos(vPegaDataInicial, vPegaDataFinal: TDateTime; vIndex, vCodigoiFood, vSeqDelivery: Integer;
      vNome: String): Boolean;

  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses Windows, UFormNotificaMensagem, uFormMain;

{$R *.dfm}

{ TDM }

procedure TDM.ChamarAlerta(vNomeCLiente: String);
var
 tipo: TTipoNotificacao;
 efeito: TTipoEfeito;
begin
  tipo := tnAviso;

  efeito := teDeslizando;

  notificaMensagem('Atenção... O Cliente ' + vNomeCLiente + ' solicitou atendimento Humano, responda o mais breve possível!', 'Aviso do Sistema', tipo, efeito, 5000);
end;


procedure TDM.DataModuleCreate(Sender: TObject);
var
  vResult, CaminhoAplicacao, DeleteSQL: string;
  vArray: TArray<string>;
  sql_txt: TStringList;
  i: Integer;
begin

  CaminhoAplicacao := ExtractFilePath(GetModuleName(HInstance));
  FDConnection1.Params.Clear;

  FDConnection1.Params.Values['DataBase']     := CaminhoAplicacao + 'BancoDados.fdb';
  FDConnection1.Params.Values['User_Name']    := 'SYSDBA';
  FDConnection1.Params.Values['Password']     := '';
  FDConnection1.Params.Values['Server']       := '';
  FDConnection1.Params.Values['Protocol']     := 'Local';
  FDConnection1.Params.Values['CharacterSet'] := 'WIN1252';
  FDConnection1.Params.Values['DriverID']     := 'FB';

  FDPhysFBDriverLink1.Embedded := True;
  FDPhysFBDriverLink1.VendorLib := CaminhoAplicacao + 'fbclient.dll';

  if not DirectoryExists(CaminhoAplicacao + 'ArqLog') then
    ForceDirectories(CaminhoAplicacao + 'ArqLog');

  {_qryDeletePolling.Params[0].AsDateTime := Now - 2;
  _qryDeletePolling.ExecSQL;
  _qryDeletePolling.Connection.Commit;

  _qryDeletePedidos.Params[0].AsDateTime := Now - 2;
  _qryDeletePedidos.ExecSQL;
  _qryDeletePedidos.Connection.Commit;

  _qryDeleteLogs.Params[0].AsDateTime := Now - 2;
  _qryDeleteLogs.ExecSQL;
  _qryDeleteLogs.Connection.Commit;}



  if FileExists(CaminhoAplicacao + 'SQL.txt') then
  begin

    sql_txt := TStringList.Create;
    try

      sql_txt.LoadFromFile(CaminhoAplicacao + 'SQL.txt');
      vResult := sql_txt.Text;
      vArray  := vResult.Split(['|']);

      for i := 0 to Length(vArray) -1 do
      begin
        //ShowMessage(vArray[i]);

        try
          _qrySQL.SQL.Clear;
          _qrySQL.SQL.Text := vArray[i];
          _qrySQL.ExecSQL;
          _qrySQL.Connection.Commit;

        except
          on e: Exception do
          begin

          end;
        end;

      end;

    finally
      FreeAndNil(sql_txt);
    end;
    DeleteSQL := CaminhoAplicacao +  'SQL.txt';
    DeleteFile(PCHar(DeleteSQL));
  end;


  {FDConnection1.Params.Values['DataBase']     := ExtractFilePath(GetModuleName(HInstance)) + 'BancoDados.fdb';
  FDConnection1.Params.Values['User_Name']    := 'SYSDBA';
  FDConnection1.Params.Values['Password']     := 'masterkey';
  FDConnection1.Params.Values['Server']       := '127.0.0.1';
  FDConnection1.Params.Values['Protocol']     := 'Local';
  FDConnection1.Params.Values['CharacterSet'] := 'WIN1252';
  FDConnection1.Params.Values['DriverID']     := 'FB';

  FDPhysFBDriverLink1.VendorLib := 'C:\iFood\fbclient.dll'; }
end;

class function TDM.DataSetToJson(pDataSetPedido, pDataSetPagamento: TDataSet;
  aCdPedido: Integer): String;
var
  ArrayJSon: TJSONArray;
  ObjJSonPai: TJSONObject;
  ObjJSon: TJSONObject;
  strJSon: TJSONString;
  intJSon: TJSONNumber;
  pField: TField;
  json_txt: TStringList;
  JSONPedido, JSONPag: String;
begin
  ArrayJSon := TJSONArray.Create;
  ObjJSonPai := TJSONObject.Create;

  try
    pDataSetPedido.First;
    while not pDataSetPedido.Eof do
    begin
      ObjJSon := TJSONObject.Create;
      for pField in pDataSetPedido.Fields do
        case pField.DataType of
          ftString:
            begin
              strJSon := TJSONString.Create(pField.AsString);
              ObjJSon.AddPair(pField.FieldName, strJSon);
            end;
          ftInteger:
            begin
              intJSon := TJSONNumber.Create(pField.AsInteger);
              ObjJSon.AddPair(pField.FieldName, intJSon);
            end;
          ftCurrency:
            begin
              //strJSon := TJSONString.Create(StringReplace(pField.AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
              strJSon := TJSONString.Create(pField.AsString);
              ObjJSon.AddPair(pField.FieldName,  strJSon);
            end;
          else // casos gerais são tratados como string
          begin
            strJSon := TJSONString.Create(pField.AsString);
            ObjJSon.AddPair(pField.FieldName, strJSon);
          end;
        end;
      ArrayJSon.AddElement(ObjJSon);
      pDataSetPedido.next;
    end;

    ObjJSonPai.AddPair('Pedido',ArrayJSon);

    JSONPedido := ObjJSonPai.ToString;

  finally
    FreeAndNil(ObjJSonPai);
  end;

  ArrayJSon := TJSONArray.Create;
  ObjJSonPai := TJSONObject.Create;
  json_txt := TStringList.Create;

  try
    pDataSetPagamento.First;
    while not pDataSetPagamento.Eof do
    begin
      ObjJSon := TJSONObject.Create;
      for pField in pDataSetPagamento.Fields do
        case pField.DataType of
          ftString:
            begin
              strJSon := TJSONString.Create(pField.AsString);
              ObjJSon.AddPair(pField.FieldName, strJSon);
            end;
          ftInteger:
            begin
              intJSon := TJSONNumber.Create(pField.AsInteger);
              ObjJSon.AddPair(pField.FieldName, intJSon);
            end;
          ftCurrency:
            begin
              //strJSon := TJSONString.Create(StringReplace(pField.AsString, ',', '.',[rfReplaceAll, rfIgnoreCase]));
              strJSon := TJSONString.Create(pField.AsString);
              ObjJSon.AddPair(pField.FieldName,  strJSon);
            end;
          else // casos gerais são tratados como string
          begin
            strJSon := TJSONString.Create(pField.AsString);
            ObjJSon.AddPair(pField.FieldName, strJSon);
          end;
        end;
      ArrayJSon.AddElement(ObjJSon);
      pDataSetPagamento.next;
    end;

    ObjJSonPai.AddPair('Pagamento',ArrayJSon);

    JSONPag := ObjJSonPai.ToString;

    //remove a  { chave } do inicio e do fim do arquivo
    JSONPedido := Copy(JSONPedido, 2, Length(JSONPedido) - 2);

    //remove a  { chave } do inicio e do fim do arquivo
    JSONPag := Copy(JSONPag, 2, Length(JSONPag) - 2);

    //adiciona a { chave } no inicio e no final com a virgula separando os objetos
    json_txt.Text := '{' + JSONPedido + ',' +JSONPag + '}';

    json_txt.SaveToFile('C:\temp\'+ FormatDateTime('dd-mm-yyyy', Now) + '_' + FormatFloat('00000', aCdPedido) + '.json');
    result := ObjJSonPai.ToString;

  finally
    FreeAndNil(ObjJSonPai);
    FreeAndNil(json_txt);
  end;

end;

function TDM.ExecSQL(SQL: String): Boolean;
var
  qry: TFDQuery;
begin
  qry := TFDQuery.Create(Self);

  try
    qry.Connection := FDConnection1;
    qry.SQL.Clear;

    qry.SQL.Text := SQL;
    qry.ExecSQL;
    qry.Connection.Commit;
    Result := True;

  finally
    qry.Free;
  end;
end;

function TDM.GetTokenBD(Reboot: Boolean = False): String;
begin
  if not Reboot then
  begin
    _qryGetTokenBD.Close;
    _qryGetTokenBD.Open;

    if not _qryGetTokenBD.IsEmpty then
      Result :=  _qryGetTokenBD.FieldByName('authorizationcode').AsString + '|' + _qryGetTokenBD.FieldByName('authorizationcodeverifier').AsString + '|' + DateTimeToStr(_qryGetTokenBD.FieldByName('DataExpiracao').AsDateTime) + '|' + _qryGetTokenBD.FieldByName('refreshtoken').AsString + '|' + _qryGetTokenBD.FieldByName('Token').AsString + '|' + '1'
    else
      Result := '' + '|' + '' + '|' + DateTimeToStr(Now) + '|' + '' + '|' + '' + '|' + '0';
  end
  else begin
    _qryDeleteConfig.ExecSQL;
    _qryDeleteConfig.Connection.Commit;
    Result := '' + '|' + '' + '|' + DateTimeToStr(Now) + '|' + '' + '|' + '' + '|' + '0';
  end;

end;

procedure TDM.GravaLog(Msg: String);
var
  Txt: TextFile;
  Arq: string;
begin
  try

     try
       Arq := ExtractFilePath( Application.ExeName ) + '\LogSmartFood.txt';
       AssignFile( Txt, Arq );
       if FileExists( Arq ) then
          Append( Txt )
       else
          Rewrite( Txt );
       Writeln( Txt, DateTimeToStr( Now ) +  ' - ' + Msg );
     finally
       CloseFile( Txt );
     end;

  except
    on e: Exception do
    begin

    end;
  end;
end;


procedure TDM.InsertLogs(pCdPedido, pTipoChamada: Integer; pAcao, pEnviado, pNomeServico, pStatusLog,
  pRecebido: String);
begin

  try

    _qryInsertLogs.Params[0].AsInteger  := pCdPedido;
    _qryInsertLogs.Params[1].AsString   := pAcao;

    if pEnviado = '' then
      _qryInsertLogs.Params[2].Clear
    else
      _qryInsertLogs.Params[2].AsMemo   := AnsiString(pEnviado);

    _qryInsertLogs.Params[3].AsString   := pNomeServico;
    _qryInsertLogs.Params[4].AsString   := pStatusLog;
    _qryInsertLogs.Params[5].AsInteger  := pTipoChamada; //0=TODAS 1=GCOM 2=IFOOD 3=WHATSAPP

    if pRecebido = '' then
      _qryInsertLogs.Params[6].Clear
    else
      _qryInsertLogs.Params[6].AsMemo   := AnsiString(pRecebido);

    _qryInsertLogs.ExecSQL;
    _qryInsertLogs.Connection.Commit;

  except
    on e: Exception do
    begin
      GravaLog( 'Falha ao inserir Logs no banco... '  +  E.Message);

    end;
  end;


end;

procedure TDM.InsertpagamentosiFood(pCdPedido: Integer; pMethod, pName, pPrepaid,
  pType: String; pValue: Currency);
begin
  _qryInsertPagamentos.Params[0].AsInteger  := pCdPedido;
  _qryInsertPagamentos.Params[1].AsString   := pMethod;
  _qryInsertPagamentos.Params[2].AsString   := pName;
  _qryInsertPagamentos.Params[3].AsString   := pPrepaid;
  _qryInsertPagamentos.Params[4].AsString   := pType;
  _qryInsertPagamentos.Params[5].AsCurrency := pValue;
  _qryInsertPagamentos.ExecSQL;
  _qryInsertPagamentos.Connection.Commit;
end;

procedure TDM.InsertTokenBD(pOperacao: Integer;  pDataExpiracao: TDateTime; pAutorizationCode, pAutorizationCodeVerifier,
  pRefreshToken, pToken: String);
begin

  case pOperacao of
    0: begin
         _qryInsertConfig.Params[0].AsString := pAutorizationCode;
         _qryInsertConfig.Params[1].AsString := pAutorizationCodeVerifier;
         _qryInsertConfig.Params[2].AsInteger := 1;
         _qryInsertConfig.Params[3].AsDateTime := pDataExpiracao;
         _qryInsertConfig.Params[4].AsString := pRefreshToken;
         _qryInsertConfig.Params[5].AsString := pToken;
         _qryInsertConfig.ExecSQL;
         _qryInsertConfig.Connection.Commit;
       end;
    1: begin
         _qryUpdateConfig.Params[0].AsString := pAutorizationCode;
         _qryUpdateConfig.Params[1].AsString := pAutorizationCodeVerifier;
         _qryUpdateConfig.Params[2].AsDateTime := pDataExpiracao;
         _qryUpdateConfig.Params[3].AsString := pRefreshToken;
         _qryUpdateConfig.Params[4].AsString := pToken;
         _qryUpdateConfig.Params[5].AsInteger := 1;
         _qryUpdateConfig.ExecSQL;
         _qryUpdateConfig.Connection.Commit;

       end;
  end;

end;

function TDM.ListaPedidos(vPegaDataInicial, vPegaDataFinal: TDateTime; vIndex, vCodigoiFood, vSeqDelivery: Integer;
  vNome: String): Boolean;
var
  StatusProducao, StatusEntrega, StatusFinalizado, StatusCancelado, StatusPendente: Integer;
begin
  StatusPendente   := 0;
  StatusProducao   := 0;
  StatusEntrega    := 0;
  StatusFinalizado := 0;
  StatusCancelado  := 0;

  try


    PegaDataInicial := StrToDateTime(FormatDateTime('dd/mm/yyyy 00:00', vPegaDataInicial));
    PegaDataFinal   := StrToDateTime(FormatDateTime('dd/mm/yyyy 23:59', vPegaDataFinal));

    if (vCodigoiFood = 0) and (vSeqDelivery = 0) then
    begin
      case vIndex of
        0: begin
             _qryListaPedido.Params[0].Value   := 'T';
             _qryListaPedido.Params[3].Value   := vNome;
             _qryListaPedido.Params[4].Clear;
             _qryListaPedido.Params[5].Clear;
             _qryListaPedido.Params[6].Clear;
           end;
        1: begin
             _qryListaPedido.Params[0].Value   := 'S';
             _qryListaPedido.Params[3].Value   := vNome;
             _qryListaPedido.Params[4].Value   := 'PEA';
             _qryListaPedido.Params[5].Clear;
             _qryListaPedido.Params[6].Clear;
           end;
        2: begin
             _qryListaPedido.Params[0].Value   := 'S';
             _qryListaPedido.Params[3].Value   := vNome;
             _qryListaPedido.Params[4].Value   := 'PDE';
             _qryListaPedido.Params[5].Clear;
             _qryListaPedido.Params[6].Clear;
           end;
        3: begin
             _qryListaPedido.Params[0].Value   := 'S';
             _qryListaPedido.Params[4].Value   := 'PDF';
             _qryListaPedido.Params[5].Clear;
             _qryListaPedido.Params[6].Clear;
           end;
        4: begin
             _qryListaPedido.Params[0].Value   := 'X';
             _qryListaPedido.Params[4].Value   := 'PCC';
             _qryListaPedido.Params[5].Clear;
             _qryListaPedido.Params[6].Clear;
           end;
        5: begin
             _qryListaPedido.Params[0].Value   := 'N';
             _qryListaPedido.Params[4].Value   := 'PNA';
             _qryListaPedido.Params[5].Clear;
             _qryListaPedido.Params[6].Clear;
           end;
      end;
    end
    else begin
      if vSeqDelivery = 0 then
      begin
        _qryListaPedido.Params[0].Value  := 'C';
        _qryListaPedido.Params[3].Value  := vNome;
        _qryListaPedido.Params[4].Clear;
        _qryListaPedido.Params[5].Value := vCodigoiFood;
        _qryListaPedido.Params[6].Clear;

      end
      else begin
        _qryListaPedido.Params[0].Value  := 'Q';
        _qryListaPedido.Params[3].Value  := vNome;
        _qryListaPedido.Params[4].Clear;
        _qryListaPedido.Params[5].Clear;
        _qryListaPedido.Params[6].Value := vSeqDelivery;

      end;
    end;


      {Em preparo
      Saiu para Entrega
      Finalizado
      Cancelado pela Loja
      Cancelado pelo Cliente
      Cancelado pelo iFood}


    _qryListaPedido.Params[1].AsDateTime := PegaDataInicial;
    _qryListaPedido.Params[2].AsDateTime := PegaDataFinal;
    _qryListaPedido.Close;
    _qryListaPedido.Open;
  except
    on E:Exception do
    begin
      GravaLog( 'Listar dados do pedido... '  +  E.Message);
    end;
  end;

  _qryListaPedido.DisableControls;
  _qryListaPedido.First;
  while not _qryListaPedido.Eof do
  begin
    if _qryListaPedido.FieldByName('statuspedido').AsString = 'PEA' then
      StatusProducao := StatusProducao + 1;

    if _qryListaPedido.FieldByName('statuspedido').AsString = 'PDE' then
      StatusEntrega := StatusEntrega + 1;

    if _qryListaPedido.FieldByName('statuspedido').AsString = 'PDF' then
      StatusFinalizado := StatusFinalizado + 1;

    if _qryListaPedido.FieldByName('statuspedido').AsString = 'PCC' then
      StatusCancelado := StatusCancelado + 1;

    if _qryListaPedido.FieldByName('statuspedido').AsString = 'PNA' then
      StatusPendente := StatusPendente + 1;

    _qryListaPedido.Next;
  end;

  _qryListaPedido.First;
  _qryListaPedido.EnableControls;

  _frmMain._lblStatusNovos.Caption       := FormatFloat('00',StatusPendente);
  _frmMain._lblStatusProducao.Caption    := FormatFloat('00',StatusProducao);
  _frmMain._lblStatusEntrega.Caption     := FormatFloat('00',StatusEntrega);
  _frmMain._lblStatusFinalizados.Caption := FormatFloat('00',StatusFinalizado);
  _frmMain._lblStatusCancelados.Caption  := FormatFloat('00',StatusCancelado);
  Result := _qryListaPedido.IsEmpty;

end;

function TDM.SetCadCliente(aBairro, aCEP, aCidade, aComplemento, aCPF, aFoneiFood, aLogradouro, aNome,
  aNrEndereco, aPhoneLozalizer, aPontoReferencia, aUuIdIfood: String; aIdIfood: Integer): Integer;
var
  vsql: TFDQuery;
  CdCliente: Integer;
begin
  Result := 0;

  try

    vsql := TFDQuery.Create(DM);
    try
      vsql.Connection := FDConnection1;
      vsql.SQL.Text :=  _qryGetCdClienteCad.SQL.Text;
      vsql.Params[0].AsInteger := aIdIfood;
      vsql.Close;
      vsql.Open;
      if vsql.IsEmpty then
      begin

        _qryInsertClienteIfood.Params[0].AsString  := aBairro;                                {BAIRRO}
        _qryInsertClienteIfood.Params[1].AsInteger := 5300108;                                {CDMUNICIPIO}
        _qryInsertClienteIfood.Params[2].AsInteger := 53;                                     {CDUF}
        _qryInsertClienteIfood.Params[3].AsString  := aCEP;                                   {CEP}
        _qryInsertClienteIfood.Params[4].AsString  := UpperCase(aCidade);                     {CIDADE}
        _qryInsertClienteIfood.Params[5].AsString  := UpperCase(Copy(aComplemento,1,60));     {COMPLEMENTO}
        _qryInsertClienteIfood.Params[6].AsString  := aCPF;                                   {CPF}
        _qryInsertClienteIfood.Params[7].AsString  := aFoneiFood;                             {FONEIFOOD}
        _qryInsertClienteIfood.Params[8].AsInteger := aIdIfood;                               {IDIFOOD}
        _qryInsertClienteIfood.Params[9].AsString  := UpperCase(Copy(aLogradouro,1,60));      {LOGRADOURO}
        _qryInsertClienteIfood.Params[10].AsString := UpperCase(aNome);                       {NOME}
        _qryInsertClienteIfood.Params[11].AsString := UpperCase(aNrEndereco);                 {NRENDERECO}
        _qryInsertClienteIfood.Params[12].AsString := aPhoneLozalizer;                        {PHONE_LOCALIZER}
        _qryInsertClienteIfood.Params[13].AsString := UpperCase(Copy(aPontoReferencia,1,60)); {PONTOREFERENCIA}
        _qryInsertClienteIfood.Params[14].AsString := aUuIdIfood;                             {UUIDIFOOD}
        _qryInsertClienteIfood.ExecSQL;
        _qryInsertClienteIfood.Connection.Commit;

      end
      else begin
        CdCliente := vsql.FieldByName('CDCLIENTE').AsInteger;

        _qryUpdateClienteIfood.Params[0].AsString   := UpperCase(aBairro);                     {BAIRRO}
        _qryUpdateClienteIfood.Params[1].AsInteger  := 5300108;                                {CDMUNICIPIO}
        _qryUpdateClienteIfood.Params[2].AsInteger  := 53;                                     {CDUF}
        _qryUpdateClienteIfood.Params[3].AsString   := aCEP;                                   {CEP}
        _qryUpdateClienteIfood.Params[4].AsString   := UpperCase(aCidade);                     {CIDADE}
        _qryUpdateClienteIfood.Params[5].AsString   := UpperCase(Copy(aComplemento,1,60));     {COMPLEMENTO}
        _qryUpdateClienteIfood.Params[6].AsString   := aCPF;                                   {CPF}
        _qryUpdateClienteIfood.Params[7].AsString   := aFoneiFood;                             {FONEIFOOD}
        _qryUpdateClienteIfood.Params[8].AsInteger  := aIdIfood;                               {IDIFOOD}
        _qryUpdateClienteIfood.Params[9].AsString   := UpperCase(Copy(aLogradouro,1,60));      {LOGRADOURO}
        _qryUpdateClienteIfood.Params[10].AsString  := aNome;                                  {NOME}
        _qryUpdateClienteIfood.Params[11].AsString  := UpperCase(aNrEndereco);                 {NRENDERECO}
        _qryUpdateClienteIfood.Params[12].AsString  := aPhoneLozalizer;                        {PHONE_LOCALIZER}
        _qryUpdateClienteIfood.Params[13].AsString  := UpperCase(Copy(aPontoReferencia,1,60)); {PONTOREFERENCIA}
        _qryUpdateClienteIfood.Params[14].AsString  := aUuIdIfood;                             {UUIDIFOOD}
        _qryUpdateClienteIfood.Params[15].AsInteger := CdCliente;                              {CDCLIENTE}
        _qryUpdateClienteIfood.ExecSQL;
        _qryUpdateClienteIfood.Connection.Commit;

      end;

    finally
      FreeAndNil(vsql)
    end;


    vsql := TFDQuery.Create(DM);
    try
      vsql.Connection := FDConnection1;
      vsql.SQL.Text :=  _qryGetCdClienteCad.SQL.Text;
      vsql.Params[0].AsInteger := aIdIfood;
      vsql.Close;
      vsql.Open;

      CdCliente := vsql.FieldByName('CDCLIENTE').AsInteger;
      Result := CdCliente;
    finally
      FreeAndNil(vsql)
    end;

  except
    on e: Exception do
    begin
      GravaLog( 'Falha ao SetCadCliente... '  +  E.Message);
    end;
  end;
end;

function TDM.StrToCurrJson(param: String): Currency;
begin
  Result := StrToCurrDef( StringReplace(StringReplace(param, '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase]),0);
end;

function TDM.InserirPedidoZAP(AceitaPedidoAut: Boolean; NomeJSON: String): Integer;
var
  vJSON, vItensPedido: TJSONObject;
  json_txt: TStringList;
  vPedido: TJSONArray;
  i, vCdProdutoPai: Integer;
  GetSeqDelivery, NrItem: Integer;
  PedidoInserido: Boolean;
  Origem, Destino: String;
  D, O: PWideChar;
begin
  Result := 0;
  PedidoInserido := False;
  NrItem := 0;
  json_txt := TStringList.Create;
  try
    json_txt.LoadFromFile('C:\temp\' + NomeJSON);
    vJSON := TJSONObject.ParseJSONValue(json_txt.Text) as TJSONObject;
    try

      try

        vPedido := vJSON.GetValue<TJSONArray>('Dados') as TJSONArray;
        for i := 0 to vPedido.Count -1 do
        begin

          vItensPedido := vPedido.Items[i] as TJSONObject;
          if not PedidoInserido then
          begin
            Result := vItensPedido.GetValue<Integer>('CDPEDIDO');
            _qryGetClienteCad.Params[0].AsInteger := vItensPedido.GetValue<Integer>('CDCLIENTE');
            _qryGetClienteCad.Close;
            _qryGetClienteCad.Open;

            if _qryGetClienteCad.IsEmpty then
            begin
              _qryInsertClienteZAP.Params[0].AsInteger   := vItensPedido.GetValue<Integer>('CDCLIENTE');                     //CDCLIENTE
              _qryInsertClienteZAP.Params[1].AsString    := UpperCase(vItensPedido.GetValue<string>('BAIRRO'));              //BAIRRO
              _qryInsertClienteZAP.Params[2].AsString    := vItensPedido.GetValue<string>('CEP');                            //CEP
              _qryInsertClienteZAP.Params[3].AsInteger   := vItensPedido.GetValue<Integer>('CDMUNICIPIO');                   //CDMUNICIPIO
              _qryInsertClienteZAP.Params[4].AsString    := vItensPedido.GetValue<string>('CDUF');                           //CDUF
              _qryInsertClienteZAP.Params[5].AsString    := UpperCase(vItensPedido.GetValue<string>('CIDADE'));              //CIDADE
              _qryInsertClienteZAP.Params[6].AsString    := UpperCase(vItensPedido.GetValue<string>('COMPLEMENTOENDERECO')); //COMPLEMENTOENDERECO
              _qryInsertClienteZAP.Params[7].AsString    := vItensPedido.GetValue<string>('CPF');                            //CPF
              _qryInsertClienteZAP.Params[8].AsString    := vItensPedido.GetValue<string>('FONECEL');                        //FONECEL
              _qryInsertClienteZAP.Params[9].AsString    := UpperCase(vItensPedido.GetValue<string>('LOGRADOURO'));          //LOGRADOURO
              _qryInsertClienteZAP.Params[10].AsString   := UpperCase(vItensPedido.GetValue<string>('NOME'));                //NOME
              _qryInsertClienteZAP.Params[11].AsString   := UpperCase(vItensPedido.GetValue<string>('NRENDERECO'));          //NRENDERECO
              _qryInsertClienteZAP.Params[12].AsString   := UpperCase(vItensPedido.GetValue<string>('PONTOREFERENCIA'));     //PONTOREFERENCIA
              _qryInsertClienteZAP.ExecSQL;
              _qryInsertClienteZAP.Connection.Commit;
            end;

            _qryGetSeqDelivery.Params[0].AsDateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy 00:00:00', Now));
            _qryGetSeqDelivery.Close;
            _qryGetSeqDelivery.Open;
            GetSeqDelivery := _qryGetSeqDelivery.FieldByName('SEQDELIVERY').AsInteger;

            _qryInsertPedido_ZAP.Params[0].AsInteger  := vItensPedido.GetValue<Integer>('CDPEDIDO');                   //CDPEDIDO
            _qryInsertPedido_ZAP.Params[1].AsInteger  := vItensPedido.GetValue<Integer>('CDLOJA');                     //CDLOJA_GCONNECT
            _qryInsertPedido_ZAP.Params[2].AsInteger  := vItensPedido.GetValue<Integer>('CDCLIENTE');                  //CDCLIENTE
            _qryInsertPedido_ZAP.Params[3].AsInteger  := vItensPedido.GetValue<Integer>('CDCLIENTE');                  //CDPAGAMENTO
            _qryInsertPedido_ZAP.Params[4].AsInteger  := vItensPedido.GetValue<Integer>('VALORRECEBIDO');              //CHANGEFOR
            _qryInsertPedido_ZAP.Params[5].AsDateTime := StrToDateTime(vItensPedido.GetValue<string>('DATA'));         //DATAPEDIDO
            _qryInsertPedido_ZAP.Params[6].AsDateTime := StrToDateTime(vItensPedido.GetValue<string>('DATA'));         //DATAACEITE
            _qryInsertPedido_ZAP.Params[7].AsCurrency := StrToCurrJson(vItensPedido.GetValue<string>('VALORENTREGA')); //DELIVERYFEE
            _qryInsertPedido_ZAP.Params[8].AsString   := 'NOMELOJA';                                                   //NOMELOJA
            _qryInsertPedido_ZAP.Params[9].AsInteger  := GetSeqDelivery;                                               //SEQDELIVERY

            if AceitaPedidoAut then
              _qryInsertPedido_ZAP.Params[10].AsString   := 'PEA'                                                       //STATUSPEDIDO
            else
              _qryInsertPedido_ZAP.Params[10].AsString   := 'PNA';                                                      //STATUSPEDIDO

            _qryInsertPedido_ZAP.Params[11].AsCurrency := StrToCurrJson(vItensPedido.GetValue<string>('VALOR_TOTAL')) +
                                                         StrToCurrJson(vItensPedido.GetValue<string>('VALORENTREGA'));  //SUBTOTAL
            _qryInsertPedido_ZAP.Params[12].AsInteger := vItensPedido.GetValue<Integer>('TIPOENTREGA');                 //1=DELIVERY 2=TAKEOUT

            _qryInsertPedido_ZAP.Params[13].AsCurrency := StrToCurrJson(vItensPedido.GetValue<string>('VALOR_TOTAL'));  //VALORTOTAL

            InsertpagamentosiFood(vItensPedido.GetValue<Integer>('CDPEDIDO'),
                                  ifthen(vItensPedido.GetValue<string>('FORMA_PGT') = 'DINHEIRO','DIN','CAR'), //method = CREDIT, DEBIT, CASH,
                                  vItensPedido.GetValue<string>('FORMA_PGT'), //name
                                  'false',//prepaid
                                  'OFFLINE', //type
                                  StrToCurrJson(vItensPedido.GetValue<string>('VALORENTREGA')));

            _qryInsertPedido_ZAP.ExecSQL;
            _qryInsertPedido_ZAP.Connection.Commit;
            PedidoInserido := True;
          end;


          //if not _frmConcentrador._checkAdcComoProd.Checked then
          if not True then
          begin
            if vItensPedido.GetValue<string>('ISADICIONALPROD') = 'N' then
            begin
              NrItem := NrItem + 1;
              vCdProdutoPai := StrToInt( vItensPedido.GetValue<string>('CDPRODUTO'));
              _qryInsertPedidoItens.Params[0].AsInteger   := vItensPedido.GetValue<Integer>('CDPEDIDO');                                                                                                                               {CDPEDIDO}
              _qryInsertPedidoItens.Params[1].AsInteger   := vItensPedido.GetValue<Integer>('CDPRODUTO');                                                                                                                              {EXTERNALCODE}
              _qryInsertPedidoItens.Params[2].Clear;                                                                                                                                                                                   {EXTERNALCODE_PAI}
              _qryInsertPedidoItens.Params[3].AsString    := UpperCase(vItensPedido.GetValue<string>('DESCRICAO'));                                                                                                                               {NAME}
              _qryInsertPedidoItens.Params[4].AsString    := 'N';                                                                                                                                                                      {ISAUXILIAR}
              _qryInsertPedidoItens.Params[5].AsInteger   := NrItem;                                                                                                                                                                   {NRITEM}
              _qryInsertPedidoItens.Params[6].AsString    := UpperCase(vItensPedido.GetValue<string>('DESCRICAOAUXILIAR'));                                                                                                                       {OBSERVATIONS}
              _qryInsertPedidoItens.Params[7].AsCurrency  := vItensPedido.GetValue<Integer>('QUANTIDADE');                                                                                                                             {QUANTITY}
              _qryInsertPedidoItens.Params[8].AsCurrency  := 0;                                                                                                                                                                        {DISCOUNT}
              _qryInsertPedidoItens.Params[9].AsCurrency  := StrToCurr( StringReplace(StringReplace(vItensPedido.GetValue<string>('PRECOFINALVENDA'), '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase]));  {PRICE}
              _qryInsertPedidoItens.Params[10].AsString   := 'S';                                                                                                                                                                      {STATUSINTEGRADO}
              _qryInsertPedidoItens.Params[11].AsCurrency := StrToCurr( StringReplace(StringReplace(vItensPedido.GetValue<string>('PRECOFINALVENDA'), '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase])) *
                                                             StrToCurr( StringReplace(StringReplace(vItensPedido.GetValue<string>('QUANTIDADE'), '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase]));;      {TOTALPRICE}

              _qryInsertPedidoItens.ExecSQL;
              _qryInsertPedidoItens.Connection.Commit;

            end
            else begin
              _qryInsertPedidoItens.Params[0].AsInteger   := vItensPedido.GetValue<Integer>('CDPEDIDO');                                                                                                                               {CDPEDIDO}
              _qryInsertPedidoItens.Params[1].AsInteger   := vItensPedido.GetValue<Integer>('CDPRODUTO');                                                                                                                              {EXTERNALCODE}
              _qryInsertPedidoItens.Params[2].AsInteger   := vCdProdutoPai;                                                                                                                                                            {EXTERNALCODE_PAI}
              _qryInsertPedidoItens.Params[3].AsString    := UpperCase(vItensPedido.GetValue<string>('DESCRICAO'));                                                                                                                               {NAME}
              _qryInsertPedidoItens.Params[4].AsString    := 'S';                                                                                                                                                                      {ISAUXILIAR}
              _qryInsertPedidoItens.Params[5].AsInteger   := NrItem;                                                                                                                                                                   {NRITEM}
              _qryInsertPedidoItens.Params[6].AsString    := UpperCase(vItensPedido.GetValue<string>('DESCRICAOAUXILIAR'));                                                                                                                       {OBSERVATIONS}
              _qryInsertPedidoItens.Params[7].AsCurrency  := vItensPedido.GetValue<Integer>('QUANTIDADE');                                                                                                                             {QUANTITY}
              _qryInsertPedidoItens.Params[8].AsCurrency  := 0;                                                                                                                                                                        {DISCOUNT}
              _qryInsertPedidoItens.Params[9].AsCurrency  := StrToCurr( StringReplace(StringReplace(vItensPedido.GetValue<string>('PRECOFINALVENDA'), '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase]));  {PRICE}
              _qryInsertPedidoItens.Params[10].AsString   := 'S';                                                                                                                                                                      {STATUSINTEGRADO}
              _qryInsertPedidoItens.Params[11].AsCurrency := StrToCurr( StringReplace(StringReplace(vItensPedido.GetValue<string>('PRECOFINALVENDA'), '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase])) *
                                                             StrToCurr( StringReplace(StringReplace(vItensPedido.GetValue<string>('QUANTIDADE'), '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase]));;      {TOTALPRICE}

              _qryInsertPedidoItens.ExecSQL;
              _qryInsertPedidoItens.Connection.Commit;

            end;

          end
          else begin

              NrItem := NrItem + 1;
              //vCdProdutoPai := StrToInt( vItensPedido.GetValue<string>('CDPRODUTO'));
              _qryInsertPedidoItens.Params[0].AsInteger   := vItensPedido.GetValue<Integer>('CDPEDIDO');                                                                                                                               {CDPEDIDO}
              _qryInsertPedidoItens.Params[1].AsInteger   := vItensPedido.GetValue<Integer>('CDPRODUTO');                                                                                                                              {EXTERNALCODE}
              _qryInsertPedidoItens.Params[2].Clear;                                                                                                                                                                                   {EXTERNALCODE_PAI}
              _qryInsertPedidoItens.Params[3].AsString    := UpperCase(vItensPedido.GetValue<string>('DESCRICAO'));                                                                                                                               {NAME}
              _qryInsertPedidoItens.Params[4].AsString    := 'N';                                                                                                                                                                      {ISAUXILIAR}
              _qryInsertPedidoItens.Params[5].AsInteger   := NrItem;                                                                                                                                                                   {NRITEM}
              _qryInsertPedidoItens.Params[6].AsString    := UpperCase(vItensPedido.GetValue<string>('DESCRICAOAUXILIAR'));                                                                                                                       {OBSERVATIONS}
              _qryInsertPedidoItens.Params[7].AsCurrency  := vItensPedido.GetValue<Integer>('QUANTIDADE');                                                                                                                             {QUANTITY}
              _qryInsertPedidoItens.Params[8].AsCurrency  := 0;                                                                                                                                                                        {DISCOUNT}
              _qryInsertPedidoItens.Params[9].AsCurrency  := StrToCurr( StringReplace(StringReplace(vItensPedido.GetValue<string>('PRECOFINALVENDA'), '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase]));  {PRICE}
              _qryInsertPedidoItens.Params[10].AsString   := 'S';                                                                                                                                                                      {STATUSINTEGRADO}
              _qryInsertPedidoItens.Params[11].AsCurrency := StrToCurr( StringReplace(StringReplace(vItensPedido.GetValue<string>('PRECOFINALVENDA'), '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase])) *
                                                             StrToCurr( StringReplace(StringReplace(vItensPedido.GetValue<string>('QUANTIDADE'), '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase]));;      {TOTALPRICE}

              _qryInsertPedidoItens.ExecSQL;
              _qryInsertPedidoItens.Connection.Commit;

          end;


        end;
        Origem := 'C:\temp\' + NomeJSON;
        Destino := 'C:\temp\importado\' + NomeJSON;
        O := PWideChar(Origem);
        D := PWideChar(Destino);
        MoveFile(O, D);

      except
        on e: Exception do
        begin
          DM.GravaLog( 'Falha ao gravar pedidos do ZAP ' + 'detalhes do erro: ' + e.Message);
        end;
      end;

    finally
      FreeAndNil(vJSON);
    end;

  finally
    FreeAndNil(json_txt);
  end;



end;

procedure TDM.TocarBip;
begin
  Windows.Beep(5000, 200);
  Windows.Beep(1000, 200);
  Windows.Beep(3000, 200);
  Windows.Beep(5000, 200);
  Windows.Beep(7000, 200);
end;

procedure TDM._qryListaLogsGeralSTATUSLOGGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
 if Sender.AsString = 'S' then
   Text := 'OK'
 else
   Text := 'ERRO';

end;

procedure TDM._qryListaLogsGeralTIPOCHAMADAGetText(Sender: TField;
  var Text: string; DisplayText: Boolean);
begin
  case Sender.AsInteger of
    0: Text := 'TODAS';
    1: Text := 'GCOM';
    2: Text := 'IFOOD';
    3: Text := 'WHATSAPP';
  end;
end;

end.
