program ColMix;

uses
  Vcl.Forms,
  System.SysUtils,
  Vcl.Dialogs,
  Winapi.Windows,
  Winapi.Messages,
  uColPri in 'uColPri.pas' {fColPri},
  uDM in 'uDM.pas' {DM: TDataModule},
  uAtuApp in '..\Utilitarios64\atualizacao\uAtuApp.pas' {fAtuApp},
  ucriptografia in '..\Utilitarios64\criptografia\ucriptografia.pas',
  uVersao in '..\Utilitarios64\versao\uVersao.pas',
  uAutApp in '..\Utilitarios64\login\uAutApp.pas' {fAutApp},
  uWsUsers in '..\Utilitarios64\login\uWsUsers.pas',
  uConfigSis in '..\Utilitarios64\config\uConfigSis.pas',
  uAppSbr in '..\Utilitarios64\sobre\uAppSbr.pas' {fAppSbr},
  uDatHor in '..\Utilitarios64\funcoes\uDatHor.pas',
  uAbrangencia in '..\Utilitarios64\funcoes\uAbrangencia.pas',
  uWsRelatorio in '..\Utilitarios64\relatorio\uWsRelatorio.pas',
  uWsAcaoSid in '..\Utilitarios64\acaosid\uWsAcaoSid.pas',
  uApoOrp in '..\Utilitarios64\acaosid\uApoOrp.pas' {fApoOrp},
  uBxaCmp in '..\Utilitarios64\acaosid\uBxaCmp.pas' {fBxaCmp},
  uBarPrg in '..\Utilitarios64\BarraProgressao\uBarPrg.pas' {fBarPrg},
  uMpop828 in '..\Utilitarios64\relatorio\uMpop828.pas' {fMpop828},
  uWsrErl in '..\Utilitarios64\relatorio\uWsrErl.pas' {fWsrErl},
  uRelPrd in 'uRelPrd.pas' {fRelPrd},
  uWSEstCmp in '..\Utilitarios64\acaosid\uWSEstCmp.pas',
  uEstCmp in '..\Utilitarios64\acaosid\uEstCmp.pas' {fEstCmp};

{$R *.res}

begin
  Application.Initialize;

  Application.Title := 'ColorCenter-Mix ';
  Application.MainFormOnTaskbar := True;

  Application.CreateForm(TfColPri, fColPri);
  Application.CreateForm(TDM, DM);
  Application.CreateForm(TfAtuApp, fAtuApp);
  Application.CreateForm(TfAutApp, fAutApp);
  Application.CreateForm(TfAppSbr, fAppSbr);
  Application.CreateForm(TfApoOrp, fApoOrp);
  Application.CreateForm(TfBxaCmp, fBxaCmp);
  Application.CreateForm(TfBarPrg, fBarPrg);
  Application.CreateForm(TfMpop828, fMpop828);
  Application.CreateForm(TfWsrErl, fWsrErl);
  Application.CreateForm(TfRelPrd, fRelPrd);
  Application.CreateForm(TfEstCmp, fEstCmp);

  // inicializa cliente data set de configuração
  dm.cdsConfiguracao.EmptyDataSet;
  dm.cdsConfiguracao.Insert;
  dm.cdsConfiguracao.FieldByName('AppNcp').AsString := Application.Title;
  dm.cdsConfiguracao.FieldByName('AppNom').AsString := 'ColMix ';
  dm.cdsConfiguracao.FieldByName('EmpNom').AsString := 'CD. ';
  dm.cdsConfiguracao.FieldByName('DevNom').AsString := 'Luciano Ebeling ';

  dm.cdsConfiguracao.Post;

  // Carregar arquivo .CFG no cdsConfiguração e conecta ao banco de dados
  LerConfigSis;

// Verifica a versão e atualiza o app
  fAtuApp.ShowModal;

   //Acesso ao app
  fAutApp.ShowModal;

// usuário logado, ececuta a aplicação
  if dm.cdsConfiguracao.FieldByName('CodUsu').AsInteger > 0 then
    begin
      Application.Run;
    end
  else
    begin
      fAtuApp.Free;
      fAutApp.Free;
      fAppSbr.Free;
      fApoOrp.Free;
      fBxaCmp.Free;
      fWsrErl.Free;
      fBarPrg.Free;
      fRelPrd.Free;
      fEstCmp.Free;
      DM.Free;
      Application.Terminate;
    end;
end.
