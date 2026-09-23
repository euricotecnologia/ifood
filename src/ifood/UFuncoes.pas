unit UFuncoes;

interface

uses
  System.SysUtils, System.Classes, Vcl.StdCtrls, System.StrUtils, Vcl.Mask,
  Vcl.DBCtrls, Data.DB, Vcl.Forms, Winapi.Windows, System.Win.Registry, FireDAC.Comp.Client,
  Winapi.WinInet, ACBrDownload, pcnConversao, Winapi.ShellAPI,
  ACBrCEP, Datasnap.DBClient, Printers, Winapi.Messages, IniFiles,  WinSpool,
  FireDAC.Phys.IBBase, ACBrPosPrinter, IdBaseComponent,
  IdHTTP, System.IOUtils, System.JSON, Winapi.PsAPI, DateUtils;

type
  TTypeLocalizar = (fsSearch, fsFilter);


type
  Projeto = record
    iEmp: integer; // Id empresa
    sEmp: String;
    sEmpFantasia: String;
    iUsuario: integer; // id usuario
    sUsuario, // Nome do usario
    sUsuarioCaixa, sLoginUsuario, sInfoDevSistema1, // Dados do sistema
    sInfoDevSistema2, sSiteDevSistema, sSoftwareHouse: String;
    bSalvaLayoutCons: boolean;
    bFiltroCreate: boolean;
    bUsaEntregaParcialMat: boolean;
    bUsaControleEstoque: boolean;
    bQualidade: boolean;
    iMaterial: integer;
    dEstoque: double;
    dReserva: double;
    bVersaoAvaliacao: boolean;
    sFoneCliente: String;
    iIDCaixa: integer; // Id Caixa
    dCaixaDataAbertura: TDateTime; // Abertura do caixa
    dCaixaHoraAbertura: TDateTime; // Horario fechamento caixa

    // envio de email
    MailPort: integer;
    MailHost, MailUsername, MailPassword: string;

    // dados da liceça e validação
    DataLiberacao: TDate;
    ValidadeLiberacao: TDate;
    dUltimoAcesso: TDate;
  end;

type

  TConnectionOnException = procedure(EClassName, EMessage: String; xMsg: String = '') of object;

  TFuncAndProc = class(TObject)

    const
      PING_GOOGLE_DOMAIN_BR   = 'https://www.google.com.br';
      PING_FACEBOOK_DOMAIN_BR = 'https://www.facebook.com.br';
      PING_GOOGLE_IPV4_BR     = '173.194.42.152';
      PING_GOOGLE_IPV4_USA    = '173.194.42.148';
      ERR_LOCAL_NETWORK       = 'Cabo de rede desconectado ou rede local mal-configurada';
      ERR_INTERNET_OFFLINE    = 'Sem conexão com a internet.';


    public
      {Retorna o ID único do computador que é gerado pela soma do
      Serial do HD}
      function GetIdComputador: Int64;
      {Função que retorna o Serial do HD somando com o Serial da Placa Mãe}
      function SSerial(FDrive: String): String;
      {Função que retorna o serial da Placa Mãe}
      function CPUID: Int64;

      function GetCep(Cep,fBairro,fCidade,fComplemento,fLogradouro: String; qry: TFDQuery): Boolean;
      function CheckInternet: Boolean;
      procedure GetFTP_HTTP_Download(vACBrDownload: TACBrDownload; IsConcentrador: Boolean);
      procedure GetDadosConn_Download(vACBrDownload: TACBrDownload; IsConcentrador: Boolean);
      function Is64Bits: Boolean;
      procedure SetDadosBD(NomeBD, DataBase, User_Name, Password, Server, isServidor: String);
      function GetDadosBD(NomeBDRegedit: String; con: TFDConnection): String;
      function GetDadosBDTXT(NomeBDRegedit: String): String;
      procedure GetDadosBDbck(NomeBDRegedit, CaminhoBck: String; con: TFDIBBackup);
      function GetDadosBDNoConection(NomeBDRegedit: String): Boolean;
      function CheckKeyBD(NomeBD: String): Boolean;
      function ValidaData(Campo: TSQLTimeStampField; Componente:TDBEdit): Boolean;
      function ValidaDataDW(Input: String): Boolean;
      function ValidaTelefone(Campo: TStringField; Componente:TDBEdit): Boolean;
      function ValidaCNPJ(xCNPJ: String): Boolean;
      function ValidaCPF(xCPF: String): Boolean;
      function EnDecryptInfo(Action, Key, Src: String): String;
      function SenhaDoDia: Integer;
      function VersaoExe:String;
      procedure InsereRegedit;
      function FormatarCNPJ(const CNPJ: string = ''): string;
      function FormatarCPF(const CPF: string = ''): string;
      function GetDefaultPrinterName: String;
      function SetDefaultPrinter(const PrinterName: String): Boolean;
      function GetCurrentPrinterHandle: THandle;
      procedure PurgeJobsOnCurrentPrinter;
      function GetStrNumber(const S: string): string;
      procedure ForceForegroundWindow(hwnd: THandle);
      procedure SetDadosImpressoraESCPOS(ACBrPosPrinter: TACBrPosPrinter; NomeKeyINI: String);
      function RAcent(sENTRADA: String): String;
      function ParcialSLIndexOf(pLista: TStrings; pWord: String): Integer;
      class function ReadWriteIni(Secao, Variavel: String; const Gravar: Boolean = True; const Valor: String = ''): String;
      function VerficarSeAplicaticoEstarRodandoPeloNomeDoExecutavel(Nome: String): Boolean;
      function ValidaContraSenha(vChave, vNrSerieMaquina: String): String;
      function StrIsDate(const S: string): boolean;
      function LerStringConfig(Campo, CaminhoXML : string; default : string =''):string;
      function GetFileVersion(exeName : string): string;


    end;

  var
    D: String = '  /  /    ';
    Proc: TFuncAndProc;
    ACBrCEP1: TACBrCEP;
    FOnException: TConnectionOnException;

implementation

uses UFormMensagensPadrao;

function TFuncAndProc.ValidaTelefone(Campo: TStringField; Componente:TDBEdit): Boolean;
begin
  Result := False;
  if Campo.IsNull then
    Exit
  else begin
    if (Trim(Componente.Text)) <> '' then begin

      if Length(Trim(Componente.Text)) < 10 then begin
        T_frmFormMensagensPadrao.Mensagem('o Telefone digitado é inválido! Por favor faça a correção.','E',[mbOk]);
        //Campo.Clear;
        Componente.SetFocus;
      end
      else
        Result := True;
    end;
  end;
end;

function TFuncAndProc.CheckInternet: Boolean;
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


function TFuncAndProc.CheckKeyBD(NomeBD: String): Boolean;
var
  reg: TRegistry;
begin
  Result := False;

  reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;

  if not Is64Bits then begin
    if reg.KeyExists('SOFTWARE\_iFood\BancoDados\' + NomeBD) then
      Result := True;
  end
  else
    if reg.KeyExists('SOFTWARE\Wow6432Node\_iFood\BancoDados\' + NomeBD) then
      Result := True;


  Reg.CloseKey;

  reg.Free;
end;

function TFuncAndProc.CPUID: Int64;
var
  A,B,C,D: LongWord;
  CPUID: LongWord;
begin
  asm
    push EAX
    push EBX
    push ECX
    push EDX

    mov eax, 1
    db $0F, $A2
    mov A, EAX
    mov B, EBX
    mov C, ECX
    mov D, EDX

    pop EDX
    pop ECX
    pop EBX
    pop EAX
  end;
  CPUID := A;
  Result := CPUID;
end;

function TFuncAndProc.EnDecryptInfo(Action, Key, Src: String): String;
label Fim;
var
  KeyLen, KeyPos, OffSet, SrcPos,
  SrcAsc, TmpSrcAsc, Range: Integer;
  Dest: String;
begin
  try
    if (Src = '') then begin
      Result:= '';
      Goto Fim;
    end;
    Dest := '';
    KeyLen := Length(Key);
    KeyPos := 0;
    {SrcPos := 0;}
    {SrcAsc := 0;}
    Range := 256;
    if (Action = UpperCase('C')) then begin
      Randomize;
      OffSet := Random(Range);
      Dest := Format('%1.2x',[OffSet]);
      for SrcPos := 1 to Length(Src) do
      begin
        Application.ProcessMessages;
        SrcAsc := (Ord(Src[SrcPos]) + OffSet) Mod 255;
        if KeyPos < KeyLen then
          KeyPos := KeyPos + 1 else KeyPos := 1;
        SrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
        Dest := Dest + Format('%1.2x',[SrcAsc]);
        OffSet := SrcAsc;
      end;
    end
    else
      if (Action = UpperCase('D')) then begin
        OffSet := StrToInt('$' + copy(Src,1,2));//<--adiciona o $ entra as aspas simples
        SrcPos := 3;
        repeat
          SrcAsc := StrToInt('$' + copy(Src,SrcPos,2));//<-- adiciona o $ entra as aspas simples
          if (KeyPos < KeyLen) then
            KeyPos := KeyPos + 1
          else
            KeyPos := 1;
          TmpSrcAsc := SrcAsc Xor Ord(Key[KeyPos]);
          if TmpSrcAsc <= OffSet then
            TmpSrcAsc := 255 + TmpSrcAsc - OffSet
          else
            TmpSrcAsc := TmpSrcAsc - OffSet;
          Dest := Dest + Chr(TmpSrcAsc);
          OffSet := SrcAsc;
          SrcPos := SrcPos + 2;
        until (SrcPos >= Length(Src));
      end;
      Result:= Dest;
      Fim:
  except
    raise Exception.Create('Falha ao descriptografar os dados!');
  end;
end;


procedure TFuncAndProc.ForceForegroundWindow(hwnd: THandle);
  // (W) 2001 Daniel Rolf
  // http://www.finecode.de
  // rolf@finecode.de
var
  hlp: TForm;
begin
  hlp := TForm.Create(nil);
  try
    hlp.BorderStyle := bsNone;
    hlp.SetBounds(0, 0, 1, 1);
    hlp.FormStyle := fsStayOnTop;
    hlp.Show;
    mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0);
    mouse_event(MOUSEEVENTF_ABSOLUTE or MOUSEEVENTF_LEFTUP, 0, 0, 0, 0);
    SetForegroundWindow(hwnd);
  finally
    hlp.Free;
  end;
end;

function TFuncAndProc.FormatarCNPJ(const CNPJ: string): string;
var
  I: Integer;
  Caracteres: TSysCharSet;
begin
  Result := '';
  Caracteres:= ['0'..'9'];
  for I := 1 to Length(CNPJ) do
    if CharInSet(CNPJ[I],Caracteres) then
      Result := Result + CNPJ[I];

  if Length(Result) <> 14 then
    raise Exception.Create('CNPJ inválido.')
  else
    Result := Copy(Result, 1, 2) + '.' + Copy(Result, 3, 3) + '.' +
      Copy(Result, 6, 3) + '/' + Copy(Result, 9, 4) + '-' + Copy(Result, 13, 2);
end;

function TFuncAndProc.FormatarCPF(const CPF: string): string;
var
  I: Integer;
  Caracteres: TSysCharSet;
begin
  Result := '';
  Caracteres:= ['0'..'9'];
  for I := 1 to Length(CPF) do
    if CharInSet(CPF[I],Caracteres) then
      Result := Result + CPF[I];

  if Length(Result) <> 11 then
    raise Exception.Create('CPF inválido.')
  else
    Result := Copy(Result, 1, 3) + '.' + Copy(Result, 4, 3) + '.' +
      Copy(Result, 7, 3) + '-' + Copy(Result, 10, 2);
end;


function TFuncAndProc.GetCep(Cep,fBairro,fCidade,fComplemento,fLogradouro: String; qry: TFDQuery): Boolean;
var
  I : Integer ;
begin
  Result := False;

    if CheckInternet then begin

      ACBrCEP1 := TACBrCEP.Create(Application);
      try

        try
          ACBrCEP1.WebService := wsCorreios;
          ACBrCEP1.BuscarPorCEP(Cep);
          if ACBrCEP1.Enderecos.Count < 1 then
             T_frmFormMensagensPadrao.Mensagem('Nenhum endereço encontrado pelo CEP informado!','E',[mbOk])
          else
           begin
             For I := 0 to ACBrCEP1.Enderecos.Count-1 do
             begin
               with ACBrCEP1.Enderecos[I] do
               begin
                  qry.FieldByName(fBairro).AsString := Bairro;
                  qry.FieldByName(fCidade).AsString := Municipio;
                  qry.FieldByName(fComplemento).AsString := Complemento;
                  qry.FieldByName(fLogradouro).AsString := Tipo_Logradouro+ ' ' + Logradouro;
                  Result := True;
               end;
             end;
           end;

        except
           On E : Exception do
           begin
              if Pos(UpperCase('cep nao encontrado'),e.Message) > 0 then begin
                T_frmFormMensagensPadrao.Mensagem('CEP não encontrado!','E',[mbOk]);
                qry.FieldByName(fBairro).Clear;
                qry.FieldByName(fCidade).Clear;
                qry.FieldByName(fComplemento).Clear;
                qry.FieldByName(fLogradouro).Clear;
              end
              else begin
                T_frmFormMensagensPadrao.Mensagem('Falha ao consultar o CEP, verifique a mensagem para maiores detalhes!','E',[mbOk]);
                T_frmFormMensagensPadrao.Mensagem(E.Message,'E',[mbOk]);
              end;
           end;
        end;

      finally
        FreeAndNil(ACBrCEP1);
      end;

    end;
end;

{Uses Printers, WinSpool}
{ Pega o handle da impressora padrão }
function TFuncAndProc.GetCurrentPrinterHandle: THandle;
const
  Defaults: TPrinterDefaults = (pDatatype: nil; pDevMode: nil;
  DesiredAccess: PRINTER_ACCESS_USE or PRINTER_ACCESS_ADMINISTER);
var
  Device, Driver, Port: array [0 .. 255] of char;
  hDeviceMode: THandle;
begin { GetCurrentPrinterHandle }
  Printer.GetPrinter(Device, Driver, Port, hDeviceMode);
  if not OpenPrinter(@Device, Result, @Defaults) then
    RaiseLastOSError;
end;

function TFuncAndProc.GetDadosBD(NomeBDRegedit: String; con: TFDConnection): String;
var
  reg: TRegistry;
  isServidor, vHost: String;
begin
  reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  if not Is64Bits then
    reg.OpenKey('SOFTWARE\_iFood\BancoDados\' + NomeBDRegedit ,True)
  else
    reg.OpenKey('SOFTWARE\Wow6432Node\_iFood\BancoDados\' + NomeBDRegedit ,True);

  con.Params.Clear;
  con.Params.Values['DataBase']   := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386BD', Reg.ReadString('DataBase'));
  con.Params.Values['User_Name']  := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386BD', Reg.ReadString('User_Name'));
  con.Params.Values['Password']   := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386BD', Reg.ReadString('Password'));
  con.Params.Values['Server']     := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386BD', Reg.ReadString('Server'));

  {vHost Para atualização automatica do pré-venda}
  vHost                           := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386BD', Reg.ReadString('Server'));

  con.Params.Values['Protocol']     := 'TCPIP';
  con.Params.Values['CharacterSet'] := 'WIN1252';
  con.Params.Values['DriverID']     := 'FB';

  isServidor := Reg.ReadString('Servidor');

  Result := isServidor + '|' + vHost;

  Reg.CloseKey;

  reg.Free;
end;

procedure TFuncAndProc.GetDadosBDbck(NomeBDRegedit, CaminhoBck: String;
  con: TFDIBBackup);
var
  reg: TRegistry;
begin
  reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  if not Is64Bits then
    reg.OpenKey('SOFTWARE\_iFood\BancoDados\' + NomeBDRegedit ,True)
  else
    reg.OpenKey('SOFTWARE\Wow6432Node\_iFood\BancoDados\' + NomeBDRegedit ,True);


  with con do
  begin
    UserName  := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386BD', Reg.ReadString('User_Name')); // usuario da base de dados
    Password  := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386BD', Reg.ReadString('Password')); // senha da base de dados
    Host      := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386BD', Reg.ReadString('Server')); // local do servidor da base de dados
    Verbose   := True; // capturar retorno/saida do servico da base de dados
    Database  := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386BD', Reg.ReadString('DataBase')); // local e nome da base de dados
    BackupFiles.Clear;
    BackupFiles.Add(CaminhoBck + '\BancoDados_' + FormatDateTime('dd-mm-yyyy_hhnn', Date + Time) + '.bck');
  end;

  Reg.CloseKey;
  reg.Free;
end;

function TFuncAndProc.GetDadosBDNoConection(NomeBDRegedit: String): Boolean;
var
  reg: TRegistry;
begin
  Result := False;

  reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  if not Is64Bits then
    reg.OpenKey('SOFTWARE\_iFood\BancoDados\' + NomeBDRegedit ,True)
  else
    reg.OpenKey('SOFTWARE\Wow6432Node\_iFood\BancoDados\' + NomeBDRegedit ,True);

  if Reg.ReadString('Servidor') = 'True' then
    Result := True;

  Reg.CloseKey;

  reg.Free;
end;

function TFuncAndProc.GetDadosBDTXT(NomeBDRegedit: String): String;
var
  reg: TRegistry;
  isServidor: String;
begin
  reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  if not Is64Bits then
    reg.OpenKey('SOFTWARE\_iFood\BancoDados\' + NomeBDRegedit ,True)
  else
    reg.OpenKey('SOFTWARE\Wow6432Node\_iFood\BancoDados\' + NomeBDRegedit ,True);

  {DataBase|User_Name|Password|Server|isServidor}
  Result :=                Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386BD', Reg.ReadString('DataBase'));
  Result := Result + '|' + Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386BD', Reg.ReadString('User_Name'));
  Result := Result + '|' + Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386BD', Reg.ReadString('Password'));
  Result := Result + '|' + Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386BD', Reg.ReadString('Server'));
  isServidor := Reg.ReadString('Servidor');
  Result := Result + '|' + isServidor;
  Reg.CloseKey;

  reg.Free;
end;

procedure TFuncAndProc.GetDadosConn_Download(vACBrDownload: TACBrDownload;
  IsConcentrador: Boolean);
var
  get_url: string;
  resp: TMemoryStream;
  IdHTTP1: TIdHTTP;
  result: TStrings;
  JsonObject: TJSONObject;
begin
  try
    get_url := 'http://griffedasruas.com.br/conn.php';
    resp := TMemoryStream.Create;
    result := TStringList.Create;
    IdHTTP1 := TIdHTTP.Create(Application);
    try
      IdHTTP1.Get(get_url, resp);
      resp.Position := 0; // <-- add this!!

      result.LoadFromStream(resp);

      JsonObject := TJSONObject.ParseJSONValue(result.Text) as TJSONObject;

      //ShowMessage( JsonObject.GetValue('Protocolo').Value);

      if EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',JsonObject.GetValue('Protocolo').Value) = 'HTTP' then
        vACBrDownload.Protocolo       := protHTTP
      else
        vACBrDownload.Protocolo       := protFTP;

      vACBrDownload.FTP.FtpHost     := EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',JsonObject.GetValue('Host').Value);
      vACBrDownload.FTP.FtpPort     := EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',JsonObject.GetValue('Porta').Value);
      vACBrDownload.FTP.FtpUser     := EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',JsonObject.GetValue('Usuario').Value);
      vACBrDownload.FTP.FtpPass     := EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',JsonObject.GetValue('Senha').Value);
      vACBrDownload.Proxy.ProxyHost := EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',JsonObject.GetValue('ProxyHost').Value);
      vACBrDownload.Proxy.ProxyPort := EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',JsonObject.GetValue('ProxyPorta').Value);
      vACBrDownload.Proxy.ProxyUser := EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',JsonObject.GetValue('ProxyUsuario').Value);
      vACBrDownload.Proxy.ProxyPass := EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',JsonObject.GetValue('ProxySenha').Value);


      if IsConcentrador then
      begin
        vACBrDownload.DownloadUrl     := EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',JsonObject.GetValue('URLConcentrador').Value);
        vACBrDownload.DownloadNomeArq := EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',JsonObject.GetValue('NomeArquivoConcentrador').Value);
      end
      else begin
        vACBrDownload.DownloadUrl     := EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',JsonObject.GetValue('URLCaixa').Value);
        vACBrDownload.DownloadNomeArq := EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',JsonObject.GetValue('NomeArquivoCaixa').Value);
      end;

      vACBrDownload.DownloadDest     := EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',JsonObject.GetValue('Destino').Value);
      vACBrDownload.SizeRecvBuffer   := StrToInt(EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',JsonObject.GetValue('BufferSize').Value));

      FreeAndNil(JsonObject);


    finally
      FreeAndNil(result);
      FreeAndNil(IdHTTP1);
      resp.Free;
    end;

  except


  end;

end;

function TFuncAndProc.GetDefaultPrinterName: String;
begin
  if(Printer.PrinterIndex >= 0)then
    Result := Printer.Printers[Printer.PrinterIndex]
  else
    Result := 'Nenhuma impressora Padrão foi detectada';
end;

function TFuncAndProc.GetFileVersion(exeName: string): string;
const
  c_StringInfo = 'StringFileInfo\040904E4\FileVersion';
var
  n, Len : cardinal;
  Buf, Value : PChar;
begin
  Result := '';
  n := GetFileVersionInfoSize(PChar(exeName),n);
  if n > 0 then begin
    Buf := AllocMem(n);
    try
      GetFileVersionInfo(PChar(exeName),0,n,Buf);
      if VerQueryValue(Buf,PChar(c_StringInfo),Pointer(Value),Len) then begin
        Result := Trim(Value);
      end;
    finally
      FreeMem(Buf,n);
    end;
  end;
end;

procedure TFuncAndProc.GetFTP_HTTP_Download(vACBrDownload: TACBrDownload;
  IsConcentrador: Boolean);
var
  reg: TRegistry;
begin
  reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  if not Is64Bits then
    reg.OpenKey('SOFTWARE\_iFood\ConexaoWeb\' + 'FTP_HTTP' ,True)
  else
    reg.OpenKey('SOFTWARE\Wow6432Node\_iFood\ConexaoWeb\' + 'FTP_HTTP' ,True);

  if Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',Reg.ReadString('Protocolo')) = 'HTTP' then
    vACBrDownload.Protocolo       := protHTTP
  else
    vACBrDownload.Protocolo       := protFTP;

  vACBrDownload.FTP.FtpHost     := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',Reg.ReadString('Host'));
  vACBrDownload.FTP.FtpPort     := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',Reg.ReadString('Porta'));
  vACBrDownload.FTP.FtpUser     := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',Reg.ReadString('Usuario'));
  vACBrDownload.FTP.FtpPass     := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',Reg.ReadString('Senha'));

  vACBrDownload.Proxy.ProxyHost := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',Reg.ReadString('ProxyHost'));
  vACBrDownload.Proxy.ProxyPort := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',Reg.ReadString('ProxyPorta'));
  vACBrDownload.Proxy.ProxyUser := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',Reg.ReadString('ProxyUsuario'));
  vACBrDownload.Proxy.ProxyPass := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',Reg.ReadString('ProxySenha'));

  if IsConcentrador then
    vACBrDownload.DownloadUrl     := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',Reg.ReadString('URLConcentrador'))
  else
    vACBrDownload.DownloadUrl     := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',Reg.ReadString('URLCaixa'));

  vACBrDownload.DownloadDest    := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',Reg.ReadString('Destino'));
  if IsConcentrador then
    vACBrDownload.DownloadNomeArq := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',Reg.ReadString('NomeArquivoConcentrador'))
  else
    vACBrDownload.DownloadNomeArq := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',Reg.ReadString('NomeArquivoCaixa'));

  vACBrDownload.SizeRecvBuffer  := StrToInt(Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386FTP_HTTP',Reg.ReadString('BufferSize')));

  Reg.CloseKey;

  reg.Free;
end;

function TFuncAndProc.GetIdComputador: Int64;
var
  Drive: String;
begin
  {Pega o Drive que o Windows está instalado}
  SetLength(Drive, MAX_PATH);
  if GetWindowsDirectory(PChar(Drive), MAX_PATH) > 0 then
    Drive := Drive[1]
  else
    Drive := 'C';

  Result := StrToInt64(SSerial(Drive));
end;

{somente os números de uma String}
function TFuncAndProc.GetStrNumber(const S: string): string;
var
  vText : PChar;
begin
  vText := PChar(S);
  Result := '';

  while (vText^ <> #0) do
  begin
    {$IFDEF UNICODE}
    if CharInSet(vText^, ['0'..'9']) then
    {$ELSE}
    if vText^ in ['0'..'9'] then
    {$ENDIF}
      Result := Result + vText^;

    Inc(vText);
  end;
end;

procedure TFuncAndProc.InsereRegedit;
begin
  if Is64Bits then begin
    ShellExecute(0, nil, 'regedit.exe', '/s "C:\iFood - Concentrador\Arquivos\FTPSmart64.reg"', nil, SW_SHOWMINIMIZED);
    ShellExecute(0, nil, 'regedit.exe', '/s "C:\iFood - Concentrador\Arquivos\SuperDB64.reg"', nil, SW_SHOWMINIMIZED);

    {if FileExists('C:\PdvSmart - Concentrador\Arquivos\BdNutricorpus64.reg') then begin
      ShellExecute(0, nil, 'regedit.exe', '/s "C:\iFood - Concentrador\Arquivos\BdNutricorpus64.reg"', nil, SW_SHOWMINIMIZED);
      //DeleteFile('C:\PdvSmart - Concentrador\Arquivos\BdNutricorpus64.reg');
    end;}

  end
  else begin
    ShellExecute(0, nil, 'regedit.exe', '/s "C:\iFood - Concentrador\Arquivos\FTPSmart32.reg"', nil, SW_SHOWMINIMIZED);
    ShellExecute(0, nil, 'regedit.exe', '/s "C:\iFood - Concentrador\Arquivos\SuperDB32.reg"', nil, SW_SHOWMINIMIZED);

    {if FileExists('C:\PdvSmart - Concentrador\Arquivos\BdNutricorpus32.reg') then begin
      ShellExecute(0, nil, 'regedit.exe', '/s "C:\iFood - Concentrador\Arquivos\BdNutricorpus32.reg"', nil, SW_SHOWMINIMIZED);
      //DeleteFile('C:\iFood - Concentrador\Arquivos\BdNutricorpus32.reg');
    end;}
  end;


end;

function TFuncAndProc.Is64Bits: Boolean;
const
  PROCESSOR_ARCHITECTURE_INTEL = $0000;
  PROCESSOR_ARCHITECTURE_IA64 = $0006;
  PROCESSOR_ARCHITECTURE_AMD64 = $0009;
  PROCESSOR_ARCHITECTURE_UNKNOWN = $FFFF;
var
  xSysInfo: TSystemInfo;
begin
  GetNativeSystemInfo(xSysInfo);
  case xSysInfo.wProcessorArchitecture of
    PROCESSOR_ARCHITECTURE_AMD64, PROCESSOR_ARCHITECTURE_IA64:
      Result := True;
  else
    Result := False;
  end;
end;

function TFuncAndProc.LerStringConfig(Campo, CaminhoXML,
  default: string): string;
var cd : TClientDataSet;
begin
  Campo := uppercase(Campo);
  if FileExists(CaminhoXML) then
  begin
    cd := TClientDataSet.Create(nil);
    cd.FileName := CaminhoXML;
    cd.open;

    if (cd.Locate('NOME', Campo, [])) then
      result:=cd.FieldByName('TEXTO').AsString
    else
      result:=default;
    cd.Free;
  end
  else
    result:=default;
end;

{ mata todos os trabalhos da impressora }
function TFuncAndProc.ParcialSLIndexOf(pLista: TStrings;
  pWord: String): Integer;
begin
  for Result := 0 to pLista.Count - 1 do
      if Pos(pWord, pLista[Result]) > 0 then
          Exit;

  Result := -1;
end;

procedure TFuncAndProc.PurgeJobsOnCurrentPrinter;
var
  hPrinter: THandle;
begin
  hPrinter := GetCurrentPrinterHandle;
  try
    if not WinSpool.SetPrinter(hPrinter, 0, nil, PRINTER_CONTROL_PURGE) then
      RaiseLastOSError;
  finally
    ClosePrinter(hPrinter);
  end;
end;

function TFuncAndProc.RAcent(sENTRADA: String): String;
const ComAcento = 'áàâäãéèêëíìîïóòôöõúùûüçÁÀÂÄÃÉÈÊËÍÌÎÏÓÒÔÖÕÚÙÛÜÇ';
      SemAcento = 'aaaaaeeeeiiiiooooouuuucAAAAAEEEEIIIIOOOOOUUUUC';
var
  i: Integer;
begin
  for i := 1 to Length(sENTRADA) Do
    if Pos(sENTRADA[i], ComAcento) <> 0 Then
    sENTRADA[i] := SemAcento[Pos(sENTRADA[i], ComAcento)];
    Result := sENTRADA;
end;

class function TFuncAndProc.ReadWriteIni(Secao, Variavel: String;
  const Gravar: Boolean; const Valor: String): String;
var
  Ini: TIniFile;
begin
  Ini := TIniFile.Create(TPath.Combine(ExtractFilePath(Application.ExeName), 'Arquivos\Config.ini'));
  try
    Result := '';

    if Gravar then
      Ini.WriteString(Secao, Variavel, Valor)
    else
      Result := Ini.ReadString(Secao, Variavel, Valor);

  finally
    FreeAndNil(Ini);
  end;
end;

function TFuncAndProc.SenhaDoDia: Integer;
var
  Dia, Mes, Ano: String;
  DataDia: TDateTime;
begin
  DataDia := Now;
  Dia := FormatDateTime('dd',DataDia);
  Mes := FormatDateTime('mm',DataDia);
  Ano := FormatDateTime('yyyy',DataDia);
  Result := StrToInt(dia) + StrToInt(mes) + StrToInt(ano);
end;

procedure TFuncAndProc.SetDadosBD(NomeBD, DataBase, User_Name, Password, Server,
  isServidor: String);
var
  reg: TRegistry;
begin
  reg := TRegistry.Create;
  reg.RootKey := HKEY_LOCAL_MACHINE;
  if not Is64Bits then
    reg.OpenKey('SOFTWARE\_iFood\BancoDados\'  + NomeBD ,True)
  else
    reg.OpenKey('SOFTWARE\_iFood\BancoDados\'  + NomeBD ,True);


  try

    Reg.WriteString('DataBase', Proc.EnDecryptInfo('C','PdvSmartPwdJ6T2H140386BD',DataBase));
    Reg.WriteString('User_Name', Proc.EnDecryptInfo('C','PdvSmartPwdJ6T2H140386BD',User_Name));
    Reg.WriteString('Password', Proc.EnDecryptInfo('C','PdvSmartPwdJ6T2H140386BD',Password));
    Reg.WriteString('Server', Proc.EnDecryptInfo('C','PdvSmartPwdJ6T2H140386BD',Server));
    Reg.WriteString('Servidor',isServidor);

    Reg.CloseKey;

  except
    Application.MessageBox('Erro ao gravar no registro!','Mensagem do Sistema',0);
    reg.Free;
  end;

  reg.Free;

end;

procedure TFuncAndProc.SetDadosImpressoraESCPOS(ACBrPosPrinter: TACBrPosPrinter; NomeKeyINI: String);
var
  ArqIni: TIniFile;
begin
    ArqIni := TIniFile.Create(ExtractFilePath(ParamStr(0)) + 'Arquivos\Config.ini');
    try

      ACBrPosPrinter.Device.ParamsString := ArqINI.ReadString(NomeKeyINI,'DeviceParams',ACBrPosPrinter.Device.ParamsString);
      ACBrPosPrinter.Modelo := TACBrPosPrinterModelo(ArqINI.ReadInteger(NomeKeyINI,'Modelo', Integer(ACBrPosPrinter.Modelo)));
      ACBrPosPrinter.Porta  := ArqINI.ReadString(NomeKeyINI,'Porta',ACBrPosPrinter.Porta);
      ACBrPosPrinter.ArqLOG := '';
      ACBrPosPrinter.LinhasBuffer := ArqINI.ReadInteger(NomeKeyINI,'LinhasBuffer',ACBrPosPrinter.LinhasBuffer);
      ACBrPosPrinter.LinhasEntreCupons := ArqINI.ReadInteger(NomeKeyINI,'LinhasPular',ACBrPosPrinter.LinhasEntreCupons);
      ACBrPosPrinter.EspacoEntreLinhas := ArqINI.ReadInteger(NomeKeyINI,'EspacoEntreLinhas',ACBrPosPrinter.EspacoEntreLinhas);
      ACBrPosPrinter.ColunasFonteNormal := ArqINI.ReadInteger(NomeKeyINI,'Colunas',ACBrPosPrinter.ColunasFonteNormal);
      ACBrPosPrinter.ControlePorta := ArqINI.ReadBool(NomeKeyINI,'ControlePorta',ACBrPosPrinter.ControlePorta);
      ACBrPosPrinter.CortaPapel := ArqINI.ReadBool(NomeKeyINI,'CortarPapel',ACBrPosPrinter.CortaPapel);
      ACBrPosPrinter.TraduzirTags := ArqINI.ReadBool(NomeKeyINI,'TraduzirTags',ACBrPosPrinter.TraduzirTags);
      ACBrPosPrinter.IgnorarTags := ArqINI.ReadBool(NomeKeyINI,'IgnorarTags',ACBrPosPrinter.IgnorarTags);
      ACBrPosPrinter.PaginaDeCodigo := TACBrPosPaginaCodigo( ArqINI.ReadInteger(NomeKeyINI,'PaginaDeCodigo',Integer(ACBrPosPrinter.PaginaDeCodigo)) );
      //ACBrPosPrinter.Ativar ;

    finally
      FreeAndNil(ArqINI);
    end;

end;

function TFuncAndProc.SetDefaultPrinter(const PrinterName: String): Boolean;
var
  s2: String;
  dum1: PChar;
  xx, qq: Integer;
const
  cs1: PChar = 'Windows';
  cs2: PChar = 'Device';
  cs3: PChar = 'Devices';
  cs4: PChar = #0;
begin
  xx := 254;
  GetMem( dum1, xx);
  Result := False;
  try
    qq := GetProfileString( cs3, pchar( printerName ), #0, dum1, xx);
    if (qq > 0) and (trim( strpas( dum1 )) <> '') then begin
      s2 := PrinterName + ',' + strpas( dum1 );
      while GetProfileString( cs1, cs2, cs4, dum1, xx) > 0 do
        WriteProfileString( cs1, cs2, #0);
      WriteProfileString( cs1, cs2, pchar( s2 ));
      case Win32Platform of
       VER_PLATFORM_WIN32_NT :
        // SendMessage( HWND_BROADCAST, WM_WININICHANGE, 0, LongInt(cs1));
        // VER_PLATFORM_WIN32_WINDOWS :
        // SendMessage( HWND_BROADCAST, WM_SETTINGCHANGE, 0, LongInt(cs1));
       end;
      Result := True;
    end;
  finally
    FreeMem( dum1 );
  end;
end;

function TFuncAndProc.SSerial(FDrive: String): String;
var
  Serial: DWord;
  DirLen, Flags: DWord;
  DLabel: array[0..11] of Char;
  Conta: Int64;
begin
  try
    GetVolumeInformation(PChar(FDrive + ':\'),DLabel,12,@Serial,DirLen,Flags,nil,0);
    Conta :=  Serial + CPUID;
    Result := FloatToStr(Conta);
  except
    Result := '';
  end;
end;

function TFuncAndProc.StrIsDate(const S: string): boolean;
begin
  try
    StrToDate(S);
    Result := True;
  except
    Result := False;
  end;
end;

function TFuncAndProc.ValidaCNPJ(xCNPJ: String): Boolean;
var
  cnpj: String;
  dg1, dg2: Integer;
  x, total: Integer;
  ret: Boolean;
begin
  ret := False;
  cnpj := '';
  // Analisa os formatos
  if Length(xCNPJ) = 18 then
    if (Copy(xCNPJ, 3, 1) + Copy(xCNPJ, 7, 1) + Copy(xCNPJ, 11,
        1) + Copy(xCNPJ, 16, 1) = '../-') then
    begin
      cnpj := Copy(xCNPJ, 1, 2) + Copy(xCNPJ, 4, 3) + Copy(xCNPJ, 8, 3)
        + Copy(xCNPJ, 12, 4) + Copy(xCNPJ, 17, 2);
      ret := True;
    end;
  if Length(xCNPJ) = 14 then
  begin
    cnpj := xCNPJ;
    ret := True;
  end;
  // Verifica
  if ret then
  begin
    try
      // 1° digito
      total := 0;
      for x := 1 to 12 do
      begin
        if x < 5 then
          Inc(total, StrToInt(Copy(cnpj, x, 1)) * (6 - x))
        else
          Inc(total, StrToInt(Copy(cnpj, x, 1)) * (14 - x));
      end;
      dg1 := 11 - (total mod 11);
      if dg1 > 9 then
        dg1 := 0;
      // 2° digito
      total := 0;
      for x := 1 to 13 do
      begin
        if x < 6 then
          Inc(total, StrToInt(Copy(cnpj, x, 1)) * (7 - x))
        else
          Inc(total, StrToInt(Copy(cnpj, x, 1)) * (15 - x));
      end;
      dg2 := 11 - (total mod 11);
      if dg2 > 9 then
        dg2 := 0;
      // Validação final
      if (dg1 = StrToInt(Copy(cnpj, 13, 1))) and
        (dg2 = StrToInt(Copy(cnpj, 14, 1))) then
        ret := True
      else
        ret := False;
    except
      ret := False;
    end;
    {Cnpj Inválidos}
    case AnsiIndexStr(cnpj, ['00000000000000', '11111111111111',
                             '22222222222222', '33333333333333',
                             '44444444444444', '55555555555555',
                             '66666666666666', '77777777777777',
                             '88888888888888', '99999999999999']) of
      0 .. 9: ret := False;

    end;
  end;
  ValidaCNPJ := ret;
end;

function TFuncAndProc.ValidaContraSenha(vChave, vNrSerieMaquina: String): String;
var
  ResultDataInicial, ResultDataFinal,
  Chave, SerialHD: string;
  DiasRestantes: Integer;
  MyArray: TArray<string>;
  vDataInicial, vDataFinal: TDateTime;
  procedure invalida_aborta;
  begin
    Application.MessageBox('Chave de ativação inválida!', 'Atenção', MB_ICONWARNING);
    Abort;
  end;

begin

  Chave := vChave;
  vDataInicial := Now;
  vDataFinal := Now;

  try
    Chave := Proc.EnDecryptInfo('D','PdvSmartPwdJ6T2H140386CONTRASENHA', Chave);
  except
    invalida_aborta;
  end;

  MyArray := Chave.Split(['|']);

  ResultDataInicial := ReverseString( MyArray[0] );
  ResultDataFinal := ReverseString( MyArray[1] );

  // VERIFICA SE A DATA INICIAL É VALIDA
  if not StrIsDate(ResultDataInicial) then
    invalida_aborta
  else
    vDataInicial := StrToDate(ResultDataInicial);

  // VERIFICA SE A DATA FINAL É VALIDA
  if not StrIsDate(ResultDataFinal) then
  begin
    invalida_aborta;
  end
  else
    vDataFinal := StrToDate(ResultDataFinal);

  SerialHD := MyArray[2];
  DiasRestantes := DaysBetween(vDataFinal, vDataInicial);

  //Caso volte a data
  if vDataInicial > Date then
    DiasRestantes := 0;

  if vDataFinal = Date then
    DiasRestantes := 0;

  Result := DiasRestantes.ToString + '|' + DateToStr(vDataInicial) + '|' + DateToStr(vDataFinal) + '|' + SerialHD + '|' + vChave;
end;


function TFuncAndProc.ValidaCPF(xCPF: String): Boolean;
var
  d1, d4, xx, nCount, resto, digito1, digito2: Integer;
  Check: String;
begin
  try
    d1 := 0;
    d4 := 0;
    xx := 1;
    for nCount := 1 to Length(xCPF) - 2 do
    begin
      if Pos(Copy(xCPF, nCount, 1), '/-.') = 0 then
      begin
        d1 := d1 + (11 - xx) * StrToInt(Copy(xCPF, nCount, 1));
        d4 := d4 + (12 - xx) * StrToInt(Copy(xCPF, nCount, 1));
        xx := xx + 1;
      end;
    end;
    resto := (d1 mod 11);
    if resto < 2 then
    begin
      digito1 := 0;
    end
    else
    begin
      digito1 := 11 - resto;
    end;
    d4 := d4 + 2 * digito1;
    resto := (d4 mod 11);
    if resto < 2 then
    begin
      digito2 := 0;
    end
    else
    begin
      digito2 := 11 - resto;
    end;
    Check := IntToStr(digito1) + IntToStr(digito2);
    if Check <> Copy(xCPF, succ(Length(xCPF) - 2), 2) then
    begin
      Result := False;
    end
    else
    begin
      Result := True;
    end;

    case AnsiIndexStr(xCPF, ['00000000000', '11111111111',
                             '22222222222', '33333333333',
                             '44444444444', '55555555555',
                             '66666666666', '77777777777',
                             '88888888888', '99999999999']) of
      0 .. 9: Result := False;
    end;

  except
    Result := False;
  end;
end;


function TFuncAndProc.ValidaData(Campo: TSQLTimeStampField; Componente:TDBEdit): Boolean;
begin
  try
    if (Componente.Text = '') or (Componente.Text = D)then begin
      Result := False;
     exit;
    end
     else begin
        StrToDate(Componente.Text);
        Result := True;
     end;
  except
    T_frmFormMensagensPadrao.Mensagem('A Data digitada é inválida! Por favor faça a correção.','E',[mbOk]);
    Campo.Clear;
    Componente.SetFocus;
    Result := False;
  end;
end;

function TFuncAndProc.ValidaDataDW(Input: String): Boolean;
begin
  try
    if (Input = '') or (Input = D)then begin
      Result := False;
     exit;
    end
     else begin
        StrToDate(Input);
        Result := True;
     end;
  except
    T_frmFormMensagensPadrao.Mensagem('A Data digitada é inválida! Por favor faça a correção.','E',[mbOk]);
    Result := False;
  end;
end;


function TFuncAndProc.VerficarSeAplicaticoEstarRodandoPeloNomeDoExecutavel(
  Nome: String): Boolean;
var
  rId:array[0..999] of DWord;
  i, NumProc, NumMod: DWord;
  HProc, HMod:THandle;
  sNome, sNomeTratado:String;
  Tamanho, Count: Integer;
begin
  Result := False;
  SetLength(sNome, 256);
  // Aqui vc pega os IDs dos processos em execução
  EnumProcesses(@rId[0], 4000, NumProc);

  // Aqui vc faz um for p/ pegar cada processo
  for i := 0 to NumProc div 4 do
  begin
  // Aqui vc seleciona o processo
    HProc := OpenProcess(Process_Query_Information or Process_VM_Read, False, rId[i]);
    if HProc = 0 then
      Continue;
    // Aqui vc pega os módulos do processo
    // Como vc só quer o nome do programa, então será sempre o primeiro
    EnumProcessModules(HProc, @HMod, 4, NumMod);
    // Aqui vc pega o nome do módulo; como é o primeiro, é o nome do programa
    GetModuleBaseName(HProc, HMod, @sNome[1], 256);
    sNomeTratado := trim(sNome);
    Tamanho := Length(SnomeTratado);
     Count := 1;
     while Count <= Tamanho do
       begin
         if SnomeTratado[Count] = '' Then
           Break;
        Count := Count+1;
       end;
     sNomeTratado := Copy(SnomeTratado,1,Count-1);
    if AnsiUpperCase(sNomeTratado)=AnsiUpperCase(Nome) Then
      Result := True;
    // Aqui vc libera o handle do processo selecionado
    CloseHandle(HProc);
  end;
end;

function TFuncAndProc.VersaoExe: String;
type
  PFFI = ^vs_FixedFileInfo;
var
  F: PFFI;
  Handle: Dword;
  Len: Longint;
  Data: Pchar;
  Buffer: Pointer;
  Tamanho: Dword;
  Parquivo: Pchar;
  Arquivo: String;
begin
  Arquivo := Application.ExeName;
  Parquivo := StrAlloc(Length(Arquivo) + 1);
  StrPcopy(Parquivo, Arquivo);
  Len := GetFileVersionInfoSize(Parquivo, Handle);
  Result := '';
  if Len > 0 then
  begin
    Data := StrAlloc(Len + 1);
    if GetFileVersionInfo(Parquivo, Handle, Len, Data) then
    begin
      VerQueryValue(Data, '\', Buffer, Tamanho);
      F := PFFI(Buffer);
      Result := Format('%d.%d.%d.%d', [HiWord(F^.dwFileVersionMs),
        LoWord(F^.dwFileVersionMs), HiWord(F^.dwFileVersionLs),
        LoWord(F^.dwFileVersionLs)]);
    end;
    StrDispose(Data);
  end;
  StrDispose(Parquivo);
end;


end.
