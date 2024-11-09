unit uConfigSis;

interface

uses
  System.SysUtils,
  Vcl.Forms,
  Vcl.Dialogs,
  Winapi.Windows,
  Winapi.Messages,
  uDM, uCriptografia, uAutApp;

procedure LerConfigSis;

implementation

procedure LerConfigSis;

var
  Linha, Chave, Valor, Cripto  : string;
  arquivo : TextFile;
  NumCrt, PosSep  : Integer;

begin

  //dm.SQLConexao.Close;

  if FileExists(dm.cdsConfiguracao.FieldByName('AppNom').AsString +'.cfg') then
    begin
      AssignFile(arquivo,dm.cdsConfiguracao.FieldByName('AppNom').AsString + '.cfg');
      Reset(arquivo);

      dm.cdsConfiguracao.Edit;
      Cripto := '';

      while not eof(arquivo) do
        begin
          Readln(arquivo,linha);
          NumCrt := Length(Linha);
          PosSep := Pos('=',Linha);
          Chave  := Copy(Linha,1,(PosSep - 1));
          Valor  := Copy(Linha,(PosSep + 1),NumCrt);

          if Chave = 'AQ.Cripto' then
            begin
              Cripto := Valor;
            end
          else
            if Chave = 'DB.Nome' then
              begin
                dm.cdsConfiguracao.FieldByName('VerBnc').AsString  := Valor;
              end
            else if Chave = 'DB.Instancia' then
              begin
                dm.cdsConfiguracao.FieldByName('IstBnc').AsString  := Valor;
              end
            else if Chave = 'DB.Usuario' then
              begin
                dm.cdsConfiguracao.FieldByName('UsuBnc').AsString  := Valor;
              end
            else if (Chave = 'DB.Senha') then
              begin
                if Cripto = 'S' then
                  dm.cdsConfiguracao.FieldByName('SnhBnc').AsString  := Crypt('D',Valor)
                else
                  dm.cdsConfiguracao.FieldByName('SnhBnc').AsString  := Valor;
              end
            else if Chave = 'WS.Servidor' then
              begin
                dm.cdsConfiguracao.FieldByName('WebSrv').AsString  := Valor;
              end
            else if Chave = 'FTPS.Servidor' then
              begin
                dm.cdsConfiguracao.FieldByName('FtpSrv').AsString  := Valor;
              end
            else if Chave = 'FTPS.Senha' then
              begin
               if Cripto = 'S' then
                 dm.cdsConfiguracao.FieldByName('FtpSnh').AsString  := Crypt('D',Valor)
               else
                 dm.cdsConfiguracao.FieldByName('FtpSnh').AsString  := Valor;
              end
            else if Chave = 'FTPS.Porta' then
              begin
                dm.cdsConfiguracao.FieldByName('FtpPrt').AsString  := Valor;
              end
            else if Chave = 'FTPS.Usuario' then
              begin
                dm.cdsConfiguracao.FieldByName('FtpUsr').AsString  := Valor;
              end;
        end;

      dm.cdsConfiguracao.Post;
      Closefile(arquivo);

      dm.SQLConexao.Close;
      dm.SQLConexao.DriverName := dm.cdsConfiguracao.FieldByName('VerBnc').AsString;
      dm.SQLConexao.Params.Values['DataBase']  := dm.cdsConfiguracao.FieldByName('IstBnc').AsString;
      dm.SQLConexao.Params.Values['User_Name'] := dm.cdsConfiguracao.FieldByName('UsuBnc').AsString;
      dm.SQLConexao.Params.Values['Password']  := dm.cdsConfiguracao.FieldByName('SnhBnc').AsString;

      Try
        Begin
          dm.SQLConexao.Open;
        End;
      Except
        begin
          Application.MessageBox(PChar('Falha na Conexão, verifique as informações no arquivo ' +
            dm.cdsConfiguracao.FieldByName('AppNom').AsString + '.cfg' +'! '),'Erro',MB_OK + MB_ICONERROR);

          Application.Terminate;
        end;
      end;

    end
  else
    begin
      Application.MessageBox(PChar('Arquivo ' + dm.cdsConfiguracao.FieldByName('AppNom').AsString + '.cfg, não encontrado! '),'Erro',MB_OK + MB_ICONERROR);
      Application.Terminate;
    end;

end;

end.
