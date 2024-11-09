unit uEstCmp;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Soap.InvokeRegistry,
  System.Net.URLClient, Soap.Rio, Soap.SOAPHTTPClient, uwsEstCmp, uDM;

type
  TfEstCmp = class(TForm)
    HTTPRIOwsEstCmp: THTTPRIO;
  private
    { Private declarations }
  public
    { Public declarations }
    function EstornaCoponente(CodOri:String;NumOrp:Integer;CodEtg:Integer;CodCmp,DerCmp:String;QtdEst:Double):String;
  end;

var
  fEstCmp: TfEstCmp;

implementation

{$R *.dfm}

{ TfEstCmp }

function TfEstCmp.EstornaCoponente(CodOri: String; NumOrp, CodEtg: Integer;
  CodCmp, DerCmp: String; QtdEst: Double): String;
var
  parameters: estornacomponenteestornacomponenteIn;
  retorno : estornacomponenteestornacomponenteOut;
  NomUsu, SnhUsu : String;

begin

  NomUsu := dm.cdsConfiguracao.FieldByName('NomUsu').AsString;
  SnhUsu := dm.cdsConfiguracao.FieldByName('SnhUsu').AsString;
  parameters := estornacomponenteestornacomponenteIn.Create;
  retorno    := estornacomponenteestornacomponenteOut.Create;

  parameters.codOri := CodOri;
  parameters.numOrp := NumOrp;
  parameters.codEtg := CodEtg;
  parameters.codCmp := CodCmp;
  parameters.derCmp := DerCmp;
  parameters.qtdEst := QtdEst;

  retorno := (fEstCmp.HTTPRIOwsEstCmp as  sapiens_Synccom_senior_g5_co_mpr_cha_estornacomponente).estornacomponente(NomUsu,SnhUsu,0,Parameters);

  if retorno.retorno = 'OK' then
    Result := retorno.retorno
  else
    Result := retorno.erroExecucao;

  Retorno.Free;
  Parameters.Free;

end;

end.
