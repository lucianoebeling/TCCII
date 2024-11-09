unit uColPri;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ToolWin, Vcl.ComCtrls, Vcl.Menus,
  Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.Imaging.jpeg,
  System.ImageList, Vcl.ImgList, System.Actions, Vcl.ActnList,
  Vcl.PlatformDefaultStyleActnCtrls, Vcl.ActnMan, Vcl.ActnCtrls, Vcl.Mask,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdHTTP,
  Soap.InvokeRegistry, System.Net.URLClient, Soap.Rio, Soap.SOAPHTTPClient,
  DateUtils, System.Math, Vcl.Imaging.pngimage;

type
  TfColPri = class(TForm)
    sbColPri: TStatusBar;
    MainMenuPri: TMainMenu;
    pnReceitas: TPanel;
    pnFiltros: TPanel;
    Arquivo1: TMenuItem;
    Sair1: TMenuItem;
    Ajuda1: TMenuItem;
    Sobre1: TMenuItem;
    pnOrdemProducao: TPanel;
    VerificaAtualizao1: TMenuItem;
    pn1: TPanel;
    imLogo: TImage;
    gbFiltros: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    mmOP: TMemo;
    tmColPri: TTimer;
    TrocarUsurio1: TMenuItem;
    Panel4: TPanel;
    tbColPri: TToolBar;
    ilColPri: TImageList;
    tbTrocaUsuario: TToolButton;
    tbSair: TToolButton;
    mmRP: TMemo;
    mmNumPed: TMemo;
    ilFiltro: TImageList;
    Label4: TLabel;
    mmReceita: TMemo;
    tbMostrar: TToolButton;
    tbProduzir: TToolButton;
    tbImprimir: TToolButton;
    ToolButton3: TToolButton;
    ToolButton4: TToolButton;
    pmGrdLot: TPopupMenu;
    Imprimiretiqueta1: TMenuItem;
    bgReceita: TGroupBox;
    dbgReceita: TDBGrid;
    gpLoteReceita: TGroupBox;
    dbLoteReceita: TDBGrid;
    gbComponenteEstoque: TGroupBox;
    dbgComponenteEstoque: TDBGrid;
    gbLoteComponente: TGroupBox;
    dbLoteComponente: TDBGrid;
    gbCoponenteOP: TGroupBox;
    DBGrid2: TDBGrid;
    GroupBox7: TGroupBox;
    dbgLoteComponenteOp: TDBGrid;
    gbOrdemProducao: TGroupBox;
    dbgOrdemProducao: TDBGrid;
    GroupBox6: TGroupBox;
    dbgLoteOp: TDBGrid;
    procedure Sair1Click(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure VerificaAtualizao1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure tmColPriTimer(Sender: TObject);
    procedure TrocarUsurio1Click(Sender: TObject);
    procedure tbSairClick(Sender: TObject);
    function LoteReceita:String;
    procedure tbTrocaUsuarioClick(Sender: TObject);
    procedure tbProduzirClick(Sender: TObject);
    procedure tbMostrarClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure dbgReceitaDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fColPri: TfColPri;

implementation

{$R *.dfm}

uses uAppSbr, uAtuApp, uVersao, uDM, uDatHor, uAutApp, uAbrangencia, uWsAcaoSid, uApoOrp, uBxaCmp, uWsrErl,
  uBarPrg, uMpop828, uRelPrd;

procedure TfColPri.dbgReceitaDblClick(Sender: TObject);
begin
  fRelPrd.ShowModal;
end;

procedure TfColPri.FormShow(Sender: TObject);
begin
  fApoOrp.HTTPRIOAcaoSid.WSDLLocation := dm.cdsConfiguracao.FieldByName('WebSrv').AsString + '/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_sid?wsdl';
  fApoOrp.HTTPRIOAcaoSid.Service := 'g5-senior-services';
  fApoOrp.HTTPRIOAcaoSid.Port := 'sapiens_Synccom_senior_g5_co_ger_sidPort';

  fBxaCmp.HTTPRIOAcaoSid.WSDLLocation := dm.cdsConfiguracao.FieldByName('WebSrv').AsString + '/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_sid?wsdl';
  fBxaCmp.HTTPRIOAcaoSid.Service := 'g5-senior-services';
  fBxaCmp.HTTPRIOAcaoSid.Port := 'sapiens_Synccom_senior_g5_co_ger_sidPort';

  fWsrErl.HTTPRIOExeRel.WSDLLocation := dm.cdsConfiguracao.FieldByName('WebSrv').AsString + '/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_relatorio?wsdl';
  fWsrErl.HTTPRIOExeRel.Service := 'g5-senior-services';
  fWsrErl.HTTPRIOExeRel.Port := 'sapiens_Synccom_senior_g5_co_ger_relatorioPort';

  fWsrErl.HTTPRIOExeRel.WSDLLocation := dm.cdsConfiguracao.FieldByName('WebSrv').AsString + '/g5-senior-services/sapiens_Synccom_senior_g5_co_mpr_cha_estornacomponente?wsdl';
  fWsrErl.HTTPRIOExeRel.Service := 'g5-senior-services';
  fWsrErl.HTTPRIOExeRel.Port := 'sapiens_Synccom_senior_g5_co_mpr_cha_estornacomponentePort';

  sbColPri.Panels[0].Text := 'Versão: ' + VerAplicacao;
  sbColPri.Panels[1].Text := 'Usuário: ' + dm.cdsConfiguracao.FieldByName('CodUsu').AsString + ' - ' + dm.cdsConfiguracao.FieldByName('NomUsu').AsString;
end;

//Gera lote da  receita produzida
function TfColPri.LoteReceita: String;
Var
  CamBas, CodLot : String;
  CodEmp, CodFil, Ano, LotSeq, LotAno : Integer;

begin

  CodEmp := dm.cdsConfiguracao.FieldByName('CodEmp').AsInteger;
  CodFil := 1;
  CodLot := '';
  LotSeq := 1;
  LotAno := YearOf(Date);
  LotAno := LotAno - 2000;

  dm.sqlE078ULT.Close;
  dm.sqlE078ULT.Sql.Text := 'SELECT CODEMP, CODFIL, CAMBAS, ULTNUM, DESCAM ' +
                              'FROM E078ULT ' +
                             'WHERE CODEMP = :CodEmp ' +
                               'AND CODFIL = :CodFil ' +
                               'AND CAMBAS = ''LOTEANO''';

  dm.sqlE078ULT.ParamByName('CodEmp').AsInteger := CodEmp;
  dm.sqlE078ULT.ParamByName('CodFil').AsInteger := CodFil;

  dm.sqlE078ULT.Open;

  If not dm.sqlE078ULT.eof then
    begin

      LotAno := dm.sqlE078ULT.FieldByName('ULTNUM').AsInteger;

      if ((YearOf(Date) - 2000) > LotAno) then
        begin
            LotSeq := 1;

            dm.sqlE078ULT1.Close;
            dm.sqlE078ULT1.Sql.Text := 'UPDATE E078ULT ' +
                                        'SET UltNum = :LotSeq ' +
                                      'WHERE CodEmp = :CodEmp ' +
                                        'AND CodFil = :CodFil ' +
                                        'AND CamBas = ''LOTESEQ''';

            dm.sqlE078ULT1.ParamByName('CodEmp').AsInteger := CodEmp;
            dm.sqlE078ULT1.ParamByName('CodFil').AsInteger := CodFil;
            dm.sqlE078ULT1.ParamByName('LotSeq').AsInteger := LotSeq;
            dm.sqlE078ULT1.ExecSql;

            LotAno := YearOf(Date);
            LotAno := LotAno - 2000;

            dm.sqlE078ULT1.Close;
            dm.sqlE078ULT1.Sql.Text := 'UPDATE E078ULT ' +
                                          'SET UltNum = :LotAno ' +
                                        'WHERE CodEmp = :CodEmp ' +
                                          'AND CodFil = :CodFil ' +
                                          'AND CamBas = ''LOTEANO''';

            dm.sqlE078ULT1.ParamByName('CodEmp').AsInteger := CodEmp;
            dm.sqlE078ULT1.ParamByName('CodFil').AsInteger := CodFil;
            dm.sqlE078ULT1.ParamByName('LotAno').AsInteger := LotAno;
            dm.sqlE078ULT1.ExecSql;

            CodLot := IntToStr(LotSeq) + '.' + IntToStr(LotAno);
          end
      else
        begin

          LotSeq := 1;

          dm.sqlE078ULT1.Close;
          dm.sqlE078ULT1.Sql.Text := 'SELECT CODEMP, CODFIL, CAMBAS, ULTNUM, DESCAM ' +
                                       'FROM E078ULT ' +
                                      'WHERE CODEMP = :CodEmp ' +
                                        'AND CODFIL = :CodFil ' +
                                        'AND CAMBAS = ''LOTESEQ''';

          dm.sqlE078ULT1.ParamByName('CodEmp').AsInteger := CodEmp;
          dm.sqlE078ULT1.ParamByName('CodFil').AsInteger := CodFil;

          dm.sqlE078ULT1.Open;

          If not dm.sqlE078ULT1.eof then
            begin
              LotSeq := dm.sqlE078ULT1.FieldByName('ULTNUM').AsInteger + 1;
            end;

          dm.sqlE078ULT1.Close;
          dm.sqlE078ULT1.Sql.Text := 'UPDATE E078ULT ' +
                                        'SET UltNum = :LotSeq ' +
                                      'WHERE CodEmp = :CodEmp ' +
                                        'AND CodFil = :CodFil ' +
                                        'AND CamBas = ''LOTESEQ''';

          dm.sqlE078ULT1.ParamByName('CodEmp').AsInteger := CodEmp;
          dm.sqlE078ULT1.ParamByName('CodFil').AsInteger := CodFil;
          dm.sqlE078ULT1.ParamByName('LotSeq').AsInteger := LotSeq;
          dm.sqlE078ULT1.ExecSql;

          CodLot := IntToStr(LotSeq) + '.' + IntToStr(LotAno);
        end;
    end
  else
    begin
      dm.sqlE078ULT1.Close;
      dm.sqlE078ULT1.Sql.Text := 'INSERT INTO E078ULT(CodEmp, CodFil, CamBas, UltNum, DesCam) ' +
                                              'VALUES(1,1,''LOTESEQ'',1,''Cód. Lote-Seq'')';
      dm.sqlE078ULT1.ExecSql;

      dm.sqlE078ULT1.Close;
      dm.sqlE078ULT1.Sql.Text := 'INSERT INTO E078ULT(CodEmp, CodFil, CamBas, UltNum, DesCam) ' +
                                              'VALUES(1,1,''LOTEANO'',:LotAno,''Cód. Lote-Ano'')';

      LotAno := YearOf(Date);
      LotAno := LotAno - 2000;
      dm.sqlE078ULT1.ParamByName('LotAno').AsInteger := LotAno;
      dm.sqlE078ULT1.ExecSql;

      CodLot := IntToStr(1) + '.' + IntToStr(YearOf(Date));
    end;

    Result := CodLot;
end;

procedure TfColPri.Sair1Click(Sender: TObject);
begin
  Close;
end;

procedure TfColPri.Sobre1Click(Sender: TObject);
begin
  fAppSbr.showModal;
end;

procedure TfColPri.tbImprimirClick(Sender: TObject);
begin
  fMpop828.ShowModal;
end;

procedure TfColPri.tbMostrarClick(Sender: TObject);
var
  AbrNumPed, AbrRp, AbrOp, AbrReceita  : String;
  Achou : Integer;

begin
  Achou := 0;

  fBarPrg.Show;
  fBarPrg.AtualizarBarra('Mostrar','Localizando receitas...',10);

  dm.sqlReceitas.Close;
  dm.sqlReceitas.SQL.Text := 'SELECT E900CMO.CODEMP AS CODEMP, E900CMO.CODCMP AS CODCMP, E900CMO.CODDER AS CODDER, E075PRO.DESPRO AS DESPRO, ' +
                                    'E075PRO.CPLPRO AS CPLPRO, SUM(E900CMO.QTDPRV) AS QTDPRV, SUM(E900CMO.QTDUTI) AS QTDUTI, SUM(E900CMO.QTDRES) AS QTDRES ' +
                               'FROM E900CMO, E900COP, E075PRO ' +
                              'WHERE E900CMO.CODEMP = E900COP.CODEMP ' +
                                'AND E900CMO.CODORI = E900COP.CODORI ' +
                                'AND E900CMO.NUMORP = E900COP.NUMORP ' +
                                'AND E900CMO.CODEMP = E075PRO.CODEMP ' +
                                'AND E900CMO.CODCMP = E075PRO.CODPRO ' +
                                'AND E900COP.CODORI NOT IN (''R40'') ' +
                                'AND E075PRO.CODFAM IN (''R41'')  ' +
                                'AND E900COP.CODEMP = :CodEmp ';

  if length(mmNumPed.lines.Text) > 0 then
    begin
      AbrNumPed := uAbrangencia.abrangenciaTabela('E900COP.NUMPED',mmNumPed.lines.Text);
      dm.sqlReceitas.SQL.Add(AbrNumPed);
    end;

  if length(mmRP.lines.Text) > 0 then
    begin
      AbrRp := uAbrangencia.abrangenciaTabela('E900COP.RELPRD',mmRp.lines.Text);
      dm.sqlReceitas.SQL.Add(AbrRp);
    end;

  if length(mmOP.lines.Text) > 0 then
    begin
      AbrOp := uAbrangencia.abrangenciaTabela('E900COP.NUMORP',mmOp.lines.Text);
      dm.sqlReceitas.SQL.Add(AbrOp);
    end;

  if length(mmReceita.lines.Text) > 0 then
    begin
      AbrReceita := uAbrangencia.abrangenciaTabela('E900CMO.CODCMP',mmReceita.lines.Text);
      dm.sqlReceitas.SQL.Add(AbrReceita);
    end;

  dm.sqlReceitas.SQL.Add('AND E900COP.SITORP IN (''L'',''A'',''F'') ' +
                         'AND E900COP.TIPORP IN (''N'',''P'') ' +
                   'GROUP BY E900CMO.CODEMP, E900CMO.CODCMP, E900CMO.CODDER, E075PRO.DESPRO, E075PRO.CPLPRO ' +
                   'ORDER BY E900CMO.CODEMP, E075PRO.CPLPRO, E900CMO.CODCMP, E900CMO.CODDER ');

  dm.sqlReceitas.ParamByName('CodEmp').AsInteger := dm.cdsConfiguracao.FieldByName('CodEmp').AsInteger;

  dm.sqlReceitas.Open;

  dm.sqlReceitas.First;

  dm.cdsReceitas.EmptyDataSet;

  fBarPrg.AtualizarBarra('Mostrar','Localizando receitas...',20);

  while not dm.sqlReceitas.eof do
    begin
      Achou := 1;
      fBarPrg.AtualizarBarra('Mostrar','Carregando receitas...',50);

      dm.cdsReceitas.Insert;
      dm.cdsReceitas.FieldByName('CodEmp').AsInteger := dm.sqlReceitas.FieldByName('CodEmp').AsInteger;
      dm.cdsReceitas.FieldByName('CodPro').AsString  := dm.sqlReceitas.FieldByName('CodCmp').AsString;
      dm.cdsReceitas.FieldByName('CodDer').AsString  := dm.sqlReceitas.FieldByName('CodDer').AsString;
      dm.cdsReceitas.FieldByName('CodMar').AsString  := dm.sqlReceitas.FieldByName('DesPro').AsString;
      dm.cdsReceitas.FieldByName('DesPro').AsString  := dm.sqlReceitas.FieldByName('CplPro').AsString;
      dm.cdsReceitas.FieldByName('QtdPrv').AsFloat   := dm.sqlReceitas.FieldByName('QtdPrv').AsFloat;
      dm.cdsReceitas.FieldByName('QtdUti').AsFloat   := dm.sqlReceitas.FieldByName('QtdUti').AsFloat;
      dm.cdsReceitas.FieldByName('QtdRes').AsFloat   := dm.sqlReceitas.FieldByName('QtdRes').AsFloat;
      dm.cdsReceitas.FieldByName('QtdTot').AsFloat   := 0;
      dm.cdsReceitas.Post;

      dm.sqlReceitas.Next;
      fBarPrg.AtualizarBarra('Mostrar','Carregando receitas...',60);
    end;

  fBarPrg.AtualizarBarra('Mostrar','Exibindo receitas...',100);
  fBarPrg.Close;

  dm.cdsReceitas.First;

  If achou = 0 then
    begin
      Application.MessageBox(pchar('ERRO: Não encontradas receitas para o filtro. ' ),'ERRO',mb_ICONERROR);
    end;
end;
procedure TfColPri.tbProduzirClick(Sender: TObject);
var

  CodEmp, NumOrp, SeqRot, NumCad, I, TurTrb : Integer;
  CodCmp, DerCmp, CodLot, NomUsu, SnhUsu, CodOri, CodDep, CodEtg, AbrNumPed, AbrRp, AbrOp, AbrReceita,
  CodPro, CodDer, RetSid, LotRec  : String;
  QtdPrv, QtdEst, QtdRe1, QtdUti, TmpPrd, CmpPrv, PerPro, QtdTot, CmpTot : Double;
  DatVld, DatVll, DatVlm, DatFab, DatZer, VldLot : TDate;

begin
  fBarPrg.Show;
  fBarPrg.AtualizarBarra('Produzir','Apontamento e baixa de componentes...',10);

  if dm.cdsReceitas.FieldByName('QtdTot').AsFloat > 0 then
    begin

      // Apontamento produção, informar o número do cadastro do colaborador
      NumCad := dm.cdsConfiguracao.FieldByName('NumCad').AsInteger;
      TurTrb := dm.cdsConfiguracao.FieldByName('TurTrb').AsInteger;

      if NumCad < 1 then
        begin
          fBarPrg.Close;
          Application.MessageBox(pchar('ERRO: É obrigatório informar o número do cadastro do colaborador. Contate o adminsitrdor da aplicação'),'ERRO',mb_ICONERROR);
        end;

      // Zerando datas
      //DatVld := EncodeDate(31,12,1900);
      //DatFab := EncodeDate(31,12,1900);
      //DatVll := EncodeDate(31,12,1900);
      //DatVlm := EncodeDate(31,12,1900);
      DatZer := EncodeDate(1900,12,31);
      VldLot := DatZer;

      fBarPrg.AtualizarBarra('Produzir','Operador e turno...',50);

      dm.cdsOrdemProducao.First;
      LotRec := '';

      while not dm.cdsOrdemProducao.eof do
        begin

          CodOri  := dm.cdsOrdemProducao.FieldByName('CodOri').AsString;
          NumOrp  := dm.cdsOrdemProducao.FieldByName('NumOrp').AsInteger;
          CodPro  := dm.cdsOrdemProducao.FieldByName('CodPro').AsString;
          CodDer  := dm.cdsOrdemProducao.FieldByName('CodDer').AsString;
          QtdPrv  := dm.cdsOrdemProducao.FieldByName('QtdPrv').AsFloat;
          QtdTot  := dm.cdsOrdemProducao.FieldByName('QtdTot').AsFloat;

          // Baixar componentes da OP
          dm.cdsComponente.First;
          RetSid := '';

          while not dm.cdsComponente.eof do
            begin
              CodEmp := dm.cdsComponente.FieldByName('CodEmp').AsInteger;
              CodOri := dm.cdsComponente.FieldByName('CodOri').AsString;
              NumOrp := dm.cdsComponente.FieldByName('NumOrp').AsInteger;
              CodEtg := dm.cdsComponente.FieldByName('CodEtg').AsString;
              CodDep := dm.cdsComponente.FieldByName('CodDep').AsString;
              CodCmp := dm.cdsComponente.FieldByName('CodCmp').AsString;
              DerCmp := dm.cdsComponente.FieldByName('DerCmp').AsString;
              CmpPrv := dm.cdsComponente.FieldByName('CmpPrv').AsFloat;
              CmpTot := RoundTo(dm.cdsComponente.FieldByName('QtdTot').AsFloat,-3);

              //CmpTot := (CmpPrv * QtdTot) / QtdPrv;

              If  (dm.cdsComponente.FieldByName('QtdTot').AsFloat > 0) then
                begin
                  dm.sqlE210DLS.Close;
                  dm.sqlE210DLS.Sql.Text := 'SELECT CODEMP, CODDEP, CODPRO, CODDER, QTDEST, QTDRES, DATFAB, DATVLT, CODLOT ' +
                                              'FROM E210DLS ' +
                                             'WHERE CODEMP = :CodEmp ' +
                                               'AND CODPRO = :CodCmp ' +
                                               'AND CODDER = :DerCmp ' +
                                               'AND QTDEST > 0  ' +
                                               'AND CODDEP = :CodDep ' +
                                          'ORDER BY DATVLT DESC ';

                  dm.sqlE210DLS.ParamByName('CodEmp').AsInteger := CodEmp;
                  dm.sqlE210DLS.ParamByName('CodCmp').AsString  := CodCmp;
                  dm.sqlE210DLS.ParamByName('DerCmp').AsString  := DerCmp;
                  dm.sqlE210DLS.ParamByName('CodDep').AsString  := CodDep;

                  dm.sqlE210DLS.Open;

                  CodLot := '';
                  If not dm.sqlE210DLS.eof then
                    begin
                      CodLot := dm.sqlE210DLS.FieldByName('CodLot').AsString;
                      DatVll := dm.sqlE210DLS.FieldByName('DatVlt').AsDateTime;
                    end;

                  if (DatVlm < DatVll) then
                    DatVlm := DatVll;

                  //Baixar componente
                  RetSid := fBxaCmp.BaixarCmp(CodOri,NumOrp,CodEtg,CodCmp,DerCmp,CmpTot,CodDep,Codlot);

                  if RetSid <> 'OK' then
                   begin
                     fBarPrg.Close;
                     Application.messageBox(pwidechar('Erro ao baixar componente: ' + CodCmp + ' ' + RetSid),'Erro',mb_OkCancel+mb_IconError)
                   end;
                end;

              dm.cdsComponente.Next;
            end;

          //Abrir apontamento de produção
          //ApontarOp(CodOri: String; NumOrp: Integer; CodEtg :String; SeqRot:Integer; QtdRe1:Double; CodLot:String): string;

          CodEtg  := dm.cdsOrdemProducao.FieldByName('CodEtg').AsString;
          SeqRot  := dm.cdsOrdemProducao.FieldByName('SeqRot').AsInteger;
          CodDep  := dm.cdsOrdemProducao.FieldByName('CodDep').AsString;

          RetSid := '';
          QtdRe1 := 0;
          CodLot := '';

          RetSid := fApoOrp.ApontarOp(CodOri,NumOrp,CodEtg,SeqRot,QtdRe1,CodLot);

          if RetSid <> 'OK' then
            begin
               fBarPrg.Close;
               Application.messageBox(pwidechar('Erro ao apontar início da OP: ' + IntToStr(NumOrp) + ' - ' + RetSid),'Erro',mb_OkCancel+mb_IconError);
            end
          else
            begin

              // Fechar apontamento de produção
              // ApontarOp(CodOri: String; NumOrp: Integer; CodEtg :String; SeqRot:Integer; QtdRe1:Double; CodLot:String): string;

              RetSid := '';
              QtdRe1  := RoundTo(dm.cdsOrdemProducao.FieldByName('QtdTot').AsFloat,-3);

              if (VldLot < DatVlm)  then
                LotRec  := LoteReceita;

              RetSid := fApoOrp.ApontarOp(CodOri,NumOrp,CodEtg,SeqRot,QtdRe1,LotRec);

              if RetSid <> 'OK' then
                 begin
                    fBarPrg.Close;
                    Application.messageBox(pwidechar('Erro ao apontar fim  da OP: ' + IntToStr(NumOrp) + ' - ' + RetSid),'Erro',mb_OkCancel+mb_IconError);
                 end
              else
                begin
                  // Ajuste data de fabricação e validade do lote produzido
                  dm.sqlE210DLS.Close;
                  dm.sqlE210DLS.Sql.Text := 'SELECT CODEMP, CODDEP, CODPRO, CODDER, QTDEST, QTDRES, DATFAB, DATVLT, CODLOT ' +
                                              'FROM E210DLS ' +
                                             'WHERE CODEMP = :CodEmp ' +
                                               'AND CODPRO = :CodPro ' +
                                               'AND CODDER = :CodDer ' +
                                               'AND CODLOT = :CodLot ' +
                                               'AND CODDEP = ''22'' ' +
                                          'ORDER BY DATVLT DESC ';

                  dm.sqlE210DLS.ParamByName('CodEmp').AsInteger := dm.cdsReceitas.FieldByName('CodEmp').AsInteger;
                  dm.sqlE210DLS.ParamByName('CodPro').AsString  := dm.cdsReceitas.FieldByName('CodPro').AsString;
                  dm.sqlE210DLS.ParamByName('CodDer').AsString  := dm.cdsReceitas.FieldByName('CodDer').AsString;
                  dm.sqlE210DLS.ParamByName('CodLot').AsString  := LotRec;

                  dm.sqlE210DLS.Open;
                  if not dm.sqlE210DLS.eof then
                    begin

                      DatFab := Date;
                      DatVld := DatVlm;

                      dm.sqlE210DLS1.Close;
                      dm.sqlE210DLS1.Sql.Text := 'UPDATE E210DLS ' +
                                                    'SET DATFAB = :DatFab, DATVLT = :DatVld ' +
                                                  'WHERE CODEMP = :CodEmp ' +
                                                    'AND CODPRO = :CodPro ' +
                                                    'AND CODDER = :CodDer ' +
                                                    'AND CODLOT = :CodLot ' +
                                                    'AND CODDEP = ''22'' ';

                      dm.sqlE210DLS1.ParamByName('CodEmp').AsInteger  := dm.cdsReceitas.FieldByName('CodEmp').AsInteger;
                      dm.sqlE210DLS1.ParamByName('CodPro').AsString   := dm.cdsReceitas.FieldByName('CodPro').AsString;
                      dm.sqlE210DLS1.ParamByName('CodDer').AsString   := dm.cdsReceitas.FieldByName('CodDer').AsString;
                      dm.sqlE210DLS1.ParamByName('CodLot').AsString   := LotRec;
                      dm.sqlE210DLS1.ParamByName('DatFab').AsDateTime := DatFab;
                      dm.sqlE210DLS1.ParamByName('DatVld').AsDateTime := DatVld;

                      dm.sqlE210DLS1.ExecSQL;

                    end;
                end;
            end;

          VldLot := DatVlm;

          dm.cdsOrdemProducao.Next;
        end;

      fBarPrg.AtualizarBarra('Produzir','Apontamentos e baixas realizados com sucesso...',100);
      fBarPrg.Close;

      dm.cdsReceitas.Edit;
      dm.cdsReceitas.FieldByName('QtdTot').AsFloat := 0;
      dm.cdsReceitas.Post;

    end
  else
    begin
      fBarPrg.Close;
      Application.MessageBox(pchar('ERRO: É obrigatório informar a quantidade total a produzir para o receita: ' + dm.cdsReceitas.FieldByName('CodPro').AsString ),'ERRO',mb_ICONERROR);
    end;
end;

procedure TfColPri.tbSairClick(Sender: TObject);
begin
  Close;
end;

procedure TfColPri.tbTrocaUsuarioClick(Sender: TObject);
begin
  fAutApp.ShowModal;
  sbColPri.Panels[1].Text := 'Usuário: ' + dm.cdsConfiguracao.FieldByName('CodUsu').AsString + ' - ' + dm.cdsConfiguracao.FieldByName('NomUsu').AsString;
end;

procedure TfColPri.tmColPriTimer(Sender: TObject);
begin
  sbColPri.Panels[2].Text := DataCompletaExtenso();
end;

procedure TfColPri.TrocarUsurio1Click(Sender: TObject);
begin
  fAutApp.ShowModal;
  sbColPri.Panels[1].Text := 'Usuário: ' + dm.cdsConfiguracao.FieldByName('CodUsu').AsString + ' - ' + dm.cdsConfiguracao.FieldByName('NomUsu').AsString;
end;

procedure TfColPri.VerificaAtualizao1Click(Sender: TObject);
begin
  fAtuApp.showModal;
end;

end.
