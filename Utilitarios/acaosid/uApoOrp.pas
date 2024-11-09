unit uApoOrp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Soap.InvokeRegistry,
  System.Net.URLClient, Soap.Rio, Soap.SOAPHTTPClient, uDM, uColPri, uWSAcaoSid;

type
  TfApoOrp = class(TForm)
    HTTPRIOAcaoSid: THTTPRIO;
  private
    { Private declarations }
  public
    { Public declarations }
    function ApontarOp(CodOri: String; NumOrp: Integer; CodEtg :String; SeqRot:Integer; QtdRe1:Double; CodLot:String): string;
  end;

var
  fApoOrp: TfApoOrp;

implementation

{$R *.dfm}


function TfApoOrp.ApontarOp(CodOri: String; NumOrp: Integer; CodEtg :String; SeqRot:Integer; QtdRe1:Double; CodLot:String): string;
  var
    Retorno    :sidExecutarOut;
    Parameters :sidExecutarIn;
    Sid        : Array_Of_sidExecutarInSID;

    ParamSid0, ParamSid1, ParamSid2, ParamSid3, ParamSid4, ParamSid5,
    ParamSid6, ParamSid7, ParamSid8, ParamSid9, ParamSid10, ParamSid11 : sidExecutarInSID;

    I, NumCad, TurTrb : Integer;
    NomUsu, SnhUsu, CodDep : String;
    QtdPrv, QtdEst, QtdUti, TmpPrd : Double;
    DatVld, DatFab : TDate;

  begin

    // SID.Prd.ApontarOps (MCAP) - Apontar Ordens De Produção

    // CodOri Código da origem
    // NumCad	Código do operador
    // NumOrp	Número da O.P.
    // CodEtg	Código do estágio
    // SeqRot	Sequência de roteiro
    // CodCre	Centro de recurso
    // QtdRe1	Quantidade de 1a. qualidade
    // CodPro	Código do produto
    // CodDer	Código da derivação
    // CodLot	Código do lote
    // CodDep	Código do depósito

    // function Getsapiens_Synccom_senior_g5_co_ger_sid(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): sapiens_Synccom_senior_g5_co_ger_sid;
    // function  Executar(const user: string; const password: string; const encryption: Integer; const parameters: sidExecutarIn): sidExecutarOut; stdcall;

    Retorno       := sidExecutarOut.Create;
    Parameters    := sidExecutarIn.Create;
    ParamSid0     := sidExecutarInSID.Create;
    ParamSid1     := sidExecutarInSID.Create;
    ParamSid2     := sidExecutarInSID.Create;
    ParamSid3     := sidExecutarInSID.Create;
    ParamSid4     := sidExecutarInSID.Create;
    ParamSid5     := sidExecutarInSID.Create;
    ParamSid6     := sidExecutarInSID.Create;
    ParamSid7     := sidExecutarInSID.Create;
    ParamSid8     := sidExecutarInSID.Create;
    ParamSid9     := sidExecutarInSID.Create;
    ParamSid10    := sidExecutarInSID.Create;
    ParamSid11    := sidExecutarInSID.Create;

    NomUsu := dm.cdsConfiguracao.FieldByName('NomUsu').AsString;
    SnhUsu := dm.cdsConfiguracao.FieldByName('SnhUsu').AsString;

    // Depósito pulmão: 22
    CodDep := '22';

    // Sequencia do roteiro da operação misturar tintas
    SeqRot := 10;

    // Apontamento produção informar o número do cadastro do colaborador
    NumCad := dm.cdsConfiguracao.FieldByName('NumCad').AsInteger;
    TurTrb := dm.cdsConfiguracao.FieldByName('TurTrb').AsInteger;

    if NumCad < 1 then
      begin
        Application.MessageBox(pchar('ERRO: É obrigatório informar o número do cadastro do colaborador. Contate o adminsitrdor da aplicação'),'ERRO',mb_ICONERROR);
      end;

    SetLength(Sid,12);

    ParamSid0.param := 'acao=SID.Prd.ApontarOps';
    Sid[0] := ParamSid0;
    ParamSid1.param := 'CODORI=' + CodOri;
    Sid[1] := ParamSid1;
    ParamSid2.param := 'NUMORP=' + IntToStr(NumOrp);
    Sid[2] := ParamSid2;
    ParamSid3.param := 'CODETG=' + CodEtg;
    Sid[3] := ParamSid3;
    ParamSid4.param := 'SEQROT=' + IntToStr(SeqRot);
    Sid[4] := ParamSid4;
    ParamSid5.param := 'NUMCAD=' + IntToStr(NumCad);
    Sid[5] := ParamSid5;
    ParamSid6.param := 'TURTRB=' + IntToStr(TurTrb);
    Sid[6] := ParamSid6;
    ParamSid7.param := 'DATMOV=' + FormatDateTime('dd/mm/yyyy',date);
    Sid[7] := ParamSid7;
    ParamSid8.param := 'HORMOV=' + FormatDateTime('hh:mm:ss',time);
    Sid[8] := ParamSid8;

    if Qtdre1 = 0 then
      begin
        // Abrir apontamento de produção
        ParamSid9.param := '';
        Sid[9] := ParamSid9;
        ParamSid10.param := '';
        Sid[10] := ParamSid10;
        ParamSid11.param := '';
        Sid[11] := ParamSid11;
      end
    else
      begin
        // Fechar apontamento de produção
        ParamSid9.param := 'QTDRE1=' + StringReplace((FloatToStr(QtdRe1)),',','.',[rfReplaceAll, rfIgnoreCase]);
        Sid[9] := ParamSid9;
        ParamSid10.param := 'CODDEP=' + CodDep;
        Sid[10] := ParamSid10;
        ParamSid11.param := 'CODLOT=' + CodLot;
        Sid[11] := ParamSid11;
      end;

    Parameters.Sid := Sid;

    retorno := (fApoOrp.HTTPRIOAcaoSid as sapiens_Synccom_senior_g5_co_ger_sid).Executar(NomUsu,SnhUsu,0,Parameters);

    if retorno.resultado = 'OK' then
      Result := retorno.resultado
    else
      Result := retorno.resultado + ' ' + retorno.erroExecucao;


    Retorno.Free;
    Parameters.Free;

  end;
end.
