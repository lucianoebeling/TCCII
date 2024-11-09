// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : http://vm-senior:8080/g5-senior-services/sapiens_SyncMCWFUsers?wsdl
//  >Import : http://vm-senior:8080/g5-senior-services/sapiens_SyncMCWFUsers?wsdl>0
//  >Import : http://vm-senior:8080/g5-senior-services/sapiens_SyncMCWFUsers?xsd=1
// Encoding : UTF-8
// Version  : 1.0
// (13/05/2024 15:44:48 - - $Rev: 116709 $)
// ************************************************************************ //

unit uWsUsers;

interface

uses Soap.InvokeRegistry, Soap.SOAPHTTPClient, System.Types, Soap.XSBuiltIns, udm;

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
  // !:int             - "http://www.w3.org/2001/XMLSchema"[Gbl]
  // !:string          - "http://www.w3.org/2001/XMLSchema"[Lit][Gbl]

  mcwfUsersGetPersonKindOut = class;            { "http://services.senior.com.br"[Lit][GblCplx] }
  mcwfUsersChangePasswordIn = class;            { "http://services.senior.com.br"[GblCplx] }
  mcwfUsersUserReplicationIn = class;           { "http://services.senior.com.br"[GblCplx] }
  mcwfUsersUserReplicationOut = class;          { "http://services.senior.com.br"[Lit][GblCplx] }
  mcwfUsersDiscoverUsersGroupsIn = class;       { "http://services.senior.com.br"[GblCplx] }
  mcwfUsersDiscoverUsersGroupsOut = class;      { "http://services.senior.com.br"[Lit][GblCplx] }
  mcwfUsersPersonExistsOut = class;             { "http://services.senior.com.br"[Lit][GblCplx] }
  mcwfUsersAuthenticateJAASIn = class;          { "http://services.senior.com.br"[GblCplx] }
  mcwfUsersAuthenticateJAASOut = class;         { "http://services.senior.com.br"[Lit][GblCplx] }
  mcwfUsersGetPersonKindIn = class;             { "http://services.senior.com.br"[GblCplx] }
  mcwfUsersPersonExistsIn = class;              { "http://services.senior.com.br"[GblCplx] }
  mcwfUsersGetUserGroupsOut = class;            { "http://services.senior.com.br"[Lit][GblCplx] }
  mcwfUsersGetUserGroupsIn = class;             { "http://services.senior.com.br"[GblCplx] }
  mcwfUsersChangePasswordOut = class;           { "http://services.senior.com.br"[Lit][GblCplx] }



  // ************************************************************************ //
  // XML       : mcwfUsersGetPersonKindOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  mcwfUsersGetPersonKindOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FpmPersonKind: string;
    FpmPersonKind_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetpmPersonKind(Index: Integer; const Astring: string);
    function  pmPersonKind_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property erroExecucao: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property pmPersonKind: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpmPersonKind write SetpmPersonKind stored pmPersonKind_Specified;
  end;



  // ************************************************************************ //
  // XML       : mcwfUsersChangePasswordIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  mcwfUsersChangePasswordIn = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FpmNewPassword: string;
    FpmNewPassword_Specified: boolean;
    FpmNewPasswordConfirmation: string;
    FpmNewPasswordConfirmation_Specified: boolean;
    FpmPassword: string;
    FpmPassword_Specified: boolean;
    FpmUser: string;
    FpmUser_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetpmNewPassword(Index: Integer; const Astring: string);
    function  pmNewPassword_Specified(Index: Integer): boolean;
    procedure SetpmNewPasswordConfirmation(Index: Integer; const Astring: string);
    function  pmNewPasswordConfirmation_Specified(Index: Integer): boolean;
    procedure SetpmPassword(Index: Integer; const Astring: string);
    function  pmPassword_Specified(Index: Integer): boolean;
    procedure SetpmUser(Index: Integer; const Astring: string);
    function  pmUser_Specified(Index: Integer): boolean;
  published
    property flowInstanceID:            string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:                  string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property pmNewPassword:             string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpmNewPassword write SetpmNewPassword stored pmNewPassword_Specified;
    property pmNewPasswordConfirmation: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpmNewPasswordConfirmation write SetpmNewPasswordConfirmation stored pmNewPasswordConfirmation_Specified;
    property pmPassword:                string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpmPassword write SetpmPassword stored pmPassword_Specified;
    property pmUser:                    string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpmUser write SetpmUser stored pmUser_Specified;
  end;



  // ************************************************************************ //
  // XML       : mcwfUsersUserReplicationIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  mcwfUsersUserReplicationIn = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FpmUserReplicationXML: string;
    FpmUserReplicationXML_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetpmUserReplicationXML(Index: Integer; const Astring: string);
    function  pmUserReplicationXML_Specified(Index: Integer): boolean;
  published
    property flowInstanceID:       string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:             string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property pmUserReplicationXML: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpmUserReplicationXML write SetpmUserReplicationXML stored pmUserReplicationXML_Specified;
  end;



  // ************************************************************************ //
  // XML       : mcwfUsersUserReplicationOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  mcwfUsersUserReplicationOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property erroExecucao: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
  end;



  // ************************************************************************ //
  // XML       : mcwfUsersDiscoverUsersGroupsIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  mcwfUsersDiscoverUsersGroupsIn = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
  published
    property flowInstanceID: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
  end;



  // ************************************************************************ //
  // XML       : mcwfUsersDiscoverUsersGroupsOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  mcwfUsersDiscoverUsersGroupsOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FpmReturn: string;
    FpmReturn_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetpmReturn(Index: Integer; const Astring: string);
    function  pmReturn_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property erroExecucao: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property pmReturn:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpmReturn write SetpmReturn stored pmReturn_Specified;
  end;



  // ************************************************************************ //
  // XML       : mcwfUsersPersonExistsOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  mcwfUsersPersonExistsOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FpmPersonExists: string;
    FpmPersonExists_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetpmPersonExists(Index: Integer; const Astring: string);
    function  pmPersonExists_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property erroExecucao:   string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property pmPersonExists: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpmPersonExists write SetpmPersonExists stored pmPersonExists_Specified;
  end;



  // ************************************************************************ //
  // XML       : mcwfUsersAuthenticateJAASIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  mcwfUsersAuthenticateJAASIn = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FpmEncrypted: Integer;
    FpmEncrypted_Specified: boolean;
    FpmUserName: string;
    FpmUserName_Specified: boolean;
    FpmUserPassword: string;
    FpmUserPassword_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetpmEncrypted(Index: Integer; const AInteger: Integer);
    function  pmEncrypted_Specified(Index: Integer): boolean;
    procedure SetpmUserName(Index: Integer; const Astring: string);
    function  pmUserName_Specified(Index: Integer): boolean;
    procedure SetpmUserPassword(Index: Integer; const Astring: string);
    function  pmUserPassword_Specified(Index: Integer): boolean;
  published
    property flowInstanceID: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property pmEncrypted:    Integer  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpmEncrypted write SetpmEncrypted stored pmEncrypted_Specified;
    property pmUserName:     string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpmUserName write SetpmUserName stored pmUserName_Specified;
    property pmUserPassword: string   Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpmUserPassword write SetpmUserPassword stored pmUserPassword_Specified;
  end;



  // ************************************************************************ //
  // XML       : mcwfUsersAuthenticateJAASOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  mcwfUsersAuthenticateJAASOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FpmLogged: string;
    FpmLogged_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetpmLogged(Index: Integer; const Astring: string);
    function  pmLogged_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property erroExecucao: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property pmLogged:     string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpmLogged write SetpmLogged stored pmLogged_Specified;
  end;



  // ************************************************************************ //
  // XML       : mcwfUsersGetPersonKindIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  mcwfUsersGetPersonKindIn = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FpmPersonName: string;
    FpmPersonName_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetpmPersonName(Index: Integer; const Astring: string);
    function  pmPersonName_Specified(Index: Integer): boolean;
  published
    property flowInstanceID: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property pmPersonName:   string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpmPersonName write SetpmPersonName stored pmPersonName_Specified;
  end;



  // ************************************************************************ //
  // XML       : mcwfUsersPersonExistsIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  mcwfUsersPersonExistsIn = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FpmPersonKind: string;
    FpmPersonKind_Specified: boolean;
    FpmPersonName: string;
    FpmPersonName_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetpmPersonKind(Index: Integer; const Astring: string);
    function  pmPersonKind_Specified(Index: Integer): boolean;
    procedure SetpmPersonName(Index: Integer; const Astring: string);
    function  pmPersonName_Specified(Index: Integer): boolean;
  published
    property flowInstanceID: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:       string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property pmPersonKind:   string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpmPersonKind write SetpmPersonKind stored pmPersonKind_Specified;
    property pmPersonName:   string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpmPersonName write SetpmPersonName stored pmPersonName_Specified;
  end;



  // ************************************************************************ //
  // XML       : mcwfUsersGetUserGroupsOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  mcwfUsersGetUserGroupsOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    FpmGetUserGroupsResult: string;
    FpmGetUserGroupsResult_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
    procedure SetpmGetUserGroupsResult(Index: Integer; const Astring: string);
    function  pmGetUserGroupsResult_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property erroExecucao:          string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
    property pmGetUserGroupsResult: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpmGetUserGroupsResult write SetpmGetUserGroupsResult stored pmGetUserGroupsResult_Specified;
  end;



  // ************************************************************************ //
  // XML       : mcwfUsersGetUserGroupsIn, global, <complexType>
  // Namespace : http://services.senior.com.br
  // ************************************************************************ //
  mcwfUsersGetUserGroupsIn = class(TRemotable)
  private
    FflowInstanceID: string;
    FflowInstanceID_Specified: boolean;
    FflowName: string;
    FflowName_Specified: boolean;
    FpmGetUserGroupsUserName: string;
    FpmGetUserGroupsUserName_Specified: boolean;
    procedure SetflowInstanceID(Index: Integer; const Astring: string);
    function  flowInstanceID_Specified(Index: Integer): boolean;
    procedure SetflowName(Index: Integer; const Astring: string);
    function  flowName_Specified(Index: Integer): boolean;
    procedure SetpmGetUserGroupsUserName(Index: Integer; const Astring: string);
    function  pmGetUserGroupsUserName_Specified(Index: Integer): boolean;
  published
    property flowInstanceID:          string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowInstanceID write SetflowInstanceID stored flowInstanceID_Specified;
    property flowName:                string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FflowName write SetflowName stored flowName_Specified;
    property pmGetUserGroupsUserName: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FpmGetUserGroupsUserName write SetpmGetUserGroupsUserName stored pmGetUserGroupsUserName_Specified;
  end;



  // ************************************************************************ //
  // XML       : mcwfUsersChangePasswordOut, global, <complexType>
  // Namespace : http://services.senior.com.br
  // Serializtn: [xoLiteralParam]
  // Info      : Wrapper
  // ************************************************************************ //
  mcwfUsersChangePasswordOut = class(TRemotable)
  private
    FerroExecucao: string;
    FerroExecucao_Specified: boolean;
    procedure SeterroExecucao(Index: Integer; const Astring: string);
    function  erroExecucao_Specified(Index: Integer): boolean;
  public
    constructor Create; override;
  published
    property erroExecucao: string  Index (IS_OPTN or IS_NLBL or IS_UNQL) read FerroExecucao write SeterroExecucao stored erroExecucao_Specified;
  end;


  // ************************************************************************ //
  // Namespace : http://services.senior.com.br
  // transport : http://schemas.xmlsoap.org/soap/http
  // style     : rpc
  // use       : literal
  // binding   : sapiens_SyncMCWFUsersPortBinding
  // service   : g5-senior-services
  // port      : sapiens_SyncMCWFUsersPort
  // URL       : http://vm-senior:8080/g5-senior-services/sapiens_SyncMCWFUsers
  // ************************************************************************ //
  sapiens_SyncMCWFUsers = interface(IInvokable)
  ['{4BE004F4-E72E-DFF7-056A-E114A6242792}']

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  GetPersonKind(const user: string; const password: string; const encryption: Integer; const parameters: mcwfUsersGetPersonKindIn): mcwfUsersGetPersonKindOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  ChangePassword(const user: string; const password: string; const encryption: Integer; const parameters: mcwfUsersChangePasswordIn): mcwfUsersChangePasswordOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  GetUserGroups(const user: string; const password: string; const encryption: Integer; const parameters: mcwfUsersGetUserGroupsIn): mcwfUsersGetUserGroupsOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  PersonExists(const user: string; const password: string; const encryption: Integer; const parameters: mcwfUsersPersonExistsIn): mcwfUsersPersonExistsOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  AuthenticateJAAS(const user: string; const password: string; const encryption: Integer; const parameters: mcwfUsersAuthenticateJAASIn): mcwfUsersAuthenticateJAASOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  UserReplication(const user: string; const password: string; const encryption: Integer; const parameters: mcwfUsersUserReplicationIn): mcwfUsersUserReplicationOut; stdcall;

    // Cannot unwrap: 
    //     - Input message has more than one part
    //     - Output part does not refer to an element
    function  DiscoverUsersGroups(const user: string; const password: string; const encryption: Integer; const parameters: mcwfUsersDiscoverUsersGroupsIn): mcwfUsersDiscoverUsersGroupsOut; stdcall;
  end;

function Getsapiens_SyncMCWFUsers(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): sapiens_SyncMCWFUsers;


implementation
  uses System.SysUtils;

function Getsapiens_SyncMCWFUsers(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): sapiens_SyncMCWFUsers;
const
  defWSDL = 'http://vm-senior:8080/g5-senior-services/sapiens_SyncMCWFUsers?wsdl';
  defURL  = 'http://vm-senior:8080/g5-senior-services/sapiens_SyncMCWFUsers';
  defSvc  = 'g5-senior-services';
  defPrt  = 'sapiens_SyncMCWFUsersPort';
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
    Result := (RIO as sapiens_SyncMCWFUsers);
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


constructor mcwfUsersGetPersonKindOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure mcwfUsersGetPersonKindOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function mcwfUsersGetPersonKindOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure mcwfUsersGetPersonKindOut.SetpmPersonKind(Index: Integer; const Astring: string);
begin
  FpmPersonKind := Astring;
  FpmPersonKind_Specified := True;
end;

function mcwfUsersGetPersonKindOut.pmPersonKind_Specified(Index: Integer): boolean;
begin
  Result := FpmPersonKind_Specified;
end;

procedure mcwfUsersChangePasswordIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function mcwfUsersChangePasswordIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure mcwfUsersChangePasswordIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function mcwfUsersChangePasswordIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure mcwfUsersChangePasswordIn.SetpmNewPassword(Index: Integer; const Astring: string);
begin
  FpmNewPassword := Astring;
  FpmNewPassword_Specified := True;
end;

function mcwfUsersChangePasswordIn.pmNewPassword_Specified(Index: Integer): boolean;
begin
  Result := FpmNewPassword_Specified;
end;

procedure mcwfUsersChangePasswordIn.SetpmNewPasswordConfirmation(Index: Integer; const Astring: string);
begin
  FpmNewPasswordConfirmation := Astring;
  FpmNewPasswordConfirmation_Specified := True;
end;

function mcwfUsersChangePasswordIn.pmNewPasswordConfirmation_Specified(Index: Integer): boolean;
begin
  Result := FpmNewPasswordConfirmation_Specified;
end;

procedure mcwfUsersChangePasswordIn.SetpmPassword(Index: Integer; const Astring: string);
begin
  FpmPassword := Astring;
  FpmPassword_Specified := True;
end;

function mcwfUsersChangePasswordIn.pmPassword_Specified(Index: Integer): boolean;
begin
  Result := FpmPassword_Specified;
end;

procedure mcwfUsersChangePasswordIn.SetpmUser(Index: Integer; const Astring: string);
begin
  FpmUser := Astring;
  FpmUser_Specified := True;
end;

function mcwfUsersChangePasswordIn.pmUser_Specified(Index: Integer): boolean;
begin
  Result := FpmUser_Specified;
end;

procedure mcwfUsersUserReplicationIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function mcwfUsersUserReplicationIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure mcwfUsersUserReplicationIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function mcwfUsersUserReplicationIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure mcwfUsersUserReplicationIn.SetpmUserReplicationXML(Index: Integer; const Astring: string);
begin
  FpmUserReplicationXML := Astring;
  FpmUserReplicationXML_Specified := True;
end;

function mcwfUsersUserReplicationIn.pmUserReplicationXML_Specified(Index: Integer): boolean;
begin
  Result := FpmUserReplicationXML_Specified;
end;

constructor mcwfUsersUserReplicationOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure mcwfUsersUserReplicationOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function mcwfUsersUserReplicationOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure mcwfUsersDiscoverUsersGroupsIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function mcwfUsersDiscoverUsersGroupsIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure mcwfUsersDiscoverUsersGroupsIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function mcwfUsersDiscoverUsersGroupsIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

constructor mcwfUsersDiscoverUsersGroupsOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure mcwfUsersDiscoverUsersGroupsOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function mcwfUsersDiscoverUsersGroupsOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure mcwfUsersDiscoverUsersGroupsOut.SetpmReturn(Index: Integer; const Astring: string);
begin
  FpmReturn := Astring;
  FpmReturn_Specified := True;
end;

function mcwfUsersDiscoverUsersGroupsOut.pmReturn_Specified(Index: Integer): boolean;
begin
  Result := FpmReturn_Specified;
end;

constructor mcwfUsersPersonExistsOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure mcwfUsersPersonExistsOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function mcwfUsersPersonExistsOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure mcwfUsersPersonExistsOut.SetpmPersonExists(Index: Integer; const Astring: string);
begin
  FpmPersonExists := Astring;
  FpmPersonExists_Specified := True;
end;

function mcwfUsersPersonExistsOut.pmPersonExists_Specified(Index: Integer): boolean;
begin
  Result := FpmPersonExists_Specified;
end;

procedure mcwfUsersAuthenticateJAASIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function mcwfUsersAuthenticateJAASIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure mcwfUsersAuthenticateJAASIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function mcwfUsersAuthenticateJAASIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure mcwfUsersAuthenticateJAASIn.SetpmEncrypted(Index: Integer; const AInteger: Integer);
begin
  FpmEncrypted := AInteger;
  FpmEncrypted_Specified := True;
end;

function mcwfUsersAuthenticateJAASIn.pmEncrypted_Specified(Index: Integer): boolean;
begin
  Result := FpmEncrypted_Specified;
end;

procedure mcwfUsersAuthenticateJAASIn.SetpmUserName(Index: Integer; const Astring: string);
begin
  FpmUserName := Astring;
  FpmUserName_Specified := True;
end;

function mcwfUsersAuthenticateJAASIn.pmUserName_Specified(Index: Integer): boolean;
begin
  Result := FpmUserName_Specified;
end;

procedure mcwfUsersAuthenticateJAASIn.SetpmUserPassword(Index: Integer; const Astring: string);
begin
  FpmUserPassword := Astring;
  FpmUserPassword_Specified := True;
end;

function mcwfUsersAuthenticateJAASIn.pmUserPassword_Specified(Index: Integer): boolean;
begin
  Result := FpmUserPassword_Specified;
end;

constructor mcwfUsersAuthenticateJAASOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure mcwfUsersAuthenticateJAASOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function mcwfUsersAuthenticateJAASOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure mcwfUsersAuthenticateJAASOut.SetpmLogged(Index: Integer; const Astring: string);
begin
  FpmLogged := Astring;
  FpmLogged_Specified := True;
end;

function mcwfUsersAuthenticateJAASOut.pmLogged_Specified(Index: Integer): boolean;
begin
  Result := FpmLogged_Specified;
end;

procedure mcwfUsersGetPersonKindIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function mcwfUsersGetPersonKindIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure mcwfUsersGetPersonKindIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function mcwfUsersGetPersonKindIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure mcwfUsersGetPersonKindIn.SetpmPersonName(Index: Integer; const Astring: string);
begin
  FpmPersonName := Astring;
  FpmPersonName_Specified := True;
end;

function mcwfUsersGetPersonKindIn.pmPersonName_Specified(Index: Integer): boolean;
begin
  Result := FpmPersonName_Specified;
end;

procedure mcwfUsersPersonExistsIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function mcwfUsersPersonExistsIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure mcwfUsersPersonExistsIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function mcwfUsersPersonExistsIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure mcwfUsersPersonExistsIn.SetpmPersonKind(Index: Integer; const Astring: string);
begin
  FpmPersonKind := Astring;
  FpmPersonKind_Specified := True;
end;

function mcwfUsersPersonExistsIn.pmPersonKind_Specified(Index: Integer): boolean;
begin
  Result := FpmPersonKind_Specified;
end;

procedure mcwfUsersPersonExistsIn.SetpmPersonName(Index: Integer; const Astring: string);
begin
  FpmPersonName := Astring;
  FpmPersonName_Specified := True;
end;

function mcwfUsersPersonExistsIn.pmPersonName_Specified(Index: Integer): boolean;
begin
  Result := FpmPersonName_Specified;
end;

constructor mcwfUsersGetUserGroupsOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure mcwfUsersGetUserGroupsOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function mcwfUsersGetUserGroupsOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

procedure mcwfUsersGetUserGroupsOut.SetpmGetUserGroupsResult(Index: Integer; const Astring: string);
begin
  FpmGetUserGroupsResult := Astring;
  FpmGetUserGroupsResult_Specified := True;
end;

function mcwfUsersGetUserGroupsOut.pmGetUserGroupsResult_Specified(Index: Integer): boolean;
begin
  Result := FpmGetUserGroupsResult_Specified;
end;

procedure mcwfUsersGetUserGroupsIn.SetflowInstanceID(Index: Integer; const Astring: string);
begin
  FflowInstanceID := Astring;
  FflowInstanceID_Specified := True;
end;

function mcwfUsersGetUserGroupsIn.flowInstanceID_Specified(Index: Integer): boolean;
begin
  Result := FflowInstanceID_Specified;
end;

procedure mcwfUsersGetUserGroupsIn.SetflowName(Index: Integer; const Astring: string);
begin
  FflowName := Astring;
  FflowName_Specified := True;
end;

function mcwfUsersGetUserGroupsIn.flowName_Specified(Index: Integer): boolean;
begin
  Result := FflowName_Specified;
end;

procedure mcwfUsersGetUserGroupsIn.SetpmGetUserGroupsUserName(Index: Integer; const Astring: string);
begin
  FpmGetUserGroupsUserName := Astring;
  FpmGetUserGroupsUserName_Specified := True;
end;

function mcwfUsersGetUserGroupsIn.pmGetUserGroupsUserName_Specified(Index: Integer): boolean;
begin
  Result := FpmGetUserGroupsUserName_Specified;
end;

constructor mcwfUsersChangePasswordOut.Create;
begin
  inherited Create;
  FSerializationOptions := [xoLiteralParam];
end;

procedure mcwfUsersChangePasswordOut.SeterroExecucao(Index: Integer; const Astring: string);
begin
  FerroExecucao := Astring;
  FerroExecucao_Specified := True;
end;

function mcwfUsersChangePasswordOut.erroExecucao_Specified(Index: Integer): boolean;
begin
  Result := FerroExecucao_Specified;
end;

initialization
  { sapiens_SyncMCWFUsers }
  InvRegistry.RegisterInterface(TypeInfo(sapiens_SyncMCWFUsers), 'http://services.senior.com.br', 'UTF-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(sapiens_SyncMCWFUsers), '');
  InvRegistry.RegisterInvokeOptions(TypeInfo(sapiens_SyncMCWFUsers), ioLiteral);
  { sapiens_SyncMCWFUsers.GetPersonKind }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_SyncMCWFUsers), 'GetPersonKind', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_SyncMCWFUsers), 'GetPersonKind', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_SyncMCWFUsers.ChangePassword }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_SyncMCWFUsers), 'ChangePassword', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_SyncMCWFUsers), 'ChangePassword', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_SyncMCWFUsers.GetUserGroups }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_SyncMCWFUsers), 'GetUserGroups', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_SyncMCWFUsers), 'GetUserGroups', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_SyncMCWFUsers.PersonExists }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_SyncMCWFUsers), 'PersonExists', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_SyncMCWFUsers), 'PersonExists', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_SyncMCWFUsers.AuthenticateJAAS }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_SyncMCWFUsers), 'AuthenticateJAAS', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_SyncMCWFUsers), 'AuthenticateJAAS', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_SyncMCWFUsers.UserReplication }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_SyncMCWFUsers), 'UserReplication', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_SyncMCWFUsers), 'UserReplication', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  { sapiens_SyncMCWFUsers.DiscoverUsersGroups }
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_SyncMCWFUsers), 'DiscoverUsersGroups', 'parameters', '',
                                '[Namespace="http://services.senior.com.br"]');
  InvRegistry.RegisterParamInfo(TypeInfo(sapiens_SyncMCWFUsers), 'DiscoverUsersGroups', 'result', '',
                                '[Namespace="http://services.senior.com.br"]');
  RemClassRegistry.RegisterXSClass(mcwfUsersGetPersonKindOut, 'http://services.senior.com.br', 'mcwfUsersGetPersonKindOut');
  RemClassRegistry.RegisterSerializeOptions(mcwfUsersGetPersonKindOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(mcwfUsersChangePasswordIn, 'http://services.senior.com.br', 'mcwfUsersChangePasswordIn');
  RemClassRegistry.RegisterXSClass(mcwfUsersUserReplicationIn, 'http://services.senior.com.br', 'mcwfUsersUserReplicationIn');
  RemClassRegistry.RegisterXSClass(mcwfUsersUserReplicationOut, 'http://services.senior.com.br', 'mcwfUsersUserReplicationOut');
  RemClassRegistry.RegisterSerializeOptions(mcwfUsersUserReplicationOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(mcwfUsersDiscoverUsersGroupsIn, 'http://services.senior.com.br', 'mcwfUsersDiscoverUsersGroupsIn');
  RemClassRegistry.RegisterXSClass(mcwfUsersDiscoverUsersGroupsOut, 'http://services.senior.com.br', 'mcwfUsersDiscoverUsersGroupsOut');
  RemClassRegistry.RegisterSerializeOptions(mcwfUsersDiscoverUsersGroupsOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(mcwfUsersPersonExistsOut, 'http://services.senior.com.br', 'mcwfUsersPersonExistsOut');
  RemClassRegistry.RegisterSerializeOptions(mcwfUsersPersonExistsOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(mcwfUsersAuthenticateJAASIn, 'http://services.senior.com.br', 'mcwfUsersAuthenticateJAASIn');
  RemClassRegistry.RegisterXSClass(mcwfUsersAuthenticateJAASOut, 'http://services.senior.com.br', 'mcwfUsersAuthenticateJAASOut');
  RemClassRegistry.RegisterSerializeOptions(mcwfUsersAuthenticateJAASOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(mcwfUsersGetPersonKindIn, 'http://services.senior.com.br', 'mcwfUsersGetPersonKindIn');
  RemClassRegistry.RegisterXSClass(mcwfUsersPersonExistsIn, 'http://services.senior.com.br', 'mcwfUsersPersonExistsIn');
  RemClassRegistry.RegisterXSClass(mcwfUsersGetUserGroupsOut, 'http://services.senior.com.br', 'mcwfUsersGetUserGroupsOut');
  RemClassRegistry.RegisterSerializeOptions(mcwfUsersGetUserGroupsOut, [xoLiteralParam]);
  RemClassRegistry.RegisterXSClass(mcwfUsersGetUserGroupsIn, 'http://services.senior.com.br', 'mcwfUsersGetUserGroupsIn');
  RemClassRegistry.RegisterXSClass(mcwfUsersChangePasswordOut, 'http://services.senior.com.br', 'mcwfUsersChangePasswordOut');
  RemClassRegistry.RegisterSerializeOptions(mcwfUsersChangePasswordOut, [xoLiteralParam]);

end.