object fBxaCmp: TfBxaCmp
  Left = 0
  Top = 0
  Caption = 'fBxaCmp - Baixa de componente'
  ClientHeight = 173
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object HTTPRIOAcaoSid: THTTPRIO
    WSDLLocation = 
      'http://vm-teste:8080/g5-senior-services/sapiens_Synccom_senior_g' +
      '5_co_ger_sid?wsdl'
    Service = 'g5-senior-services'
    Port = 'sapiens_Synccom_senior_g5_co_ger_sidPort'
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 52
    Top = 8
  end
end
