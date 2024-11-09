// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://vm-senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_relatorio?wsdl
//  >Import : http://vm-senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_relatorio?wsdl>0
//  >Import : http://vm-senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_relatorio?xsd=1
// Encoding : UTF-8
// Version  : 1.0
// (11/07/2024 16:49:22 - - $Rev: 116709 $)
// ************************************************************************ //

unit uWsRelatorio;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_NLBL = $0004;
  IS_UNQL = $0008;


type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Embarcadero types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:int             - "http://www.w3.org/2001/XMLSchema"[]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Lit][Gbl]

  relatorioBloquetoFinanceiroIn = class;        { "http://services.senior.com.br"[GblCplx] }
  relatorioExecutarOut = class;                 { "http://services.senior.com.br"[Lit][GblCplx] }
  relatorioExecutarIn  = class;                 { "http://services.senior.com.br"[GblCplx] }
  relatorioBloquetoFinanceiroOut = class;       { "http://services.senior.com.br"[Lit][GblCplx] }



  // ************************************************************************ //
  // XML       : relatorioBloquetoFinanceiroIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  relatorioBloquetoFinanceiroIn = class(TRemotable)
  private
    FcaminhoArq: string;
    FcaminhoArq_Specified: boolean;
    FcodCrt: string;
    FcodCrt_Specified: boolean;
    FcodEmp: string;
    FcodEmp_Specified: boolean;
    FcodFil: string;
    FcodFil_Specified: boolean;
    FcodPor: string;
    FcodPor_Specified: boolean;
    FcodSnf: string;
    FcodSnf_Specified: boolean;
    FcodTpt: string;
    FcodTpt_Specified: boolean;
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    Fformato: string;
    Fformato_Specified: boolean;
    Fimpressora: string;
    Fimpressora_Specified: boolean;
    Fmens01: string;
    Fmens01_Specified: boolean;
    Fmens02: string;
    Fmens02_Specified: boolean;
    Fmens03: string;
    Fmens03_Specified: boolean;
    Fmens04: string;
    Fmens04_Specified: boolean;
    Fmodelo: string;
    Fmodelo_Specified: boolean;
    FnosNum: string;
    FnosNum_Specified: boolean;
    FnumNfv: string;
    FnumNfv_Specified: boolean;
    FnumTit: string;
    FnumTit_Specified: boolean;
    Fqualidade: string;
    Fqualidade_Specified: boolean;
    FwheCla: string;
    FwheCla_Specified: boolean;
    procedure SetcaminhoArq(Index: Integer; const Astring: string);
    function  caminhoArq_Specified(Index: Integer): boolean;
    procedure SetcodCrt(Index: Integer; const Astring: string);
    function  codCrt_Specified(Index: Integer): boolean;
    procedure SetcodEmp(Index: Integer; const Astring: string);
    function  codEmp_Specified(Index: Integer): boolean;
    procedure SetcodFil(Index: Integer; const Astring: string);
    function  codFil_Specified(Index: Integer): boolean;
    procedure SetcodPor(Index: Integer; const Astring: string);
    function  codPor_Specified(Index: Integer): boolean;
    procedure SetcodSnf(Index: Integer; const Astring: string);
    function  codSnf_Specified(Index: Integer): boolean;
    procedure SetcodTpt(Index: Integer; const Astring: string);
    function  codTpt_Specified(Index: Integer): boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure Setformato(Index: Integer; const Astring: string);
    function  formato_Specified(Index: Integer): boolean;
    procedure Setimpressora(Index: Integer; const Astring: string);
    function  impressora_Specified(Index: Integer): boolean;
    procedure Setmens01(Index: Integer; const Astring: string);
    function  mens01_Specified(Index: Integer): boolean;
    procedure Setmens02(Index: Integer; const Astring: string);
    function  mens02_Specified(Index: Integer): boolean;
    procedure Setmens03(Index: Integer; const Astring: string);
    function  mens03_Specified(Index: Integer): boolean;
    procedure Setmens04(Index: Integer; const Astring: string);
    function  mens04_Specified(Index: Integer): boolean;
    procedure Setmodelo(Index: Integer; const Astring: string);
    function  modelo_Specified(Index: Integer): boolean;
    procedure SetnosNum(Index: Integer; const Astring: string);
    function  nosNum_Specified(Index: Integer): boolean;
    procedure SetnumNfv(Index: Integer; const Astring: string);
    function  numNfv_Specified(Index: Integer): boolean;
    procedure SetnumTit(Index: Integer; const Astring: string);
    function  numTit_Specified(Index: Integer): boolean;
    procedure Setqualidade(Index: Integer; const Astring: string);
    function  qualidade_Specified(Index: Integer): boolean;
    procedure SetwheCla(Index: Integer; const Astring: string);
    function  wheCla_Specified(Index: Integer): boolean;
  published
    property caminhoArq:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcaminhoArq write SetcaminhoArq stored caminhoArq_Specified;
    property codCrt:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodCrt write SetcodCrt stored codCrt_Specified;
    property codEmp:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodEmp write SetcodEmp stored codEmp_Specified;
    property codFil:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodFil write SetcodFil stored codFil_Specified;
    property codPor:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodPor write SetcodPor stored codPor_Specified;
    property codSnf:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodSnf write SetcodSnf stored codSnf_Specified;
    property codTpt:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcodTpt write SetcodTpt stored codTpt_Specified;
    property flowInstanceID: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property formato:        string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fformato write Setformato stored formato_Specified;
    property impressora:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fimpressora write Setimpressora stored impressora_Specified;
    property mens01:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fmens01 write Setmens01 stored mens01_Specified;
    property mens02:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fmens02 write Setmens02 stored mens02_Specified;
    property mens03:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fmens03 write Setmens03 stored mens03_Specified;
    property mens04:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fmens04 write Setmens04 stored mens04_Specified;
    property modelo:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fmodelo write Setmodelo stored modelo_Specified;
    property nosNum:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnosNum write SetnosNum stored nosNum_Specified;
    property numNfv:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumNfv write SetnumNfv stored numNfv_Specified;
    property numTit:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FnumTit write SetnumTit stored numTit_Specified;
    property qualidade:      string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fqualidade write Setqualidade stored qualidade_Specified;
    property wheCla:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FwheCla write SetwheCla stored wheCla_Specified;
  end;



  // ************************************************************************ //
  // XML       : relatorioExecutarOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  relatorioExecutarOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FprLOG: string;
    FprLOG_Specified: boolean;
    FprRetorno: string;
    FprRetorno_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetprLOG(Index: Integer; const Astring: string);
    function  prLOG_Specified(Index: Integer): boolean;
    procedure SetprRetorno(Index: Integer; const Astring: string);
    function  prRetorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property erroExecucao: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property prLOG:        string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprLOG write SetprLOG stored prLOG_Specified;
    property prRetorno:    string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprRetorno write SetprRetorno stored prRetorno_Specified;
  end;



  // ************************************************************************ //
  // XML       : relatorioExecutarIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  relatorioExecutarIn = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FprAnexoBool: string;
    FprAnexoBool_Specified: boolean;
    FprAssunto: string;
    FprAssunto_Specified: boolean;
    FprCC: string;
    FprCC_Specified: boolean;
    FprCCo: string;
    FprCCo_Specified: boolean;
    FprDest: string;
    FprDest_Specified: boolean;
    FprDir: string;
    FprDir_Specified: boolean;
    FprEntrada: string;
    FprEntrada_Specified: boolean;
    FprEntranceIsXML: string;
    FprEntranceIsXML_Specified: boolean;
    FprExecFmt: string;
    FprExecFmt_Specified: boolean;
    FprFileExt: string;
    FprFileExt_Specified: boolean;
    FprFileLayout: string;
    FprFileLayout_Specified: boolean;
    FprFileName: string;
    FprFileName_Specified: boolean;
    FprLOG: string;
    FprLOG_Specified: boolean;
    FprLayoutEXCEL: string;
    FprLayoutEXCEL_Specified: boolean;
    FprLayoutSAGA: string;
    FprLayoutSAGA_Specified: boolean;
    FprMensagem: string;
    FprMensagem_Specified: boolean;
    FprOrder: string;
    FprOrder_Specified: boolean;
    FprPrintDest: string;
    FprPrintDest_Specified: boolean;
    FprRelatorio: string;
    FprRelatorio_Specified: boolean;
    FprRemetente: string;
    FprRemetente_Specified: boolean;
    FprRetorno: string;
    FprRetorno_Specified: boolean;
    FprSaveFormat: string;
    FprSaveFormat_Specified: boolean;
    FprTypeBmp: string;
    FprTypeBmp_Specified: boolean;
    FprUniqueFile: string;
    FprUniqueFile_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetprAnexoBool(Index: Integer; const Astring: string);
    function  prAnexoBool_Specified(Index: Integer): boolean;
    procedure SetprAssunto(Index: Integer; const Astring: string);
    function  prAssunto_Specified(Index: Integer): boolean;
    procedure SetprCC(Index: Integer; const Astring: string);
    function  prCC_Specified(Index: Integer): boolean;
    procedure SetprCCo(Index: Integer; const Astring: string);
    function  prCCo_Specified(Index: Integer): boolean;
    procedure SetprDest(Index: Integer; const Astring: string);
    function  prDest_Specified(Index: Integer): boolean;
    procedure SetprDir(Index: Integer; const Astring: string);
    function  prDir_Specified(Index: Integer): boolean;
    procedure SetprEntrada(Index: Integer; const Astring: string);
    function  prEntrada_Specified(Index: Integer): boolean;
    procedure SetprEntranceIsXML(Index: Integer; const Astring: string);
    function  prEntranceIsXML_Specified(Index: Integer): boolean;
    procedure SetprExecFmt(Index: Integer; const Astring: string);
    function  prExecFmt_Specified(Index: Integer): boolean;
    procedure SetprFileExt(Index: Integer; const Astring: string);
    function  prFileExt_Specified(Index: Integer): boolean;
    procedure SetprFileLayout(Index: Integer; const Astring: string);
    function  prFileLayout_Specified(Index: Integer): boolean;
    procedure SetprFileName(Index: Integer; const Astring: string);
    function  prFileName_Specified(Index: Integer): boolean;
    procedure SetprLOG(Index: Integer; const Astring: string);
    function  prLOG_Specified(Index: Integer): boolean;
    procedure SetprLayoutEXCEL(Index: Integer; const Astring: string);
    function  prLayoutEXCEL_Specified(Index: Integer): boolean;
    procedure SetprLayoutSAGA(Index: Integer; const Astring: string);
    function  prLayoutSAGA_Specified(Index: Integer): boolean;
    procedure SetprMensagem(Index: Integer; const Astring: string);
    function  prMensagem_Specified(Index: Integer): boolean;
    procedure SetprOrder(Index: Integer; const Astring: string);
    function  prOrder_Specified(Index: Integer): boolean;
    procedure SetprPrintDest(Index: Integer; const Astring: string);
    function  prPrintDest_Specified(Index: Integer): boolean;
    procedure SetprRelatorio(Index: Integer; const Astring: string);
    function  prRelatorio_Specified(Index: Integer): boolean;
    procedure SetprRemetente(Index: Integer; const Astring: string);
    function  prRemetente_Specified(Index: Integer): boolean;
    procedure SetprRetorno(Index: Integer; const Astring: string);
    function  prRetorno_Specified(Index: Integer): boolean;
    procedure SetprSaveFormat(Index: Integer; const Astring: string);
    function  prSaveFormat_Specified(Index: Integer): boolean;
    procedure SetprTypeBmp(Index: Integer; const Astring: string);
    function  prTypeBmp_Specified(Index: Integer): boolean;
    procedure SetprUniqueFile(Index: Integer; const Astring: string);
    function  prUniqueFile_Specified(Index: Integer): boolean;
  published
    property flowInstanceID:  string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:        string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property prAnexoBool:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprAnexoBool write SetprAnexoBool stored prAnexoBool_Specified;
    property prAssunto:       string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprAssunto write SetprAssunto stored prAssunto_Specified;
    property prCC:            string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprCC write SetprCC stored prCC_Specified;
    property prCCo:           string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprCCo write SetprCCo stored prCCo_Specified;
    property prDest:          string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprDest write SetprDest stored prDest_Specified;
    property prDir:           string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprDir write SetprDir stored prDir_Specified;
    property prEntrada:       string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprEntrada write SetprEntrada stored prEntrada_Specified;
    property prEntranceIsXML: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprEntranceIsXML write SetprEntranceIsXML stored prEntranceIsXML_Specified;
    property prExecFmt:       string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprExecFmt write SetprExecFmt stored prExecFmt_Specified;
    property prFileExt:       string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprFileExt write SetprFileExt stored prFileExt_Specified;
    property prFileLayout:    string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprFileLayout write SetprFileLayout stored prFileLayout_Specified;
    property prFileName:      string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprFileName write SetprFileName stored prFileName_Specified;
    property prLOG:           string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprLOG write SetprLOG stored prLOG_Specified;
    property prLayoutEXCEL:   string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprLayoutEXCEL write SetprLayoutEXCEL stored prLayoutEXCEL_Specified;
    property prLayoutSAGA:    string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprLayoutSAGA write SetprLayoutSAGA stored prLayoutSAGA_Specified;
    property prMensagem:      string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprMensagem write SetprMensagem stored prMensagem_Specified;
    property prOrder:         string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprOrder write SetprOrder stored prOrder_Specified;
    property prPrintDest:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprPrintDest write SetprPrintDest stored prPrintDest_Specified;
    property prRelatorio:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprRelatorio write SetprRelatorio stored prRelatorio_Specified;
    property prRemetente:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprRemetente write SetprRemetente stored prRemetente_Specified;
    property prRetorno:       string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprRetorno write SetprRetorno stored prRetorno_Specified;
    property prSaveFormat:    string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprSaveFormat write SetprSaveFormat stored prSaveFormat_Specified;
    property prTypeBmp:       string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprTypeBmp write SetprTypeBmp stored prTypeBmp_Specified;
    property prUniqueFile:    string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FprUniqueFile write SetprUniqueFile stored prUniqueFile_Specified;
  end;



  // ************************************************************************ //
  // XML       : relatorioBloquetoFinanceiroOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  relatorioBloquetoFinanceiroOut = class(TRemotable)
  private
    Farquivo: string;
    Farquivo_Specified: boolean;
    FcaminhoArq: string;
    FcaminhoArq_Specified: boolean;
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    Fretorno: string;
    Fretorno_Specified: boolean;
    procedure Setarquivo(Index: Integer; const Astring: string);
    function  arquivo_Specified(Index: Integer): boolean;
    procedure SetcaminhoArq(Index: Integer; const Astring: string);
    function  caminhoArq_Specified(Index: Integer): boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure Setretorno(Index: Integer; const Astring: string);
    function  retorno_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property arquivo:      string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Farquivo write Setarquivo stored arquivo_Specified;
    property caminhoArq:   string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FcaminhoArq write SetcaminhoArq stored caminhoArq_Specified;
    property erroExecucao: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property retorno:      string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fretorno write Setretorno stored retorno_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://services.senior.com.br
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : literal
  // binding   : sapiens_Synccom_senior_g5_co_ger_relatorioPortBinding
  // service   : g5-senior-services
  // port      : sapiens_Synccom_senior_g5_co_ger_relatorioPort
  // URL       : http://vm-senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_relatorio
  // ************************************************************************ //
  sapiens_Synccom_senior_g5_co_ger_relatorio = interface(IInvokable)
  ['{7B5BA4AF-616D-5334-CFE6-C818F15A4BC6}']

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  BloquetoFinanceiro(const user: string; const password: string; const encryption: Integer; const parameters: relatorioBloquetoFinanceiroIn): relatorioBloquetoFinanceiroOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  Executar(const user: string; const password: string; const encryption: Integer; const parameters: relatorioExecutarIn): relatorioExecutarOut; stdcall;
  end;

function Getsapiens_Synccom_senior_g5_co_ger_relatorio(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): sapiens_Synccom_senior_g5_co_ger_relatorio;


implementation
  uses System.SysUtils;

function Getsapiens_Synccom_senior_g5_co_ger_relatorio(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): sapiens_Synccom_senior_g5_co_ger_relatorio;
const
  defWSDL = 'http://vm-senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_relatorio?wsdl';
  defURL  = 'http://vm-senior:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_relatorio';
  defSvc  = 'g5-senior-services';
  defPrt  = 'sapiens_Synccom_senior_g5_co_ger_relatorioPort';
var
  RIO: THTTPRIO;
begin
  Result := nil;
  if (Addr = '') then
  begin
    if UseWSDL then
      Addr := defWSDL
    else
      Addr := defURL;
  end;
  if HTTPRIO = nil then
    RIO := THTTPRIO.Create(nil)
  else
    RIO := HTTPRIO;
  try
    Result := (RIO as sapiens_Synccom_senior_g5_co_ger_relatorio);
    if UseWSDL then
    begin
      RIO.WSDLLocation := Addr;
      RIO.Service := defSvc;
      RIO.Port := defPrt;
    end else
      RIO.URL := Addr;
  finally
    if (Result = nil) and (HTTPRIO = nil) then
      RIO.Free;
  end;
end;


procedure relatorioBloquetoFinanceiroIn.SetcaminhoArq(Index: Integer; const Astring: string);
begin
  FcaminhoArq := Astring;
  FcaminhoArq_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.caminhoArq_Specified(Index: Integer): boolean;
begin
  Result := FcaminhoArq_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.SetcodCrt(Index: Integer; const Astring: string);
begin
  FcodCrt := Astring;
  FcodCrt_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.codCrt_Specified(Index: Integer): boolean;
begin
  Result := FcodCrt_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.SetcodEmp(Index: Integer; const Astring: string);
begin
  FcodEmp := Astring;
  FcodEmp_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.codEmp_Specified(Index: Integer): boolean;
begin
  Result := FcodEmp_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.SetcodFil(Index: Integer; const Astring: string);
begin
  FcodFil := Astring;
  FcodFil_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.codFil_Specified(Index: Integer): boolean;
begin
  Result := FcodFil_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.SetcodPor(Index: Integer; const Astring: string);
begin
  FcodPor := Astring;
  FcodPor_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.codPor_Specified(Index: Integer): boolean;
begin
  Result := FcodPor_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.SetcodSnf(Index: Integer; const Astring: string);
begin
  FcodSnf := Astring;
  FcodSnf_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.codSnf_Specified(Index: Integer): boolean;
begin
  Result := FcodSnf_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.SetcodTpt(Index: Integer; const Astring: string);
begin
  FcodTpt := Astring;
  FcodTpt_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.codTpt_Specified(Index: Integer): boolean;
begin
  Result := FcodTpt_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.Setformato(Index: Integer; const Astring: string);
begin
  Fformato := Astring;
  Fformato_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.formato_Specified(Index: Integer): boolean;
begin
  Result := Fformato_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.Setimpressora(Index: Integer; const Astring: string);
begin
  Fimpressora := Astring;
  Fimpressora_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.impressora_Specified(Index: Integer): boolean;
begin
  Result := Fimpressora_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.Setmens01(Index: Integer; const Astring: string);
begin
  Fmens01 := Astring;
  Fmens01_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.mens01_Specified(Index: Integer): boolean;
begin
  Result := Fmens01_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.Setmens02(Index: Integer; const Astring: string);
begin
  Fmens02 := Astring;
  Fmens02_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.mens02_Specified(Index: Integer): boolean;
begin
  Result := Fmens02_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.Setmens03(Index: Integer; const Astring: string);
begin
  Fmens03 := Astring;
  Fmens03_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.mens03_Specified(Index: Integer): boolean;
begin
  Result := Fmens03_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.Setmens04(Index: Integer; const Astring: string);
begin
  Fmens04 := Astring;
  Fmens04_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.mens04_Specified(Index: Integer): boolean;
begin
  Result := Fmens04_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.Setmodelo(Index: Integer; const Astring: string);
begin
  Fmodelo := Astring;
  Fmodelo_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.modelo_Specified(Index: Integer): boolean;
begin
  Result := Fmodelo_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.SetnosNum(Index: Integer; const Astring: string);
begin
  FnosNum := Astring;
  FnosNum_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.nosNum_Specified(Index: Integer): boolean;
begin
  Result := FnosNum_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.SetnumNfv(Index: Integer; const Astring: string);
begin
  FnumNfv := Astring;
  FnumNfv_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.numNfv_Specified(Index: Integer): boolean;
begin
  Result := FnumNfv_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.SetnumTit(Index: Integer; const Astring: string);
begin
  FnumTit := Astring;
  FnumTit_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.numTit_Specified(Index: Integer): boolean;
begin
  Result := FnumTit_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.Setqualidade(Index: Integer; const Astring: string);
begin
  Fqualidade := Astring;
  Fqualidade_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.qualidade_Specified(Index: Integer): boolean;
begin
  Result := Fqualidade_Specified;
end;

procedure relatorioBloquetoFinanceiroIn.SetwheCla(Index: Integer; const Astring: string);
begin
  FwheCla := Astring;
  FwheCla_Specified := True;
end;

function relatorioBloquetoFinanceiroIn.wheCla_Specified(Index: Integer): boolean;
begin
  Result := FwheCla_Specified;
end;

constructor relatorioExecutarOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure relatorioExecutarOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function relatorioExecutarOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure relatorioExecutarOut.SetprLOG(Index: Integer; const Astring: string);
begin
  FprLOG := Astring;
  FprLOG_Specified := True;
end;

function relatorioExecutarOut.prLOG_Specified(Index: Integer): boolean;
begin
  Result := FprLOG_Specified;
end;

procedure relatorioExecutarOut.SetprRetorno(Index: Integer; const Astring: string);
begin
  FprRetorno := Astring;
  FprRetorno_Specified := True;
end;

function relatorioExecutarOut.prRetorno_Specified(Index: Integer): boolean;
begin
  Result := FprRetorno_Specified;
end;

procedure relatorioExecutarIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function relatorioExecutarIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure relatorioExecutarIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function relatorioExecutarIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure relatorioExecutarIn.SetprAnexoBool(Index: Integer; const Astring: string);
begin
  FprAnexoBool := Astring;
  FprAnexoBool_Specified := True;
end;

function relatorioExecutarIn.prAnexoBool_Specified(Index: Integer): boolean;
begin
  Result := FprAnexoBool_Specified;
end;

procedure relatorioExecutarIn.SetprAssunto(Index: Integer; const Astring: string);
begin
  FprAssunto := Astring;
  FprAssunto_Specified := True;
end;

function relatorioExecutarIn.prAssunto_Specified(Index: Integer): boolean;
begin
  Result := FprAssunto_Specified;
end;

procedure relatorioExecutarIn.SetprCC(Index: Integer; const Astring: string);
begin
  FprCC := Astring;
  FprCC_Specified := True;
end;

function relatorioExecutarIn.prCC_Specified(Index: Integer): boolean;
begin
  Result := FprCC_Specified;
end;

procedure relatorioExecutarIn.SetprCCo(Index: Integer; const Astring: string);
begin
  FprCCo := Astring;
  FprCCo_Specified := True;
end;

function relatorioExecutarIn.prCCo_Specified(Index: Integer): boolean;
begin
  Result := FprCCo_Specified;
end;

procedure relatorioExecutarIn.SetprDest(Index: Integer; const Astring: string);
begin
  FprDest := Astring;
  FprDest_Specified := True;
end;

function relatorioExecutarIn.prDest_Specified(Index: Integer): boolean;
begin
  Result := FprDest_Specified;
end;

procedure relatorioExecutarIn.SetprDir(Index: Integer; const Astring: string);
begin
  FprDir := Astring;
  FprDir_Specified := True;
end;

function relatorioExecutarIn.prDir_Specified(Index: Integer): boolean;
begin
  Result := FprDir_Specified;
end;

procedure relatorioExecutarIn.SetprEntrada(Index: Integer; const Astring: string);
begin
  FprEntrada := Astring;
  FprEntrada_Specified := True;
end;

function relatorioExecutarIn.prEntrada_Specified(Index: Integer): boolean;
begin
  Result := FprEntrada_Specified;
end;

procedure relatorioExecutarIn.SetprEntranceIsXML(Index: Integer; const Astring: string);
begin
  FprEntranceIsXML := Astring;
  FprEntranceIsXML_Specified := True;
end;

function relatorioExecutarIn.prEntranceIsXML_Specified(Index: Integer): boolean;
begin
  Result := FprEntranceIsXML_Specified;
end;

procedure relatorioExecutarIn.SetprExecFmt(Index: Integer; const Astring: string);
begin
  FprExecFmt := Astring;
  FprExecFmt_Specified := True;
end;

function relatorioExecutarIn.prExecFmt_Specified(Index: Integer): boolean;
begin
  Result := FprExecFmt_Specified;
end;

procedure relatorioExecutarIn.SetprFileExt(Index: Integer; const Astring: string);
begin
  FprFileExt := Astring;
  FprFileExt_Specified := True;
end;

function relatorioExecutarIn.prFileExt_Specified(Index: Integer): boolean;
begin
  Result := FprFileExt_Specified;
end;

procedure relatorioExecutarIn.SetprFileLayout(Index: Integer; const Astring: string);
begin
  FprFileLayout := Astring;
  FprFileLayout_Specified := True;
end;

function relatorioExecutarIn.prFileLayout_Specified(Index: Integer): boolean;
begin
  Result := FprFileLayout_Specified;
end;

procedure relatorioExecutarIn.SetprFileName(Index: Integer; const Astring: string);
begin
  FprFileName := Astring;
  FprFileName_Specified := True;
end;

function relatorioExecutarIn.prFileName_Specified(Index: Integer): boolean;
begin
  Result := FprFileName_Specified;
end;

procedure relatorioExecutarIn.SetprLOG(Index: Integer; const Astring: string);
begin
  FprLOG := Astring;
  FprLOG_Specified := True;
end;

function relatorioExecutarIn.prLOG_Specified(Index: Integer): boolean;
begin
  Result := FprLOG_Specified;
end;

procedure relatorioExecutarIn.SetprLayoutEXCEL(Index: Integer; const Astring: string);
begin
  FprLayoutEXCEL := Astring;
  FprLayoutEXCEL_Specified := True;
end;

function relatorioExecutarIn.prLayoutEXCEL_Specified(Index: Integer): boolean;
begin
  Result := FprLayoutEXCEL_Specified;
end;

procedure relatorioExecutarIn.SetprLayoutSAGA(Index: Integer; const Astring: string);
begin
  FprLayoutSAGA := Astring;
  FprLayoutSAGA_Specified := True;
end;

function relatorioExecutarIn.prLayoutSAGA_Specified(Index: Integer): boolean;
begin
  Result := FprLayoutSAGA_Specified;
end;

procedure relatorioExecutarIn.SetprMensagem(Index: Integer; const Astring: string);
begin
  FprMensagem := Astring;
  FprMensagem_Specified := True;
end;

function relatorioExecutarIn.prMensagem_Specified(Index: Integer): boolean;
begin
  Result := FprMensagem_Specified;
end;

procedure relatorioExecutarIn.SetprOrder(Index: Integer; const Astring: string);
begin
  FprOrder := Astring;
  FprOrder_Specified := True;
end;

function relatorioExecutarIn.prOrder_Specified(Index: Integer): boolean;
begin
  Result := FprOrder_Specified;
end;

procedure relatorioExecutarIn.SetprPrintDest(Index: Integer; const Astring: string);
begin
  FprPrintDest := Astring;
  FprPrintDest_Specified := True;
end;

function relatorioExecutarIn.prPrintDest_Specified(Index: Integer): boolean;
begin
  Result := FprPrintDest_Specified;
end;

procedure relatorioExecutarIn.SetprRelatorio(Index: Integer; const Astring: string);
begin
  FprRelatorio := Astring;
  FprRelatorio_Specified := True;
end;

function relatorioExecutarIn.prRelatorio_Specified(Index: Integer): boolean;
begin
  Result := FprRelatorio_Specified;
end;

procedure relatorioExecutarIn.SetprRemetente(Index: Integer; const Astring: string);
begin
  FprRemetente := Astring;
  FprRemetente_Specified := True;
end;

function relatorioExecutarIn.prRemetente_Specified(Index: Integer): boolean;
begin
  Result := FprRemetente_Specified;
end;

procedure relatorioExecutarIn.SetprRetorno(Index: Integer; const Astring: string);
begin
  FprRetorno := Astring;
  FprRetorno_Specified := True;
end;

function relatorioExecutarIn.prRetorno_Specified(Index: Integer): boolean;
begin
  Result := FprRetorno_Specified;
end;

procedure relatorioExecutarIn.SetprSaveFormat(Index: Integer; const Astring: string);
begin
  FprSaveFormat := Astring;
  FprSaveFormat_Specified := True;
end;

function relatorioExecutarIn.prSaveFormat_Specified(Index: Integer): boolean;
begin
  Result := FprSaveFormat_Specified;
end;

procedure relatorioExecutarIn.SetprTypeBmp(Index: Integer; const Astring: string);
begin
  FprTypeBmp := Astring;
  FprTypeBmp_Specified := True;
end;

function relatorioExecutarIn.prTypeBmp_Specified(Index: Integer): boolean;
begin
  Result := FprTypeBmp_Specified;
end;

procedure relatorioExecutarIn.SetprUniqueFile(Index: Integer; const Astring: string);
begin
  FprUniqueFile := Astring;
  FprUniqueFile_Specified := True;
end;

function relatorioExecutarIn.prUniqueFile_Specified(Index: Integer): boolean;
begin
  Result := FprUniqueFile_Specified;
end;

constructor relatorioBloquetoFinanceiroOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure relatorioBloquetoFinanceiroOut.Setarquivo(Index: Integer; const Astring: string);
begin
  Farquivo := Astring;
  Farquivo_Specified := True;
end;

function relatorioBloquetoFinanceiroOut.arquivo_Specified(Index: Integer): boolean;
begin
  Result := Farquivo_Specified;
end;

procedure relatorioBloquetoFinanceiroOut.SetcaminhoArq(Index: Integer; const Astring: string);
begin
  FcaminhoArq := Astring;
  FcaminhoArq_Specified := True;
end;

function relatorioBloquetoFinanceiroOut.caminhoArq_Specified(Index: Integer): boolean;
begin
  Result := FcaminhoArq_Specified;
end;

procedure relatorioBloquetoFinanceiroOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function relatorioBloquetoFinanceiroOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure relatorioBloquetoFinanceiroOut.Setretorno(Index: Integer; const Astring: string);
begin
  Fretorno := Astring;
  Fretorno_Specified := True;
end;

function relatorioBloquetoFinanceiroOut.retorno_Specified(Index: Integer): boolean;
begin
  Result := Fretorno_Specified;
end;

initialization
  { sapiens_Synccom_senior_g5_co_ger_relatorio }
  InvRegistry.RegisterInterface(TypeInfo(sapiens_Synccom_senior_g5_co_ger_relatorio), 'http://services.senior.com.br', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(sapiens_Synccom_senior_g5_co_ger_relatorio), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(sapiens_Synccom_senior_g5_co_ger_relatorio), ioLiteral);
  { sapiens_Synccom_senior_g5_co_ger_relatorio.BloquetoFinanceiro }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_relatorio), 'BloquetoFinanceiro', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_relatorio), 'BloquetoFinanceiro', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_Synccom_senior_g5_co_ger_relatorio.Executar }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_relatorio), 'Executar', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_relatorio), 'Executar', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  RemClassRegistry.RegisterXSClass(relatorioBloquetoFinanceiroIn, 'http://services.senior.com.br', 'relatorioBloquetoFinanceiroIn');
  RemClassRegistry.RegisterXSClass(relatorioExecutarOut, 'http://services.senior.com.br', 'relatorioExecutarOut');
  RemClassRegistry.RegisterSerializeOptions(relatorioExecutarOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(relatorioExecutarIn, 'http://services.senior.com.br', 'relatorioExecutarIn');
  RemClassRegistry.RegisterXSClass(relatorioBloquetoFinanceiroOut, 'http://services.senior.com.br', 'relatorioBloquetoFinanceiroOut');
  RemClassRegistry.RegisterSerializeOptions(relatorioBloquetoFinanceiroOut, [xoLiteralParam]);

end.