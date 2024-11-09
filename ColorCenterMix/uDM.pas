unit uDM;

interface

uses
  System.SysUtils, System.Classes, Data.DBXOracle, Data.FMTBcd, Data.DB,
  Data.SqlExpr, Datasnap.DBClient, uColPri, uAbrangencia;

type
  TDM = class(TDataModule)
    sqlConexao: TSQLConnection;
    sqlUsuario: TSQLQuery;
    sqlR910USU: TSQLQuery;
    cdsGrupos: TClientDataSet;
    cdsGruposCodUsu: TIntegerField;
    cdsGruposDesGrupo: TStringField;
    cdsGruposIdGrupo: TIntegerField;
    cdsConfiguracao: TClientDataSet;
    cdsConfiguracaoCodEmp: TIntegerField;
    cdsConfiguracaoEmpNom: TStringField;
    cdsConfiguracaoCodFil: TIntegerField;
    cdsConfiguracaoFilNom: TStringField;
    cdsConfiguracaoUsuBnc: TStringField;
    cdsConfiguracaoSnhBnc: TStringField;
    cdsConfiguracaoVerBnc: TStringField;
    cdsConfiguracaoCodUsu: TIntegerField;
    cdsConfiguracaoNomUsu: TStringField;
    cdsConfiguracaoNomCmp: TStringField;
    cdsConfiguracaoSnhUsu: TStringField;
    cdsConfiguracaoGrpUsu: TStringField;
    cdsConfiguracaoIstBnc: TStringField;
    cdsConfiguracaoWebSrv: TStringField;
    cdsConfiguracaoAppNom: TStringField;
    cdsConfiguracaoAppNcp: TStringField;
    cdsConfiguracaoFtpSrv: TStringField;
    cdsConfiguracaoFtpSnh: TStringField;
    cdsConfiguracaoFtpPrt: TStringField;
    cdsConfiguracaoFtpUsr: TStringField;
    cdsConfiguracaoCodCcu: TStringField;
    cdsConfiguracaoNumCad: TIntegerField;
    cdsConfiguracaoDevNom: TStringField;
    sqlReceitas: TSQLQuery;
    cdsReceitas: TClientDataSet;
    cdsReceitasCodEmp: TIntegerField;
    cdsReceitasCodPro: TStringField;
    cdsReceitasCodDer: TStringField;
    cdsReceitasDesPro: TStringField;
    cdsReceitasQtdPrv: TFloatField;
    cdsReceitasQtdAdi: TFloatField;
    cdsReceitasQtdTot: TFloatField;
    cdsReceitasQtdUti: TFloatField;
    cdsReceitasQtdRes: TFloatField;
    cdsReceitasCodMar: TStringField;
    cdsOrdemProducao: TClientDataSet;
    IntegerField1: TIntegerField;
    StringField1: TStringField;
    StringField2: TStringField;
    StringField3: TStringField;
    StringField4: TStringField;
    FloatField1: TFloatField;
    sqlOrdemProducao: TSQLQuery;
    cdsOrdemProducaoCodOri: TStringField;
    cdsOrdemProducaoNumPed: TIntegerField;
    cdsOrdemProducaoRelPrd: TStringField;
    cdsOrdemProducaoNumOrp: TIntegerField;
    cdsOrdemProducaoQtdRe1: TFloatField;
    cdsOrdemProducaoSeqIpd: TIntegerField;
    sqlLoteOp: TSQLQuery;
    sqlComponente: TSQLQuery;
    cdsLoteOP: TClientDataSet;
    cdsComponente: TClientDataSet;
    cdsComponenteCodEmp: TIntegerField;
    cdsComponenteCodOri: TStringField;
    cdsComponenteNumPed: TIntegerField;
    cdsComponenteRelPrd: TStringField;
    cdsComponenteNumOrp: TIntegerField;
    cdsComponenteSeqIpd: TIntegerField;
    cdsComponenteCodPro: TStringField;
    cdsComponenteCodDer: TStringField;
    cdsComponenteDesPro: TStringField;
    cdsComponenteCodMar: TStringField;
    cdsComponenteCodCmp: TStringField;
    cdsComponenteDerCmp: TStringField;
    cdsComponenteDesCmp: TStringField;
    cdsComponenteQtdPrv: TFloatField;
    cdsComponenteQtdUti: TFloatField;
    cdsComponenteQtdRes: TFloatField;
    dsReceitas: TDataSource;
    dsOrdemProducao: TDataSource;
    dsLoteOp: TDataSource;
    dsComponente: TDataSource;
    cdsOrdemProducaoQtdAdi: TFloatField;
    cdsOrdemProducaoQtdTot: TFloatField;
    sqlE210DLS: TSQLQuery;
    sqlLoteComponente: TSQLQuery;
    cdsLoteComponente: TClientDataSet;
    dsLoteComponente: TDataSource;
    sqlEstoquesCmp: TSQLQuery;
    cdsEstoquesCmp: TClientDataSet;
    IntegerField2: TIntegerField;
    StringField5: TStringField;
    StringField6: TStringField;
    StringField7: TStringField;
    StringField8: TStringField;
    FloatField2: TFloatField;
    FloatField3: TFloatField;
    dsEstoquesCmp: TDataSource;
    sqlE210EST: TSQLQuery;
    cdsEstoquesCmpQtdUti: TFloatField;
    cdsEstoquesCmpQtdPrv: TFloatField;
    sqlLoteReceita: TSQLQuery;
    cdsLoteReceita: TClientDataSet;
    dsLoteReceita: TDataSource;
    cdsLoteComponenteRec: TClientDataSet;
    dsComponenteRec: TDataSource;
    sqlLoteComponenteRec: TSQLQuery;
    cdsLoteReceitaCodEmp: TIntegerField;
    cdsLoteReceitaCodPro: TStringField;
    cdsLoteReceitaCodDer: TStringField;
    cdsLoteReceitaQtdLote: TFloatField;
    cdsLoteReceitaDatFab: TDateField;
    cdsLoteReceitaDatVld: TDateField;
    cdsLoteReceitaCodLot: TStringField;
    cdsLoteComponenteRecCodEmp: TIntegerField;
    cdsLoteComponenteRecCodPro: TStringField;
    cdsLoteComponenteRecCodDer: TStringField;
    cdsLoteComponenteRecCodLot: TStringField;
    cdsLoteComponenteRecQtdEst: TFloatField;
    cdsLoteComponenteRecDatFab: TDateField;
    cdsLoteComponenteRecDatVld: TDateField;
    cdsLoteOPCodEmp: TIntegerField;
    cdsLoteOPCodPro: TStringField;
    cdsLoteOPCodDer: TStringField;
    cdsLoteOPCodLot: TStringField;
    sqlE906OPE: TSQLQuery;
    cdsConfiguracaoTurTrb: TIntegerField;
    sqlE078ULT: TSQLQuery;
    sqlE078ULT1: TSQLQuery;
    cdsComponenteQtdTot: TFloatField;
    sqlE210DLS1: TSQLQuery;
    cdsEstoquesCmpQtdTot: TFloatField;
    cdsOrdemProducaoQtdRes: TFloatField;
    cdsOrdemProducaoCodEtg: TStringField;
    cdsComponenteCodEtg: TStringField;
    cdsOrdemProducaoSeqRot: TIntegerField;
    cdsOrdemProducaoCodDep: TStringField;
    cdsComponenteCodDep: TStringField;
    cdsComponenteCmpPrv: TFloatField;
    SQLE210MVP: TSQLQuery;
    cdsLoteOPCodDep: TStringField;
    cdsLoteOPDatMov: TDateField;
    cdsLoteOPSeqMov: TIntegerField;
    cdsLoteOPCodTns: TStringField;
    cdsLoteOPQtdMov: TFloatField;
    cdsLoteOPEstEos: TStringField;
    cdsLoteComponenteCodEmp: TIntegerField;
    cdsLoteComponenteCodDep: TStringField;
    cdsLoteComponenteDatMov: TDateField;
    cdsLoteComponenteSeqMov: TIntegerField;
    cdsLoteComponenteCodTns: TStringField;
    cdsLoteComponenteEstEos: TStringField;
    cdsLoteComponenteCodPro: TStringField;
    cdsLoteComponenteCodDer: TStringField;
    cdsLoteComponenteCodLot: TStringField;
    cdsLoteComponenteQtdMov: TFloatField;
    cdsRelPrd: TClientDataSet;
    cdsRelPrdCodEmp: TIntegerField;
    cdsRelPrdCodOri: TStringField;
    cdsRelPrdRelPrd: TStringField;
    cdsRelPrdCodCmp: TStringField;
    cdsRelPrdDerCmp: TStringField;
    cdsRelPrdQtdPrv: TFloatField;
    cdsRelPrdQtdRes: TFloatField;
    cdsRelPrdQtdUti: TFloatField;
    sqlRelPrd: TSQLQuery;
    dsRelPrd: TDataSource;
    cdsRelPrdDesCmp: TStringField;
    sqlRelPrd1: TSQLQuery;
    cdsConfiguracaoImpPdr: TStringField;
    procedure cdsReceitasCalcFields(DataSet: TDataSet);
    procedure cdsReceitasAfterScroll(DataSet: TDataSet);
    procedure cdsEstoquesCmpAfterScroll(DataSet: TDataSet);
    procedure cdsOrdemProducaoAfterScroll(DataSet: TDataSet);
    procedure cdsReceitasAfterPost(DataSet: TDataSet);
    procedure cdsComponenteAfterScroll(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DM: TDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDM.cdsComponenteAfterScroll(DataSet: TDataSet);
begin
  dm.sqlE210MVP.Close;
  dm.sqlE210MVP.Sql.Text := 'SELECT CODEMP, CODDEP, DATMOV, SEQMOV, CODTNS, ESTEOS, CODPRO, CODDER, ORIORP, NUMDOC, CODETG, CODLOT, QTDMOV ' +
                              'FROM E210MVP ' +
                             'WHERE CODEMP = :CodEmp ' +
                               'AND CODDEP = ''22'' ' +
                               'AND ORIORP = :CodOri ' +
                               'AND NUMDOC = :NumOrp ' +
                               'AND CODPRO = :CodPro ' +
                               'AND CODDER = :CodDer ' +
                         ' ORDER BY CODEMP, CODDEP, CODPRO, CODDER, DATMOV, SEQMOV ';

  dm.sqlE210MVP.ParamByName('CodEmp').AsInteger := dm.cdsComponente.FieldByName('CodEmp').AsInteger;
  dm.sqlE210MVP.ParamByName('CodPro').AsString  := dm.cdsComponente.FieldByName('CodCmp').AsString;
  dm.sqlE210MVP.ParamByName('CodDer').AsString  := dm.cdsComponente.FieldByName('DerCmp').AsString;
  dm.sqlE210MVP.ParamByName('CodOri').AsString  := dm.cdsComponente.FieldByName('CodOri').AsString;
  dm.sqlE210MVP.ParamByName('NumOrp').AsString  := dm.cdsComponente.FieldByName('NumOrp').AsString;

  dm.sqlE210MVP.Open;
  dm.cdsLoteComponente.EmptyDataSet;

  while not dm.sqlE210MVP.eof do
    begin
      dm.cdsLoteComponente.Insert;
      dm.cdsLoteComponente.FieldByName('CodEmp').AsInteger   := dm.sqlE210MVP.FieldByName('CodEmp').AsInteger;
      dm.cdsLoteComponente.FieldByName('CodDep').AsString    := dm.sqlE210MVP.FieldByName('CodDep').AsString;
      dm.cdsLoteComponente.FieldByName('CodPro').AsString    := dm.sqlE210MVP.FieldByName('CodPro').AsString;
      dm.cdsLoteComponente.FieldByName('CodDer').AsString    := dm.sqlE210MVP.FieldByName('CodDer').AsString;
      dm.cdsLoteComponente.FieldByName('CodLot').AsString    := dm.sqlE210MVP.FieldByName('CodLot').AsString;
      dm.cdsLoteComponente.FieldByName('QtdMov').AsFloat     := dm.sqlE210MVP.FieldByName('QtdMov').AsFloat;
      dm.cdsLoteComponente.FieldByName('DatMov').AsDateTime  := dm.sqlE210MVP.FieldByName('DatMov').AsDateTime;
      dm.cdsLoteComponente.FieldByName('EstEos').AsString    := dm.sqlE210MVP.FieldByName('EstEos').AsString;
      dm.cdsLoteComponente.FieldByName('CodTns').AsString    := dm.sqlE210MVP.FieldByName('CodTns').AsString;
      dm.cdsLoteComponente.FieldByName('SeqMov').AsInteger   := dm.sqlE210MVP.FieldByName('SeqMov').AsInteger;
      dm.cdsLoteComponente.Post;

      dm.sqlE210MVP.Next;
    end;
end;

procedure Tdm.cdsEstoquesCmpAfterScroll(DataSet: TDataSet);
begin
  dm.sqlE210DLS.Close;
  dm.sqlE210DLS.Sql.Text := 'SELECT CODEMP, CODDEP, CODPRO, CODDER, QTDEST, QTDRES, DATFAB, DATVLT, CODLOT ' +
                           'FROM E210DLS ' +
                          'WHERE CODEMP = :CodEmp ' +
                            'AND CODPRO = :CodCmp ' +
                            'AND CODDER = :DerCmp ' +
                            'AND QTDEST > 0  ' +
                            'AND CODDEP = ''22'' ' +
                       'ORDER BY DATVLT DESC ';

  dm.sqlE210DLS.ParamByName('CodEmp').AsInteger := dm.cdsEstoquesCmp.FieldByName('CodEmp').AsInteger;
  dm.sqlE210DLS.ParamByName('CodCmp').AsString  := dm.cdsEstoquesCmp.FieldByName('CodCmp').AsString;
  dm.sqlE210DLS.ParamByName('DerCmp').AsString  := dm.cdsEstoquesCmp.FieldByName('DerCmp').AsString;

  dm.sqlE210DLS.Open;

  dm.cdsLoteComponenteRec.EmptyDataSet;

  while not dm.sqlE210DLS.eof do
    begin
      dm.cdsLoteComponenteRec.Insert;
      dm.cdsLoteComponenteRec.FieldByName('CodEmp').AsInteger   := dm.sqlE210DLS.FieldByName('CodEmp').AsInteger;
      dm.cdsLoteComponenteRec.FieldByName('CodPro').AsString    := dm.sqlE210DLS.FieldByName('CodPro').AsString;
      dm.cdsLoteComponenteRec.FieldByName('CodDer').AsString    := dm.sqlE210DLS.FieldByName('CodDer').AsString;
      dm.cdsLoteComponenteRec.FieldByName('CodLot').AsString    := dm.sqlE210DLS.FieldByName('CodLot').AsString;
      dm.cdsLoteComponenteRec.FieldByName('QtdEst').AsFloat     := dm.sqlE210DLS.FieldByName('QtdEst').AsFloat;
      dm.cdsLoteComponenteRec.FieldByName('DatFab').AsDateTime  := dm.sqlE210DLS.FieldByName('DatFab').AsDateTime;
      dm.cdsLoteComponenteRec.FieldByName('DatVld').AsDateTime  := dm.sqlE210DLS.FieldByName('DatVlt').AsDateTime;
      dm.cdsLoteComponenteRec.Post;

      dm.sqlE210DLS.Next;
    end;

end;

procedure TDM.cdsOrdemProducaoAfterScroll(DataSet: TDataSet);
var
  AbrNumPed, AbrRp, AbrOp, AbrReceita : String;
  QtdEst : Double;

begin

  dm.sqlE210MVP.Close;
  dm.sqlE210MVP.Sql.Text := 'SELECT CODEMP, CODDEP, DATMOV, SEQMOV, CODTNS, ESTEOS, CODPRO, CODDER, ORIORP, NUMDOC, CODETG, CODLOT, QTDMOV ' +
                              'FROM E210MVP ' +
                             'WHERE CODEMP = :CodEmp ' +
                               'AND CODDEP = ''22'' ' +
                               'AND ORIORP = :CodOri ' +
                               'AND NUMDOC = :NumOrp ' +
                               'AND CODPRO = :CodPro ' +
                               'AND CODDER = :CodDer ' +
                         ' ORDER BY CODEMP, CODDEP, CODPRO, CODDER, DATMOV, SEQMOV ';

  dm.sqlE210MVP.ParamByName('CodEmp').AsInteger := dm.cdsOrdemProducao.FieldByName('CodEmp').AsInteger;
  dm.sqlE210MVP.ParamByName('CodPro').AsString  := dm.cdsOrdemProducao.FieldByName('CodPro').AsString;
  dm.sqlE210MVP.ParamByName('CodDer').AsString  := dm.cdsOrdemProducao.FieldByName('CodDer').AsString;
  dm.sqlE210MVP.ParamByName('CodOri').AsString  := dm.cdsOrdemProducao.FieldByName('CodOri').AsString;
  dm.sqlE210MVP.ParamByName('NumOrp').AsString  := dm.cdsOrdemProducao.FieldByName('NumOrp').AsString;

  dm.sqlE210MVP.Open;
  dm.cdsLoteOp.EmptyDataSet;

  while not dm.sqlE210MVP.eof do
    begin
      dm.cdsLoteOp.Insert;
      dm.cdsLoteOp.FieldByName('CodEmp').AsInteger   := dm.sqlE210MVP.FieldByName('CodEmp').AsInteger;
      dm.cdsLoteOp.FieldByName('CodDep').AsString    := dm.sqlE210MVP.FieldByName('CodDep').AsString;
      dm.cdsLoteOp.FieldByName('CodPro').AsString    := dm.sqlE210MVP.FieldByName('CodPro').AsString;
      dm.cdsLoteOp.FieldByName('CodDer').AsString    := dm.sqlE210MVP.FieldByName('CodDer').AsString;
      dm.cdsLoteOp.FieldByName('CodLot').AsString    := dm.sqlE210MVP.FieldByName('CodLot').AsString;
      dm.cdsLoteOp.FieldByName('QtdMov').AsFloat     := dm.sqlE210MVP.FieldByName('QtdMov').AsFloat;
      dm.cdsLoteOp.FieldByName('DatMov').AsDateTime  := dm.sqlE210MVP.FieldByName('DatMov').AsDateTime;
      dm.cdsLoteOp.FieldByName('EstEos').AsString    := dm.sqlE210MVP.FieldByName('EstEos').AsString;
      dm.cdsLoteOp.FieldByName('CodTns').AsString    := dm.sqlE210MVP.FieldByName('CodTns').AsString;
      dm.cdsLoteOp.FieldByName('SeqMov').AsInteger   := dm.sqlE210MVP.FieldByName('SeqMov').AsInteger;
      dm.cdsLoteOp.Post;

      dm.sqlE210MVP.Next;
    end;

  dm.cdsLoteOp.First;


  dm.sqlComponente.Close;

  dm.sqlComponente.SQL.Text := 'SELECT E900CMO.CODEMP AS CODEMP, E900COP.CODORI AS CODORI, E900QDO.CODPRO AS CODPRO, E900QDO.CODDER AS CODDER, ' +
                                      'E900QDO.QTDPRV AS QTDPRV, E900COP.NUMPED AS NUMPED, E900QDO.SEQIPD AS SEQIPD, E900COP.RELPRD AS RELPRD, ' +
                                      'E900COP.NUMORP AS NUMORP, E900CMO.CODCMP AS CODCMP, E900CMO.CODDER AS DERCMP, C.DESPRO AS DESCMP, ' +
                                      'C.CPLPRO AS CPLCMP, E900CMO.QTDPRV AS CMPPRV, E900CMO.QTDUTI AS QTDUTI, E900CMO.QTDRES AS QTDRES, ' +
                                      'P.DESPRO AS DESPRO, P.CPLPRO AS CPLPRO, E900CMO.CODDEP AS CODDEP, E900CMO.CODETG AS CODETG ' +
                                 'FROM E900CMO, E900COP, E900QDO, E075PRO P, E075PRO C ' +
                                'WHERE E900CMO.CODEMP = E900COP.CODEMP ' +
                                  'AND E900CMO.CODORI = E900COP.CODORI ' +
                                  'AND E900CMO.NUMORP = E900COP.NUMORP ' +
                                  'AND E900QDO.CODEMP = E900COP.CODEMP ' +
                                  'AND E900QDO.CODORI = E900COP.CODORI ' +
                                  'AND E900QDO.NUMORP = E900COP.NUMORP ' +
                                  'AND E900CMO.CODEMP = C.CODEMP ' +
                                  'AND E900CMO.CODCMP = C.CODPRO ' +
                                  'AND E900CMO.CODEMP = P.CODEMP ' +
                                  'AND E900CMO.CODCMP = P.CODPRO ' +
                                  'AND E900COP.CODORI  IN (''R40'') ' +
                                  'AND P.CODORI NOT IN (''R40'') ' +
                                  'AND E900COP.CODEMP = :CodEmp ' +
                                  'AND E900QDO.CODPRO = :CodPro ' +
                                  'AND E900QDO.CODDER = :CodDer ' +
                                  'AND E900COP.NUMORP = :NumOrp ';

  if length(fColPri.mmNumPed.lines.Text) > 0 then
    begin
      dm.sqlComponente.SQL.Add(AbrNumPed);
    end;

  if length(fColPri.mmRP.lines.Text) > 0 then
    begin
      dm.sqlComponente.SQL.Add(AbrRp);
    end;

  if length(fColPri.mmOP.lines.Text) > 0 then
    begin
      dm.sqlComponente.SQL.Add(AbrOp);
    end;

  if length(fColPri.mmReceita.lines.Text) > 0 then
    begin
      dm.sqlComponente.SQL.Add(AbrReceita);
    end;

  dm.sqlComponente.SQL.Add('AND E900COP.SITORP IN (''L'',''A'',''F'') ' +
                           'AND E900COP.TIPORP IN (''N'',''P'') ' +
                      'ORDER BY E900CMO.CODEMP, E900CMO.CODCMP, E900CMO.CODDER, C.CPLPRO ');

  dm.sqlComponente.ParamByName('CodEmp').AsInteger := dm.cdsOrdemProducao.FieldByName('CodEmp').AsInteger;
  dm.sqlComponente.ParamByName('CodPro').AsString  := dm.cdsOrdemProducao.FieldByName('CodPro').AsString;
  dm.sqlComponente.ParamByName('CodDer').AsString  := dm.cdsOrdemProducao.FieldByName('CodDer').AsString;
  dm.sqlComponente.ParamByName('NumOrp').AsInteger := dm.cdsOrdemProducao.FieldByName('NumOrp').AsInteger;

  dm.sqlComponente.Open;
  dm.cdsComponente.EmptyDataSet;

  while not dm.sqlComponente.eof do
    begin
      dm.cdsComponente.Insert;
      dm.cdsComponente.FieldByName('CodEmp').AsInteger := dm.sqlComponente.FieldByName('CodEmp').AsInteger;
      dm.cdsComponente.FieldByName('NumPed').AsInteger := dm.sqlComponente.FieldByName('NumPed').AsInteger;
      dm.cdsComponente.FieldByName('SeqIpd').AsInteger := dm.sqlComponente.FieldByName('SeqIpd').AsInteger;
      dm.cdsComponente.FieldByName('RelPrd').AsString  := dm.sqlComponente.FieldByName('RelPrd').AsString;
      dm.cdsComponente.FieldByName('CodPro').AsString  := dm.sqlComponente.FieldByName('CodPro').AsString;
      dm.cdsComponente.FieldByName('CodMar').AsString  := dm.sqlComponente.FieldByName('DesPro').AsString;
      dm.cdsComponente.FieldByName('DesPro').AsString  := dm.sqlComponente.FieldByName('DesPro').AsString;
      dm.cdsComponente.FieldByName('NumOrp').AsInteger := dm.sqlComponente.FieldByName('NumOrp').AsInteger;
      dm.cdsComponente.FieldByName('CodOri').AsString  := dm.sqlComponente.FieldByName('CodOri').AsString;
      dm.cdsComponente.FieldByName('QtdPrv').AsFloat   := dm.sqlComponente.FieldByName('QtdPrv').AsFloat;
      dm.cdsComponente.FieldByName('CodCmp').AsString  := dm.sqlComponente.FieldByName('CodCmp').AsString;
      dm.cdsComponente.FieldByName('DerCmp').AsString  := dm.sqlComponente.FieldByName('DerCmp').AsString;
      dm.cdsComponente.FieldByName('CodMar').AsString  := dm.sqlComponente.FieldByName('DesPro').AsString;
      dm.cdsComponente.FieldByName('DesCmp').AsString  := dm.sqlComponente.FieldByName('DesCmp').AsString + ' ' + dm.sqlComponente.FieldByName('CplPro').AsString;
      dm.cdsComponente.FieldByName('CmpPrv').AsFloat   := dm.sqlComponente.FieldByName('CmpPrv').AsFloat;
      dm.cdsComponente.FieldByName('QtdUti').AsFloat   := dm.sqlComponente.FieldByName('QtdUti').AsFloat;
      dm.cdsComponente.FieldByName('QtdRes').AsFloat   := dm.sqlComponente.FieldByName('QtdRes').AsFloat;
      dm.cdsComponente.FieldByName('CodDep').AsString  := dm.sqlComponente.FieldByName('CodDep').AsString;
      dm.cdsComponente.FieldByName('CodEtg').AsString  := dm.sqlComponente.FieldByName('CodEtg').AsString;

      if dm.cdsOrdemProducao.FieldByName('QtdPrv').AsFloat = 0 then
       dm.cdsComponente.FieldByName('QtdTot').AsFloat   := 0
      else
       dm.cdsComponente.FieldByName('QtdTot').AsFloat   := (dm.cdsComponente.FieldByName('CmpPrv').AsFloat * dm.cdsOrdemProducao.FieldByName('QtdTot').AsFloat) / dm.cdsOrdemProducao.FieldByName('QtdPrv').AsFloat;

      dm.cdsComponente.Post;

      dm.sqlComponente.Next;
    end;

    dm.cdsComponente.First;
end;

procedure TDM.cdsReceitasAfterPost(DataSet: TDataSet);
begin
  dm.sqlE210DLS.Close;
  dm.sqlE210DLS.Sql.Text := 'SELECT CODEMP, CODDEP, CODPRO, CODDER, QTDEST, QTDRES, DATFAB, DATVLT, CODLOT ' +
                           'FROM E210DLS ' +
                          'WHERE CODEMP = :CodEmp ' +
                            'AND CODPRO = :CodPro ' +
                            'AND CODDER = :CodDer ' +
                            'AND QTDEST > 0  ' +
                            'AND CODDEP = ''22'' ' +
                       'ORDER BY DATVLT DESC ';

  dm.sqlE210DLS.ParamByName('CodEmp').AsInteger := dm.cdsReceitas.FieldByName('CodEmp').AsInteger;
  dm.sqlE210DLS.ParamByName('CodPro').AsString  := dm.cdsReceitas.FieldByName('CodPro').AsString;
  dm.sqlE210DLS.ParamByName('CodDer').AsString  := dm.cdsReceitas.FieldByName('CodDer').AsString;

  dm.sqlE210DLS.Open;
  dm.cdsLoteReceita.EmptyDataSet;

  while not dm.sqlE210DLS.eof do
    begin
      dm.cdsLoteReceita.Insert;
      dm.cdsLoteReceita.FieldByName('CodEmp').AsInteger   := dm.sqlE210DLS.FieldByName('CodEmp').AsInteger;
      dm.cdsLoteReceita.FieldByName('CodPro').AsString    := dm.sqlE210DLS.FieldByName('CodPro').AsString;
      dm.cdsLoteReceita.FieldByName('CodDer').AsString    := dm.sqlE210DLS.FieldByName('CodDer').AsString;
      dm.cdsLoteReceita.FieldByName('CodLot').AsString    := dm.sqlE210DLS.FieldByName('CodLot').AsString;
      dm.cdsLoteReceita.FieldByName('QtdEst').AsFloat     := dm.sqlE210DLS.FieldByName('QtdEst').AsFloat;
      dm.cdsLoteReceita.FieldByName('DatFab').AsDateTime  := dm.sqlE210DLS.FieldByName('DatFab').AsDateTime;
      dm.cdsLoteReceita.FieldByName('DatVld').AsDateTime  := dm.sqlE210DLS.FieldByName('DatVlt').AsDateTime;
      dm.cdsLoteReceita.Post;

      dm.sqlE210DLS.Next;
    end;

end;

procedure Tdm.cdsReceitasAfterScroll(DataSet: TDataSet);
var
  AbrNumPed, AbrRp, AbrOp, AbrReceita : String;
  QtdEst : Double;

begin
  dm.sqlE210DLS.Close;
  dm.sqlE210DLS.Sql.Text := 'SELECT CODEMP, CODDEP, CODPRO, CODDER, QTDEST, QTDRES, DATFAB, DATVLT, CODLOT ' +
                           'FROM E210DLS ' +
                          'WHERE CODEMP = :CodEmp ' +
                            'AND CODPRO = :CodPro ' +
                            'AND CODDER = :CodDer ' +
                            'AND QTDEST > 0  ' +
                            'AND CODDEP = ''22'' ' +
                       'ORDER BY DATVLT DESC ';

  dm.sqlE210DLS.ParamByName('CodEmp').AsInteger := dm.cdsReceitas.FieldByName('CodEmp').AsInteger;
  dm.sqlE210DLS.ParamByName('CodPro').AsString  := dm.cdsReceitas.FieldByName('CodPro').AsString;
  dm.sqlE210DLS.ParamByName('CodDer').AsString  := dm.cdsReceitas.FieldByName('CodDer').AsString;

  dm.sqlE210DLS.Open;
  dm.cdsLoteReceita.EmptyDataSet;

  while not dm.sqlE210DLS.eof do
    begin
      dm.cdsLoteReceita.Insert;
      dm.cdsLoteReceita.FieldByName('CodEmp').AsInteger   := dm.sqlE210DLS.FieldByName('CodEmp').AsInteger;
      dm.cdsLoteReceita.FieldByName('CodPro').AsString    := dm.sqlE210DLS.FieldByName('CodPro').AsString;
      dm.cdsLoteReceita.FieldByName('CodDer').AsString    := dm.sqlE210DLS.FieldByName('CodDer').AsString;
      dm.cdsLoteReceita.FieldByName('CodLot').AsString    := dm.sqlE210DLS.FieldByName('CodLot').AsString;
      dm.cdsLoteReceita.FieldByName('QtdEst').AsFloat     := dm.sqlE210DLS.FieldByName('QtdEst').AsFloat;
      dm.cdsLoteReceita.FieldByName('DatFab').AsDateTime  := dm.sqlE210DLS.FieldByName('DatFab').AsDateTime;
      dm.cdsLoteReceita.FieldByName('DatVld').AsDateTime  := dm.sqlE210DLS.FieldByName('DatVlt').AsDateTime;
      dm.cdsLoteReceita.Post;

      dm.sqlE210DLS.Next;
    end;

  dm.cdsLoteReceita.First;

  dm.sqlEstoquesCmp.Close;
  dm.sqlEstoquesCmp.SQL.Text := 'SELECT E900CMO.CODEMP AS CODEMP, E900QDO.CODPRO AS CODPRO, E900QDO.CODDER AS CODDER, E900CMO.CODCMP AS CODCMP, E900CMO.CODDER AS DERCMP, C.DESPRO AS DESCMP, ' +
                                    'C.CPLPRO AS CPLCMP, C.CODMAR AS CODMAR, SUM(E900CMO.QTDPRV) AS QTDPRV, SUM(E900CMO.QTDUTI) AS QTDUTI, SUM(E900CMO.QTDRES) AS QTDRES ' +
                               'FROM E900CMO, E900QDO, E900COP, E075PRO P, E075PRO C  ' +
                              'WHERE E900CMO.CODEMP = E900COP.CODEMP ' +
                                'AND E900CMO.CODORI = E900COP.CODORI ' +
                                'AND E900CMO.NUMORP = E900COP.NUMORP ' +
                                'AND E900QDO.CODEMP = E900COP.CODEMP ' +
                                'AND E900QDO.CODORI = E900COP.CODORI ' +
                                'AND E900QDO.NUMORP = E900COP.NUMORP ' +
                                'AND E900CMO.CODEMP = C.CODEMP ' +
                                'AND E900CMO.CODCMP = C.CODPRO ' +
                                'AND E900QDO.CODEMP = P.CODEMP ' +
                                'AND E900QDO.CODPRO = P.CODPRO ' +
                                'AND E900COP.CODORI  IN (''R40'') ' +
                                'AND C.CODORI NOT IN (''R40'') ' +
                                'AND E900COP.CODEMP = :CodEmp ' +
                                'AND E900QDO.CODPRO = :CodPro ' +
                                'AND E900QDO.CODDER = :CodDer ';


  if length(fColPri.mmNumPed.lines.Text) > 0 then
    begin
      AbrNumPed := uAbrangencia.abrangenciaTabela('E900COP.NUMPED',fColPri.mmNumPed.lines.Text);
      dm.sqlEstoquesCmp.SQL.Add(AbrNumPed);
    end;

  if length(fColPri.mmRP.lines.Text) > 0 then
    begin
      AbrRp := uAbrangencia.abrangenciaTabela('E900COP.RELPRD',fColPri.mmRp.lines.Text);
      dm.sqlEstoquesCmp.SQL.Add(AbrRp);
    end;

  if length(fColPri.mmOP.lines.Text) > 0 then
    begin
      AbrOp := uAbrangencia.abrangenciaTabela('E900COP.NUMORP',fColPri.mmOp.lines.Text);
      dm.sqlEstoquesCmp.SQL.Add(AbrOp);
    end;

  if length(fColPri.mmReceita.lines.Text) > 0 then
    begin
      AbrReceita := uAbrangencia.abrangenciaTabela('E900QDO.CODPRO',fColPri.mmReceita.lines.Text);
      dm.sqlEstoquesCmp.SQL.Add(AbrReceita);
    end;

  dm.sqlEstoquesCmp.SQL.Add('AND E900COP.SITORP IN (''L'',''A'',''F'') ' +
                            'AND E900COP.TIPORP IN (''N'',''P'') ' +
                       'GROUP BY E900CMO.CODEMP, E900QDO.CODPRO, E900QDO.CODDER, E900CMO.CODCMP, E900CMO.CODDER, C.DESPRO, C.CPLPRO, C.CODMAR ' +
                       'ORDER BY E900CMO.CODEMP, E900CMO.CODCMP, E900CMO.CODDER, C.CPLPRO ');

  dm.sqlEstoquesCmp.ParamByName('CodEmp').AsInteger := dm.cdsReceitas.FieldByName('CodEmp').AsInteger;
  dm.sqlEstoquesCmp.ParamByName('CodPro').AsString  := dm.cdsReceitas.FieldByName('CodPro').AsString;
  dm.sqlEstoquesCmp.ParamByName('CodDer').AsString  := dm.cdsReceitas.FieldByName('CodDer').AsString;

  dm.sqlEstoquesCmp.Open;

  dm.cdsEstoquesCmp.EmptyDataSet;

  while not dm.sqlEstoquesCmp.eof do
    begin
      dm.cdsEstoquesCmp.Insert;

      dm.cdsEstoquesCmp.FieldByName('CodEmp').AsInteger := dm.sqlEstoquesCmp.FieldByName('CodEmp').AsInteger;
      dm.cdsEstoquesCmp.FieldByName('CodCmp').AsString  := dm.sqlEstoquesCmp.FieldByName('CodCmp').AsString;
      dm.cdsEstoquesCmp.FieldByName('DerCmp').AsString  := dm.sqlEstoquesCmp.FieldByName('DerCmp').AsString;
      dm.cdsEstoquesCmp.FieldByName('CodMar').AsString  := dm.sqlEstoquesCmp.FieldByName('CodMar').AsString;
      dm.cdsEstoquesCmp.FieldByName('DesCmp').AsString  := dm.sqlEstoquesCmp.FieldByName('DesCmp').AsString + ' ' + dm.sqlEstoquesCmp.FieldByName('CplCmp').AsString;
      dm.cdsEstoquesCmp.FieldByName('QtdPrv').AsFloat   := dm.sqlEstoquesCmp.FieldByName('QtdPrv').AsFloat;
      dm.cdsEstoquesCmp.FieldByName('QtdUti').AsFloat   := dm.sqlEstoquesCmp.FieldByName('QtdUti').AsFloat;
      dm.cdsEstoquesCmp.FieldByName('QtdRes').AsFloat   := dm.sqlEstoquesCmp.FieldByName('QtdRes').AsFloat;
      dm.cdsEstoquesCmp.FieldByName('QtdEst').AsFloat   := 0;

      if dm.cdsReceitas.FieldByName('QtdTot').AsFloat > 0 then
        begin
          dm.cdsEstoquesCmp.FieldByName('QtdTot').AsFloat   := (dm.cdsReceitas.FieldByName('QtdTot').AsFloat * dm.cdsEstoquesCmp.FieldByName('QtdPrv').AsFloat) / dm.cdsReceitas.FieldByName('QtdPrv').AsFloat;
        end
      else
        begin
          dm.cdsEstoquesCmp.FieldByName('QtdTot').AsFloat   := 0;
        end;

      dm.sqlE210EST.Close;
      dm.sqlE210EST.Sql.Text := 'SELECT CODEMP, CODDEP, CODPRO, CODDER, QTDEST, QTDRES ' +
                               'FROM E210EST ' +
                              'WHERE CODEMP = :CodEmp ' +
                                'AND CODPRO = :CodCmp ' +
                                'AND CODDER = :DerCmp ' +
                                'AND CODDEP = ''22'' ';

      dm.sqlE210EST.ParamByName('CodEmp').AsInteger := dm.sqlEstoquesCmp.FieldByName('CodEmp').AsInteger;
      dm.sqlE210EST.ParamByName('CodCmp').AsString  := dm.sqlEstoquesCmp.FieldByName('CodCmp').AsString;
      dm.sqlE210EST.ParamByName('DerCmp').AsString  := dm.sqlEstoquesCmp.FieldByName('DerCmp').AsString;

      dm.sqlE210EST.Open;

      while not dm.sqlE210EST.eof do
        begin
          dm.cdsEstoquesCmp.FieldByName('QtdEst').AsFloat := dm.sqlE210EST.FieldByName('QtdEst').AsFloat;

          dm.sqlE210EST.Next;
        end;

      dm.cdsEstoquesCmp.Post;

      dm.sqlEstoquesCmp.Next;
    end;

  dm.cdsEstoquesCmp.First;

  dm.sqlOrdemProducao.Close;
  dm.sqlOrdemProducao.SQL.Text := 'SELECT E900COP.CODEMP AS CODEMP, E900COP.CODORI AS CODORI, E900QDO.CODPRO AS CODPRO, E900QDO.CODDER AS CODDER, ' +
                                         'E900QDO.QTDPRV AS QTDPRV, E900COP.NUMPED AS NUMPED, E900QDO.SEQIPD AS SEQIPD, E900COP.RELPRD AS RELPRD, ' +
                                         'E900COP.NUMORP AS NUMORP, E075PRO.DESPRO AS DESPRO, E075PRO.CPLPRO AS CPLPRO, E900QDO.QTDRE1 AS QTDRE1, ' +
                                         'E900QDO.CODDEP AS CODDEP, E900OOP.SEQROT AS SEQROT, E900OOP.CODETG AS CODETG ' +
                                    'FROM E900OOP, E900COP, E900QDO, E075PRO ' +
                                    'WHERE E900QDO.CODEMP = E900COP.CODEMP ' +
                                    'AND E900QDO.CODORI = E900COP.CODORI ' +
                                    'AND E900QDO.NUMORP = E900COP.NUMORP ' +
                                    'AND E900QDO.CODEMP = E075PRO.CODEMP ' +
                                    'AND E900QDO.CODPRO = E075PRO.CODPRO ' +
                                    'AND E900OOP.CODEMP = E900COP.CODEMP ' +
                                    'AND E900OOP.CODORI = E900COP.CODORI ' +
                                    'AND E900OOP.NUMORP = E900COP.NUMORP ' +
                                    'AND E900COP.CODEMP = :CodEmp ' +
                                    'AND E900QDO.CODPRO = :CodPro ' +
                                    'AND E900QDO.CODDER = :CodDer ' +
                                    'AND E900OOP.SEQROT = 10 ';

  if length(fColPri.mmNumPed.lines.Text) > 0 then
    begin
      dm.sqlOrdemProducao.SQL.Add(AbrNumPed);
    end;

  if length(fColPri.mmRP.lines.Text) > 0 then
    begin
      dm.sqlOrdemProducao.SQL.Add(AbrRp);
    end;

  if length(fColPri.mmOP.lines.Text) > 0 then
    begin
      dm.sqlOrdemProducao.SQL.Add(AbrOp);
    end;
  {
  if length(fColPri.mmReceita.lines.Text) > 0 then
    begin
      dm.sqlOrdemProducao.SQL.Add(AbrReceita);
    end;
  }
  dm.sqlOrdemProducao.SQL.Add('AND E900COP.CODORI IN (''R40'') ' +
                              'AND E900COP.SITORP IN (''L'',''A'',''F'') ' +
                              'AND E900COP.TIPORP IN (''N'',''P'') ' +
                              'ORDER BY E900COP.CODEMP, E900COP.CODPRO, E900COP.NUMORP ');

  dm.sqlOrdemProducao.ParamByName('CodEmp').AsInteger := dm.cdsReceitas.FieldByName('CodEmp').AsInteger;
  dm.sqlOrdemProducao.ParamByName('CodPro').AsString  := dm.cdsReceitas.FieldByName('CodPro').AsString;
  dm.sqlOrdemProducao.ParamByName('CodDer').AsString  := dm.cdsReceitas.FieldByName('CodDer').AsString;

  dm.sqlOrdemProducao.Open;
  dm.cdsOrdemProducao.EmptyDataSet;

  while not dm.sqlOrdemProducao.eof do
    begin
      dm.cdsOrdemProducao.Insert;

      dm.cdsOrdemProducao.FieldByName('CodEmp').AsInteger := dm.sqlOrdemProducao.FieldByName('CodEmp').AsInteger;
      dm.cdsOrdemProducao.FieldByName('NumPed').AsInteger := dm.sqlOrdemProducao.FieldByName('NumPed').AsInteger;
      dm.cdsOrdemProducao.FieldByName('SeqIpd').AsInteger := dm.sqlOrdemProducao.FieldByName('SeqIpd').AsInteger;
      dm.cdsOrdemProducao.FieldByName('RelPrd').AsString  := dm.sqlOrdemProducao.FieldByName('RelPrd').AsString;
      dm.cdsOrdemProducao.FieldByName('CodOri').AsString  := dm.sqlOrdemProducao.FieldByName('CodOri').AsString;
      dm.cdsOrdemProducao.FieldByName('NumOrp').AsInteger := dm.sqlOrdemProducao.FieldByName('NumOrp').AsInteger;
      dm.cdsOrdemProducao.FieldByName('CodOri').AsString  := dm.sqlOrdemProducao.FieldByName('CodOri').AsString;
      dm.cdsOrdemProducao.FieldByName('CodPro').AsString  := dm.sqlOrdemProducao.FieldByName('CodPro').AsString;
      dm.cdsOrdemProducao.FieldByName('CodDer').AsString  := dm.sqlOrdemProducao.FieldByName('CodDer').AsString;
      dm.cdsOrdemProducao.FieldByName('CodMar').AsString  := dm.sqlOrdemProducao.FieldByName('DesPro').AsString;
      dm.cdsOrdemProducao.FieldByName('DesPro').AsString  := dm.sqlOrdemProducao.FieldByName('DesPro').AsString + ' ' + dm.sqlOrdemProducao.FieldByName('CplPro').AsString;
      dm.cdsOrdemProducao.FieldByName('QtdPrv').AsFloat   := dm.sqlOrdemProducao.FieldByName('QtdPrv').AsFloat;
      dm.cdsOrdemProducao.FieldByName('QtdRe1').AsFloat   := dm.sqlOrdemProducao.FieldByName('QtdRe1').AsFloat;
      dm.cdsOrdemProducao.FieldByName('CodDep').AsString  := dm.sqlOrdemProducao.FieldByName('CodDep').AsString;
      dm.cdsOrdemProducao.FieldByName('CodEtg').AsString  := dm.sqlOrdemProducao.FieldByName('CodEtg').AsString;
      dm.cdsOrdemProducao.FieldByName('SeqRot').AsInteger := dm.sqlOrdemProducao.FieldByName('SeqRot').AsInteger;

      dm.cdsOrdemProducao.Post;

      dm.sqlOrdemProducao.Next;
    end;

   dm.cdsOrdemProducao.First;

end;

procedure Tdm.cdsReceitasCalcFields(DataSet: TDataSet);
var
  PerPro : Double;
begin
  dm.cdsReceitas.FieldByName('QtdAdi').AsFloat := dm.cdsReceitas.FieldByName('QtdTot').AsFloat - dm.cdsReceitas.FieldByName('QtdPrv').AsFloat;

  if dm.cdsReceitas.FieldByName('QtdAdi').AsFloat < 0 Then
    dm.cdsReceitas.FieldByName('QtdAdi').AsFloat := 0;

  dm.cdsEstoquesCmp.First;
  while not dm.cdsEstoquesCmp.eof do
    begin

      dm.cdsEstoquesCmp.Edit;
      dm.cdsEstoquesCmp.FieldByName('QtdTot').AsFloat := (dm.cdsReceitas.FieldByName('QtdTot').AsFloat * dm.cdsEstoquesCmp.FieldByName('QtdPrv').AsFloat) / dm.cdsReceitas.FieldByName('QtdPrv').AsFloat;
      dm.cdsEstoquesCmp.Post;

      dm.cdsEstoquesCmp.Next;
    end;



  dm.cdsOrdemProducao.First;
  while not dm.cdsOrdemProducao.eof do
    begin

      If dm.cdsReceitas.FieldByName('QtdPrv').AsFloat > 0 then
        begin
          PerPro := dm.cdsOrdemProducao.FieldByName('QtdPrv').AsFloat /  dm.cdsReceitas.FieldByName('QtdPrv').AsFloat;
        end
      else
        begin
           PerPro := 0;
        end;

      dm.cdsOrdemProducao.Edit;
      dm.cdsOrdemProducao.FieldByName('QtdTot').AsFloat := dm.cdsReceitas.FieldByName('QtdTot').AsFloat * PerPro;
      dm.cdsOrdemProducao.Post;

      dm.cdsOrdemProducao.Next;
    end;

  dm.cdsOrdemProducao.First;
end;

end.
