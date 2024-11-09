unit uAtuApp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, IdTCPConnection,
  IdTCPClient, IdExplicitTLSClientServerBase, IdFTP, IdBaseComponent,
  IdComponent, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdException, ShellAPI, ActiveX, ComObj,ShlObj, Vcl.ExtCtrls,
  Xml.xmldom, Xml.XMLIntf, Xml.XMLDoc, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList;

type
  TfAtuApp = class(TForm)
    IdSSLIOHandlerSocketOpenSSL: TIdSSLIOHandlerSocketOpenSSL;
    IdFTPAtu: TIdFTP;
    TimerVerAtu: TTimer;
    XMLDocVersao: TXMLDocument;
    PanelAtu: TPanel;
    MemoAtu: TMemo;
    Image1: TImage;
    lbAppNom: TLabel;
    ImageList1: TImageList;
    pbAtuApp: TProgressBar;
    imAppLog: TImage;
    procedure TimerVerAtuTimer(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Verificaratualizao(Sender: TObject);
    procedure BaixarArquivos;
    procedure BaixarVersao;
    procedure GravaLog(NomeDoLog,Log:String);
    function ConectarAoServidorFTP: boolean;
    function VerificaVersao: boolean;
  end;

var
  fAtuApp: TfAtuApp;
  AppNom, DirApp, DirExe, DirUpd, DirLog, ArqLog, DirTmp : String;
  NumProc, FnTamanhoTotal : Integer;
  Modo: String;

implementation

{$R *.dfm}

uses uDM, uVersao;

procedure TFAtuApp.Verificaratualizao(Sender: TObject);

var ShellLink : IShellLink;
    PersistFile : IPersistFile;
    NomeLnk : WideString;
    DirDesktop: String;
    ItemIDList :  PItemIDList;
    script: TStringList;
    erro: integer;
begin

  NumProc := 1;
  AppNom := dm.cdsConfiguracao.FieldByName('AppNom').AsString;
  DirApp := GetEnvironmentVariable('APPDATA') + '\Auxiliares\' + AppNom + '\';
  DirExe := ExtractFilePath(Application.ExeName);
  DirUpd := GetEnvironmentVariable('APPDATA') + '\Auxiliares\' + AppNom + '\Update\';
  DirLog := GetEnvironmentVariable('APPDATA') + '\Auxiliares\' + AppNom + '\Log\';
  ArqLog := DirLog + AppNom + '.log';
  DirTmp := GetEnvironmentVariable('APPDATA') + '\Auxiliares\' + AppNom + '\Tmp\';

  pbAtuApp.Position := 10;

  modo := 'ATUALIZACAO';

  if not DirectoryExists(DirApp) then
    Begin
      ForceDirectories(DirApp);
      ForceDirectories(DirLog);
      ForceDirectories(DirUpd);
      ForceDirectories(DirTmp);

      GravaLog(ArqLog,'Pasta: ' + DirApp + ' foi criada. ');
      GravaLog(ArqLog,'Pasta: ' + DirUpd + ' foi criada. ');
      GravaLog(ArqLog,'Pasta: ' + DirLog + ' foi criada. ');
      GravaLog(ArqLog,'Pasta: ' + DirTmp + ' foi criada. ');

      modo := 'INSTALACAO';
    End
  else
    begin
      if not DirectoryExists(DirLog) then
        begin
          ForceDirectories(DirLog);
          GravaLog(ArqLog,'Pasta: ' + DirLog + ' foi criada. ');
          modo := 'INSTALACAO';
        end;

      if not DirectoryExists(DirUpd) then
        begin
          ForceDirectories(DirUpd);
          GravaLog(ArqLog,'Pasta: ' + DirUpd + ' foi criada. ');
          modo := 'INSTALACAO';
        end;

      if not DirectoryExists(DirTmp) then
        begin
          ForceDirectories(DirTmp);
          GravaLog(ArqLog,'Pasta: ' + DirTmp + ' foi criada. ');
          modo := 'INSTALACAO';
        end;
    end;

    pbAtuApp.Position := 20;

    if (ConectarAoServidorFTP) then
      begin

        BaixarVersao;

        pbAtuApp.Position := 30;

        if VerificaVersao then
          begin
            BaixarArquivos;
            GravaLog(ArqLog,'O arquivo ' + AppNom + '.rar foi baixado do ftp. ');

            if FileExists(DirUpd  + AppNom + '.rar') then
              begin

                ShellExecute(0,'open',PChar('"' + DirUpd + '7z.exe"'),PChar(' e -aoa "' + DirUpd + AppNom + '.rar"' + ' -o' + DirTmp),nil,SW_HIDE);
                GravaLog(ArqLog,'O arquivo de atualização: ' + DirTmp  + AppNom + '.rar' + ' foi descompactado. ');

                // criar atalho
                SetLength(DirDesktop,MAX_PATH);
                SHGetSpecialFolderLocation(Application.Handle,CSIDL_DESKTOPDIRECTORY,ItemIDList);
                SHGetPathFromIDList(ItemIdList,PChar(DirDesktop));
                SetLength(DirDesktop,StrLen(PChar(DirDesktop)));

                ShellLink := CreateComObject(CLSID_ShellLink) as IShellLink;
                PersistFile := ShellLink as IPersistFile;
                with ShellLink do
                  begin

                    // Informe o Título do ícone
                    SetDescription(PChar(dm.cdsConfiguracao.FieldByName('AppNcp').AsString));

                    // Informe o Caminho e o Arquivo
                    SetPath(PChar(DirApp + AppNom + '.exe'));

                    // Argumentos para linha de comando, caso existam
                    SetArguments(PChar(''));

                    // Informe o Caminho e o Arquivo
                    SetWorkingDirectory(PChar(DirApp));
                  end;

                pbAtuApp.Position := 40;

                // Informe o nome do Atalho
                NomeLnk := DirDesktop + '\'+ dm.cdsConfiguracao.FieldByName('AppNcp').AsString +'.lnk';

                if FileExists(NomeLnk) then
                      begin
                        DeleteFile(NomeLnk);
                        GravaLog(ArqLog,'O atalho: ' + NomeLnk + ' foi excluído. ');
                      end;

                PersistFile.Save(PWideChar(NomeLnk),False);
                GravaLog(ArqLog,'O atalho: ' + NomeLnk + ' foi criado. ');

                pbAtuApp.Position := 50;

                script := TStringList.Create;
                script.Clear;
                //script.Add('@echo off');
                script.Add(':Label1');
                script.Add('if Exist ' +  DirApp + AppNom + '.exe (del ' + DirApp + AppNom + '.exe)');
                script.Add('if Exist ' +  DirApp + AppNom + '.exe' + ' goto Label1');
                script.Add(':Label2');
                script.Add(DirUpd + '7z.exe e -aoa ' + DirUpd + AppNom + '.rar' + ' -o' + DirApp);
                //script.Add('copy /Y ' + DirTmp + '*.* ' + DirApp);
                script.Add('if Exist ' +  DirApp + AppNom + '.exe (start "'+ AppNom +'" "' + DirApp + AppNom + '.exe") else (goto Label2)');
                //script.Add('del /Q ' + DirTmp + '*.*');
                //script.Add('del /Q ' + DirUpd + '*.*');
                //script.Add('del /Q ' + DirApp + 'script.bat');
                script.Add('exit');
                script.SaveToFile(PChar(DirApp + 'script.bat'));

                GravaLog(ArqLog,'Executando script.bat ');

                pbAtuApp.Position := 70;

                if FileExists(DirApp + 'script.bat') then
                  begin
                    ShellExecute(Handle,nil,'cmd.exe',PWideChar('/c ' + DirApp + 'script.bat > ' + DirLog + 'script.log'),nil,sw_hide);
                    GravaLog(ArqLog,'Encerrando ' + AppNom + ' com a versão antiga. ');
                    Application.Terminate;
                  end
                else
                  begin
                    GravaLog(ArqLog,'O arquico de script:' + DirApp + 'script.bat, não foi encontrado. ');
                  end;
              end
            else
              begin
                GravaLog(ArqLog,'O arquivo ' + AppNom + '.rar não foi encontrado na pasta Update. ');
              end;
          end
        else
          begin
            pbAtuApp.Position := 80;
            script := TStringList.Create;
            script.Clear;
            script.Add('del /Q ' + DirUpd + '*.*');
            script.Add('del /Q ' + DirTmp + '*.*');
            script.Add('del /Q ' + DirApp + 'script.bat');
            script.Add('exit');
            script.SaveToFile(PChar(DirApp + 'script.bat'));

            pbAtuApp.Position := 90;
            GravaLog(ArqLog,'Executando script.bat ');
            if FileExists(DirApp + 'script.bat') then
              begin
                ShellExecute(Handle,nil,'cmd.exe',PWideChar('/c ' + DirApp + 'script.bat > ' + DirLog + 'script.log'),nil,sw_hide);
              end;

            pbAtuApp.Position := 100;

            fAtuApp.Close;
          end;
      end;
end;

function TfAtuApp.VerificaVersao: boolean;
Var
  VerApp,VerFtp : String;
  VerAppNum,VerFtpNum : Integer;
  Atualizacao :IXMLNode;
begin
  try
    if FileExists(DirUpd + 'versao.xml') then
      begin
        XMLDocVersao.LoadFromFile(DirUpd + 'versao.xml');
        XMLDocVersao.Active:= True;
        Atualizacao := XMLDocVersao.DocumentElement;
        VerFtp := Atualizacao.ChildNodes.FindNode('versao').Text;
        VerFtpNum := StrToInt(StringReplace(VerFtp, '.', EmptyStr, [rfReplaceAll]));
        VerApp := VerAplicacao;
        VerAppNum := StrToInt(StringReplace(VerApp, '.', EmptyStr, [rfReplaceAll]));
      end
    else
      begin
        VerFtpNum := 0;
        GravaLog(ArqLog,'Arquivo versao.xml não encontrado ');
      end;

  except
    On E:Exception do
    begin
      GravaLog(ArqLog,'Erro no carregamento do arquivo versao.xml: ' + E.Message);
      Abort;
      fAtuApp.Close;
    end;
  end;

  GravaLog(ArqLog,'Verificação da versão da Aplicação: ' + VerApp + ' e versão do ftp: ' + VerFtp);

  if ((VerFtpNum > VerAppNum) OR (modo = 'INSTALACAO')) then
    result := True
  else
    result := False;
end;

procedure TfAtuApp.BaixarVersao;
begin
  try
  if FileExists(DirUpd + 'versao.xml') then
    DeleteFile(DirUpd + 'versao.xml');

    FnTamanhoTotal := IdFTPAtu.Size('/' + AppNom + '/Update/versao.xml');

    // faz o download do arquivo "versao.xml"
    if FnTamanhoTotal > 0 then
      begin
        IdFTPAtu.Get('/' + AppNom + '/Update/versao.xml', DirUpd + 'versao.xml', True);
        GravaLog(ArqLog,'O aquivo: versão.xml foi baixado');
      end;

  except
    On E:Exception do
    begin
      // ignora a exceção "Connection Closed Gracefully"
      if E is EIdConnClosedGracefully then
        Exit;

      GravaLog(ArqLog,'Erro ao baixar a atualização: ' + E.Message);

      ShowMessage('Erro ao baixar a atualização: ' + E.Message);

      // interrompe a atualização
      Abort;

      fAtuApp.Close;
    end;
  end;
end;

function TFAtuApp.ConectarAoServidorFTP: boolean;
begin
  // desconecta, caso tenha sido conectado anteriormente
  if IdFTPAtu.Connected then
    IdFTPAtu.Disconnect;

  try
    begin
      IdFTPAtu.Host     := dm.cdsConfiguracao.FieldByName('FtpSrv').AsString;
      IdFTPAtu.Username := dm.cdsConfiguracao.FieldByName('FtpUsr').AsString;
      IdFTPAtu.Password := dm.cdsConfiguracao.FieldByName('FtpSnh').AsString;
      IdFTPAtu.Port     := dm.cdsConfiguracao.FieldByName('FtpPrt').AsInteger;

      IdFTPAtu.Connect;

      result := True;
      GravaLog(ArqLog,'Conectado ao servidor FTP');
    end;
  except
    On E:Exception do
    begin
      fAtuApp.Close;
      GravaLog(ArqLog,'Erro ao acessar o servidor de atualização: ' + E.Message);
      //ShowMessage('Erro ao acessar o servidor de atualização: ' + E.Message);
      result := False;
    end;
  end;
end;

procedure TfAtuApp.FormActivate(Sender: TObject);
begin
  lbAppNom.Caption := dm.cdsConfiguracao.FieldByName('AppNcp').AsString;
  TimerVerAtu.Enabled := True;
  MemoAtu.Lines.Clear;
  MemoAtu.Lines.Add('Verificando atualização...');
end;

procedure TfAtuApp.FormShow(Sender: TObject);
begin
  pbAtuApp.Position := 0;
  if FileExists('AppLog.png') then
    begin
      imAppLog.Picture.LoadFromFile('AppLog.png');
    end;
end;

procedure TFAtuApp.BaixarArquivos;

begin
  try
    // excluindo arquivos se já existirem
    if FileExists(DirUpd + AppNom + '.rar') then
      DeleteFile(DirUpd + AppNom + '.rar');

    if FileExists(DirUpd + '7z.exe') then
      DeleteFile(DirUpd + '7z.exe');

    if FileExists(DirUpd + '7z.dll') then
      DeleteFile(DirUpd + '7z.dll');

    // obtém o tamanho da atualização e preenche a variável "FnTamanhoTotal"
    FnTamanhoTotal := IdFTPAtu.Size('/' + AppNom + '/Update/' + AppNom + '.rar');

    // faz o download do arquivo "Atualizacao.rar"
    if FnTamanhoTotal > 0 then
      Begin
        try
          IdFTPAtu.Get('/' + AppNom + '/Update/' + AppNom + '.rar', DirUpd  + AppNom + '.rar', True)
        except
          fAtuApp.Close;
        end;
      End
    else
      GravaLog(ArqLog,'Arquivo:  ');

    if not FileExists(DirUpd + '7z.exe') then
      begin
        FnTamanhoTotal := IdFTPAtu.Size('/7z/7z.exe');
        if FnTamanhoTotal > 0 then
          IdFTPAtu.Get('/7z/7z.exe', DirUpd + '7z.exe', True);
      end;

    if not FileExists(DirUpd + 'z7.dll') then
      begin
        FnTamanhoTotal := IdFTPAtu.Size('/7z/7z.dll');
        if FnTamanhoTotal > 0 then
          IdFTPAtu.Get('/7z/7z.dll', DirUpd + '7z.dll', True);
      end;

  except
    On E:Exception do
    begin
      // ignora a exceção "Connection Closed Gracefully"
      if E is EIdConnClosedGracefully then
        Exit;

      GravaLog(ArqLog,'Erro ao baixar a atualização: ' + E.Message);
      ShowMessage('Erro ao baixar a atualização: ' + E.Message);

      // interrompe a atualização
      Abort;

      fAtuApp.Close;
    end;
  end;
end;

procedure TFAtuApp.GravaLog(NomeDoLog,Log:String);
var
  Arquivo: TextFile;
begin
  MemoAtu.Lines.Clear;
  MemoAtu.Lines.Add(Log);

  fAtuApp.Refresh;

  AssignFile(Arquivo, NomeDoLog);
  if FileExists(NomeDoLog) then
    Append(arquivo) { se existir, apenas adiciona linhas }
  else
    ReWrite(arquivo); { cria um novo se não existir }
  try
    WriteLn(arquivo, DateTimeToStr(Now) + ' ' + IntToStr(NumProc) + ': ' + log);
    NumProc := NumProc + 1;
  finally
    CloseFile(arquivo)
  end;
end;

procedure TfAtuApp.TimerVerAtuTimer(Sender: TObject);
begin
  TimerVerAtu.Enabled := False;
  Verificaratualizao(Sender);
end;

end.
