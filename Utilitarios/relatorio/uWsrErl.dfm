object fWsrErl: TfWsrErl
  Left = 0
  Top = 0
  Caption = 'fWsrErl - Executar relat'#243'rio via webservice do ERP'
  ClientHeight = 100
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object HTTPRIOExeRel: THTTPRIO
    WSDLLocation = 
      'http://vm-senior:8080/g5-senior-services/sapiens_Synccom_senior_' +
      'g5_co_ger_relatorio?wsdl'
    Service = 'g5-senior-services'
    Port = 'sapiens_Synccom_senior_g5_co_ger_relatorioPort'
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 40
    Top = 16
  end
end
