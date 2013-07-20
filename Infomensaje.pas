// ************************************************************************ //
// The types declared in this file were generated from data read from the
// WSDL File described below:
// WSDL     : https://www.comunets.com/WS/Infomensaje.asmx?WSDL
// Encoding : utf-8
// Version  : 1.0
// (2010/10/26 12:43:09 PM - 1.33.2.5)
// ************************************************************************ //

unit Infomensaje;

interface

uses InvokeRegistry, SOAPHTTPClient, Types, XSBuiltIns;

type

  // ************************************************************************ //
  // The following types, referred to in the WSDL document are not being represented
  // in this file. They are either aliases[@] of other types represented or were referred
  // to but never[!] declared in the document. The types from the latter category
  // typically map to predefined/known XML or Borland types; however, they could also 
  // indicate incorrect WSDL documents that failed to declare or import a schema type.
  // ************************************************************************ //
  // !:string          - "http://www.w3.org/2001/XMLSchema"
  // !:boolean         - "http://www.w3.org/2001/XMLSchema"



  // ************************************************************************ //
  // Namespace : https://www.comunets.com/
  // soapAction: https://www.comunets.com/Enviar
  // transport : http://schemas.xmlsoap.org/soap/http
  // binding   : InfomensajeSoap
  // service   : Infomensaje
  // port      : InfomensajeSoap
  // URL       : https://www.comunets.com/WS/Infomensaje.asmx
  // ************************************************************************ //
  InfomensajeSoap = interface(IInvokable)
  ['{6B41B453-E7F6-D5F8-902E-9806B2833ACC}']
    function  Enviar(const Servicio: WideString; const Usuario: WideString; const Contrase_a: WideString; const Celular: WideString; const Mensaje: WideString): Boolean; stdcall;
  end;

function GetInfomensajeSoap(UseWSDL: Boolean=System.False; Addr: string=''; HTTPRIO: THTTPRIO = nil): InfomensajeSoap;


implementation

function GetInfomensajeSoap(UseWSDL: Boolean; Addr: string; HTTPRIO: THTTPRIO): InfomensajeSoap;
const
  defWSDL = 'https://www.comunets.com/WS/Infomensaje.asmx?WSDL';
  defURL  = 'https://www.comunets.com/WS/Infomensaje.asmx';
  defSvc  = 'Infomensaje';
  defPrt  = 'InfomensajeSoap';
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
    Result := (RIO as InfomensajeSoap);
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


initialization
  InvRegistry.RegisterInterface(TypeInfo(InfomensajeSoap), 'https://www.comunets.com/', 'utf-8');
  InvRegistry.RegisterDefaultSOAPAction(TypeInfo(InfomensajeSoap), 'https://www.comunets.com/Enviar');
  InvRegistry.RegisterExternalParamName(TypeInfo(InfomensajeSoap), 'Enviar', 'Contrase_a', 'Contraseña');

end. 