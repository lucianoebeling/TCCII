object fEstCmp: TfEstCmp
  Left = 0
  Top = 0
  Caption = 'fEstCmp - Estorna Componente da Ordem de Produ'#231#227'o'
  ClientHeight = 101
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object HTTPRIOwsEstCmp: THTTPRIO
    WSDLLocation = 
      'http://vm-teste:8080/g5-senior-services/sapiens_Synccom_senior_g' +
      '5_co_mpr_cha_estornacomponente?wsdl'
    Service = 'g5-senior-services'
    Port = 'sapiens_Synccom_senior_g5_co_mpr_cha_estornacomponentePort'
    Converter.Options = [soSendMultiRefObj, soTryAllSchema, soRootRefNodesToBody, soCacheMimeResponse, soUTF8EncodeXML]
    Left = 56
    Top = 16
  end
end
