// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://vm-teste:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_sid?wsdl
//  >Import : http://vm-teste:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_sid?wsdl>0
//  >Import : http://vm-teste:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_sid?xsd
// Encoding : UTF-8
// Version  : 1.0
// (18/07/2024 14:08:37 - - $Rev: 116709 $)
// ************************************************************************ //

unit uWsAcaoSid;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns;

const
  IS_OPTN = $0001;
  IS_UNBD = $0002;
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

  sidExecutarIn        = class;                 { "http://services.senior.com.br"[GblCplx] }
  sidExecutarOut       = class;                 { "http://services.senior.com.br"[Lit][GblCplx] }
  sidExecutarInSID     = class;                 { "http://services.senior.com.br"[GblCplx] }

  Array_Of_sidExecutarInSID = array of sidExecutarInSID;   { "http://services.senior.com.br"[GblUbnd] }


  // ************************************************************************ //
  // XML       : sidExecutarIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  sidExecutarIn = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FSID: Array_Of_sidExecutarInSID;
    FSID_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetSID(Index: Integer; const AArray_Of_sidExecutarInSID: Array_Of_sidExecutarInSID);
    function  SID_Specified(Index: Integer): boolean;
  public
    destructor Destroy; override;
  published
    property flowInstanceID: string                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string                     Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property SID:            Array_Of_sidExecutarInSID  Index (IS_OPTN or IS_UNBD or IS_NLBL or IS_UNQL) read FSID write SetSID stored SID_Specified;
  end;



  // ************************************************************************ //
  // XML       : sidExecutarOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  sidExecutarOut = class(TRemotable)
  private
    Fresultado: string;
    Fresultado_Specified: boolean;
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    procedure Setresultado(Index: Integer; const Astring: string);
    function  resultado_Specified(Index: Integer): boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property resultado:    string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fresultado write Setresultado stored resultado_Specified;
    property erroExecucao: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
  end;



  // ************************************************************************ //
  // XML       : sidExecutarInSID, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  sidExecutarInSID = class(TRemotable)
  private
    Fparam: string;
    Fparam_Specified: boolean;
    procedure Setparam(Index: Integer; const Astring: string);
    function  param_Specified(Index: Integer): boolean;
  published
    property param: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read Fparam write Setparam stored param_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://services.senior.com.br
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : literal
  // binding   : sapiens_Synccom_senior_g5_co_ger_sidPortBinding
  // service   : g5-senior-services
  // port      : sapiens_Synccom_senior_g5_co_ger_sidPort
  // URL       : http://vm-teste:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_sid
  // ************************************************************************ //
  sapiens_Synccom_senior_g5_co_ger_sid = interface(IInvokable)
  ['{7950402D-FC3C-695F-6B6E-45A4123583A7}']

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  Executar(const user: string; const password: string; const encryption: Integer; const parameters: sidExecutarIn): sidExecutarOut; stdcall;
  end;

function Getsapiens_Synccom_senior_g5_co_ger_sid(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): sapiens_Synccom_senior_g5_co_ger_sid;


implementation
  uses System.SysUtils;

function Getsapiens_Synccom_senior_g5_co_ger_sid(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): sapiens_Synccom_senior_g5_co_ger_sid;
const
  defWSDL = 'http://vm-teste:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_sid?wsdl';
  defURL  = 'http://vm-teste:8080/g5-senior-services/sapiens_Synccom_senior_g5_co_ger_sid';
  defSvc  = 'g5-senior-services';
  defPrt  = 'sapiens_Synccom_senior_g5_co_ger_sidPort';
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
    Result := (RIO as sapiens_Synccom_senior_g5_co_ger_sid);
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


destructor sidExecutarIn.Destroy;
var
  I: Integer;
begin
  for I := 0 to System.Length(FSID)-1 do
    System.SysUtils.FreeAndNil(FSID[I]);
  System.SetLength(FSID, 0);
  inherited Destroy;
end;

procedure sidExecutarIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function sidExecutarIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure sidExecutarIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function sidExecutarIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure sidExecutarIn.SetSID(Index: Integer; const AArray_Of_sidExecutarInSID: Array_Of_sidExecutarInSID);
begin
  FSID := AArray_Of_sidExecutarInSID;
  FSID_Specified := True;
end;

function sidExecutarIn.SID_Specified(Index: Integer): boolean;
begin
  Result := FSID_Specified;
end;

constructor sidExecutarOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure sidExecutarOut.Setresultado(Index: Integer; const Astring: string);
begin
  Fresultado := Astring;
  Fresultado_Specified := True;
end;

function sidExecutarOut.resultado_Specified(Index: Integer): boolean;
begin
  Result := Fresultado_Specified;
end;

procedure sidExecutarOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function sidExecutarOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure sidExecutarInSID.Setparam(Index: Integer; const Astring: string);
begin
  Fparam := Astring;
  Fparam_Specified := True;
end;

function sidExecutarInSID.param_Specified(Index: Integer): boolean;
begin
  Result := Fparam_Specified;
end;

initialization
  { sapiens_Synccom_senior_g5_co_ger_sid }
  InvRegistry.RegisterInterface(TypeInfo(sapiens_Synccom_senior_g5_co_ger_sid), 'http://services.senior.com.br', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(sapiens_Synccom_senior_g5_co_ger_sid), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(sapiens_Synccom_senior_g5_co_ger_sid), ioLiteral);
  { sapiens_Synccom_senior_g5_co_ger_sid.Executar }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_sid), 'Executar', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_Synccom_senior_g5_co_ger_sid), 'Executar', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  RemClassRegistry.RegisterXSInfo(TypeInfo(Array_Of_sidExecutarInSID), 'http://services.senior.com.br', 'Array_Of_sidExecutarInSID');
  RemClassRegistry.RegisterXSClass(sidExecutarIn, 'http://services.senior.com.br', 'sidExecutarIn');
  RemClassRegistry.RegisterXSClass(sidExecutarOut, 'http://services.senior.com.br', 'sidExecutarOut');
  RemClassRegistry.RegisterSerializeOptions(sidExecutarOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(sidExecutarInSID, 'http://services.senior.com.br', 'sidExecutarInSID');

end.