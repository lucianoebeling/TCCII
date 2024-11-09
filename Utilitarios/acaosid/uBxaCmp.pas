unit uBxaCmp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uDM, uWsAcaoSid, Soap.InvokeRegistry,
  System.Net.URLClient, Soap.Rio, Soap.SOAPHTTPClient;

type
  TfBxaCmp = class(TForm)
    HTTPRIOAcaoSid: THTTPRIO;
  private
    { Private declarations }
  public
    { Public declarations }
    Function BaixarCmp(CodOri:String;NumOrp:Integer;CodEtg:String;CodCmp:String;DerCmp:String;QtdUti:Double;CodDep:String;CodLot:String): String;
  end;

var
  fBxaCmp: TfBxaCmp;

implementation

{$R *.dfm}

Function TfBxaCmp.BaixarCmp(CodOri:String;NumOrp:Integer;CodEtg:String;CodCmp:String;DerCmp:String;QtdUti:Double;CodDep:String;CodLot:String): String;
  var
    Retorno    :sidExecutarOut;
    Parameters :sidExecutarIn;
    Sid        : Array_Of_sidExecutarInSID;

    ParamSid0, ParamSid1, ParamSid2, ParamSid3, ParamSid4, ParamSid5,
    ParamSid6, ParamSid7, ParamSid8 : sidExecutarInSID;

    NomUsu, SnhUsu  : String;

  begin

     // SID.Prd.BaixarComponentes (MPMO) - Baixar Componentes Da OP/OS

    // CodOri	Código da origem
    // NumOrp	Número da O.P./O.S.
    // CodEtg	Código do estágio
    // CodCmp	Código do componente
    // CodDer	Código da derivação do componente
    // QtdUti	Quantidade a utilizar (quantidade a baixar)
    // CodLot	Código do lote do componente
    // DatMov	Data do movimento

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

    SetLength(Sid,9);

    NomUsu := dm.cdsConfiguracao.FieldByName('NomUsu').AsString;
    SnhUsu := dm.cdsConfiguracao.FieldByName('SnhUsu').AsString;

    ParamSid0.Param := 'acao=SID.Prd.BaixarComponentes';
    Sid[0] := ParamSid0;
    ParamSid1.Param := 'CODORI=' + CodOri;
    Sid[1] := ParamSid1;
    ParamSid2.Param := 'NUMORP=' + IntToStr(NumOrp);
    Sid[2] := ParamSid2;
    ParamSid3.Param := 'CODETG=' + CodEtg;
    Sid[3] := ParamSid3;
    ParamSid4.Param := 'CODCMP=' + CodCmp;
    Sid[4] := ParamSid4;
    ParamSid5.Param := 'CODDER=' + DerCmp;
    Sid[5] := ParamSid5;
    ParamSid6.Param := 'QTDUTI=' + StringReplace((FloatToStr(QtdUti)),',','.',[rfReplaceAll, rfIgnoreCase]);
    Sid[6] := ParamSid6;
    ParamSid7.Param := 'CODDEP=' + CodDep;
    Sid[7] := ParamSid7;
    ParamSid8.Param := 'CODLOT=' + CodLot;
    Sid[8] := ParamSid8;

    Parameters.Sid := Sid;

    retorno := (fBxaCmp.HTTPRIOAcaoSid as sapiens_Synccom_senior_g5_co_ger_sid).Executar(NomUsu,SnhUsu,0,Parameters);

    if retorno.resultado = 'OK' then
      Result := retorno.resultado
    else
      Result := retorno.resultado + ' ' + retorno.erroExecucao;

    Retorno.Free;
    Parameters.Free;
   end;
end.
