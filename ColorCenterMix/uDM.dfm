object DM: TDM
  Height = 655
  Width = 1105
  object sqlConexao: TSQLConnection
    ConnectionName = 'OracleConnection'
    DriverName = 'Oracle'
    LoginPrompt = False
    Params.Strings = (
      'DriverName=Oracle'
      'DataBase=orcl'
      'User_Name=sapiens'
      'Password=sapiens'
      'RowsetSize=20'
      'BlobSize=-1'
      'ErrorResourceFile='
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'OS Authentication=False'
      'Multiple Transaction=False'
      'Trim Char=False'
      'Decimal Separator=,')
    Left = 56
    Top = 16
  end
  object sqlUsuario: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 56
    Top = 80
  end
  object sqlR910USU: TSQLQuery
    Params = <>
    Left = 56
    Top = 144
  end
  object cdsGrupos: TClientDataSet
    PersistDataPacket.Data = {
      560000009619E0BD010000001800000003000000000003000000560006436F64
      557375040001000000000008446573477275706F010049000000010005574944
      544802000200FA00074964477275706F04000100000000000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CodUsu'
        DataType = ftInteger
      end
      item
        Name = 'DesGrupo'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'IdGrupo'
        DataType = ftInteger
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 288
    Top = 16
    object cdsGruposCodUsu: TIntegerField
      FieldName = 'CodUsu'
    end
    object cdsGruposDesGrupo: TStringField
      FieldName = 'DesGrupo'
      Size = 250
    end
    object cdsGruposIdGrupo: TIntegerField
      FieldName = 'IdGrupo'
    end
  end
  object cdsConfiguracao: TClientDataSet
    PersistDataPacket.Data = {
      810200009619E0BD010000001800000019000000000003000000810206436F64
      456D70040001000000000006456D704E6F6D0100490000000100055749445448
      02000200320006436F6446696C04000100000000000646696C4E6F6D01004900
      0000010005574944544802000200320006557375426E63010049000000010005
      574944544802000200640006536E68426E630100490000000100055749445448
      02000200640006566572426E6301004900000001000557494454480200020064
      0006436F645573750400010000000000064E6F6D557375010049000000010005
      5749445448020002006400064E6F6D436D700100490000000100055749445448
      02000200640006536E6855737501004900000001000557494454480200020064
      0006477270557375010049000000010005574944544802000200640006497374
      426E630100490000000100055749445448020002006400065765625372760100
      49000000010005574944544802000200FA00064170704E6F6D01004900000001
      00055749445448020002003200064170704E6370010049000000010005574944
      5448020002006400064674705372760100490000000100055749445448020002
      00FA0006467470536E68010049000000010005574944544802000200FA000646
      7470507274010049000000010005574944544802000200140006467470557372
      010049000000010005574944544802000200320006436F644363750100490000
      000100055749445448020002001400064E756D43616404000100000000000644
      65764E6F6D010049000000010005574944544802000200320006547572547262
      040001000000000006496D705064720100490000000100055749445448020002
      0064000000}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CodEmp'
        DataType = ftInteger
      end
      item
        Name = 'EmpNom'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CodFil'
        DataType = ftInteger
      end
      item
        Name = 'FilNom'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'UsuBnc'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'SnhBnc'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'VerBnc'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CodUsu'
        DataType = ftInteger
      end
      item
        Name = 'NomUsu'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'NomCmp'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'SnhUsu'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'GrpUsu'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'IstBnc'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'WebSrv'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'AppNom'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'AppNcp'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'FtpSrv'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'FtpSnh'
        DataType = ftString
        Size = 250
      end
      item
        Name = 'FtpPrt'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'FtpUsr'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CodCcu'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NumCad'
        DataType = ftInteger
      end
      item
        Name = 'DevNom'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'TurTrb'
        DataType = ftInteger
      end
      item
        Name = 'ImpPdr'
        DataType = ftString
        Size = 100
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 176
    Top = 16
    object cdsConfiguracaoCodEmp: TIntegerField
      FieldName = 'CodEmp'
    end
    object cdsConfiguracaoEmpNom: TStringField
      FieldName = 'EmpNom'
      Size = 50
    end
    object cdsConfiguracaoCodFil: TIntegerField
      FieldName = 'CodFil'
    end
    object cdsConfiguracaoFilNom: TStringField
      FieldName = 'FilNom'
      Size = 50
    end
    object cdsConfiguracaoUsuBnc: TStringField
      FieldName = 'UsuBnc'
      Size = 100
    end
    object cdsConfiguracaoSnhBnc: TStringField
      FieldName = 'SnhBnc'
      Size = 100
    end
    object cdsConfiguracaoVerBnc: TStringField
      FieldName = 'VerBnc'
      Size = 100
    end
    object cdsConfiguracaoCodUsu: TIntegerField
      FieldName = 'CodUsu'
    end
    object cdsConfiguracaoNomUsu: TStringField
      FieldName = 'NomUsu'
      Size = 100
    end
    object cdsConfiguracaoNomCmp: TStringField
      FieldName = 'NomCmp'
      Size = 100
    end
    object cdsConfiguracaoSnhUsu: TStringField
      FieldName = 'SnhUsu'
      Size = 100
    end
    object cdsConfiguracaoGrpUsu: TStringField
      FieldName = 'GrpUsu'
      Size = 100
    end
    object cdsConfiguracaoIstBnc: TStringField
      FieldName = 'IstBnc'
      Size = 100
    end
    object cdsConfiguracaoWebSrv: TStringField
      FieldName = 'WebSrv'
      Size = 250
    end
    object cdsConfiguracaoAppNom: TStringField
      FieldName = 'AppNom'
      Size = 50
    end
    object cdsConfiguracaoAppNcp: TStringField
      FieldName = 'AppNcp'
      Size = 100
    end
    object cdsConfiguracaoFtpSrv: TStringField
      FieldName = 'FtpSrv'
      Size = 250
    end
    object cdsConfiguracaoFtpSnh: TStringField
      FieldName = 'FtpSnh'
      Size = 250
    end
    object cdsConfiguracaoFtpPrt: TStringField
      FieldName = 'FtpPrt'
    end
    object cdsConfiguracaoFtpUsr: TStringField
      FieldName = 'FtpUsr'
      Size = 50
    end
    object cdsConfiguracaoCodCcu: TStringField
      FieldName = 'CodCcu'
    end
    object cdsConfiguracaoNumCad: TIntegerField
      FieldName = 'NumCad'
    end
    object cdsConfiguracaoDevNom: TStringField
      FieldName = 'DevNom'
      Size = 50
    end
    object cdsConfiguracaoTurTrb: TIntegerField
      FieldName = 'TurTrb'
    end
    object cdsConfiguracaoImpPdr: TStringField
      FieldName = 'ImpPdr'
      Size = 100
    end
  end
  object sqlReceitas: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 56
    Top = 208
  end
  object cdsReceitas: TClientDataSet
    PersistDataPacket.Data = {
      E70000009619E0BD010000001800000009000000000003000000E70006436F64
      456D70040001000000000006436F6450726F0100490000000100055749445448
      02000200080006436F6444657201004900000001000557494454480200020003
      0006436F644D6172010049000000010005574944544802000200320006446573
      50726F010049000000010005574944544802000200C800065174645072760800
      0400000000000651746452657308000400000000000651746455746908000400
      0000000006517464546F74080004000000000001000D44454641554C545F4F52
      4445520200820000000000}
    Active = True
    Aggregates = <>
    DisableStringTrim = True
    FieldDefs = <
      item
        Name = 'CodEmp'
        DataType = ftInteger
      end
      item
        Name = 'CodPro'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CodDer'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CodMar'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DesPro'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'QtdPrv'
        DataType = ftFloat
      end
      item
        Name = 'QtdRes'
        DataType = ftFloat
      end
      item
        Name = 'QtdUti'
        DataType = ftFloat
      end
      item
        Name = 'QtdTot'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    StoreDefs = True
    AfterPost = cdsReceitasAfterPost
    AfterScroll = cdsReceitasAfterScroll
    OnCalcFields = cdsReceitasCalcFields
    Left = 176
    Top = 208
    object cdsReceitasCodEmp: TIntegerField
      FieldName = 'CodEmp'
    end
    object cdsReceitasCodPro: TStringField
      FieldName = 'CodPro'
      Size = 8
    end
    object cdsReceitasCodDer: TStringField
      FieldName = 'CodDer'
      Size = 3
    end
    object cdsReceitasCodMar: TStringField
      FieldName = 'CodMar'
      Size = 50
    end
    object cdsReceitasDesPro: TStringField
      FieldName = 'DesPro'
      Size = 200
    end
    object cdsReceitasQtdPrv: TFloatField
      FieldName = 'QtdPrv'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object cdsReceitasQtdRes: TFloatField
      FieldName = 'QtdRes'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object cdsReceitasQtdUti: TFloatField
      FieldName = 'QtdUti'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object cdsReceitasQtdAdi: TFloatField
      FieldKind = fkCalculated
      FieldName = 'QtdAdi'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
      Calculated = True
    end
    object cdsReceitasQtdTot: TFloatField
      DefaultExpression = '0'
      FieldName = 'QtdTot'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
  end
  object cdsOrdemProducao: TClientDataSet
    PersistDataPacket.Data = {
      6D0100009619E0BD0100000018000000110000000000030000006D0106436F64
      456D700400010000000000064E756D5065640400010000000000065365714970
      640400010000000000064E756D4F7270040001000000000006436F644F726901
      00490000000100055749445448020002000A0006436F64457467010049000000
      010005574944544802000200080006436F644D61720100490000000100055749
      44544802000200320006436F6450726F01004900000001000557494454480200
      0200080006436F64446572010049000000010005574944544802000200030006
      44657350726F010049000000010005574944544802000200C800065174645072
      7608000400000000000651746452657308000400000000000651746452653108
      0004000000000006517464416469080004000000000006517464546F74080004
      000000000006536571526F74040001000000000006436F644465700100490000
      0001000557494454480200020014000000}
    Active = True
    Aggregates = <>
    DisableStringTrim = True
    FieldDefs = <
      item
        Name = 'CodEmp'
        DataType = ftInteger
      end
      item
        Name = 'NumPed'
        DataType = ftInteger
      end
      item
        Name = 'SeqIpd'
        DataType = ftInteger
      end
      item
        Name = 'NumOrp'
        DataType = ftInteger
      end
      item
        Name = 'CodOri'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'CodEtg'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CodMar'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CodPro'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CodDer'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'DesPro'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'QtdPrv'
        DataType = ftFloat
      end
      item
        Name = 'QtdRes'
        DataType = ftFloat
      end
      item
        Name = 'QtdRe1'
        DataType = ftFloat
      end
      item
        Name = 'QtdAdi'
        DataType = ftFloat
      end
      item
        Name = 'QtdTot'
        DataType = ftFloat
      end
      item
        Name = 'SeqRot'
        DataType = ftInteger
      end
      item
        Name = 'CodDep'
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    IndexFieldNames = 'CodEmp;CodPro;CodDer'
    MasterSource = dsReceitas
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    AfterScroll = cdsOrdemProducaoAfterScroll
    Left = 176
    Top = 368
    object IntegerField1: TIntegerField
      FieldName = 'CodEmp'
    end
    object cdsOrdemProducaoNumPed: TIntegerField
      FieldName = 'NumPed'
    end
    object cdsOrdemProducaoSeqIpd: TIntegerField
      FieldName = 'SeqIpd'
    end
    object cdsOrdemProducaoRelPrd: TStringField
      FieldKind = fkCalculated
      FieldName = 'RelPrd'
      Size = 50
      Calculated = True
    end
    object cdsOrdemProducaoNumOrp: TIntegerField
      FieldName = 'NumOrp'
    end
    object cdsOrdemProducaoCodOri: TStringField
      FieldName = 'CodOri'
      Size = 10
    end
    object cdsOrdemProducaoCodEtg: TStringField
      FieldName = 'CodEtg'
      Size = 8
    end
    object StringField3: TStringField
      FieldName = 'CodMar'
      Size = 50
    end
    object StringField1: TStringField
      FieldName = 'CodPro'
      Size = 8
    end
    object StringField2: TStringField
      FieldName = 'CodDer'
      Size = 3
    end
    object StringField4: TStringField
      FieldName = 'DesPro'
      Size = 200
    end
    object FloatField1: TFloatField
      FieldName = 'QtdPrv'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object cdsOrdemProducaoQtdRes: TFloatField
      DefaultExpression = '0'
      FieldName = 'QtdRes'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object cdsOrdemProducaoQtdRe1: TFloatField
      FieldName = 'QtdRe1'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object cdsOrdemProducaoQtdAdi: TFloatField
      FieldName = 'QtdAdi'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object cdsOrdemProducaoQtdTot: TFloatField
      DefaultExpression = '0'
      FieldName = 'QtdTot'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object cdsOrdemProducaoSeqRot: TIntegerField
      FieldName = 'SeqRot'
    end
    object cdsOrdemProducaoCodDep: TStringField
      FieldName = 'CodDep'
    end
  end
  object sqlOrdemProducao: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 56
    Top = 368
  end
  object sqlLoteOp: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 432
    Top = 368
  end
  object sqlComponente: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 56
    Top = 448
  end
  object cdsLoteOP: TClientDataSet
    PersistDataPacket.Data = {
      F80000009619E0BD01000000180000000A000000000003000000F80006436F64
      456D70040001000000000006436F644465700100490000000100055749445448
      020002001400064461744D6F760400060000000000065365714D6F7604000100
      0000000006436F64546E73010049000000010005574944544802000200050006
      457374456F73010049000000010005574944544802000200140006436F645072
      6F010049000000010005574944544802000200080006436F6444657201004900
      0000010005574944544802000200040006436F644C6F74010049000000010005
      5749445448020002003200065174644D6F7608000400000000000000}
    Active = True
    Aggregates = <>
    DisableStringTrim = True
    FieldDefs = <
      item
        Name = 'CodEmp'
        DataType = ftInteger
      end
      item
        Name = 'CodDep'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DatMov'
        DataType = ftDate
      end
      item
        Name = 'SeqMov'
        DataType = ftInteger
      end
      item
        Name = 'CodTns'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'EstEos'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CodPro'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CodDer'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CodLot'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'QtdMov'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 576
    Top = 368
    object cdsLoteOPCodEmp: TIntegerField
      FieldName = 'CodEmp'
    end
    object cdsLoteOPCodDep: TStringField
      FieldName = 'CodDep'
    end
    object cdsLoteOPDatMov: TDateField
      FieldName = 'DatMov'
    end
    object cdsLoteOPSeqMov: TIntegerField
      FieldName = 'SeqMov'
    end
    object cdsLoteOPCodTns: TStringField
      FieldName = 'CodTns'
      Size = 5
    end
    object cdsLoteOPEstEos: TStringField
      FieldName = 'EstEos'
    end
    object cdsLoteOPCodPro: TStringField
      FieldName = 'CodPro'
      Size = 8
    end
    object cdsLoteOPCodDer: TStringField
      FieldName = 'CodDer'
      Size = 4
    end
    object cdsLoteOPCodLot: TStringField
      FieldName = 'CodLot'
      Size = 50
    end
    object cdsLoteOPQtdMov: TFloatField
      FieldName = 'QtdMov'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
  end
  object cdsComponente: TClientDataSet
    PersistDataPacket.Data = {
      CA0100009619E0BD010000001800000014000000000003000000CA0106436F64
      456D70040001000000000006436F644F72690100490000000100055749445448
      020002000A00064E756D50656404000100000000000653657149706404000100
      000000000652656C507264010049000000010005574944544802000200140006
      4E756D4F7270040001000000000006436F6450726F0100490000000100055749
      44544802000200320006436F6444657201004900000001000557494454480200
      02000A000644657350726F010049000000010005574944544802000200640006
      436F644D6172010049000000010005574944544802000200140006436F64436D
      700100490000000100055749445448020002000A0006446572436D7001004900
      00000100055749445448020002000A0006446573436D70010049000000010005
      5749445448020002006400065174645072760800040000000000065174645574
      69080004000000000006517464526573080004000000000006517464546F7408
      0004000000000006436F64457467010049000000010005574944544802000200
      080006436F64446570010049000000010005574944544802000200140006436D
      7050727608000400000000000000}
    Active = True
    Aggregates = <>
    DisableStringTrim = True
    FieldDefs = <
      item
        Name = 'CodEmp'
        DataType = ftInteger
      end
      item
        Name = 'CodOri'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'NumPed'
        DataType = ftInteger
      end
      item
        Name = 'SeqIpd'
        DataType = ftInteger
      end
      item
        Name = 'RelPrd'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'NumOrp'
        DataType = ftInteger
      end
      item
        Name = 'CodPro'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'CodDer'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DesPro'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'CodMar'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CodCmp'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DerCmp'
        DataType = ftString
        Size = 10
      end
      item
        Name = 'DesCmp'
        DataType = ftString
        Size = 100
      end
      item
        Name = 'QtdPrv'
        DataType = ftFloat
      end
      item
        Name = 'QtdUti'
        DataType = ftFloat
      end
      item
        Name = 'QtdRes'
        DataType = ftFloat
      end
      item
        Name = 'QtdTot'
        DataType = ftFloat
      end
      item
        Name = 'CodEtg'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CodDep'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CmpPrv'
        DataType = ftFloat
      end>
    IndexDefs = <>
    MasterSource = dsOrdemProducao
    PacketRecords = 0
    Params = <>
    StoreDefs = True
    AfterScroll = cdsComponenteAfterScroll
    Left = 176
    Top = 448
    object cdsComponenteCodEmp: TIntegerField
      FieldName = 'CodEmp'
    end
    object cdsComponenteCodOri: TStringField
      FieldName = 'CodOri'
      Size = 10
    end
    object cdsComponenteNumPed: TIntegerField
      FieldName = 'NumPed'
    end
    object cdsComponenteSeqIpd: TIntegerField
      FieldName = 'SeqIpd'
    end
    object cdsComponenteRelPrd: TStringField
      FieldName = 'RelPrd'
    end
    object cdsComponenteNumOrp: TIntegerField
      FieldName = 'NumOrp'
    end
    object cdsComponenteCodPro: TStringField
      FieldName = 'CodPro'
      Size = 50
    end
    object cdsComponenteCodDer: TStringField
      FieldName = 'CodDer'
      Size = 10
    end
    object cdsComponenteDesPro: TStringField
      FieldName = 'DesPro'
      Size = 100
    end
    object cdsComponenteCodMar: TStringField
      FieldName = 'CodMar'
    end
    object cdsComponenteCodCmp: TStringField
      FieldName = 'CodCmp'
      Size = 10
    end
    object cdsComponenteDerCmp: TStringField
      FieldName = 'DerCmp'
      Size = 10
    end
    object cdsComponenteDesCmp: TStringField
      FieldName = 'DesCmp'
      Size = 100
    end
    object cdsComponenteQtdPrv: TFloatField
      FieldName = 'QtdPrv'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object cdsComponenteQtdUti: TFloatField
      FieldName = 'QtdUti'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object cdsComponenteQtdRes: TFloatField
      FieldName = 'QtdRes'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object cdsComponenteQtdTot: TFloatField
      FieldName = 'QtdTot'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object cdsComponenteCodEtg: TStringField
      FieldName = 'CodEtg'
      Size = 8
    end
    object cdsComponenteCodDep: TStringField
      FieldName = 'CodDep'
    end
    object cdsComponenteCmpPrv: TFloatField
      FieldName = 'CmpPrv'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
  end
  object dsReceitas: TDataSource
    DataSet = cdsReceitas
    Left = 304
    Top = 208
  end
  object dsOrdemProducao: TDataSource
    DataSet = cdsOrdemProducao
    Left = 305
    Top = 369
  end
  object dsLoteOp: TDataSource
    DataSet = cdsLoteOP
    Left = 712
    Top = 368
  end
  object dsComponente: TDataSource
    DataSet = cdsComponente
    Left = 304
    Top = 448
  end
  object sqlE210DLS: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 304
    Top = 144
  end
  object sqlLoteComponente: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 432
    Top = 448
  end
  object cdsLoteComponente: TClientDataSet
    PersistDataPacket.Data = {
      F80000009619E0BD01000000180000000A000000000003000000F80006436F64
      456D70040001000000000006436F644465700100490000000100055749445448
      020002001400064461744D6F760400060000000000065365714D6F7604000100
      0000000006436F64546E73010049000000010005574944544802000200050006
      457374456F73010049000000010005574944544802000200140006436F645072
      6F010049000000010005574944544802000200080006436F6444657201004900
      0000010005574944544802000200040006436F644C6F74010049000000010005
      5749445448020002003200065174644D6F7608000400000000000000}
    Active = True
    Aggregates = <>
    DisableStringTrim = True
    FieldDefs = <
      item
        Name = 'CodEmp'
        DataType = ftInteger
      end
      item
        Name = 'CodDep'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'DatMov'
        DataType = ftDate
      end
      item
        Name = 'SeqMov'
        DataType = ftInteger
      end
      item
        Name = 'CodTns'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'EstEos'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'CodPro'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CodDer'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CodLot'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'QtdMov'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 576
    Top = 448
    object cdsLoteComponenteCodEmp: TIntegerField
      FieldName = 'CodEmp'
    end
    object cdsLoteComponenteCodDep: TStringField
      FieldName = 'CodDep'
    end
    object cdsLoteComponenteDatMov: TDateField
      FieldName = 'DatMov'
    end
    object cdsLoteComponenteSeqMov: TIntegerField
      FieldName = 'SeqMov'
    end
    object cdsLoteComponenteCodTns: TStringField
      FieldName = 'CodTns'
      Size = 5
    end
    object cdsLoteComponenteEstEos: TStringField
      FieldName = 'EstEos'
    end
    object cdsLoteComponenteCodPro: TStringField
      FieldName = 'CodPro'
      Size = 8
    end
    object cdsLoteComponenteCodDer: TStringField
      FieldName = 'CodDer'
      Size = 4
    end
    object cdsLoteComponenteCodLot: TStringField
      FieldName = 'CodLot'
      Size = 50
    end
    object cdsLoteComponenteQtdMov: TFloatField
      FieldName = 'QtdMov'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
  end
  object dsLoteComponente: TDataSource
    DataSet = cdsLoteComponente
    Left = 712
    Top = 448
  end
  object sqlEstoquesCmp: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 56
    Top = 288
  end
  object cdsEstoquesCmp: TClientDataSet
    PersistDataPacket.Data = {
      F60000009619E0BD01000000180000000A000000000003000000F60006436F64
      456D70040001000000000006436F64436D700100490000000100055749445448
      02000200080006446572436D7001004900000001000557494454480200020003
      0006436F644D6172010049000000010005574944544802000200320006446573
      436D70010049000000010005574944544802000200C800065174645072760800
      0400000000000651746452657308000400000000000651746455746908000400
      0000000006517464457374080004000000000006517464546F74080004000000
      000001000D44454641554C545F4F524445520200820000000000}
    Active = True
    Aggregates = <>
    DisableStringTrim = True
    FieldDefs = <
      item
        Name = 'CodEmp'
        DataType = ftInteger
      end
      item
        Name = 'CodCmp'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'DerCmp'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'CodMar'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'DesCmp'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'QtdPrv'
        DataType = ftFloat
      end
      item
        Name = 'QtdRes'
        DataType = ftFloat
      end
      item
        Name = 'QtdUti'
        DataType = ftFloat
      end
      item
        Name = 'QtdEst'
        DataType = ftFloat
      end
      item
        Name = 'QtdTot'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'DEFAULT_ORDER'
      end
      item
        Name = 'CHANGEINDEX'
      end>
    Params = <>
    StoreDefs = True
    AfterScroll = cdsEstoquesCmpAfterScroll
    OnCalcFields = cdsReceitasCalcFields
    Left = 176
    Top = 288
    object IntegerField2: TIntegerField
      FieldName = 'CodEmp'
    end
    object StringField5: TStringField
      FieldName = 'CodCmp'
      Size = 8
    end
    object StringField6: TStringField
      FieldName = 'DerCmp'
      Size = 3
    end
    object StringField7: TStringField
      FieldName = 'CodMar'
      Size = 50
    end
    object StringField8: TStringField
      FieldName = 'DesCmp'
      Size = 200
    end
    object cdsEstoquesCmpQtdPrv: TFloatField
      FieldName = 'QtdPrv'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object FloatField3: TFloatField
      FieldName = 'QtdRes'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object cdsEstoquesCmpQtdUti: TFloatField
      FieldName = 'QtdUti'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object FloatField2: TFloatField
      FieldName = 'QtdEst'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object cdsEstoquesCmpQtdTot: TFloatField
      FieldName = 'QtdTot'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
  end
  object dsEstoquesCmp: TDataSource
    DataSet = cdsEstoquesCmp
    Left = 304
    Top = 288
  end
  object sqlE210EST: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 168
    Top = 144
  end
  object sqlLoteReceita: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 432
    Top = 208
  end
  object cdsLoteReceita: TClientDataSet
    PersistDataPacket.Data = {
      A70000009619E0BD010000001800000007000000000003000000A70006436F64
      456D70040001000000000006436F6450726F0100490000000100055749445448
      02000200080006436F6444657201004900000001000557494454480200020004
      0006436F644C6F74010049000000010005574944544802000200320006517464
      457374080004000000000006446174466162040006000000000006446174566C
      6404000600000000000000}
    Active = True
    Aggregates = <>
    DisableStringTrim = True
    FieldDefs = <
      item
        Name = 'CodEmp'
        DataType = ftInteger
      end
      item
        Name = 'CodPro'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CodDer'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CodLot'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'QtdEst'
        DataType = ftFloat
      end
      item
        Name = 'DatFab'
        DataType = ftDate
      end
      item
        Name = 'DatVld'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 576
    Top = 208
    object cdsLoteReceitaCodEmp: TIntegerField
      FieldName = 'CodEmp'
    end
    object cdsLoteReceitaCodPro: TStringField
      FieldName = 'CodPro'
      Size = 8
    end
    object cdsLoteReceitaCodDer: TStringField
      FieldName = 'CodDer'
      Size = 4
    end
    object cdsLoteReceitaCodLot: TStringField
      FieldName = 'CodLot'
      Size = 50
    end
    object cdsLoteReceitaQtdLote: TFloatField
      FieldName = 'QtdEst'
      DisplayFormat = '###,###,##0.0000'
      EditFormat = '###,###,##0.0000'
    end
    object cdsLoteReceitaDatFab: TDateField
      FieldName = 'DatFab'
    end
    object cdsLoteReceitaDatVld: TDateField
      FieldName = 'DatVld'
    end
  end
  object dsLoteReceita: TDataSource
    DataSet = cdsLoteReceita
    Left = 712
    Top = 208
  end
  object cdsLoteComponenteRec: TClientDataSet
    PersistDataPacket.Data = {
      A70000009619E0BD010000001800000007000000000003000000A70006436F64
      456D70040001000000000006436F6450726F0100490000000100055749445448
      02000200080006436F6444657201004900000001000557494454480200020004
      0006436F644C6F74010049000000010005574944544802000200320006517464
      457374080004000000000006446174466162040006000000000006446174566C
      6404000600000000000000}
    Active = True
    Aggregates = <>
    DisableStringTrim = True
    FieldDefs = <
      item
        Name = 'CodEmp'
        DataType = ftInteger
      end
      item
        Name = 'CodPro'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'CodDer'
        DataType = ftString
        Size = 4
      end
      item
        Name = 'CodLot'
        DataType = ftString
        Size = 50
      end
      item
        Name = 'QtdEst'
        DataType = ftFloat
      end
      item
        Name = 'DatFab'
        DataType = ftDate
      end
      item
        Name = 'DatVld'
        DataType = ftDate
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 576
    Top = 288
    object cdsLoteComponenteRecCodEmp: TIntegerField
      FieldName = 'CodEmp'
    end
    object cdsLoteComponenteRecCodPro: TStringField
      FieldName = 'CodPro'
      Size = 8
    end
    object cdsLoteComponenteRecCodDer: TStringField
      FieldName = 'CodDer'
      Size = 4
    end
    object cdsLoteComponenteRecCodLot: TStringField
      FieldName = 'CodLot'
      Size = 50
    end
    object cdsLoteComponenteRecQtdEst: TFloatField
      FieldName = 'QtdEst'
      DisplayFormat = '###,###,##0.0000'
      EditFormat = '###,###,##0.0000'
    end
    object cdsLoteComponenteRecDatFab: TDateField
      FieldName = 'DatFab'
    end
    object cdsLoteComponenteRecDatVld: TDateField
      FieldName = 'DatVld'
    end
  end
  object dsComponenteRec: TDataSource
    DataSet = cdsLoteComponenteRec
    Left = 712
    Top = 288
  end
  object sqlLoteComponenteRec: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 432
    Top = 288
  end
  object sqlE906OPE: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 176
    Top = 80
  end
  object sqlE078ULT: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 712
    Top = 144
  end
  object sqlE078ULT1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 824
    Top = 144
  end
  object sqlE210DLS1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 432
    Top = 144
  end
  object SQLE210MVP: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 576
    Top = 144
  end
  object cdsRelPrd: TClientDataSet
    PersistDataPacket.Data = {
      DD0000009619E0BD010000001800000009000000000003000000DD0006436F64
      456D70040001000000000006436F644F72690100490000000100055749445448
      0200020014000652656C5072640100490000000100055749445448020002000C
      0006436F64436D70010049000000010005574944544802000200080006446572
      436D70010049000000010005574944544802000200050006446573436D700100
      49000000010005574944544802000200C8000651746450727608000400000000
      0006517464526573080004000000000006517464557469080004000000000000
      00}
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'CodEmp'
        DataType = ftInteger
      end
      item
        Name = 'CodOri'
        DataType = ftString
        Size = 20
      end
      item
        Name = 'RelPrd'
        DataType = ftString
        Size = 12
      end
      item
        Name = 'CodCmp'
        DataType = ftString
        Size = 8
      end
      item
        Name = 'DerCmp'
        DataType = ftString
        Size = 5
      end
      item
        Name = 'DesCmp'
        DataType = ftString
        Size = 200
      end
      item
        Name = 'QtdPrv'
        DataType = ftFloat
      end
      item
        Name = 'QtdRes'
        DataType = ftFloat
      end
      item
        Name = 'QtdUti'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 176
    Top = 528
    object cdsRelPrdCodEmp: TIntegerField
      FieldName = 'CodEmp'
    end
    object cdsRelPrdCodOri: TStringField
      FieldName = 'CodOri'
    end
    object cdsRelPrdRelPrd: TStringField
      FieldName = 'RelPrd'
      Size = 12
    end
    object cdsRelPrdCodCmp: TStringField
      FieldName = 'CodCmp'
      Size = 8
    end
    object cdsRelPrdDerCmp: TStringField
      FieldName = 'DerCmp'
      Size = 5
    end
    object cdsRelPrdDesCmp: TStringField
      FieldName = 'DesCmp'
      Size = 200
    end
    object cdsRelPrdQtdPrv: TFloatField
      DefaultExpression = '0'
      FieldName = 'QtdPrv'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object cdsRelPrdQtdRes: TFloatField
      DefaultExpression = '0'
      FieldName = 'QtdRes'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
    object cdsRelPrdQtdUti: TFloatField
      DefaultExpression = '0'
      FieldName = 'QtdUti'
      DisplayFormat = '###,###,##0.000'
      EditFormat = '###,###,##0.000'
    end
  end
  object sqlRelPrd: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 56
    Top = 528
  end
  object dsRelPrd: TDataSource
    DataSet = cdsRelPrd
    Left = 296
    Top = 528
  end
  object sqlRelPrd1: TSQLQuery
    MaxBlobSize = -1
    Params = <>
    SQLConnection = sqlConexao
    Left = 56
    Top = 592
  end
end
