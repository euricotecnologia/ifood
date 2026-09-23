unit Thread.IFood;

interface

uses
  System.Classes, FireDAC.Stan.Param, Data.DB, WiniNet, Vcl.Dialogs, REST.Client, REST.Types,
  Vcl.StdCtrls, System.IniFiles, System.DateUtils, FireDAC.Comp.Client, REST.Response.Adapter,
  System.JSON, System.Generics.Collections, FireDAC.Phys.FB, REST.Json, UIFoodRecord,
  Winapi.Windows, Vcl.Forms, REST.Authenticator.Basic, StrUtils, System.SysUtils, System.Types,
  ACBrUtil, Vcl.ExtCtrls;

type

  TConnectionOnException = procedure(EClassName, EMessage: String; xMsg: String = '') of object;

type

  TThreadNFe_NFCe = class(TThread)
  private
    const
      PING_GOOGLE_DOMAIN_BR   = 'https://www.google.com.br';
      PING_FACEBOOK_DOMAIN_BR = 'https://www.facebook.com.br';
      PING_GOOGLE_IPV4_BR     = '173.194.42.152';
      PING_GOOGLE_IPV4_USA    = '173.194.42.148';
      ERR_LOCAL_NETWORK       = 'Cabo de rede desconectado ou rede local mal-configurada';
      ERR_INTERNET_OFFLINE    = 'Sem conexão com a internet.';

    var
      FOnException: TConnectionOnException;

      FTimeCheck: Cardinal;
      FTimeCheck_Half: Cardinal;
      InicioThread: Cardinal;
      FLastUpdate, FLastUpdate_Half: Cardinal;

      FRestClient: TRESTClient;
      FRestRequest: TRESTRequest;
      FRestResponse: TRESTResponse;


      FToken, ClientID, ClientSecret, Username, Password, FMerchantID,
      FAuthorizationCode, FRefreshToken, FAuthorizationCodeVerifier,
      FAccessToken: String;

      FMemo, FMemoPedido: TMemo;
      FalertaMsn: TForm;
      FEdit: TEdit;
      FIFood: TIFoodRecord;
      FLabelUltAtualizacao, FStatusLoja: TLabel;
      FimgStatus: TImage;
      FConn: TFDConnection;
      FDPhysFBDriverLink1: TFDPhysFBDriverLink;

      FQuery, FQueryPedidos: TFDQuery;
      FirstExec, FAceitaPedidoAuto, FImprimeViaEntregadorAut, FAdcComoProd: Boolean;

    function InserePedidoINI(vDeliveryDateTime, vDeliveryDateTimeStart, vDeliveryDateTimeEnd, vIsAgendado, vREFERENCE, vSHORTREFERENCE: String): Integer;

    procedure InserePedidoItem(vCDPEDIDO, vCDPRODUTO, vCDPRODUTOPAI, vNRITEM: Integer;
     vDESCRICAO, vISAUXILIAR, vOBSERVATIONS: String; vQUANTIDADE, vVL_DESCONTO, vVL_UNITARIO, vVL_TOTAL: Currency);

    function TrataTexto(const pText: string): string;
    procedure DoProgress;
    procedure loadCredentials;
    procedure createComponents;

    procedure destroyComponents;
    function GetToken: Boolean;
    procedure Polling;
    procedure GetOrder;
    procedure GetPedidos_Aceitos_Cancelados_Confirmados;
    procedure Acknowledgment;
    procedure ConfirmaPedido(vCdPedido: Integer; orderId: String);

    procedure StatusMerchants;
    procedure GravaLog(Msg: String);

    procedure AtualizaPedido(vCREATEDAT, vID, vNOMELOJA, vSTATUSPEDIDO: String;
      vCDCLIENTE, VCDLOJA_GCONNECT, vCDPEDIDO: Integer; vCHANGEFOR, vDELIVERYFEE, vSUBTOTAL, VTAXAADICIONAL, VTIPOENTREGA, VTOTALPRICE: Currency);

    procedure VerificaPedidos_and_Status;

    procedure ChamarAlerta(QtdePedidos, Loja: String);
    procedure TocarBip;

    procedure DestruirObjetos;
  protected
    procedure Execute; override;

    function CheckInternet: Boolean;
  public
    constructor Create(CreateSuspended: Boolean; aMemo, aMemoPedido: TMemo; aEdit: TEdit; aLabelUltAtualizacao, aStatusLoja: TLabel;
      aAuthorizationCode, aAuthorizationCodeVerifier, aRefreshToken, aMerchantID: String; aimgStatus: TImage);

    property IntervaloVerificacao: Cardinal read FTimeCheck write FTimeCheck default 300;
    property IntervaloVerificacao_Half: Cardinal read FTimeCheck_Half write FTimeCheck_Half default 150;

    destructor Destroy; override;
  end;

implementation

uses
  UDM, AlertaMsg, uFormMain;

{ TThreadCheckConnection }

procedure TThreadNFe_NFCe.Acknowledgment;
var
  parameter: TRESTRequestParameter;
  jsonArray: TJSONArray;
  Envio, Body: String;
begin

  DM._qryPolling.Close;
  DM._qryPolling.Open;

  if not DM._qryPolling.IsEmpty then
  begin

    createComponents;
    try
      FRestClient.BaseURL := 'https://merchant-api.ifood.com.br/order/v1.0';
      FRESTClient.ContentType := 'application/json';
      FRESTRequest.Accept := 'application/json';
      FRESTRequest.Method := rmPOST;
      FRESTRequest.Resource := '/events/acknowledgment';

      parameter := FRESTRequest.Params.AddHeader('Authorization', 'Bearer ' + FToken);
      parameter.Options := [poDoNotEncode];

      jsonArray := TJSONArray.Create;
      try

        DM._qryPolling.First;
        while not DM._qryPolling.Eof do
        begin
          jsonArray.Add(TJSONObject.Create(TJSONPair.Create('id',DM._qryPolling.FieldByName('id').AsString)));

          DM._qryPolling.Next;
        end;

        FRestRequest.AddBody(TJson.JsonEncode(jsonArray), ctAPPLICATION_JSON);
        Body := jsonArray.ToString;
      finally
        jsonArray.Free;
      end;


      Envio :=    'BaseURL: '     + FRESTClient.BaseURL + #13 +
                  'ContentType: ' + FRESTClient.ContentType + #13 +
                  'Accept: '      + FRESTRequest.Accept + #13 +
                  'Method: GET'   + #13 +
                  'Body: '        + Body   + #13 +
                   //'Header: '      + parameter.ToString  + #13 +
                  'Resource: '    + FRESTRequest.Resource;

      DM.InsertLogs(0,
                    2,
                    'Envio - Acknowledgment',
                    Envio,
                    'IFOOD - Acknowledgment',
                    'S',
                    '');

      FRestRequest.Execute;

      case FRESTResponse.StatusCode of
        202:
        begin //Accepted. The request may be processed asynchronously

          DM.InsertLogs(0,
                        2,
                        'Resposta - Acknowledgment',
                        '',
                        'IFOOD - Acknowledgment',
                        'S',
                        'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Accepted. The request may be processed asynchronously' + #13  +  #13  + FRestResponse.Content);

         DM._qryUpdatepollingEnviado.ExecSQL;
         DM._qryUpdatepollingEnviado.Connection.Commit;

        end;
        400: //Bad request.
        begin
          DM.InsertLogs(0,
                        2,
                        'Resposta - Acknowledgment',
                        '',
                        'IFOOD - Acknowledgment',
                        'N',
                        'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Bad request.' + #13  +  #13  + FRestResponse.Content);

          raise Exception.CreateFmt(FRESTResponse.Content, []);
        end;
        413: //Payload too large. You may acknowledge at most 10000 events at a time.
        begin
          DM.InsertLogs(0,
                        2,
                        'Resposta - Acknowledgment',
                        '',
                        'IFOOD - Acknowledgment',
                        'N',
                        'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Payload too large. You may acknowledge at most 10000 events at a time.' + #13  +  #13  + FRestResponse.Content);

          raise Exception.CreateFmt(FRESTResponse.Content, []);
        end;
        415: //Unsupported Media Type
        begin
          DM.InsertLogs(0,
                        2,
                        'Resposta - Acknowledgment',
                        '',
                        'IFOOD - Acknowledgment',
                        'N',
                        'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Unsupported Media Type' + #13  +  #13  + FRestResponse.Content);

          raise Exception.CreateFmt(FRESTResponse.Content, []);
        end;
        500: //Internal Server Error
        begin
          DM.InsertLogs(0,
                        2,
                        'Resposta - Acknowledgment',
                        '',
                        'IFOOD - Acknowledgment',
                        'N',
                        'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Internal Server Error' + #13  +  #13  + FRestResponse.Content);

          raise Exception.CreateFmt(FRESTResponse.Content, []);
        end;
      end;


    finally
      destroyComponents;
    end;

  end;

end;

procedure TThreadNFe_NFCe.ChamarAlerta(QtdePedidos, Loja: String);
var
  I: Integer;
  BarraIniciar: HWND; {Barra Iniciar}
  tmAltura: Integer;
  tmRect: TRect;
  xTop : Integer;
  xIniTop : Integer;
begin

  //localiza o Handle da janela iniciar
  BarraIniciar := FindWindow('Shell_TrayWnd', nil);
  //Pega o "retângulo" que envolve a barra e sua altura
  GetWindowRect(BarraIniciar, tmRect);
  tmAltura := tmRect.Bottom - tmRect.Top;
  FalertaMsn := TFAlertaMsg.Create(Application);

  with FalertaMsn do
  begin
    Left := (Screen.Width - ClientWidth) - 10;
    if tmRect.Top = -2 then
       tmAltura := 5;

       Tag := StrToInt(QtdePedidos);
       Caption := Loja;

    //Pega o top final
    xTop := Screen.Height - ClientHeight - tmAltura;
    //Pega o top inicial
    xIniTop := Screen.Height + ClientHeight + tmAltura;
    Top := xIniTop;
    for I := xIniTop downto xTop do
    begin
       Top := Top - 1;
       Show;
       Update;
       Application.ProcessMessages;
       //Sleep(1);
    end;
    TocarBip;
    Sleep(3000);
    Close;
    FreeAndNil(FalertaMsn);
    end;

end;


function TThreadNFe_NFCe.CheckInternet: Boolean;
var test1,test2,test3,test4:LongBool;
begin
  try
    test1   :=  InternetCheckConnection(PING_GOOGLE_DOMAIN_BR,1,0);
    Result  :=  test1;
    if not ( test1 ) then
    begin
      test2   :=  InternetCheckConnection(PING_GOOGLE_IPV4_BR,1,0);
      test3   :=  InternetCheckConnection(PING_GOOGLE_IPV4_USA,1,0);
      test4   :=  InternetCheckConnection(PING_FACEBOOK_DOMAIN_BR,1,0);
      Result  :=  (test2 or test3 or test4);
    end;
  except
    on E:Exception do
    begin
      Result := False;
      if Assigned(FOnException) then
        FOnException(E.ClassName, E.Message);
    end;
  end;
end;

constructor TThreadNFe_NFCe.Create(CreateSuspended: Boolean; aMemo, aMemoPedido: TMemo; aEdit: TEdit;
  aLabelUltAtualizacao, aStatusLoja: TLabel; aAuthorizationCode, aAuthorizationCodeVerifier,
  aRefreshToken, aMerchantID: String; aimgStatus: TImage);
begin
  inherited Create(CreateSuspended);
  FreeOnTerminate := False;
  Priority        := tpLower;
  FTimeCheck      := 30;           //Checar a cada 30 Segundos
  FTimeCheck_Half := 15;           //Checar a cada 15 Segundos
  FLastUpdate     := GetTickCount; //GetTickCount = Returns the number of milliseconds that have elapsed since the system was started.
  FLastUpdate_Half:= GetTickCount; //GetTickCount = Returns the number of milliseconds that have elapsed since the system was started.
  FMemo := aMemo;
  FLabelUltAtualizacao := aLabelUltAtualizacao;
  FMemoPedido := aMemoPedido;
  FEdit := aEdit;
  FirstExec := False;
  InicioThread := 0;

  FAuthorizationCode := aAuthorizationCode;
  FAuthorizationCodeVerifier := aAuthorizationCodeVerifier;
  FRefreshToken := aRefreshToken;
  FMerchantID := aMerchantID;
  FStatusLoja := aStatusLoja;
  FimgStatus := aimgStatus;

  FConn := TFDConnection.Create(nil);
  FDPhysFBDriverLink1 := TFDPhysFBDriverLink.Create(nil);

  FConn.LoginPrompt := False;
  FConn.Params.Clear;

  FConn.Params.Values['DataBase']     := ExtractFilePath(GetModuleName(HInstance)) + 'BancoDados.fdb';
  FConn.Params.Values['User_Name']    := 'SYSDBA';
  FConn.Params.Values['Password']     := '';
  FConn.Params.Values['Server']       := '';
  FConn.Params.Values['Protocol']     := 'Local';
  FConn.Params.Values['CharacterSet'] := 'WIN1252';
  FConn.Params.Values['DriverID']     := 'FB';

  FDPhysFBDriverLink1.Embedded := True;

  FDPhysFBDriverLink1.VendorLib := ExtractFilePath(GetModuleName(HInstance)) + 'fbclient.dll';


  {FConn.Params.Values['DataBase']     := ExtractFilePath(GetModuleName(HInstance)) + 'BancoDados.fdb';
  FConn.Params.Values['User_Name']    := 'SYSDBA';
  FConn.Params.Values['Password']     := 'masterkey';
  FConn.Params.Values['Server']       := '127.0.0.1';
  FConn.Params.Values['Protocol']     := 'Local';
  FConn.Params.Values['CharacterSet'] := 'WIN1252';
  FConn.Params.Values['DriverID']     := 'FB';

  FDPhysFBDriverLink1.VendorLib := 'C:\iFood\fbclient.dll'; }


  FQuery := TFDQuery.Create(nil);
  FQueryPedidos := TFDQuery.Create(nil);

  FQuery.Connection := FConn;
  FQueryPedidos.Connection := FConn;

end;

procedure TThreadNFe_NFCe.createComponents;
begin
  FRestClient := TRESTClient.Create(nil);
  FRestResponse := TRESTResponse.Create(nil);
  FRestRequest := TRESTRequest.Create(nil);

  FRestRequest.Client := FRestClient;
  FRestRequest.Response := FRestResponse;
end;

destructor TThreadNFe_NFCe.Destroy;
begin
  Synchronize(DestruirObjetos);
  inherited;
end;

procedure TThreadNFe_NFCe.destroyComponents;
begin
  FRestResponse.Free;
  FRestRequest.Free;
  FRestClient.Free;
end;

procedure TThreadNFe_NFCe.DestruirObjetos;
begin
  FConn.Free;
  FDPhysFBDriverLink1.Free;
  FQueryPedidos.Free;
  FQuery.Free;
end;

procedure TThreadNFe_NFCe.DoProgress;
begin

  if CheckInternet then
  begin

    loadCredentials;

    try
      GetToken

    except
      on e: Exception do
      begin
        GravaLog( 'Falha ao pegar Token... '  +  E.Message);
      end;
    end;

    try

      Polling;
    except
      on e: Exception do
      begin
        GravaLog( 'Falha ao fazer Polling... '  +  E.Message);
      end;
    end;


    try

      StatusMerchants;
    except
      on e: Exception do
      begin
        GravaLog( 'Falha ao pegar  StatusMerchants... '  +  E.Message);
      end;
    end;


    try

      GetOrder;

    except
      on e: Exception do
      begin
        GravaLog( 'Falha ao fazer GetOrder... '  +  E.Message);
      end;
    end;


    try

      GetPedidos_Aceitos_Cancelados_Confirmados;

    except
      on e: Exception do
      begin
        GravaLog( 'Falha ao fazer GetPedidos_Aceitos_Cancelados_Confirmados... '  +  E.Message);
      end;
    end;

    try

      Acknowledgment;
    except
      on e: Exception do
      begin
        GravaLog( 'Falha ao fazer Acknowledgment... '  +  E.Message);
      end;
    end;

  end;

end;

procedure TThreadNFe_NFCe.loadCredentials;
var
  fileName: string;
  IniFile: TIniFile;
begin
  fileName := ExtractFilePath(GetModuleName(HInstance)) + 'IFOODConfig.ini';
  IniFile  := TIniFile.Create(fileName);
  try
    ClientID                 := IniFile.ReadString('CONFIG_IFOOD', 'CLIENT_ID', '');
    ClientSecret             := IniFile.ReadString('CONFIG_IFOOD', 'CLIENT_SECRET', '');
    Username                 := IniFile.ReadString('CONFIG_IFOOD', 'CLIENT_USERNAME', '');
    Password                 := IniFile.ReadString('CONFIG_IFOOD', 'CLIENT_PASSWORD', '');
    FAceitaPedidoAuto        := IniFile.ReadString('CONFIG_IFOOD', 'ACEITAPEDIDOAUTO', '') = 'True';
    FAdcComoProd             := IniFile.ReadString('CONFIG_IFOOD', 'ADCCOMOPROD', '') = 'True';
    FImprimeViaEntregadorAut := IniFile.ReadString('CONFIG_IFOOD', 'IMPRIMEVIAENTREGADORAUT', '') = 'True';
  finally
    IniFile.Free;
  end;
end;

procedure TThreadNFe_NFCe.Polling;
var
  parameter : TRESTRequestParameter;
  JSON, Envio: String;
  vFDMemTable: TFDMemTable;
  vJObj_Array: TJSONArray;
  vJdsAdapter: TCustomJSONDataSetAdapter;

begin
  createComponents;
  try

    FRestClient.BaseURL := 'https://merchant-api.ifood.com.br/order/v1.0';
    FRestClient.ContentType := 'application/json';
    FRestRequest.Accept := 'application/json';
    FRestRequest.Method := rmGET;

    parameter := FRestRequest.Params.AddHeader('Authorization', 'Bearer ' + FToken);
    parameter.Options := [poDoNotEncode];

    FRestRequest.Resource := 'events:polling';

    Envio :=    'BaseURL: '     + FRESTClient.BaseURL + #13 +
                'ContentType: ' + FRESTClient.ContentType + #13 +
                'Accept: '      + FRESTRequest.Accept + #13 +
                'Method: GET'   + #13 +
                 //'Header: '      + parameter.ToString  + #13 +
                'Resource: '    + FRESTRequest.Resource;


    DM.InsertLogs(0,
                  2,
                  'Envio - Polling',
                  Envio,
                  'IFOOD - Polling',
                  'S',
                  '');


    FRestRequest.Execute;


    case FRestResponse.StatusCode of
      200: begin
             //OK

             try


               JSON := FRestResponse.JSONValue.Format;

               DM.InsertLogs(0,
                             2,
                             'Retorno - Polling',
                             '',
                             'IFOOD - Polling',
                             'S',
                             'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'OK' + #13  +  #13  + FRestResponse.Content);


               vFDMemTable := TFDMemTable.Create(Nil);
               vJdsAdapter := TCustomJSONDataSetAdapter.Create(Nil);
               vJObj_Array := TJSONObject.ParseJSONValue(JSON) as TJSONArray;

               try

                 try
                   vJdsAdapter.Dataset := vFDMemTable;
                   vJdsAdapter.UpdateDataSet( vJObj_Array );

                   vFDMemTable.First;
                   while not vFDMemTable.Eof do
                   begin

                     DM.Tb_POLLING.Filtered := False;
                     DM.Tb_POLLING.Filter := 'id = '+ QuotedStr(vFDMemTable.FieldByName('id').AsString);
                     DM.Tb_POLLING.Filtered := True;

                     if DM.Tb_POLLING.IsEmpty then
                     begin
                       DM.Tb_POLLING.Append;
                       DM.Tb_POLLING.FieldByName('codigo').AsInteger := 1;
                       DM.Tb_POLLING.FieldByName('id').AsString := vFDMemTable.FieldByName('id').AsString;
                       DM.Tb_POLLING.FieldByName('code').AsString := vFDMemTable.FieldByName('code').AsString;
                       DM.Tb_POLLING.FieldByName('orderId').AsString := vFDMemTable.FieldByName('orderId').AsString;
                       DM.Tb_POLLING.FieldByName('createdAt').AsString := vFDMemTable.FieldByName('createdAt').AsString;
                       DM.Tb_POLLING.FieldByName('dt_hr_sis').AsDateTime := ISO8601ToDate(vFDMemTable.FieldByName('createdAt').AsString);
                       DM.Tb_POLLING.FieldByName('integrado').AsString := 'N';
                       DM.Tb_POLLING.FieldByName('statusackenviado').AsString := 'N';
                       DM.Tb_POLLING.FieldByName('statuspedidoaceito').AsString := 'N';
                       DM.Tb_POLLING.FieldByName('statuspedidocancelado').AsString := 'N';
                       DM.Tb_POLLING.FieldByName('statuspedidoconfirmado').AsString := 'N';
                       DM.Tb_POLLING.FieldByName('statuspedidoretirado').AsString := 'N';

                       DM.Tb_POLLING.Post;
                     end;

                     vFDMemTable.Next;
                   end;

                 except
                   on E: Exception do
                   begin

                   end;

                 end;

               finally
                 vFDMemTable.Free;
                 vJdsAdapter.Free;
                 vJObj_Array.Free;
                 DM.Tb_POLLING.Filtered := False;
               end;

             except
               on E: Exception do
               begin
                  GravaLog( 'Falha ao fazer polling... '  +  E.Message + FRESTResponse.Content);
               end;
             end;

             FMemo.Lines.Text := FRestResponse.JSONValue.Format;
           end;

      204: begin
             //No pending events found.
             DM.InsertLogs(0,
                           2,
                           'Retorno - Polling',
                           '',
                           'IFOOD - Polling',
                           'S',
                           'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'No pending events found.' + #13  +  #13  + FRestResponse.Content);
           end;

      400: begin
             //Bad Request. One or more request parameters were not valid.
             DM.InsertLogs(0,
                           2,
                           'Retorno - Polling',
                           '',
                           'IFOOD - Polling',
                           'N',
                           'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Bad Request. One or more request parameters were not valid.' + #13  +  #13  + FRestResponse.Content);
           end;
      404: begin
             //Not Found.
             DM.InsertLogs(0,
                           2,
                           'Retorno - Polling',
                           '',
                           'IFOOD - Polling',
                           'N',
                           'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Not Found.' + #13  +  #13  + FRestResponse.Content);
           end;
      413: begin
             //The request would query too many merchants (maximum is 100).
             DM.InsertLogs(0,
                           2,
                           'Retorno - Polling',
                           '',
                           'IFOOD - Polling',
                           'N',
                           'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'The request would query too many merchants (maximum is 100).' + #13  +  #13  + FRestResponse.Content);
           end;
      415: begin
             //Unsupported Media Type
             DM.InsertLogs(0,
                           2,
                           'Retorno - Polling',
                           '',
                           'IFOOD - Polling',
                           'N',
                           'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Unsupported Media Type' + #13  +  #13  + FRestResponse.Content);
           end;
      500: begin
             //Internal Server Error
             DM.InsertLogs(0,
                           2,
                           'Retorno - Polling',
                           '',
                           'IFOOD - Polling',
                           'N',
                           'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Internal Server Error' + #13  +  #13  + FRestResponse.Content);
           end;
    end;


  finally
    destroyComponents;
  end;

end;

procedure TThreadNFe_NFCe.Execute;
begin
  NameThreadForDebugging('Thread.IFood');

  while not Terminated do
  begin

    if Terminated then
      Exit;

    if ( FTimeCheck >= 1000 ) then
      FTimeCheck := FTimeCheck div 1000;

    FTimeCheck  :=  FTimeCheck * 1000;


    if ( FTimeCheck_Half >= 1000 ) then
      FTimeCheck_Half := FTimeCheck_Half div 1000;

    FTimeCheck_Half  :=  FTimeCheck_Half * 1000;

    {Controla a primeira execução da thread apos 3 segundos}
    if InicioThread = 300000000 then
    begin
      FirstExec := True;
      InicioThread := InicioThread  + 1;
    end
    else begin
      InicioThread := InicioThread + 1;
      if InicioThread > 300000000  then
        InicioThread := 300000001;
    end;

    if (GetTickCount >= (FLastUpdate + FTimeCheck)) or (FirstExec)  then
    begin
      FirstExec := False;
      FLabelUltAtualizacao.Caption := FormatDateTime('dd/mm/yyyy hh:nn:ss', Now);
      Synchronize(DoProgress);

      FLastUpdate :=  GetTickCount;
    end;

    if (GetTickCount >= (FLastUpdate_Half + FTimeCheck_Half)) then
    begin
      Synchronize(VerificaPedidos_and_Status);

      FLastUpdate_Half :=  GetTickCount;
    end;

  end;
end;

procedure TThreadNFe_NFCe.GetOrder;
var
  parameter: TRESTRequestParameter;
  vArrayResult: TArray<string>;
  JSON, Envio: String;
  i, h, j, l, k, vCdPedido, NrItem, GetCdCliente, cdloja_gconnect: Integer;
  GetTaxaEntrega: Currency;
  vTiposPagamentos, vItems, vSubItens, vArraybenefits,
  vArraysponsorshipValues, vArrayadditionalFees: TJSONArray;
  vPedido, vPagamento, vCliente, vEndereco, vProduto, vSubProduto, vTaxaEntrega,
  vMercant, vDelivery, vPhone, vTotal, vPayments, vVethod, vSchedule,
  vIndoor, vBenefits, vSponsorshipValues, vAdditionalFees, vTakeout: TJSONObject;

  sql, produtos, adicionais: string;
  GetMode, CdProduto, CdAdicionais: Integer;

  JSON_Pedido, Mensagem, DadosImpressao, Result, ResponsavelDesconto, DataAgenda, HoraAgenda: String;
  vArrayPedido: TJSONArray;
  vResult, vDadosIncluirPedido, vDados, vDadosPedido: TJSONObject;
  impressao_txt, produtos_txt: TStringList;
  ValorDesconto: Currency;
begin
  createComponents;
  vCdPedido := 0;
  ValorDesconto := 0;
  FIFood.AdditionalFees_value := 0;

  try
    FRestClient.BaseURL := 'https://merchant-api.ifood.com.br/order/v1.0';
    FRestClient.ContentType := 'application/json';
    FRestRequest.Accept := 'application/json';
    FRestRequest.Method := rmGET;

    FQueryPedidos.SQL := DM._qryGetPedidos.SQL;

    FQueryPedidos.Close;
    FQueryPedidos.Open;


    if not FQueryPedidos.IsEmpty then
    begin
      FQueryPedidos.First;
      while not FQueryPedidos.Eof do
      begin
        FRestRequest.Resource := 'orders/' + FQueryPedidos.FieldByName('orderId').AsString;
        parameter := FRestRequest.Params.AddHeader('Authorization', 'Bearer ' + FToken);
        parameter.Options := [poDoNotEncode];

        Envio :=    'BaseURL: '     + FRESTClient.BaseURL + #13 +
                    'ContentType: ' + FRESTClient.ContentType + #13 +
                    'Accept: '      + FRESTRequest.Accept + #13 +
                    'Method: GET'   + #13 +
                     //'Header: '      + parameter.ToString  + #13 +
                    'Resource: '    + FRESTRequest.Resource;


        DM.InsertLogs(0,
                      2,
                      'Envio - GetOrder',
                      Envio,
                      'IFOOD - GetOrder',
                      'S',
                      '');

        FRestRequest.Execute;

        case FRestResponse.StatusCode of
          200: //OK
          begin
              JSON := FRestResponse.JSONValue.Format;
              JSON := Utf8toAnsi(RawByteString(TrataTexto(FRestResponse.JSONValue.Format)));

               DM.InsertLogs(0,
                             2,
                             'Retorno - GetOrder',
                             '',
                             'IFOOD - GetOrder',
                             'S',
                             JSON);



              FMemoPedido.Text := JSON;
              vPedido := TJSONObject.ParseJSONValue(JSON) as TJSONObject;

              try

                if(vPedido <> nil)then
                begin
                  vPedido.TryGetValue<string>('id', FIFood.Pedido_reference);
                  vPedido.TryGetValue<string>('displayId', FIFood.Pedido_shortReference);

                  if vPedido.GetValue<string>('orderType') = 'DELIVERY' then
                    GetMode := 1  //DELIVERY
                  else
                    if vPedido.GetValue<string>('orderType') = 'TAKEOUT' then
                    begin
                      GetMode := 2; //TAKEOUT
                      vTakeout := vPedido.GetValue<TJSONObject>('takeout') as TJSONObject;
                      vTakeout.TryGetValue<string>('takeoutDateTime', FIFood.Pedido_deliveryDateTime);
                    end
                    else
                      if vPedido.GetValue<string>('orderType') = 'INDOOR' then
                      begin
                        GetMode := 3; //INDOOR
                        vIndoor := vPedido.GetValue<TJSONObject>('indoor') as TJSONObject;
                        vIndoor.TryGetValue<string>('deliveryDateTime', FIFood.Pedido_deliveryDateTime);
                      end;

                  vPedido.TryGetValue<string>('orderTiming', FIFood.Pedido_orderTiming);

                  if FIFood.Pedido_orderTiming = 'IMMEDIATE' then
                  begin
                    //IMMEDIATE
                    if GetMode = 1 then //quando o GetMode é diferente de 1 pego o deliveryDateTime no objeto vIndoor
                    begin
                      vDelivery := vPedido.GetValue<TJSONObject>('delivery') as TJSONObject;
                      vDelivery.TryGetValue<string>('deliveryDateTime', FIFood.Pedido_deliveryDateTime);
                    end;
                  end
                  else begin
                    //SCHEDULED
                    vSchedule := vPedido.GetValue<TJSONObject>('schedule') as TJSONObject;
                    vSchedule.TryGetValue<string>('deliveryDateTimeStart', FIFood.Pedido_deliveryDateTimeStart);
                    vSchedule.TryGetValue<string>('deliveryDateTimeEnd', FIFood.Pedido_deliveryDateTimeEnd);

                    if GetMode = 1 then //Quando é retirada o deliveryDateTime pego pelo takeoutDateTime
                    begin
                      vDelivery := vPedido.GetValue<TJSONObject>('delivery') as TJSONObject;
                      vDelivery.TryGetValue<string>('deliveryDateTime', FIFood.Pedido_deliveryDateTime);
                    end;

                  end;

                  vCdPedido := InserePedidoINI(FIFood.Pedido_deliveryDateTime, FIFood.Pedido_deliveryDateTimeStart,FIFood.Pedido_deliveryDateTimeEnd,FIFood.Pedido_orderTiming,FIFood.Pedido_reference,FIFood.Pedido_shortReference);

                  FMemoPedido.Lines.SaveToFile(ExtractFilePath(GetModuleName(HInstance)) + '\ArqLog\' + FIFood.Pedido_shortReference + '_' + FQueryPedidos.FieldByName('orderId').AsString + '.txt');

                  if vPedido.TryGetValue<TJSONArray>('additionalFees', vArrayadditionalFees) then
                  begin

                    for k := 0 to vArrayadditionalFees.Count -1 do
                    begin
                      vAdditionalFees := vArrayadditionalFees.Items[k] as TJSONObject;
                      vAdditionalFees.TryGetValue<currency>('value', FIFood.AdditionalFees_value);
                    end;

                  end;

                  if vPedido.TryGetValue<TJSONArray>('benefits', vArraybenefits) then
                  begin


                    for j := 0 to vArraybenefits.Count -1 do
                    begin
                      vBenefits := vArraybenefits.Items[j] as TJSONObject;

                      vBenefits.TryGetValue<currency>('value', FIFood.Benefits_value);
                      vBenefits.TryGetValue<string>('target', FIFood.Benefits_target);

                      if vBenefits.TryGetValue<TJSONArray>('sponsorshipValues', vArraybenefits) then
                      begin
                        for l := 0 to vArraybenefits.Count -1 do
                        begin
                          vsponsorshipValues := vArraybenefits.Items[l] as TJSONObject;
                          vsponsorshipValues.TryGetValue<currency>('value', FIFood.Benefits_sponsorship_value);
                          vsponsorshipValues.TryGetValue<string>('name', FIFood.Benefits_sponsorship_name);

                          if FIFood.Benefits_sponsorship_name = 'IFOOD' then
                          begin
                            if FIFood.Benefits_sponsorship_value > 0 then
                            begin

                              DM.InsertpagamentosiFood(vCdPedido,
                                                       'CREDIT',
                                                       'PAGAMENTO IFOOD',
                                                       'true',
                                                       'ONLINE',
                                                       FIFood.Benefits_sponsorship_value);

                              ValorDesconto := ValorDesconto + FIFood.Benefits_sponsorship_value;
                              ResponsavelDesconto := 'iFood';
                            end;


                          end
                          else
                            if FIFood.Benefits_sponsorship_name = 'MERCHANT' then
                            begin
                              if FIFood.Benefits_sponsorship_value > 0 then
                              begin
                                ValorDesconto := ValorDesconto + FIFood.Benefits_sponsorship_value;
                                ResponsavelDesconto := 'Loja';
                              end;

                            end;

                        end;
                      end;

                    end;

                    //Fim dos descontos
                    DM._qryUpddateVal_Resp_Desc.Params[0].AsString := ResponsavelDesconto;
                    DM._qryUpddateVal_Resp_Desc.Params[1].AsCurrency := ValorDesconto;
                    DM._qryUpddateVal_Resp_Desc.Params[2].AsInteger := vCdPedido;
                    DM._qryUpddateVal_Resp_Desc.ExecSQL;
                    DM._qryUpddateVal_Resp_Desc.Connection.Commit;

                  end;


                  NrItem := 0;

                  vCliente := vPedido.GetValue<TJSONObject>('customer') as TJSONObject;

                  case GetMode of
                    1: begin
                         vDelivery := vPedido.GetValue<TJSONObject>('delivery') as TJSONObject;
                         vDelivery.TryGetValue<string>('observations', FIFood.Endereco_observations);

                         vEndereco := vDelivery.GetValue<TJSONObject>('deliveryAddress') as TJSONObject;

                         vCliente.TryGetValue<string>('id', FIFood.Cliente_id);
                         vCliente.TryGetValue<string>('documentNumber', FIFood.Cliente_documentNumber);
                         if vCliente.TryGetValue<TJSONObject>('phone', vPhone) then
                         begin
                           vPhone.TryGetValue<string>('number', FIFood.Cliente_phone);
                           vPhone.TryGetValue<string>('localizer', FIFood.Cliente_id);
                           vPhone.TryGetValue<string>('localizer', FIFood.Cliente_phone_localizer);
                         end;

                         vCliente.TryGetValue<string>('id', FIFood.Cliente_uuid);
                         vCliente.TryGetValue<string>('name', FIFood.Cliente_name);

                         vEndereco.TryGetValue<string>('city', FIFood.Endereco_city);
                         vEndereco.TryGetValue<string>('complement', FIFood.Endereco_complement);
                         vEndereco.TryGetValue<string>('formattedAddress', FIFood.Endereco_formattedAddress);
                         vEndereco.TryGetValue<string>('neighborhood', FIFood.Endereco_neighborhood);
                         vEndereco.TryGetValue<string>('postalCode', FIFood.Endereco_postalCode);
                         vEndereco.TryGetValue<string>('reference', FIFood.Endereco_reference);
                         vEndereco.TryGetValue<string>('streetName', FIFood.Endereco_streetName);
                         vEndereco.TryGetValue<string>('streetNumber', FIFood.Endereco_streetNumber);
                       end;
                    2: begin

                         vCliente.TryGetValue<string>('id', FIFood.Cliente_id);
                         vCliente.TryGetValue<string>('documentNumber', FIFood.Cliente_documentNumber);

                         if vCliente.TryGetValue<TJSONObject>('phone', vPhone) then
                         begin
                           vPhone.TryGetValue<string>('number', FIFood.Cliente_phone);
                           vPhone.TryGetValue<string>('localizer', FIFood.Cliente_id);
                           vPhone.TryGetValue<string>('localizer', FIFood.Cliente_phone_localizer);
                         end;

                         vCliente.TryGetValue<string>('id', FIFood.Cliente_uuid);
                         vCliente.TryGetValue<string>('name', FIFood.Cliente_name);

                         FIFood.Endereco_city := 'RETIRADA';
                         FIFood.Endereco_complement := 'RETIRADA';
                         FIFood.Endereco_formattedAddress := 'RETIRADA';
                         FIFood.Endereco_neighborhood := 'RETIRADA';
                         FIFood.Endereco_reference := 'RETIRADA';
                         FIFood.Endereco_streetName := 'RETIRADA';
                         FIFood.Endereco_streetNumber := 'RETIRADA';
                         FIFood.Endereco_postalCode := '00000000';



                       end;
                    3: begin
                         vEndereco := vPedido.GetValue<TJSONObject>('indoor') as TJSONObject;

                         vIndoor.TryGetValue<string>('mode', FIFood.Indoor_mode);
                         vIndoor.TryGetValue<string>('table', FIFood.Indoor_table);
                         vIndoor.TryGetValue<string>('deliveryDateTime', FIFood.Cliente_uuid);

                         DM._qryAtualizaPedidoIndoor.Params[0].AsString    := FIFood.Indoor_mode; //Mode
                         DM._qryAtualizaPedidoIndoor.Params[1].AsString    := FIFood.Indoor_table; //Table
                         DM._qryAtualizaPedidoIndoor.Params[2].AsInteger   := vCdPedido; //CdPedido
                         DM._qryAtualizaPedidoIndoor.ExecSQL;
                         DM._qryAtualizaPedidoIndoor.Connection.Commit;

                         if FIFood.Indoor_mode = 'TABLE' then
                         begin

                           vCliente.TryGetValue<string>('id', FIFood.Cliente_id);
                           vCliente.TryGetValue<string>('documentNumber', FIFood.Cliente_documentNumber);

                           if vCliente.TryGetValue<TJSONObject>('phone', vPhone) then
                           begin
                             vPhone.TryGetValue<string>('number', FIFood.Cliente_phone);
                             vPhone.TryGetValue<string>('localizer', FIFood.Cliente_id);
                             vPhone.TryGetValue<string>('localizer', FIFood.Cliente_phone_localizer);
                           end;

                           vCliente.TryGetValue<string>('id', FIFood.Cliente_uuid);
                           vCliente.TryGetValue<string>('name', FIFood.Cliente_name);

                           vIndoor.TryGetValue<string>('table', FIFood.Endereco_city);
                           vIndoor.TryGetValue<string>('table', FIFood.Endereco_complement);
                           vIndoor.TryGetValue<string>('table', FIFood.Endereco_formattedAddress);
                           vIndoor.TryGetValue<string>('table', FIFood.Endereco_neighborhood);
                           vIndoor.TryGetValue<string>('table', FIFood.Endereco_reference);
                           vIndoor.TryGetValue<string>('table', FIFood.Endereco_streetName);
                           vIndoor.TryGetValue<string>('table', FIFood.Endereco_streetNumber);
                           FIFood.Endereco_postalCode := '00000000';
                         end
                         else begin
                           FIFood.Cliente_name := 'BALCAO';
                           FIFood.Cliente_uuid :=  OnlyNumber(FIFood.Cliente_uuid);
                           FIFood.Cliente_id := Copy(FIFood.Cliente_uuid,1,10);
                           FIFood.Endereco_city := 'BALCAO';
                           FIFood.Endereco_complement := 'BALCAO';
                           FIFood.Endereco_formattedAddress := 'BALCAO';
                           FIFood.Endereco_neighborhood := 'BALCAO';
                           FIFood.Endereco_reference := 'BALCAO';
                           FIFood.Endereco_streetName := 'BALCAO';
                           FIFood.Endereco_streetNumber := 'BALCAO';
                           FIFood.Endereco_postalCode := '00000000';

                         end;



                       end;
                  end;


                  //vTaxaEntrega := vPedido.GetValue<TJSONObject>('deliveryMethod') as TJSONObject;

                  //GetTaxaEntrega := StrToCurr( StringReplace(StringReplace(vTaxaEntrega.GetValue<string>('value'), '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase]));

                  try
                    GetCdCliente := DM.SetCadCliente(FIFood.Endereco_neighborhood,
                                                     FIFood.Endereco_postalCode,
                                                     FIFood.Endereco_city,
                                                     FIFood.Endereco_complement,
                                                     FIFood.Cliente_documentNumber,
                                                     FIFood.Cliente_phone,
                                                     FIFood.Endereco_formattedAddress,
                                                     FIFood.Cliente_name,
                                                     FIFood.Endereco_streetNumber,
                                                     FIFood.Cliente_phone_localizer,
                                                     FIFood.Endereco_reference + ' ' + FIFood.Endereco_observations,
                                                     FIFood.Cliente_uuid,
                                                     StrToInt(FIFood.Cliente_id));
                  except
                    on e: Exception do
                    begin
                      GravaLog( 'Falha ao cadastrar o cliente... '  +  E.Message);
                    end;
                  end;

                  vPayments := vPedido.GetValue<TJSONObject>('payments') as TJSONObject;

                  //Pagamentos no primeiro loop somente populo Payments_changeFor para inserir na tabela de pedidos
                  vTiposPagamentos := vPayments.GetValue<TJSONArray>('methods') as TJSONArray;
                  for i := 0 to vTiposPagamentos.Count -1 do
                  begin
                    vPagamento := vTiposPagamentos.Items[i] as TJSONObject;


                    vPagamento.TryGetValue<string>('prepaid', FIFood.Payments_prepaid);
                    vPagamento.TryGetValue<string>('method', FIFood.Payments_methods);
                    vPagamento.TryGetValue<string>('value', FIFood.Payments_value);


                    if FIFood.Payments_methods = 'CASH' then
                    begin
                      vVethod := vPagamento.GetValue<TJSONObject>('cash') as TJSONObject;
                      FIFood.Payments_name := 'Dinheiro';

                      vVethod.TryGetValue<string>('changeFor', FIFood.Payments_changeFor);
                    end
                    else begin //FIFood.Payments_methods = 'CREDIT', 'MEAL_VOUCHER', 'PIX'
                      vVethod := vPagamento.GetValue<TJSONObject>('card') as TJSONObject;
                      vVethod.TryGetValue<string>('brand', FIFood.Payments_name);
                      FIFood.Payments_changeFor := ''; //Zerando Troco
                    end;

                  end;



                  try

                    vTotal := vPedido.GetValue<TJSONObject>('total') as TJSONObject;
                    vTotal.TryGetValue<string>('deliveryFee', FIFood.Pedido_deliveryFee);
                    vTotal.TryGetValue<string>('subTotal', FIFood.Pedido_subTotal);
                    vTotal.TryGetValue<string>('orderAmount', FIFood.Pedido_totalPrice);


                    vPedido.TryGetValue<string>('createdAt', FIFood.Pedido_createdAt);
                    vPedido.TryGetValue<string>('id', FIFood.Pedido_id);
                    vPedido.TryGetValue<string>('reference', FIFood.Pedido_reference);
                    vPedido.TryGetValue<string>('displayId', FIFood.Pedido_shortReference);


                    vMercant := vPedido.GetValue<TJSONObject>('merchant') as TJSONObject;

                    vMercant.TryGetValue<string>('name', FIFood.Mercant_name);
                    vMercant.TryGetValue<string>('id', FIFood.Mercant_shortId);

                    DM._qryCdLoja_by_MerchanID.Params[0].AsString := FMerchantID;
                    DM._qryCdLoja_by_MerchanID.Close;
                    DM._qryCdLoja_by_MerchanID.Open;

                    if not DM._qryCdLoja_by_MerchanID.IsEmpty then
                      cdloja_gconnect := DM._qryCdLoja_by_MerchanID.FieldByName('cdloja_gconnect').AsInteger
                    else
                      cdloja_gconnect := 1;

                    AtualizaPedido(FIFood.Pedido_createdAt,
                                   FIFood.Pedido_id,
                                   FIFood.Mercant_name,
                                   'PNA',
                                    GetCdCliente,
                                    cdloja_gconnect,
                                    vCdPedido,
                                    StrToCurrDef( StringReplace(StringReplace(FIFood.Payments_changeFor, '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase]),0),
                                    StrToCurrDef( StringReplace(StringReplace(FIFood.Pedido_deliveryFee, '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase]),0),
                                    StrToCurrDef( StringReplace(StringReplace(FIFood.Pedido_subTotal,    '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase]),0),
                                    FIFood.AdditionalFees_value,
                                    GetMode,
                                    StrToCurrDef( StringReplace(StringReplace(FIFood.Pedido_totalPrice,  '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase]),0));


                  except
                    on e: Exception do
                    begin
                      GravaLog( 'Falha ao gravar o pedido... '  +  E.Message);
                    end;
                  end;

                  //no segundo loop faço as devidas inserçoes com o vCdPedido ja populado
                  vTiposPagamentos := vPayments.GetValue<TJSONArray>('methods') as TJSONArray;
                  for i := 0 to vTiposPagamentos.Count -1 do
                  begin
                    vPagamento := vTiposPagamentos.Items[i] as TJSONObject;



                    vPagamento.TryGetValue<string>('prepaid', FIFood.Payments_prepaid);
                    vPagamento.TryGetValue<string>('method', FIFood.Payments_methods);
                    vPagamento.TryGetValue<string>('value', FIFood.Payments_value);
                    vPagamento.TryGetValue<string>('type', FIFood.Payments_type);
                    vPagamento.TryGetValue<string>('method', FIFood.Payments_method);


                    if FIFood.Payments_methods = 'CASH' then
                    begin
                      vVethod := vPagamento.GetValue<TJSONObject>('cash') as TJSONObject;
                       FIFood.Payments_name := 'CASH';

                      vVethod.TryGetValue<string>('changeFor', FIFood.Payments_changeFor);
                    end
                    else begin //FIFood.Payments_methods = 'CREDIT', 'MEAL_VOUCHER', 'PIX'
                      vVethod := vPagamento.GetValue<TJSONObject>('card') as TJSONObject;
                      vVethod.TryGetValue<string>('brand', FIFood.Payments_name);
                      FIFood.Payments_changeFor := ''; //Zerando Troco
                    end;


                    try

                      DM.InsertpagamentosiFood(vCdPedido,
                                               FIFood.Payments_method,
                                               FIFood.Payments_name,
                                               FIFood.Payments_prepaid,
                                               FIFood.Payments_type,
                                               StrToCurrDef( StringReplace(StringReplace(FIFood.Payments_value, '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase]),0));
                    except
                      on e: Exception do
                      begin
                        GravaLog( 'Falha ao gravar pagamentos... '  +  E.Message);
                      end;
                    end;

                  end;




                  vItems := vPedido.GetValue<TJSONArray>('items') as TJSONArray;
                  for i := 0 to vItems.Count -1 do
                  begin
                    vProduto := vItems.Items[i] as TJSONObject;

                    vProduto.TryGetValue<string>('discount', FIFood.Produto_discount);
                    vProduto.TryGetValue<string>('externalCode', FIFood.Produto_externalCode);
                    vProduto.TryGetValue<string>('name', FIFood.Produto_name);
                    vProduto.TryGetValue<string>('observations', FIFood.Produto_observations);
                    vProduto.TryGetValue<string>('unitPrice', FIFood.Produto_price);
                    vProduto.TryGetValue<string>('quantity', FIFood.Produto_quantity);
                    vProduto.TryGetValue<string>('totalPrice', FIFood.Produto_totalPrice);


                    try

                      NrItem := NrItem + 1;

                      InserePedidoItem(vCdPedido,
                                       StrToIntDef(FIFood.Produto_externalCode,0),
                                       0,
                                       NrItem,
                                       FIFood.Produto_name,
                                       'N',
                                       FIFood.Produto_observations,
                                       StrToInt(FIFood.Produto_quantity),
                                       StrToCurrDef( StringReplace(StringReplace(FIFood.Produto_discount, '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase]),0),
                                       StrToCurr( StringReplace(StringReplace(FIFood.Produto_price , '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase])),
                                       StrToCurr( StringReplace(StringReplace(FIFood.Produto_price , '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase])) *
                                       StrToInt(FIFood.Produto_quantity));


                    except
                      on e: Exception do
                      begin
                        GravaLog( 'Falha ao gravar produtos... '  +  E.Message);
                      end;
                    end;


                    if vProduto.TryGetValue<TJSONArray>('options', vSubItens) then
                    begin
                      vSubItens := vProduto.GetValue<TJSONArray>('options') as TJSONArray;
                      for h := 0 to vSubItens.Count -1 do
                      begin
                        vSubProduto := vSubItens.Items[h] as TJSONObject;

                        vSubProduto.TryGetValue<string>('discount', FIFood.SubProduto_discount);
                        vSubProduto.TryGetValue<string>('externalCode', FIFood.SubProduto_externalCode);
                        vSubProduto.TryGetValue<string>('name', FIFood.SubProduto_name);
                        vSubProduto.TryGetValue<string>('observations', FIFood.SubProduto_observations);
                        vSubProduto.TryGetValue<string>('unitPrice', FIFood.SubProduto_price);
                        vSubProduto.TryGetValue<string>('quantity', FIFood.SubProduto_quantity);
                        vSubProduto.TryGetValue<string>('price', FIFood.SubProduto_totalPrice);



                        try

                          //NrItem := NrItem + 1;
                          if not FAdcComoProd then
                          begin
                           InserePedidoItem(vCdPedido,
                                            StrToIntDef(FIFood.SubProduto_externalCode,0),
                                            StrToIntDef(FIFood.Produto_externalCode,0),
                                            NrItem,
                                            FIFood.SubProduto_name,
                                            'S',
                                            FIFood.SubProduto_observations,
                                            StrToInt(FIFood.Produto_quantity) * StrToInt(FIFood.SubProduto_quantity),
                                            StrToCurrDef( StringReplace(StringReplace(FIFood.SubProduto_discount, '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase]),0),
                                            StrToCurr( StringReplace(StringReplace(FIFood.SubProduto_price , '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase])),
                                            StrToCurr( StringReplace(StringReplace(FIFood.SubProduto_price , '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase])) *
                                            StrToInt(FIFood.SubProduto_quantity));

                          end
                          else begin
                            NrItem := NrItem + 1;
                            InserePedidoItem(vCdPedido,
                                             StrToIntDef(FIFood.SubProduto_externalCode,0),
                                             0,
                                             NrItem,
                                             FIFood.SubProduto_name,
                                             'N',
                                             FIFood.SubProduto_observations,
                                             StrToInt(FIFood.Produto_quantity) * StrToInt(FIFood.SubProduto_quantity),
                                             StrToCurrDef( StringReplace(StringReplace(FIFood.SubProduto_discount, '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase]),0),
                                             StrToCurr( StringReplace(StringReplace(FIFood.SubProduto_price , '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase])),
                                             StrToCurr( StringReplace(StringReplace(FIFood.SubProduto_price , '.', ',',[rfReplaceAll, rfIgnoreCase]), '"', '',[rfReplaceAll, rfIgnoreCase])) *
                                             StrToInt(FIFood.SubProduto_quantity));


                          end;

                        except
                          on e: Exception do
                          begin
                            GravaLog( 'Falha ao gravar subprodutos... '  +  E.Message);
                          end;
                        end;

                      end;


                    end;

                  end;


                end;

              finally
                vPedido.Free;
              end;

              DM._qryUpdateIntegrado.Params[0].AsInteger := 0; //0=Novos 1=Aceitos 2=Cancelados 3=Confirmados 4=Retirados
              DM._qryUpdateIntegrado.Params[1].AsInteger := FQueryPedidos.FieldByName('codigo').AsInteger;
              DM._qryUpdateIntegrado.ExecSQL;
              DM._qryUpdateIntegrado.Connection.Commit;


              if FImprimeViaEntregadorAut then
              begin


              end;

              if FAceitaPedidoAuto then
                ConfirmaPedido(vCdPedido, FQueryPedidos.FieldByName('orderId').AsString);

          end;
          400: //Invalid parameter
          begin

          end;
          404://Order not found
          begin

          end;
          500://Internal Server Error
          begin

          end;

        end;


        FQueryPedidos.Next;
      end;

      DM.ListaPedidos(Now, Now, 0, 0, 0, '');
    end;


  finally
    destroyComponents;
  end;
end;

procedure TThreadNFe_NFCe.GetPedidos_Aceitos_Cancelados_Confirmados;
var
  DadosRetornados: Boolean;
  GetSQL: String;
begin
  DadosRetornados := False;

  FQueryPedidos.SQL.Clear;
  FQueryPedidos.SQL := DM._qryGetPedidosAceitos.SQL;

  FQueryPedidos.Close;
  FQueryPedidos.Open;

  if not FQueryPedidos.IsEmpty then
  begin
    DadosRetornados := True;
    FQueryPedidos.First;
    while not FQueryPedidos.Eof do
    begin
      DM._qryUpdateStatusPedidoAceito.Params[0].AsDateTime := FQueryPedidos.FieldByName('dt_hr_sis').AsDateTime;
      DM._qryUpdateStatusPedidoAceito.Params[1].AsString := 'PEA';
      DM._qryUpdateStatusPedidoAceito.Params[2].AsInteger := FQueryPedidos.FieldByName('cdpedido').AsInteger;
      DM._qryUpdateStatusPedidoAceito.ExecSQL;
      DM._qryUpdateStatusPedidoAceito.Connection.Commit;

      DM._qryUpdateIntegrado.Params[0].AsInteger := 1; //0=Novos 1=Aceitos 2=Cancelados 3=Confirmados 4=Retirados
      DM._qryUpdateIntegrado.Params[1].AsInteger := FQueryPedidos.FieldByName('codigo').AsInteger;
      DM._qryUpdateIntegrado.ExecSQL;
      DM._qryUpdateIntegrado.Connection.Commit;

      GetSQL := StringReplace(DM._qryUpdateStatusPedidoAceito.SQL.Text, ':statuspedido', QuotedStr('PEA'),[rfReplaceAll, rfIgnoreCase]);
      GetSQL := StringReplace(GetSQL, ':cdpedido', QuotedStr(FQueryPedidos.FieldByName('cdpedido').AsInteger.ToString),[rfReplaceAll, rfIgnoreCase]);

      DM.InsertLogs(FQueryPedidos.FieldByName('cdpedido').AsInteger,
                    2,
                    'Envio - SQL',
                    GetSQL,
                    'IFOOD - Pedidos Aceitos pelo iFood',
                    'S',
                    '');

      FQueryPedidos.Next;
    end;

  end;

  FQueryPedidos.SQL.Clear;
  FQueryPedidos.SQL := DM._qryGetPedidosCanc.SQL;

  FQueryPedidos.Close;
  FQueryPedidos.Open;

  if not FQueryPedidos.IsEmpty then
  begin
    DadosRetornados := True;
    FQueryPedidos.First;
    while not FQueryPedidos.Eof do
    begin
      DM._qryUpdateStatusPedidoCancelar.Params[0].AsString := 'PCC';
      DM._qryUpdateStatusPedidoCancelar.Params[1].AsInteger := FQueryPedidos.FieldByName('cdpedido').AsInteger;
      DM._qryUpdateStatusPedidoCancelar.ExecSQL;
      DM._qryUpdateStatusPedidoCancelar.Connection.Commit;


      DM._qryUpdateIntegrado.Params[0].AsInteger := 2; //0=Novos 1=Aceitos 2=Cancelados 3=Confirmados 4=Retirados
      DM._qryUpdateIntegrado.Params[1].AsInteger := FQueryPedidos.FieldByName('codigo').AsInteger;
      DM._qryUpdateIntegrado.ExecSQL;
      DM._qryUpdateIntegrado.Connection.Commit;

      GetSQL := StringReplace(DM._qryUpdateStatusPedidoCancelar.SQL.Text, ':statuspedido', QuotedStr('PCC'),[rfReplaceAll, rfIgnoreCase]);
      GetSQL := StringReplace(GetSQL, ':cdpedido', QuotedStr(FQueryPedidos.FieldByName('cdpedido').AsInteger.ToString),[rfReplaceAll, rfIgnoreCase]);

      DM.InsertLogs(FQueryPedidos.FieldByName('cdpedido').AsInteger,
                    2,
                    'Envio - SQL',
                    GetSQL,
                    'IFOOD - Pedidos Cancelados pelo iFood',
                    'S',
                    '');

      FQueryPedidos.Next;
    end;

  end;


  FQueryPedidos.SQL.Clear;
  FQueryPedidos.SQL := DM._qryGetPedidosRetirados.SQL;

  FQueryPedidos.Close;
  FQueryPedidos.Open;

  if not FQueryPedidos.IsEmpty then
  begin
    DadosRetornados := True;
    FQueryPedidos.First;
    while not FQueryPedidos.Eof do
    begin
      DM._qryUpdateStatusPedidoRetirado.Params[0].AsString := 'PDR';
      DM._qryUpdateStatusPedidoRetirado.Params[1].AsInteger := FQueryPedidos.FieldByName('cdpedido').AsInteger;
      DM._qryUpdateStatusPedidoRetirado.ExecSQL;
      DM._qryUpdateStatusPedidoRetirado.Connection.Commit;

      DM._qryUpdateIntegrado.Params[0].AsInteger := 4; //0=Novos 1=Aceitos 2=Cancelados 3=Confirmados 4=Retirados
      DM._qryUpdateIntegrado.Params[1].AsInteger := FQueryPedidos.FieldByName('codigo').AsInteger;
      DM._qryUpdateIntegrado.ExecSQL;
      DM._qryUpdateIntegrado.Connection.Commit;

      GetSQL := StringReplace(DM._qryUpdateStatusPedidoRetirado.SQL.Text, ':statuspedido', QuotedStr('PDR'),[rfReplaceAll, rfIgnoreCase]);
      GetSQL := StringReplace(GetSQL, ':cdpedido', QuotedStr(FQueryPedidos.FieldByName('cdpedido').AsInteger.ToString),[rfReplaceAll, rfIgnoreCase]);

      DM.InsertLogs(FQueryPedidos.FieldByName('cdpedido').AsInteger,
                    2,
                    'Envio - SQL',
                    GetSQL,
                    'IFOOD - Pedidos Retirados pelo iFood',
                    'S',
                    '');

      FQueryPedidos.Next;
    end;

  end;


  FQueryPedidos.SQL.Clear;
  FQueryPedidos.SQL := DM._qryGetPedidosConfirmados.SQL;

  FQueryPedidos.Close;
  FQueryPedidos.Open;

  if not FQueryPedidos.IsEmpty then
  begin
    DadosRetornados := True;
    FQueryPedidos.First;
    while not FQueryPedidos.Eof do
    begin
      DM._qryUpdateStatusPedidoConfirmado.Params[0].AsString := 'PDF';
      DM._qryUpdateStatusPedidoConfirmado.Params[1].AsInteger := FQueryPedidos.FieldByName('cdpedido').AsInteger;
      DM._qryUpdateStatusPedidoConfirmado.ExecSQL;
      DM._qryUpdateStatusPedidoConfirmado.Connection.Commit;


      DM._qryUpdateIntegrado.Params[0].AsInteger := 3; //0=Novos 1=Aceitos 2=Cancelados 3=Confirmados 4=Retirados
      DM._qryUpdateIntegrado.Params[1].AsInteger := FQueryPedidos.FieldByName('codigo').AsInteger;
      DM._qryUpdateIntegrado.ExecSQL;
      DM._qryUpdateIntegrado.Connection.Commit;

      GetSQL := StringReplace(DM._qryUpdateStatusPedidoConfirmado.SQL.Text, ':statuspedido', QuotedStr('PDF'),[rfReplaceAll, rfIgnoreCase]);
      GetSQL := StringReplace(GetSQL, ':cdpedido', QuotedStr(FQueryPedidos.FieldByName('cdpedido').AsInteger.ToString),[rfReplaceAll, rfIgnoreCase]);

      DM.InsertLogs(FQueryPedidos.FieldByName('cdpedido').AsInteger,
                    2,
                    'Envio - SQL',
                    GetSQL,
                    'IFOOD - Pedidos Finalizados pelo iFood',
                    'S',
                    '');

      FQueryPedidos.Next;
    end;

  end;


  if DadosRetornados then
  begin
    DM._qryListaPedido.Close;
    DM._qryListaPedido.Open;
  end;

end;

function TThreadNFe_NFCe.GetToken: Boolean;
var
  vArray1: TArray<string>;
  DataBD: TDateTime;
  vResult, _expires_in: String;
  vGetOperacao: Integer;
begin
  vResult := DM.GetTokenBD;
  vArray1 := vResult.Split(['|']);

  DataBD := StrToDateTime(vArray1[2]);
  vGetOperacao := StrToInt(vArray1[5]);

   if DataBD > Now then
   begin
     FAuthorizationCode := vArray1[0];
     FAuthorizationCodeVerifier := vArray1[1];
     FRefreshToken := vArray1[3];
     FToken := vArray1[4];
     FEdit.Text := FToken;
     Result := True;
   end
   else begin

     createComponents;
     try
       //FRestClient.BaseURL := 'https://pos-api.ifood.com.br/oauth/token';
       FRestClient.BaseURL := 'https://merchant-api.ifood.com.br/authentication/v1.0/oauth/token';
       FRestClient.ContentType := 'application/x-www-form-urlencoded';
       FRestRequest.Accept := 'application/json';

       FRestRequest.AddParameter('grantType', 'refresh_token', TRESTRequestParameterKind.pkGETorPOST);
       FRestRequest.AddParameter('clientId', ClientID, TRESTRequestParameterKind.pkGETorPOST);
       FRestRequest.AddParameter('clientSecret', ClientSecret, TRESTRequestParameterKind.pkGETorPOST);
       FRestRequest.AddParameter('authorizationCode', vArray1[0], TRESTRequestParameterKind.pkGETorPOST);
       FRestRequest.AddParameter('authorizationCodeVerifier', vArray1[1], TRESTRequestParameterKind.pkGETorPOST);
       FRestRequest.AddParameter('refreshToken', vArray1[3], TRESTRequestParameterKind.pkGETorPOST);


       FRestRequest.Method := rmPOST;

       FRestRequest.Execute;
       if FRestResponse.StatusCode >= 400 then
         raise Exception.CreateFmt(FRestResponse.Content, []);

       FMemo.Lines.Text := FRestResponse.JSONValue.Format;
       FToken := FRestResponse.JSONValue.GetValue<String>('accessToken');
       FAccessToken := FRestResponse.JSONValue.GetValue<String>('accessToken');
       FRefreshToken := FRestResponse.JSONValue.GetValue<String>('refreshToken');
       _expires_in := FRestResponse.JSONValue.GetValue<String>('expiresIn');

       DM.InsertTokenBD(vGetOperacao, IncSecond(Now,_expires_in.ToInteger - 60), FAuthorizationCode, FAuthorizationCodeVerifier, FRefreshToken, FAccessToken);
       Result := True;
     finally
       destroyComponents;
     end;

   end;

end;

procedure TThreadNFe_NFCe.GravaLog(Msg: String);
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

procedure TThreadNFe_NFCe.AtualizaPedido(vCREATEDAT, vID, vNOMELOJA, vSTATUSPEDIDO: String;
  vCDCLIENTE, VCDLOJA_GCONNECT, vCDPEDIDO: Integer; vCHANGEFOR, vDELIVERYFEE, vSUBTOTAL, VTAXAADICIONAL, VTIPOENTREGA, VTOTALPRICE: Currency);
begin

  try
    DM._qryAtualizaPedido.Params[0].AsInteger   := vCDCLIENTE;             {CDCLIENTE}
    DM._qryAtualizaPedido.Params[1].AsInteger   := VCDLOJA_GCONNECT;       {CDLOJA_GCONNECT}
    DM._qryAtualizaPedido.Params[2].AsCurrency  := vCHANGEFOR;             {CHANGEFOR}

    DM._qryAtualizaPedido.Params[3].AsString    := vCREATEDAT;             {CREATEDAT}
    DM._qryAtualizaPedido.Params[4].AsCurrency  := vDELIVERYFEE;           {DELIVERYFEE}
    DM._qryAtualizaPedido.Params[5].AsString    := vID;                    {ID}
    DM._qryAtualizaPedido.Params[6].AsString    := vNOMELOJA;              {NOMELOJA}
    DM._qryAtualizaPedido.Params[7].AsString    := vSTATUSPEDIDO;          {STATUSPEDIDO}
    DM._qryAtualizaPedido.Params[8].AsCurrency  := vSUBTOTAL;              {SUBTOTAL}
    DM._qryAtualizaPedido.Params[9].AsCurrency  := VTAXAADICIONAL;         {TAXAADICIONAL}
    DM._qryAtualizaPedido.Params[10].AsCurrency := VTIPOENTREGA;           {TIPOENTREGA}
    DM._qryAtualizaPedido.Params[11].AsCurrency := VTOTALPRICE;            {TOTALPRICE}
    DM._qryAtualizaPedido.Params[12].AsInteger  := vCDPEDIDO;              {CDPEDIDO}
    DM._qryAtualizaPedido.ExecSQL;
    DM._qryAtualizaPedido.Connection.Commit;

  except
    on e: Exception do
    begin
      DM.GravaLog( 'Falha ao atualizar pedido... '  +  E.Message);
    end;
  end;

end;

function TThreadNFe_NFCe.InserePedidoINI(vDeliveryDateTime, vDeliveryDateTimeStart, vDeliveryDateTimeEnd,
  vIsAgendado, vREFERENCE, vSHORTREFERENCE: String): Integer;
var
  GetSeqDelivery: Integer;
begin
  Result := 0;

  DM._qryGetSeqDelivery.Params[0].AsDateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy 00:00:00', Now));
  DM._qryGetSeqDelivery.Close;
  DM._qryGetSeqDelivery.Open;
  GetSeqDelivery := DM._qryGetSeqDelivery.FieldByName('SEQDELIVERY').AsInteger;

  try
    DM._qryInsertPedido.Params[0].AsDateTime  := Now;                                     {DATAPEDIDO}
    DM._qryInsertPedido.Params[1].AsDateTime  := ISO8601ToDate(vDeliveryDateTime);        {DELIVERYDATETIME}

    if vIsAgendado = 'SCHEDULED' then
    begin
      //SCHEDULED
      DM._qryInsertPedido.Params[2].AsDateTime  := ISO8601ToDate(vDeliveryDateTimeStart); {DELIVERYDATETIMESTART}
      DM._qryInsertPedido.Params[3].AsDateTime  := ISO8601ToDate(vDeliveryDateTimeEnd);   {DELIVERYDATETIMEEND}
      DM._qryInsertPedido.Params[4].AsString    := 'S';                                   {ISAGENDADO}
    end
    else begin
      //IMMEDIATE
      DM._qryInsertPedido.Params[2].Clear;                                                {DELIVERYDATETIMESTART}
      DM._qryInsertPedido.Params[3].Clear;                                                {DELIVERYDATETIMEEND}
      DM._qryInsertPedido.Params[4].AsString    := 'N';                                   {ISAGENDADO}
    end;

    DM._qryInsertPedido.Params[5].AsInteger   := GetSeqDelivery;                          {SEQDELIVERY}
    DM._qryInsertPedido.Params[6].AsString    := 'PIN';                                   {STATUSPEDIDO}
    DM._qryInsertPedido.Params[7].AsString    := vREFERENCE;                              {REFERENCE}
    DM._qryInsertPedido.Params[8].AsString    := vSHORTREFERENCE;                         {SHORTREFERENCE}
    DM._qryInsertPedido.ExecSQL;
    DM._qryInsertPedido.Connection.Commit;

    DM._qryGetIDPedido.Close;
    DM._qryGetIDPedido.Params[0].AsString := vSHORTREFERENCE;
    DM._qryGetIDPedido.Open;

    if not DM._qryGetIDPedido.IsEmpty then
      Result := DM._qryGetIDPedido.FieldByName('cdpedido').AsInteger;

  except
    on e: Exception do
    begin
      DM.GravaLog( 'Falha ao iniciar Novo Pedido... '  +  E.Message);
    end;
  end;

end;

procedure TThreadNFe_NFCe.InserePedidoItem(vCDPEDIDO, vCDPRODUTO, vCDPRODUTOPAI,
  vNRITEM: Integer; vDESCRICAO, vISAUXILIAR, vOBSERVATIONS: String; vQUANTIDADE, vVL_DESCONTO, vVL_UNITARIO,
  vVL_TOTAL: Currency);
begin

  try

    DM._qryInsertPedidoItens.Params[0].AsInteger   := vCDPEDIDO;           {CDPEDIDO}
    DM._qryInsertPedidoItens.Params[1].AsInteger   := vCDPRODUTO;          {EXTERNALCODE}

    if vCDPRODUTOPAI > 0 then
      DM._qryInsertPedidoItens.Params[2].AsInteger   := vCDPRODUTOPAI      {EXTERNALCODE_PAI}
    else
      DM._qryInsertPedidoItens.Params[2].Clear;                            {EXTERNALCODE_PAI}

    DM._qryInsertPedidoItens.Params[3].AsString    := vDESCRICAO;          {NAME}
    DM._qryInsertPedidoItens.Params[4].AsString    := vISAUXILIAR;         {ISAUXILIAR}
    DM._qryInsertPedidoItens.Params[5].AsInteger   := vNRITEM;             {NRITEM}
    DM._qryInsertPedidoItens.Params[6].AsString    := vOBSERVATIONS;       {OBSERVATIONS}
    DM._qryInsertPedidoItens.Params[7].AsCurrency  := vQUANTIDADE;         {QUANTITY}
    DM._qryInsertPedidoItens.Params[8].AsCurrency  := vVL_DESCONTO;        {DISCOUNT}
    DM._qryInsertPedidoItens.Params[9].AsCurrency  := vVL_UNITARIO;        {PRICE}
    DM._qryInsertPedidoItens.Params[10].AsString   := 'N';                 {STATUSINTEGRADO}
    DM._qryInsertPedidoItens.Params[11].AsCurrency := vVL_UNITARIO *
                                                      vQUANTIDADE;         {TOTALPRICE}
    DM._qryInsertPedidoItens.ExecSQL;
    DM._qryInsertPedidoItens.Connection.Commit;

  except
    on e: Exception do
    begin
      DM.GravaLog( 'Falha ao InserePedidoItem... '  +  E.Message);
    end;
  end;

end;

procedure TThreadNFe_NFCe.ConfirmaPedido(vCdPedido: Integer; orderId: String);
var
  parameter: TRESTRequestParameter;
  Envio: String;
begin
  FRESTClient.BaseURL := 'https://merchant-api.ifood.com.br/order/v1.0';

  FRESTClient.ContentType := 'application/json';
  FRESTRequest.Accept := 'application/json';
  FRESTRequest.Method := rmPOST;

  parameter := FRESTRequest.Params.AddHeader('Authorization', 'Bearer ' + FToken);
  parameter.Options := [poDoNotEncode];

  FRESTRequest.Resource := '/orders/' + orderId + '/confirm';

  Envio :=    'BaseURL: '     + FRESTClient.BaseURL + #13 +
              'ContentType: ' + FRESTClient.ContentType + #13 +
              'Accept: '      + FRESTRequest.Accept + #13 +
              'Method: POST'  + #13 +
              'Resource: '    + FRESTRequest.Resource;

  DM.InsertLogs(0,
                2,
                'Envio - ConfirmaPedido',
                Envio,
                'IFOOD - ConfirmaPedido',
                'S',
                '');

  FRestRequest.Execute;

  case FRestResponse.StatusCode of
    202: //Accepted
    begin
      DM.InsertLogs(0,
                    2,
                    'Resposta - ConfirmaPedido',
                    '',
                    'IFOOD - ConfirmaPedido',
                    'S',
                    'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Accepted' + #13  +  #13  + FRestResponse.Content);

      DM._qryUpdateStatusPedidoAceiteAut.Params[0].AsInteger := vCdPedido;
      DM._qryUpdateStatusPedidoAceiteAut.ExecSQL;
      DM._qryUpdateStatusPedidoAceiteAut.Connection.Commit;

    end;
    400: //Bad Request
    begin
      DM.InsertLogs(0,
                    2,
                    'Resposta - ConfirmaPedido',
                    '',
                    'IFOOD - ConfirmaPedido',
                    'N',
                    'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Bad Request' + #13  +  #13  + FRestResponse.Content);

    end;
    404: //Not Found
    begin
      DM.InsertLogs(0,
                    2,
                    'Resposta - ConfirmaPedido',
                    '',
                    'IFOOD - ConfirmaPedido',
                    'N',
                    'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Not Found' + #13  +  #13  + FRestResponse.Content);

    end;
    500: //Internal Server Error
    begin
      DM.InsertLogs(0,
                    2,
                    'Resposta - ConfirmaPedido',
                    '',
                    'IFOOD - ConfirmaPedido',
                    'N',
                    'StatusCode: ' + FRestResponse.StatusCode.ToString + #13 + 'Internal Server Error' + #13  +  #13  + FRestResponse.Content);

    end
  end;

end;

procedure TThreadNFe_NFCe.StatusMerchants;
var
  parameter: TRESTRequestParameter;
  vStatusLoja, vValidations, vMensagem: TJSONObject;
  vArrayStatus, vArrayvalidations: TJSONArray;
  available, state, title, subtitle, description, mtitle, msubtitle, mdescription, Envio: String;
  i, h: Integer;
begin
  createComponents;
  try
    FRESTClient.BaseURL := 'https://merchant-api.ifood.com.br/merchant/v1.0';
    FRESTClient.ContentType := 'application/json';
    FRESTRequest.Accept := 'application/json';
    FRESTRequest.Method := rmGET;

    parameter := FRestRequest.Params.AddHeader('Authorization', 'Bearer ' + FToken);

    parameter.Options := [poDoNotEncode];

    FRESTRequest.Resource := '/merchants/' + FMerchantID + '/status';

    Envio :=    'BaseURL: '     + FRESTClient.BaseURL + #13 +
                'ContentType: ' + FRESTClient.ContentType + #13 +
                'Accept: '      + FRESTRequest.Accept + #13 +
                'Method: GET'   + #13 +
                 //'Header: '      + parameter.ToString  + #13 +
                'Resource: '    + FRESTRequest.Resource;

    DM.InsertLogs(0,
                  2,
                  'Envio - StatusMerchants',
                  Envio,
                  'IFOOD - StatusMerchants',
                  'S',
                  '');


    FRestRequest.Execute;

    if FRestResponse.StatusCode = 200 then
    begin
      FMemo.Text := FRestResponse.Content;

      DM.InsertLogs(0,
                    2,
                    'Resposta - StatusMerchants',
                    '',
                    'IFOOD - StatusMerchants',
                    'S',
                    FRestResponse.Content);


      vArrayStatus := FRestResponse.JSONValue.GetValue<TJSONArray>('');

      for i := 0 to vArrayStatus.Count -1 do
      begin
        vStatusLoja := vArrayStatus.Items[i] as TJSONObject;
        vStatusLoja.TryGetValue<string>('available', available); //true-false
        vStatusLoja.TryGetValue<string>('state', state); //OK-CLOSED-ERROR
        vStatusLoja.TryGetValue<TJSONArray>('validations', vArrayvalidations);

        vStatusLoja.TryGetValue<TJSONObject>('message', vMensagem);
        vMensagem.TryGetValue<string>('title', mtitle);
        vMensagem.TryGetValue<string>('subtitle', msubtitle);
        vMensagem.TryGetValue<string>('description', mdescription);
        //ShowMessage(Mtitle);

        for h := 0 to vArrayvalidations.Count -1 do
        begin
          if h = 0 then
          begin
            vValidations := vArrayvalidations.Items[h] as TJSONObject;

            vValidations.TryGetValue<TJSONObject>('message', vValidations);

            vValidations.TryGetValue<string>('title', title);
            vValidations.TryGetValue<string>('subtitle', subtitle);
            vValidations.TryGetValue<string>('description', description);
            //ShowMessage(title);
          end;

        end;


      end;

      if available = 'true' then
      begin
        FStatusLoja.Caption := mtitle + ': (' + title + ')';
        FimgStatus.Picture := _frmMain._imgLojaON.Picture;
      end
      else begin
        FStatusLoja.Caption := mtitle + ' (' + title + ' ' + subtitle + ') ' + 'Detalhes: ' + description;
        FimgStatus.Picture := _frmMain._imgLojaOFF.Picture;
      end;


      FStatusLoja.Hint := available + '|' + state + '|' + title + '|' + subtitle + '|' + description + '|' + mtitle + '|' + msubtitle + '|' + mdescription;
      //StatusLoja(available,state,title,subtitle,description,mtitle,msubtitle,mdescription);
    end
    else
    begin
      //T_frmFormMensagensPadrao.Mensagem('Falha ao deletar Interrupção da Loja!', 'E', [mbOk]);
    end;

  finally
    destroyComponents;
  end;
end;

procedure TThreadNFe_NFCe.TocarBip;
begin
  Winapi.Windows.Beep(5000, 200);
  Winapi.Windows.Beep(1000, 200);
  Winapi.Windows.Beep(3000, 200);
  Winapi.Windows.Beep(5000, 200);
  Winapi.Windows.Beep(7000, 200);
end;

{Edit1.Text :=  Utf8toAnsi(RawByteString(TrataTexto( 'TESTE DE CARACTERES: ATENÇÃO, SOLUÇÕES, meditação, ÉÁÀçÇ ')));}
function TThreadNFe_NFCe.TrataTexto(const pText: string): string;
type
  USAscii20127 = type AnsiString(20127);
begin
  Result := string(USAscii20127(pText));
  //remove aspas simples
  Result := StringReplace(Result, '''', ' ',[rfReplaceAll, rfIgnoreCase])

end;


procedure TThreadNFe_NFCe.VerificaPedidos_and_Status;
var
  StatusNovosPedidos: Integer;
begin
  try
    StatusNovosPedidos := 0;

    DM._qryPedidosNaoAceito.Params[0].AsDateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy 00:00:00', Now));
    DM._qryPedidosNaoAceito.Params[1].AsDateTime := StrToDateTime(FormatDateTime('dd/mm/yyyy 23:59:59', Now));
    DM._qryPedidosNaoAceito.Close;
    DM._qryPedidosNaoAceito.Open;
    StatusNovosPedidos := DM._qryPedidosNaoAceito.RecordCount;

    if StatusNovosPedidos > 0 then
      ChamarAlerta(StatusNovosPedidos.ToString,'CoreFood');

  except
    on e: Exception do
    begin
      DM.GravaLog( 'Falha ao consultar pedidos aceitos ' + 'detalhes do erro: ' + e.Message);
    end;
  end;

end;


end.
