unit uWsrErl;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Soap.InvokeRegistry,
  System.Net.URLClient, Soap.Rio, Soap.SOAPHTTPClient, uWsRelatorio, uDM;

type
  TfWsrErl = class(TForm)
    HTTPRIOExeRel: THTTPRIO;
  private
    { Private declarations }
  public
    { Public declarations }
    function ImprimirRelatorio(Printer,NomeRelatorio,Parametros:String): String;
  end;

var
  fWsrErl: TfWsrErl;

implementation

{$R *.dfm}

{ TfWsrErl }

function TfWsrErl.ImprimirRelatorio(Printer,NomeRelatorio,Parametros:String): String;
Var
  QtdEti : Integer;
  QtdPro : Double;

  NomUsu, SnhUsu : String;
  RelExeOut : relatorioExecutarOut;
  parameters: relatorioExecutarIn;

begin
  NomUsu := dm.cdsConfiguracao.FieldByName('NomUsu').AsString;
  SnhUsu := dm.cdsConfiguracao.FieldByName('SnhUsu').AsString;

  RelExeOut  := relatorioExecutarOut.Create;
  parameters := relatorioExecutarIn.Create;

  parameters.prEntrada   := Parametros;
  parameters.prPrintDest := Printer;
  parameters.prEntranceIsXML := 'F';
  parameters.prExecFmt := 'tefPrint';
  parameters.prRelatorio := NomeRelatorio;

  RelExeOut := (HTTPRIOExeRel as sapiens_Synccom_senior_g5_co_ger_relatorio).Executar(NomUsu,SnhUsu,0,parameters);

  if RelExeOut.prRetorno <> '' then
    begin
      Result := RelExeOut.prRetorno;
    end
  else
    begin
      Result := 'OK';
    end;
end;

end.
