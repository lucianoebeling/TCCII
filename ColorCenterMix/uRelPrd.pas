unit uRelPrd;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.Grids, Vcl.DBGrids, Vcl.ExtCtrls, Vcl.Imaging.pngimage, uDM, uColPri, uAbrangencia,
  Vcl.ToolWin, System.ImageList, Vcl.ImgList, uBxaCmp, uBarPrg;

type
  TfRelPrd = class(TForm)
    dbgRelPrd: TDBGrid;
    sbRElPrd: TStatusBar;
    pnTitRel: TPanel;
    lbTitRel: TLabel;
    imTitRel: TImage;
    spTitRel: TShape;
    ToolBar2: TToolBar;
    tbCancelar: TToolButton;
    tbImprimir: TToolButton;
    tbSair: TToolButton;
    img: TImageList;
    btBxaCmp: TToolButton;
    tbEstCmp: TToolButton;
    gbCodBar: TGroupBox;
    Label1: TLabel;
    edCodBar: TEdit;
    lbRelPrd: TLabel;
    edRelPrd: TEdit;
    lbCodPro: TLabel;
    edCodPro: TEdit;
    lbCodDEr: TLabel;
    edCodDer: TEdit;
    lbLote: TLabel;
    edCodLot: TEdit;
    lbPesEti: TLabel;
    edPesEti: TEdit;
    procedure FormShow(Sender: TObject);
    procedure tbSairClick(Sender: TObject);
    procedure tbImprimirClick(Sender: TObject);
    procedure edCodBarExit(Sender: TObject);
    procedure btBxaCmpClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure tbEstCmpClick(Sender: TObject);
  private
    { Private declarations }

  public
    { Public declarations }
    CodOri, CodEtg, CodCmp, DerCmp, CodDep, Codlot : String;
    NumOrp : Integer;
    PesLta : Double;
  end;

var
  fRelPrd: TfRelPrd;

implementation

{$R *.dfm}

uses uEstCmp;

procedure TfRelPrd.edCodBarExit(Sender: TObject);
var
  Aux, CodPro, CodDer, CodLot : String;
  PesLta : Double;
  PosStr : Integer;

begin
  if length(edCodBar.Text) > 0 then
    begin
      edRelPrd.Text := dm.cdsRelPrd.FieldByName('RelPrd').AsString;

      Aux := edCodBar.Text;
      PosStr := AnsiPos('-',Aux);
      CodPro := Copy(Aux,1, PosStr -1);
      edCodPro.Text := CodPro;
      Delete(Aux,1,PosStr);

      PosStr := AnsiPos('-',Aux);
      CodDer := Copy(Aux,1, PosStr -1);
      edCodDer.Text := CodDer;
      Delete(Aux,1,PosStr);

      PosStr := AnsiPos('-',Aux);
      CodLot := Copy(Aux,1, PosStr -1);
      edCodLot.Text := CodLot;
      Delete(Aux,1,PosStr);

      PesLta := StrToFloatDef(Copy(Aux,1, 9),0);
      if PesLta > 0 then
        PesLta := PesLta / 1000;

      edPesEti.Text := formatfloat('###,##0.0',PesLta);

      if CodPro <> dm.cdsRelPrd.FieldByName('CodCmp').AsString then
        begin
          edPesEti.Text := '0,0';
          edCodLot.Text := '';
          edCodBar.Text := '';
          edCodPro.Text := '';
          edCodDer.Text := '';
          edRelPrd.Text := '';
          edCodBar.SetFocus;

          Application.MessageBox(PChar('Produto: ' + CodPro + ' não é componente da RP. '),'Aviso',MB_OK + mb_IconError);
        end;
    end;
end;

procedure TfRelPrd.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  edPesEti.Text := '0,0';
  edCodLot.Text := '';
  edCodBar.Text := '';
  edCodPro.Text := '';
  edCodDer.Text := '';
  edRelPrd.Text := '';
end;

procedure TfRelPrd.FormShow(Sender: TObject);
var
   AbrNumPed, AbrRp, AbrOp, AbrReceita  :String;
   Achou : Integer;
begin
  dm.sqlRelPrd.Close;
  dm.sqlRelPrd.SQL.Text := 'SELECT E900COP.CODEMP AS CODEMP, E900COP.CODORI AS CODORI, E900COP.RELPRD AS RELPRD, E900CMO.CODCMP AS CODCMP, E900CMO.CODDER AS DERCMP, E075PRO.DESPRO AS DESPRO, ' +
                                  'E075PRO.CPLPRO AS CPLPRO, SUM(E900CMO.QTDPRV) AS QTDPRV, SUM(E900CMO.QTDUTI) AS QTDUTI, SUM(E900CMO.QTDRES) AS QTDRES ' +
                               'FROM E900CMO, E900COP, E900QDO, E075PRO ' +
                              'WHERE E900CMO.CODEMP = E900COP.CODEMP ' +
                                'AND E900CMO.CODORI = E900COP.CODORI ' +
                                'AND E900CMO.NUMORP = E900COP.NUMORP ' +
                                'AND E900CMO.CODEMP = E075PRO.CODEMP ' +
                                'AND E900CMO.CODCMP = E075PRO.CODPRO ' +
                                'AND E900QDO.CODEMP = E900COP.CODEMP ' +
                                'AND E900QDO.CODORI = E900COP.CODORI ' +
                                'AND E900QDO.NUMORP = E900COP.NUMORP ' +
                                'AND E900COP.CODORI NOT IN (''R40'') ' +
                                'AND E075PRO.CODFAM IN (''R41'')  ' +
                                'AND E900CMO.CODEMP = :CodEmp ' +
                                'AND E900CMO.CODCMP = :CodCmp ' +
                                'AND E900CMO.CODDER = :DerCmp ';


  if length(fColPri.mmNumPed.lines.Text) > 0 then
    begin
      AbrNumPed := uAbrangencia.abrangenciaTabela('E900COP.NUMPED',fColPri.mmNumPed.lines.Text);
      dm.sqlRelPrd.SQL.Add(AbrNumPed);
    end;

  if length(fColPri.mmRP.lines.Text) > 0 then
    begin
      AbrRp := uAbrangencia.abrangenciaTabela('E900COP.RELPRD',fColPri.mmRp.lines.Text);
      dm.sqlRelPrd.SQL.Add(AbrRp);
    end;

  if length(fColPri.mmOP.lines.Text) > 0 then
    begin
      AbrOp := uAbrangencia.abrangenciaTabela('E900COP.NUMORP',fColPri.mmOp.lines.Text);
      dm.sqlRelPrd.SQL.Add(AbrOp);
    end;

  if length(fColPri.mmReceita.lines.Text) > 0 then
    begin
      AbrReceita := uAbrangencia.abrangenciaTabela('E900CMO.CODCMP',fColPri.mmReceita.lines.Text);
      dm.sqlRelPrd.SQL.Add(AbrReceita);
    end;

  dm.sqlRelPrd.SQL.Add('AND E900COP.SITORP IN (''L'',''A'',''F'') ' +
                       'AND E900COP.TIPORP IN (''N'',''P'') ' +
                   'GROUP BY E900COP.CODEMP, E900COP.CODORI, E900COP.RELPRD, E900CMO.CODCMP, E900CMO.CODDER, E075PRO.DESPRO, E075PRO.CPLPRO  ' +
                   'ORDER BY E900COP.CODEMP, E900COP.CODORI, E900COP.RELPRD, E075PRO.CPLPRO, E900CMO.CODCMP, E900CMO.CODDER ');

  dm.sqlRelPrd.ParamByName('CodEmp').AsInteger := dm.cdsConfiguracao.FieldByName('CodEmp').AsInteger;
  dm.sqlRelPrd.ParamByName('CodCmp').AsString  := dm.cdsReceitas.FieldByName('CodPro').AsString;
  dm.sqlRelPrd.ParamByName('DerCmp').AsString  := dm.cdsReceitas.FieldByName('CodDer').AsString;

  dm.sqlRelPrd.Open;
  dm.sqlRelPrd.First;

  dm.cdsRelPrd.EmptyDataSet;

  achou := 0;

  while not dm.sqlRelPrd.eof do
    begin
      achou := 1;
      dm.cdsRelPrd.Insert;
      dm.cdsRelPrd.FieldByName('CodEmp').AsInteger := dm.sqlRelPrd.FieldByName('CodEmp').AsInteger;
      dm.cdsRelPrd.FieldByName('CodOri').AsString  := dm.sqlRelPrd.FieldByName('CodOri').AsString;
      dm.cdsRelPrd.FieldByName('RelPrd').AsString  := dm.sqlRelPrd.FieldByName('RelPrd').AsString;
      dm.cdsRelPrd.FieldByName('CodCmp').AsString  := dm.sqlRelPrd.FieldByName('CodCmp').AsString;
      dm.cdsRelPrd.FieldByName('DerCmp').AsString  := dm.sqlRelPrd.FieldByName('DerCmp').AsString;
      dm.cdsRelPrd.FieldByName('DesCmp').AsString  := dm.sqlRelPrd.FieldByName('DesPro').AsString + ' ' + dm.sqlRelPrd.FieldByName('CplPro').AsString;
      dm.cdsRelPrd.FieldByName('QtdPrv').AsFloat   := dm.sqlRelPrd.FieldByName('QtdPrv').AsFloat;
      dm.cdsRelPrd.FieldByName('QtdUti').AsFloat   := dm.sqlRelPrd.FieldByName('QtdUti').AsFloat;
      dm.cdsRelPrd.FieldByName('QtdRes').AsFloat   := dm.sqlRelPrd.FieldByName('QtdRes').AsFloat;
      dm.cdsRelPrd.Post;

      dm.sqlRelPrd.Next;
    end;

  dm.cdsRelPrd.First;

  If achou = 0 then
    begin
      Application.MessageBox(pchar('ERRO: Não encontradas RP''s para o filtro. ' ),'ERRO',mb_ICONERROR);
    end;

  edCodBar.SetFocus;
end;

procedure TfRelPrd.tbEstCmpClick(Sender: TObject);
var
   AbrNumPed, AbrRp, AbrOp, AbrReceita, RetSid  :String;
   Achou, EtgOrp : Integer;
   CmpTot, QtdEst : Double;

begin

  dm.sqlRelPrd1.Close;
  dm.sqlRelPrd1.Sql.Text := 'SELECT E900COP.CODEMP AS CODEMP, E900COP.CODORI AS CODORI, E900COP.RELPRD AS RELPRD, E900COP.NUMORP AS NUMORP, E900CMO.CODCMP AS CODCMP, E900CMO.CODDER AS DERCMP, E075PRO.DESPRO AS DESPRO, ' +
                                   'E075PRO.CPLPRO AS CPLPRO, E900CMO.QTDPRV AS QTDPRV, E900CMO.QTDUTI AS QTDUTI, E900CMO.QTDRES AS QTDRES, E900CMO.CODETG AS CODETG ' +
                              'FROM E900CMO, E900COP, E900QDO, E075PRO ' +
                             'WHERE E900CMO.CODEMP = E900COP.CODEMP ' +
                               'AND E900CMO.CODORI = E900COP.CODORI ' +
                               'AND E900CMO.NUMORP = E900COP.NUMORP ' +
                               'AND E900CMO.CODEMP = E075PRO.CODEMP ' +
                               'AND E900CMO.CODCMP = E075PRO.CODPRO ' +
                               'AND E900QDO.CODEMP = E900COP.CODEMP ' +
                               'AND E900QDO.CODORI = E900COP.CODORI ' +
                               'AND E900QDO.NUMORP = E900COP.NUMORP ' +
                               'AND E900COP.CODORI NOT IN (''R40'') ' +
                               'AND E075PRO.CODFAM IN (''R41'')  ' +
                               'AND E900CMO.CODEMP = :CodEmp ' +
                               'AND E900CMO.CODCMP = :CodCmp ' +
                               'AND E900CMO.CODDER = :DerCmp ' +
                               'AND E900COP.RELPRD = :RelPrd ';


  if length(fColPri.mmNumPed.lines.Text) > 0 then
    begin
      AbrNumPed := uAbrangencia.abrangenciaTabela('E900COP.NUMPED',fColPri.mmNumPed.lines.Text);
      dm.sqlRelPrd1.SQL.Add(AbrNumPed);
    end;

  if length(fColPri.mmRP.lines.Text) > 0 then
    begin
      AbrRp := uAbrangencia.abrangenciaTabela('E900COP.RELPRD',fColPri.mmRp.lines.Text);
      dm.sqlRelPrd1.SQL.Add(AbrRp);
    end;

  if length(fColPri.mmOP.lines.Text) > 0 then
    begin
      AbrOp := uAbrangencia.abrangenciaTabela('E900COP.NUMORP',fColPri.mmOp.lines.Text);
      dm.sqlRelPrd1.SQL.Add(AbrOp);
    end;


  dm.sqlRelPrd1.SQL.Add('AND E900COP.SITORP IN (''L'',''A'',''F'') ' +
                        'AND E900COP.TIPORP IN (''N'',''P'') ' +
                   'ORDER BY E900COP.CODEMP, E900COP.CODORI, E900COP.RELPRD, E075PRO.CPLPRO, E900CMO.CODCMP, E900CMO.CODDER ');

  dm.sqlRelPrd1.ParamByName('CodEmp').AsInteger := dm.cdsConfiguracao.FieldByName('CodEmp').AsInteger;
  dm.sqlRelPrd1.ParamByName('CodCmp').AsString  := dm.cdsRelPrd.FieldByName('CodCmp').AsString;
  dm.sqlRelPrd1.ParamByName('DerCmp').AsString  := dm.cdsRelPrd.FieldByName('DerCmp').AsString;
  dm.sqlRelPrd1.ParamByName('RelPrd').AsString  := dm.cdsRelPrd.FieldByName('RelPrd').AsString;


  fBarPrg.Show;
  fBarPrg.AtualizarBarra('Estornar componente','Estornando componente: ' + dm.cdsRelPrd.FieldByName('CodCmp').AsString + '... ',10);

  dm.sqlRelPrd1.Open;

  While not dm.sqlRelPrd1.eof do
    begin

      fBarPrg.AtualizarBarra('Estornar componente','Estornando componente: ' + dm.cdsRelPrd.FieldByName('CodCmp').AsString + '... ',50);

      CodOri := dm.sqlRelPrd1.FieldByName('CodOri').AsString;
      NumOrp := dm.sqlRelPrd1.FieldByName('NumOrp').AsInteger;
      EtgOrp := dm.sqlRelPrd1.FieldByName('CodEtg').AsInteger;
      CodCmp := dm.sqlRelPrd1.FieldByName('CodCmp').AsString;
      DerCmp := dm.sqlRelPrd1.FieldByName('DerCmp').AsString;

      if dm.sqlRelPrd1.FieldByName('QtdPrv').AsFloat < dm.cdsRelPrd.FieldByName('QtdPrv').AsFloat then
        begin
          CmpTot := StrToFloatDef(edPesEti.Text,0) * dm.sqlRelPrd1.FieldByName('QtdPrv').AsFloat / dm.cdsRelPrd.FieldByName('QtdPrv').AsFloat;
        end
      else
        begin
          CmpTot := StrToFloatDef(edPesEti.Text,0);
        end;

      CodDep := '22';
      CodLot :=  edCodLot.Text;

      RetSid := fEstCmp.EstornaCoponente(CodOri,NumOrp,EtgOrp,CodCmp,DerCmp,CmpTot);

      if RetSid <> 'OK' then
        begin
          fBarPrg.Close;
          Application.messageBox(pwidechar('Erro ao estornar componente: ' + CodCmp + ' ' + RetSid),'Erro',mb_OkCancel+mb_IconError)
        end
      else
        begin
          Application.messageBox(pwidechar('Componente: ' + CodCmp + ' estornado  com sucesso!'),'Aviso',mb_Ok+MB_ICONINFORMATION);
        end;

      fBarPrg.AtualizarBarra('Estornar componente','Estornando componente: ' + dm.cdsRelPrd.FieldByName('CodCmp').AsString + '... ',80);

      dm.sqlRelPrd1.Next;
    end;

  fBarPrg.AtualizarBarra('Estornar componente','Estornando componente: ' + dm.cdsRelPrd.FieldByName('CodCmp').AsString + '... ',100);
  fBarPrg.Close;

  FormShow(Sender);
  edCodBar.SetFocus;

end;

procedure TfRelPrd.tbImprimirClick(Sender: TObject);
begin
  fColPri.tbImprimirClick(Sender);
end;

procedure TfRelPrd.tbSairClick(Sender: TObject);
begin
  close;
end;

procedure TfRelPrd.btBxaCmpClick(Sender: TObject);
var
  RetSid, AbrNumPed, AbrRp, AbrOp, AbrReceita : String;
  NumOrp : Integer;
  CmpTot : Double;

begin

  fBarPrg.Show;
  fBarPrg.AtualizarBarra('Baixar componente','Baixando componente: ' + dm.cdsRelPrd.FieldByName('CodCmp').AsString + '... ',10);

  dm.sqlRelPrd1.Close;
  dm.sqlRelPrd1.Sql.Text := 'SELECT E900COP.CODEMP AS CODEMP, E900COP.CODORI AS CODORI, E900COP.RELPRD AS RELPRD, E900COP.NUMORP AS NUMORP, E900CMO.CODCMP AS CODCMP, E900CMO.CODDER AS DERCMP, E075PRO.DESPRO AS DESPRO, ' +
                                   'E075PRO.CPLPRO AS CPLPRO, E900CMO.QTDPRV AS QTDPRV, E900CMO.QTDUTI AS QTDUTI, E900CMO.QTDRES AS QTDRES, E900CMO.CODETG AS CODETG ' +
                              'FROM E900CMO, E900COP, E900QDO, E075PRO ' +
                             'WHERE E900CMO.CODEMP = E900COP.CODEMP ' +
                               'AND E900CMO.CODORI = E900COP.CODORI ' +
                               'AND E900CMO.NUMORP = E900COP.NUMORP ' +
                               'AND E900CMO.CODEMP = E075PRO.CODEMP ' +
                               'AND E900CMO.CODCMP = E075PRO.CODPRO ' +
                               'AND E900QDO.CODEMP = E900COP.CODEMP ' +
                               'AND E900QDO.CODORI = E900COP.CODORI ' +
                               'AND E900QDO.NUMORP = E900COP.NUMORP ' +
                               'AND E900COP.CODORI NOT IN (''R40'') ' +
                               'AND E075PRO.CODFAM IN (''R41'')  ' +
                               'AND E900CMO.CODEMP = :CodEmp ' +
                               'AND E900CMO.CODCMP = :CodCmp ' +
                               'AND E900CMO.CODDER = :DerCmp ' +
                               'AND E900COP.RELPRD = :RelPrd ';


  if length(fColPri.mmNumPed.lines.Text) > 0 then
    begin
      AbrNumPed := uAbrangencia.abrangenciaTabela('E900COP.NUMPED',fColPri.mmNumPed.lines.Text);
      dm.sqlRelPrd1.SQL.Add(AbrNumPed);
    end;

  if length(fColPri.mmRP.lines.Text) > 0 then
    begin
      AbrRp := uAbrangencia.abrangenciaTabela('E900COP.RELPRD',fColPri.mmRp.lines.Text);
      dm.sqlRelPrd1.SQL.Add(AbrRp);
    end;

  if length(fColPri.mmOP.lines.Text) > 0 then
    begin
      AbrOp := uAbrangencia.abrangenciaTabela('E900COP.NUMORP',fColPri.mmOp.lines.Text);
      dm.sqlRelPrd1.SQL.Add(AbrOp);
    end;


  dm.sqlRelPrd1.SQL.Add('AND E900COP.SITORP IN (''L'',''A'',''F'') ' +
                        'AND E900COP.TIPORP IN (''N'',''P'') ' +
                   'ORDER BY E900COP.CODEMP, E900COP.CODORI, E900COP.RELPRD, E075PRO.CPLPRO, E900CMO.CODCMP, E900CMO.CODDER ');

  dm.sqlRelPrd1.ParamByName('CodEmp').AsInteger := dm.cdsConfiguracao.FieldByName('CodEmp').AsInteger;
  dm.sqlRelPrd1.ParamByName('CodCmp').AsString  := dm.cdsRelPrd.FieldByName('CodCmp').AsString;
  dm.sqlRelPrd1.ParamByName('DerCmp').AsString  := dm.cdsRelPrd.FieldByName('DerCmp').AsString;
  dm.sqlRelPrd1.ParamByName('RelPrd').AsString  := dm.cdsRelPrd.FieldByName('RelPrd').AsString;

  dm.sqlRelPrd1.Open;

  fBarPrg.AtualizarBarra('Baixar componente','Baixando componente: ' + dm.cdsRelPrd.FieldByName('CodCmp').AsString + '... ',20);

  While not dm.sqlRelPrd1.eof do
    begin

      fBarPrg.AtualizarBarra('Baixar comoponente','Baixando componente: ' + dm.cdsRelPrd.FieldByName('CodCmp').AsString,50);

      CodOri := dm.sqlRelPrd1.FieldByName('CodOri').AsString;
      NumOrp := dm.sqlRelPrd1.FieldByName('NumOrp').AsInteger;
      CodEtg := dm.sqlRelPrd1.FieldByName('CodEtg').AsString;
      CodCmp := dm.sqlRelPrd1.FieldByName('CodCmp').AsString;
      DerCmp := dm.sqlRelPrd1.FieldByName('DerCmp').AsString;

      if dm.sqlRelPrd1.FieldByName('QtdPrv').AsFloat < dm.cdsRelPrd.FieldByName('QtdPrv').AsFloat then
        begin
          CmpTot := StrToFloatDef(edPesEti.Text,0) * dm.sqlRelPrd1.FieldByName('QtdPrv').AsFloat / dm.cdsRelPrd.FieldByName('QtdPrv').AsFloat;
        end
      else
        begin
          CmpTot := StrToFloatDef(edPesEti.Text,0);
        end;

      CodDep := '22';
      CodLot :=  edCodLot.Text;

      RetSid := fBxaCmp.BaixarCmp(CodOri,NumOrp,CodEtg,CodCmp,DerCmp,CmpTot,CodDep,Codlot);

      if RetSid <> 'OK' then
        begin
          fBarPrg.Close;
          Application.messageBox(pwidechar('Erro ao baixar componente: ' + CodCmp + ' ' + RetSid),'Erro',mb_OkCancel+mb_IconError)
        end
      else
        begin
          fBarPrg.AtualizarBarra('Baixar componente','Baixando componente: ' + dm.cdsRelPrd.FieldByName('CodCmp').AsString + '... ',100);
          fBarPrg.Close;

          Application.messageBox(pwidechar('Componente: ' + CodCmp + ' baixado  com sucesso! '),'Aviso',mb_Ok+MB_ICONINFORMATION);
        end;

      fBarPrg.AtualizarBarra('Baixar componente','Baixando componente: ' + dm.cdsRelPrd.FieldByName('CodCmp').AsString + '... ',80);

      dm.sqlRelPrd1.Next;
    end;

  FormShow(Sender);
  edCodBar.SetFocus;

end;

end.
