object DM: TDM
  OldCreateOrder = True
  OnCreate = DataModuleCreate
  Height = 751
  Width = 1119
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=C:\iFood\BancoDados.fdb'
      'User_Name=SYSDBA'
      'CharacterSet=WIN1252'
      'DriverID=FB')
    LoginPrompt = False
    Left = 60
    Top = 60
  end
  object FDGUIxWaitCursor1: TFDGUIxWaitCursor
    Provider = 'Forms'
    Left = 158
    Top = 60
  end
  object _qryInsertConfig: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        ' insert into ifood_config (authorizationcode,authorizationcodeve' +
        'rifier,cdconfig,dataexpiracao,refreshtoken,token) values (:autho' +
        'rizationcode,:authorizationcodeverifier,:cdconfig,:dataexpiracao' +
        ',:refreshtoken,:token);')
    Left = 746
    Top = 400
    ParamData = <
      item
        Name = 'AUTHORIZATIONCODE'
        ParamType = ptInput
      end
      item
        Name = 'AUTHORIZATIONCODEVERIFIER'
        ParamType = ptInput
      end
      item
        Name = 'CDCONFIG'
        ParamType = ptInput
      end
      item
        Name = 'DATAEXPIRACAO'
        ParamType = ptInput
      end
      item
        Name = 'REFRESHTOKEN'
        ParamType = ptInput
      end
      item
        Name = 'TOKEN'
        ParamType = ptInput
      end>
  end
  object _qryUpdateConfig: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update ifood_config'
      'set authorizationcode = :authorizationcode,'
      '    authorizationcodeverifier = :authorizationcodeverifier,'
      '    dataexpiracao = :dataexpiracao,'
      '    refreshtoken = :refreshtoken,'
      '    token = :token'
      'where (cdconfig = :cdconfig);')
    Left = 648
    Top = 400
    ParamData = <
      item
        Name = 'AUTHORIZATIONCODE'
        ParamType = ptInput
      end
      item
        Name = 'AUTHORIZATIONCODEVERIFIER'
        ParamType = ptInput
      end
      item
        Name = 'DATAEXPIRACAO'
        DataType = ftTimeStamp
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'REFRESHTOKEN'
        ParamType = ptInput
      end
      item
        Name = 'TOKEN'
        DataType = ftString
        ParamType = ptInput
        Size = 1500
      end
      item
        Name = 'CDCONFIG'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object _qryGetTokenBD: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select authorizationcode,'
      '       authorizationcodeverifier,'
      '       dataexpiracao,'
      '       refreshtoken,'
      '       token'
      'from ifood_config')
    Left = 550
    Top = 400
  end
  object _qryUpdateIntegrado: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'execute procedure sp_status_pedido_polling (:poperacao, :pcodigo' +
        ')')
    Left = 452
    Top = 400
    ParamData = <
      item
        Name = 'POPERACAO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PCODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object _qryGetPedidos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select p.codigo,'
      '       p.orderId,'
      '       p.id'
      'from ifood_polling p'
      'where (p.integrado = '#39'N'#39' and p.code = '#39'PLC'#39')')
    Left = 354
    Top = 468
  end
  object _qryInsertPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '  insert into ifood_pedidos ('
      '    cdintegracao,'
      '    cdpagamento,'
      '    datapedido,'
      '    deliverydatetime,'
      '    deliverydatetimestart,'
      '    deliverydatetimeend,'
      '    isagendado,'
      '    seqdelivery,'
      '    statuspedido,'
      '    reference,'
      '    shortreference)'
      '  values ('
      '    0,'
      '    0,'
      '    :datapedido,'
      '    :deliverydatetime,'
      '    :deliverydatetimestart,'
      '    :deliverydatetimeend,'
      '    :isagendado,'
      '    :seqdelivery,'
      '    :statuspedido,'
      '    :reference,'
      '    :shortreference);')
    Left = 256
    Top = 468
    ParamData = <
      item
        Name = 'DATAPEDIDO'
        DataType = ftTimeStamp
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DELIVERYDATETIME'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Name = 'DELIVERYDATETIMESTART'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Name = 'DELIVERYDATETIMEEND'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Name = 'ISAGENDADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'SEQDELIVERY'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'STATUSPEDIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'REFERENCE'
        DataType = ftString
        ParamType = ptInput
        Size = 120
      end
      item
        Name = 'SHORTREFERENCE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end>
  end
  object _qryInsertPedidoItens: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '  insert into ifood_pedidos_itens ('
      '    cdpedido,'
      '    externalcode,'
      '    externalcode_pai,'
      '    name,'
      '    isauxiliar,'
      '    nritem,'
      '    observations,'
      '    quantity,'
      '    discount,'
      '    price,'
      '    statusintegrado,'
      '    totalprice)'
      '  values ('
      '    :cdpedido,'
      '    :externalcode,'
      '    :externalcode_pai,'
      '    :name,'
      '    :isauxiliar,'
      '    :nritem,'
      '    :observations,'
      '    :quantity,'
      '    :discount,'
      '    :price,'
      '    :statusintegrado,'
      '    :totalprice);')
    Left = 158
    Top = 468
    ParamData = <
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EXTERNALCODE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'EXTERNALCODE_PAI'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'NAME'
        DataType = ftString
        ParamType = ptInput
        Size = 120
      end
      item
        Name = 'ISAUXILIAR'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'NRITEM'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'OBSERVATIONS'
        DataType = ftString
        ParamType = ptInput
        Size = 255
      end
      item
        Name = 'QUANTITY'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DISCOUNT'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Name = 'PRICE'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Name = 'STATUSINTEGRADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'TOTALPRICE'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end>
  end
  object _qryGetIDPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select'
      '  max(t.cdpedido) cdpedido'
      'from ifood_pedidos t'
      'where t.shortreference = :shortreference')
    Left = 60
    Top = 468
    ParamData = <
      item
        Name = 'SHORTREFERENCE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object _qryListaPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'SELECT * FROM SPPESQUISAPEDIDOSIFOOD(:POPERACAO, :PDATAINICIAL, ' +
        ':PDATAFINAL, :PNOME, :PSTATUS, :PSHORTREFERENCE,:PSEQDELIVERY)')
    Left = 746
    Top = 332
    ParamData = <
      item
        Name = 'POPERACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
        Value = Null
      end
      item
        Name = 'PDATAINICIAL'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Name = 'PDATAFINAL'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Name = 'PNOME'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'PSTATUS'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'PSHORTREFERENCE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'PSEQDELIVERY'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object _qryListaPedidoItens: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      ' select'
      '  i.cdpedido, '
      '  i.externalcode,'
      '  i.externalcode_pai,'
      '  coalesce(p.descricao, i.name) name,'
      '  i.isauxiliar,'
      '  i.nritem,'
      '  i.observations,'
      '  i.quantity,'
      '  i.discount,'
      '  i.price,'
      '  i.statusintegrado,'
      '  i.totalprice'
      'from ifood_pedidos_itens i'
      'left join tb_produto p on p.cdproduto = i.externalcode'
      'where i.cdpedido = :cdpedido')
    Left = 648
    Top = 332
    ParamData = <
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object _qryUpdateStatusPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update ifood_pedidos p set'
      'p.statuspedido = :statuspedido,'
      'p.statusaceite = '#39'S'#39','
      'p.dataaceite = current_timestamp'
      'where (p.reference = :reference)')
    Left = 550
    Top = 332
    ParamData = <
      item
        Name = 'STATUSPEDIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
        Value = Null
      end
      item
        Name = 'REFERENCE'
        DataType = ftString
        ParamType = ptInput
        Size = 120
      end>
  end
  object _qryGetCdClienteCad: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select'
      '  c.cdcliente'
      'from tb_cliente c'
      'where'
      '  c.idifood  = :idifood')
    Left = 452
    Top = 332
    ParamData = <
      item
        Name = 'IDIFOOD'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object FDPhysFBDriverLink1: TFDPhysFBDriverLink
    VendorLib = 'C:\iFood\fbclient.dll'
    Left = 256
    Top = 60
  end
  object _qryGetPedidosCanc: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select p.codigo,'
      '       ip.cdpedido'
      'from ifood_polling p'
      'left join ifood_pedidos ip on p.orderid = ip.reference'
      
        'where (p.code = '#39'CAN'#39' and p.statuspedidocancelado = '#39'N'#39' and ip.c' +
        'dpedido  is not null)')
    Left = 354
    Top = 400
  end
  object _qryPolling_Correlation: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select i.codigo,'
      '       i.id,'
      '       i.code,'
      '       i.orderId,'
      '       i.createdat,'
      '       i.dt_hr_sis'
      'from ifood_polling i'
      'where i.orderId = :orderId')
    Left = 256
    Top = 400
    ParamData = <
      item
        Name = 'ORDERID'
        DataType = ftLargeint
        ParamType = ptInput
        Value = Null
      end>
  end
  object _qryInsertPagamentos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '  insert into ifood_pagamentos ('
      '    cdpedido,'
      '    method,'
      '    name,'
      '    prepaid,'
      '    "TYPE",'
      '    "VALUE")'
      '  values ('
      '    :cdpedido,'
      '    :method,'
      '    :name,'
      '    :prepaid,'
      '    :"TYPE",'
      '    :"VALUE");')
    Left = 158
    Top = 400
    ParamData = <
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'METHOD'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'NAME'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'PREPAID'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'TYPE'
        IsCaseSensitive = True
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'VALUE'
        IsCaseSensitive = True
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end>
  end
  object _qryListaPagamentos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select'
      '  p.cdpagamento,'
      '  p.cdpedido,'
      '  p.method,'
      '  p.name,'
      '  p.prepaid,'
      '  p."TYPE",'
      '  p."VALUE"'
      'from ifood_pagamentos p'
      'where p.cdpedido = :cdpedido')
    Left = 60
    Top = 400
    ParamData = <
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object _qryGetSeqDelivery: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'SELECT SEQDELIVERY FROM SP_GET_SEQDELIVERY (:DATA)')
    Left = 452
    Top = 468
    ParamData = <
      item
        Name = 'DATA'
        DataType = ftTimeStamp
        ParamType = ptInput
        Value = Null
      end>
  end
  object _qryInsertProduto: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'insert into tb_produto('
      '  cdproduto,'
      '  descricao,'
      '  descricaobase,'
      '  statusativo)'
      'values ('
      '  :cdproduto,'
      '  :descricao,'
      '  :descricao,'
      '  '#39'S'#39')')
    Left = 60
    Top = 604
    ParamData = <
      item
        Name = 'CDPRODUTO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        ParamType = ptInput
        Size = 120
      end>
  end
  object _qryDeleteProdLocal: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'delete from tb_produto;')
    Left = 746
    Top = 536
  end
  object _qryUpdateStatusPedidoEntrega: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update ifood_pedidos p set'
      'p.statuspedido = :statuspedido,'
      'p.statusentrega = '#39'S'#39
      'where (p.reference = :reference)')
    Left = 648
    Top = 536
    ParamData = <
      item
        Name = 'STATUSPEDIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
        Value = Null
      end
      item
        Name = 'REFERENCE'
        DataType = ftString
        ParamType = ptInput
        Size = 120
      end>
  end
  object _qryUpdateStatusPedidoCancelar: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update ifood_pedidos p set'
      'p.statuspedido = :statuspedido,'
      'p.statuscancelar = '#39'S'#39
      'where (p.cdpedido = :cdpedido)')
    Left = 158
    Top = 604
    ParamData = <
      item
        Name = 'STATUSPEDIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
        Value = Null
      end
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object _qryMotivoCanc: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select'
      '  i.codigocancelamento,'
      '  i.motivocancelamento'
      'from ifood_motivocanc i'
      'where i.pedidoaceito = :pedidoaceito'
      'order by i.motivocancelamento')
    Left = 452
    Top = 604
    ParamData = <
      item
        Name = 'PEDIDOACEITO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
        Value = Null
      end>
  end
  object _qryAtualizaPedido: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update ifood_pedidos set'
      '  cdcliente = :cdcliente,'
      '  cdloja_gconnect = :cdloja_gconnect,'
      '  changefor = :changefor,'
      '  createdat = :createdat,'
      '  deliveryfee = :deliveryfee,'
      '  id = :id,'
      '  nomeloja = :nomeloja,'
      '  statuspedido = :statuspedido,'
      '  subtotal = :subtotal,'
      '  taxaadicional = :taxaadicional, '
      '  tipoentrega = :tipoentrega,'
      '  totalprice = :totalprice'
      'where cdpedido = :cdpedido')
    Left = 354
    Top = 604
    ParamData = <
      item
        Name = 'CDCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CDLOJA_GCONNECT'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CHANGEFOR'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Name = 'CREATEDAT'
        DataType = ftString
        ParamType = ptInput
        Size = 120
      end
      item
        Name = 'DELIVERYFEE'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Size = 120
      end
      item
        Name = 'NOMELOJA'
        DataType = ftString
        ParamType = ptInput
        Size = 255
      end
      item
        Name = 'STATUSPEDIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'SUBTOTAL'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Name = 'TAXAADICIONAL'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Name = 'TIPOENTREGA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'TOTALPRICE'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object _qryInsertPedidobck: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '  insert into ifood_pedidos ('
      '    cdcliente,'
      '    changefor,'
      '    createdat,'
      '    datapedido,'
      '    deliveryfee,'
      '    id,'
      '    seqdelivery,'
      '    statuspedido,'
      '    reference,'
      '    shortreference,'
      '    subtotal,'
      '    totalprice)'
      '  values ('
      '    :cdcliente,'
      '    :changefor,'
      '    :createdat,'
      '    :datapedido,'
      '    :deliveryfee,'
      '    :id,'
      '    :seqdelivery,'
      '    :statuspedido,'
      '    :reference,'
      '    :shortreference,'
      '    :subtotal,'
      '    :totalprice);')
    Left = 256
    Top = 604
    ParamData = <
      item
        Name = 'CDCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CHANGEFOR'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Name = 'CREATEDAT'
        DataType = ftString
        ParamType = ptInput
        Size = 120
      end
      item
        Name = 'DATAPEDIDO'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Name = 'DELIVERYFEE'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Size = 120
      end
      item
        Name = 'SEQDELIVERY'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'STATUSPEDIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'REFERENCE'
        DataType = ftString
        ParamType = ptInput
        Size = 120
      end
      item
        Name = 'SHORTREFERENCE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'SUBTOTAL'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Name = 'TOTALPRICE'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end>
  end
  object _qryInsertImpressora: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '  insert into impressoras ('
      '    "BUFFER",'
      '    cdimpressora,'
      '    colunas,'
      '    controleporta,'
      '    cortarpapel,'
      '    espacoentrelinhas,'
      '    host,'
      '    ignorartags,'
      '    linhaspular,'
      '    modelo,'
      '    pagcodigo,'
      '    paramsstring,'
      '    porta,'
      '    setor,'
      '    statusativo,'
      '    traduzirtags)'
      '  values ('
      '    :"BUFFER",'
      '    :cdimpressora,'
      '    :colunas,'
      '    :controleporta,'
      '    :cortarpapel,'
      '    :espacoentrelinhas,'
      '    :host,'
      '    :ignorartags,'
      '    :linhaspular,'
      '    :modelo,'
      '    :pagcodigo,'
      '    :paramsstring,'
      '    :porta,'
      '    :setor,'
      '    :statusativo,'
      '    :traduzirtags);')
    Left = 550
    Top = 536
    ParamData = <
      item
        Name = 'BUFFER'
        IsCaseSensitive = True
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CDIMPRESSORA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'COLUNAS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CONTROLEPORTA'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'CORTARPAPEL'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'ESPACOENTRELINHAS'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'HOST'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'IGNORARTAGS'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'LINHASPULAR'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'MODELO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'PAGCODIGO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'PARAMSSTRING'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'PORTA'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'SETOR'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'STATUSATIVO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'TRADUZIRTAGS'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end>
  end
  object _qryAtualizaPedidoIntegrado: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update ifood_pedidos set'
      '  statuspedidointegrado = :statuspedidointegrado'
      'where cdpedido = :cdpedido')
    Left = 60
    Top = 536
    ParamData = <
      item
        Name = 'STATUSPEDIDOINTEGRADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
        Value = Null
      end
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object _qryUpdateStatusPedidoAceiteAut: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update ifood_pedidos p set'
      'p.statusaceite = '#39'S'#39','
      'p.statuspedido = '#39'PEA'#39','
      'p.dataaceite = current_timestamp'
      'where (p.cdpedido = :cdpedido)')
    Left = 746
    Top = 468
    ParamData = <
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object _qryGetStatusPedidos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select t.cdpedido,'
      '       t.cdpedidogcom,'
      '       t.reference'
      'from ifood_pedidos t'
      
        'where (t.datapedido between :pdatainicial and :pdatafinal and t.' +
        'statuspedido = '#39'PEA'#39' and t.cdpedidogcom is not null) or'
      
        '      (t.datapedido between :pdatainicial and :pdatafinal and t.' +
        'statuspedido = '#39'PDE'#39' and t.cdpedidogcom is not null)')
    Left = 648
    Top = 468
    ParamData = <
      item
        Name = 'PDATAINICIAL'
        DataType = ftTimeStamp
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PDATAFINAL'
        DataType = ftTimeStamp
        ParamType = ptInput
      end>
  end
  object _qryAtualizaStatusFinal: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update ifood_pedidos p set'
      'p.statuspedido = :statuspedido'
      'where (p.cdpedido = :cdpedido)')
    Left = 550
    Top = 468
    ParamData = <
      item
        Name = 'STATUSPEDIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
        Value = Null
      end
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object _qryPedidosNaoAceito: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select t.cdpedido'
      'from ifood_pedidos t'
      
        'where t.datapedido between :pdatainicial and :pdatafinal and t.s' +
        'tatuspedido = '#39'PNA'#39)
    Left = 452
    Top = 536
    ParamData = <
      item
        Name = 'PDATAINICIAL'
        DataType = ftTimeStamp
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'PDATAFINAL'
        DataType = ftTimeStamp
        ParamType = ptInput
      end>
  end
  object _qryPagamentosExport: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select'
      '  pg.method,'
      '  pg.name formapagamento,'
      '  pg.prepaid,'
      '  pg."TYPE",'
      '  pg."VALUE" valorpagamento'
      'from ifood_pagamentos pg'
      'where pg.cdpedido = :cdpedido')
    Left = 354
    Top = 536
    ParamData = <
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object _qryInsertLogs: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '  insert into logs ('
      '    cdpedido,'
      '    acao,'
      '    enviado,'
      '    nomeservico,'
      '    statuslog,'
      '    tipochamada,'
      '    recebido)'
      '  values ('
      '    :cdpedido,'
      '    :acao,'
      '    :enviado,'
      '    :nomeservico,'
      '    :statuslog,'
      '    :tipochamada,'
      '    :recebido);')
    Left = 256
    Top = 536
    ParamData = <
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'ENVIADO'
        DataType = ftMemo
        ParamType = ptInput
      end
      item
        Name = 'NOMESERVICO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'STATUSLOG'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'TIPOCHAMADA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'RECEBIDO'
        DataType = ftMemo
        ParamType = ptInput
      end>
  end
  object _qryListaLogs: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select l.acao,'
      '       l.enviado,'
      '       l.recebido,'
      '       l.datahora'
      'from logs l'
      'where l.cdpedido = :cdpedido'
      'order by l.datahora desc')
    Left = 158
    Top = 536
    ParamData = <
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object _qryInsertPedido_ZAP: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '  insert into ifood_pedidos ('
      '    cdpedido,'
      '    cdloja_gconnect,'
      '    cdintegracao,'
      '    cdcliente,'
      '    cdpagamento,'
      '    changefor,'
      '    datapedido,'
      '    dataaceite,'
      '    deliveryfee,'
      '    nomeloja,'
      '    seqdelivery,'
      '    statuspedido,'
      '    statuspedidointegrado,'
      '    subtotal,'
      '    tipoentrega,'
      '    totalprice)'
      '  values ('
      '    :cdpedido,'
      '    :cdloja_gconnect,'
      '    1,'
      '    :cdcliente,'
      '    :cdpagamento,'
      '    :changefor,'
      '    :datapedido,'
      '    :dataaceite,'
      '    :deliveryfee,'
      '    :nomeloja,'
      '    :seqdelivery,'
      '    :statuspedido,'
      '    '#39'S'#39','
      '    :subtotal,'
      '    :tipoentrega,'
      '    :totalprice)')
    Left = 648
    Top = 128
    ParamData = <
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CDLOJA_GCONNECT'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CDCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'CDPAGAMENTO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CHANGEFOR'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Name = 'DATAPEDIDO'
        DataType = ftTimeStamp
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'DATAACEITE'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Name = 'DELIVERYFEE'
        DataType = ftCurrency
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'NOMELOJA'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'SEQDELIVERY'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'STATUSPEDIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
      end
      item
        Name = 'SUBTOTAL'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Name = 'TIPOENTREGA'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'TOTALPRICE'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end>
  end
  object _qryInsertPedidoItens_ZAP: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '  insert into ifood_pedidos_itens ('
      '    cdpedido,'
      '    externalcode,'
      '    externalcode_pai,'
      '    name,'
      '    isauxiliar,'
      '    nritem,'
      '    observations,'
      '    quantity,'
      '    discount,'
      '    price,'
      '    statusintegrado,'
      '    totalprice)'
      '  values ('
      '    :cdpedido,'
      '    :externalcode,'
      '    :externalcode_pai,'
      '    :name,'
      '    :isauxiliar,'
      '    :nritem,'
      '    :observations,'
      '    :quantity,'
      '    :discount,'
      '    :price,'
      '    :statusintegrado,'
      '    :totalprice);')
    Left = 550
    Top = 128
    ParamData = <
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'EXTERNALCODE'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'EXTERNALCODE_PAI'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'NAME'
        DataType = ftString
        ParamType = ptInput
        Size = 120
      end
      item
        Name = 'ISAUXILIAR'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'NRITEM'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'OBSERVATIONS'
        DataType = ftString
        ParamType = ptInput
        Size = 255
      end
      item
        Name = 'QUANTITY'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'DISCOUNT'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Name = 'PRICE'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Name = 'STATUSINTEGRADO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'TOTALPRICE'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end>
  end
  object _qryInsertClienteZAP: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'insert into tb_cliente('
      '  cdcliente,'
      '  bairro,'
      '  cep,'
      '  cdmunicipio,'
      '  cduf,'
      '  cidade,'
      '  complementoendereco,'
      '  cpf,'
      '  fisica_juridica,'
      '  fonecel,'
      '  logradouro,'
      '  nome,'
      '  nrendereco,'
      '  pontoreferencia,'
      '  statusativo)'
      'values('
      '  :cdcliente,'
      '  :bairro,'
      '  :cep,'
      '  :cdmunicipio,'
      '  :cduf,'
      '  :cidade,'
      '  :complementoendereco,'
      '  :cpf,'
      '  '#39'F'#39','
      '  :fonecel,'
      '  :logradouro,'
      '  :nome,'
      '  :nrendereco,'
      '  :pontoreferencia,'
      '  '#39'S'#39')'
      '')
    Left = 452
    Top = 128
    ParamData = <
      item
        Name = 'CDCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
        Value = Null
      end
      item
        Name = 'CEP'
        ParamType = ptInput
      end
      item
        Name = 'CDMUNICIPIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CDUF'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'COMPLEMENTOENDERECO'
        ParamType = ptInput
      end
      item
        Name = 'CPF'
        DataType = ftString
        ParamType = ptInput
        Size = 11
      end
      item
        Name = 'FONECEL'
        ParamType = ptInput
      end
      item
        Name = 'LOGRADOURO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'NRENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'PONTOREFERENCIA'
        ParamType = ptInput
      end>
  end
  object _qryGetClienteCad: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select c.cdcliente from tb_cliente c'
      'where c.cdcliente = :cdcliente')
    Left = 354
    Top = 128
    ParamData = <
      item
        Name = 'CDCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object _qryInsertLoja: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '  insert into loja ('
      '    cdloja_gconnect,'
      '    id,'
      '    nomecorporacao,'
      '    nomeloja,'
      '    statuslojaprincipal)'
      '  values ('
      '    :cdloja_gconnect,'
      '    :id,'
      '    :nomecorporacao,'
      '    :nomeloja,'
      '    :statuslojaprincipal);')
    Left = 256
    Top = 196
    ParamData = <
      item
        Name = 'CDLOJA_GCONNECT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Size = 255
        Value = Null
      end
      item
        Name = 'NOMECORPORACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 255
      end
      item
        Name = 'NOMELOJA'
        DataType = ftString
        ParamType = ptInput
        Size = 255
      end
      item
        Name = 'STATUSLOJAPRINCIPAL'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end>
  end
  object _qryDadosLoja: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select cdloja,'
      '       cdloja_gconnect,'
      '       id,'
      '       nomecorporacao,'
      '       nomeloja,'
      '       statuslojaprincipal'
      'from loja')
    Left = 158
    Top = 196
  end
  object _qryUpdateLoja: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update loja'
      'set cdloja_gconnect = :cdloja_gconnect,'
      '    statuslojaprincipal = :statuslojaprincipal'
      'where (cdloja = :cdloja);')
    Left = 60
    Top = 196
    ParamData = <
      item
        Name = 'CDLOJA_GCONNECT'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'STATUSLOJAPRINCIPAL'
        DataType = ftString
        ParamType = ptInput
        Size = 1
      end
      item
        Name = 'CDLOJA'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object _qryListaLogsGeral: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select acao,'
      '       enviado,'
      '       recebido,'
      '       datahora,'
      '       nomeservico,'
      '       statuslog,'
      '       tipochamada'
      
        'from sppesquisalogs(:poperacao,:pdatainicial,:pdatafinal,:ptipoc' +
        'hamada)')
    Left = 746
    Top = 128
    ParamData = <
      item
        Name = 'POPERACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
        Value = Null
      end
      item
        Name = 'PDATAINICIAL'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Name = 'PDATAFINAL'
        DataType = ftTimeStamp
        ParamType = ptInput
      end
      item
        Name = 'PTIPOCHAMADA'
        DataType = ftInteger
        ParamType = ptInput
      end>
    object _qryListaLogsGeralACAO: TStringField
      FieldName = 'ACAO'
      Origin = 'ACAO'
      Required = True
      Size = 60
    end
    object _qryListaLogsGeralENVIADO: TMemoField
      FieldName = 'ENVIADO'
      Origin = 'ENVIADO'
      BlobType = ftMemo
    end
    object _qryListaLogsGeralRECEBIDO: TMemoField
      FieldName = 'RECEBIDO'
      Origin = 'RECEBIDO'
      BlobType = ftMemo
    end
    object _qryListaLogsGeralDATAHORA: TSQLTimeStampField
      FieldName = 'DATAHORA'
      Origin = 'DATAHORA'
      Required = True
    end
    object _qryListaLogsGeralNOMESERVICO: TStringField
      FieldName = 'NOMESERVICO'
      Origin = 'NOMESERVICO'
      Size = 60
    end
    object _qryListaLogsGeralSTATUSLOG: TStringField
      FieldName = 'STATUSLOG'
      Origin = 'STATUSLOG'
      OnGetText = _qryListaLogsGeralSTATUSLOGGetText
      Size = 1
    end
    object _qryListaLogsGeralTIPOCHAMADA: TIntegerField
      FieldName = 'TIPOCHAMADA'
      Origin = 'TIPOCHAMADA'
      OnGetText = _qryListaLogsGeralTIPOCHAMADAGetText
    end
  end
  object _qryDeletePolling: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'delete from IFOOD_POLLING'
      'where DT_HR_SIS < :data')
    Left = 256
    Top = 128
    ParamData = <
      item
        Name = 'DATA'
        ParamType = ptInput
      end>
  end
  object _qryDeleteLogs: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'delete from LOGS'
      'where DATAHORA < :data')
    Left = 550
    Top = 60
    ParamData = <
      item
        Name = 'DATA'
        ParamType = ptInput
      end>
  end
  object _qryDeletePedidos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'delete from IFOOD_PEDIDOS'
      'where DATAPEDIDO < :data')
    Left = 452
    Top = 60
    ParamData = <
      item
        Name = 'DATA'
        ParamType = ptInput
      end>
  end
  object _qryDeleteConfig: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'delete from ifood_config')
    Left = 354
    Top = 60
  end
  object _qryDeleteLoja: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'delete from loja;')
    Left = 158
    Top = 128
  end
  object _qryAtualizaPedidoIndoor: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update ifood_pedidos  set'
      '  mode = :mode,'
      '  tableindoor = :tableindoor'
      'where cdpedido = :cdpedido')
    Left = 60
    Top = 128
    ParamData = <
      item
        Name = 'MODE'
        DataType = ftString
        ParamType = ptInput
        Size = 20
        Value = Null
      end
      item
        Name = 'TABLEINDOOR'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object _qryFechamentoLoja: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update ifood_config set'
      '  dataaberturafechamento = :dataaberturafechamento,'
      '  idfechamentoloja = :idfechamentoloja,'
      '  motivofechamento = :motivofechamento'
      'where cdconfig = 1')
    Left = 746
    Top = 60
    ParamData = <
      item
        Name = 'DATAABERTURAFECHAMENTO'
        DataType = ftTimeStamp
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'IDFECHAMENTOLOJA'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'MOTIVOFECHAMENTO'
        DataType = ftString
        ParamType = ptInput
        Size = 255
      end>
  end
  object _qrySelectIDFechamento: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select idfechamentoloja'
      'from ifood_config'
      'where (cdconfig = 1);')
    Left = 648
    Top = 60
  end
  object _qryCancelarFechamento: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update ifood_config'
      'set dataaberturafechamento = null,'
      '    idfechamentoloja = null,'
      '    motivofechamento = null'
      'where (cdconfig = 1);')
    Left = 354
    Top = 196
  end
  object _qryUpddateVal_Resp_Desc: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update ifood_pedidos set'
      'responsaveldesconto = :responsaveldesconto,'
      'valordesconto = :valordesconto'
      'where cdpedido = :cdpedido')
    Left = 746
    Top = 264
    ParamData = <
      item
        Name = 'RESPONSAVELDESCONTO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
        Value = Null
      end
      item
        Name = 'VALORDESCONTO'
        DataType = ftBCD
        Precision = 18
        NumericScale = 4
        ParamType = ptInput
      end
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object _qryPolling: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select id from ifood_polling'
      'where statusackenviado = '#39'N'#39)
    Left = 648
    Top = 264
  end
  object _qryUpdatepollingEnviado: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update ifood_polling set'
      'statusackenviado = '#39'S'#39
      'where statusackenviado = '#39'N'#39)
    Left = 550
    Top = 264
  end
  object Tb_POLLING: TFDTable
    Connection = FDConnection1
    UpdateOptions.UpdateTableName = 'IFOOD_POLLING'
    TableName = 'IFOOD_POLLING'
    Left = 550
    Top = 604
  end
  object _qryGetPedidosAceitos: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select p.codigo,'
      '       p.dt_hr_sis,'
      '       ip.cdpedido'
      'from ifood_polling p'
      'left join ifood_pedidos ip on p.orderid = ip.reference'
      
        'where (p.code = '#39'CFM'#39' and p.statuspedidoaceito = '#39'N'#39' and ip.cdpe' +
        'dido  is not null)')
    Left = 452
    Top = 264
  end
  object _qryUpdateStatusPedidoAceito: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update ifood_pedidos p set'
      'p.dataaceite = :dataaceite,'
      'p.statuspedido = :statuspedido,'
      'p.statuscancelar = '#39'S'#39
      'where (p.cdpedido = :cdpedido) and (p.statuspedido = '#39'PNA'#39')')
    Left = 354
    Top = 332
    ParamData = <
      item
        Name = 'DATAACEITE'
        DataType = ftTimeStamp
        ParamType = ptInput
        Value = Null
      end
      item
        Name = 'STATUSPEDIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
        Value = Null
      end
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object _qryListaPedidoExport_Entregador: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select'
      '  p.cdpedido,'
      '  p.cdintegracao,'
      '  p.cdloja_gconnect,'
      '  p.changefor,'
      '  p.datapedido,'
      '  p.dataaceite,'
      '  p.deliverydatetimeend,'
      '  p.deliveryfee,'
      '  p.nomeloja,'
      '  p.obs,'
      '  p.reference,'
      '  p.seqdelivery,'
      '  p.shortreference,'
      '  p.subtotal,'
      '  p.tipoentrega,'
      '  p.totalprice,'
      '  p.valordesconto,'
      '  i.externalcode,'
      '  i.externalcode_pai,'
      '  coalesce(pr.descricao, i.name) name,'
      '  i.isauxiliar,'
      '  i.nritem,'
      '  i.observations,'
      '  i.quantity,'
      '  i.discount,'
      '  i.price,'
      '  i.totalprice totalprice_item,'
      '  i.statusintegrado,'
      '  c.cdcliente,'
      '  c.cpf,'
      '  c.nome,'
      '  c.idifood,'
      '  c.foneifood,'
      '  c.email,'
      '  c.logradouro,'
      '  c.nrendereco,'
      '  c.cidade,'
      '  u.siglauf,'
      '  c.bairro,'
      '  c.complementoendereco,'
      '  c.cep,'
      '  c.pontoreferencia,'
      '  c.latitude,'
      '  c.longitude'
      'from ifood_pedidos p'
      'join ifood_pedidos_itens i on p.cdpedido = i.cdpedido'
      'left join tb_produto pr on pr.cdproduto = i.externalcode'
      'join tb_cliente c on c.cdcliente = p.cdcliente'
      'join uf u on u.cduf = c.cduf'
      'where i.cdpedido = :cdpedido '
      'order by i.seq')
    Left = 256
    Top = 332
    ParamData = <
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object _qryInsertClienteIfood: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'insert into tb_cliente('
      '  bairro,'
      '  cdmunicipio,'
      '  cduf,'
      '  cep,'
      '  cidade,'
      '  complementoendereco,'
      '  cpf,'
      '  fisica_juridica,'
      '  foneifood,'
      '  idifood,'
      '  logradouro,'
      '  nome,'
      '  nrendereco,'
      '  phone_localizer,'
      '  pontoreferencia,'
      '  statusativo,'
      '  uuidifood)'
      'values('
      '  :bairro,'
      '  :cdmunicipio,'
      '  :cduf,'
      '  :cep,'
      '  :cidade,'
      '  :complementoendereco,'
      '  :cpf,'
      '  '#39'F'#39','
      '  :foneifood,'
      '  :idifood,'
      '  :logradouro,'
      '  :nome,'
      '  :nrendereco,'
      '  :phone_localizer,'
      '  :pontoreferencia,'
      '  '#39'S'#39','
      '  :uuidifood)')
    Left = 158
    Top = 332
    ParamData = <
      item
        Name = 'BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
        Value = Null
      end
      item
        Name = 'CDMUNICIPIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CDUF'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'COMPLEMENTOENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'CPF'
        DataType = ftString
        ParamType = ptInput
        Size = 14
      end
      item
        Name = 'FONEIFOOD'
        DataType = ftString
        ParamType = ptInput
        Size = 120
      end
      item
        Name = 'IDIFOOD'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'LOGRADOURO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'NRENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'PHONE_LOCALIZER'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'PONTOREFERENCIA'
        DataType = ftString
        ParamType = ptInput
        Size = 70
      end
      item
        Name = 'UUIDIFOOD'
        DataType = ftString
        ParamType = ptInput
        Size = 120
      end>
  end
  object _qryUpdateClienteIfood: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      '  update tb_cliente'
      '  set bairro = :bairro,'
      '      cdmunicipio = :cdmunicipio,'
      '      cduf = :cduf,'
      '      cep = :cep,'
      '      cidade = :cidade,'
      '      complementoendereco = :complementoendereco,'
      '      cpf = :cpf,'
      '      fisica_juridica = '#39'F'#39','
      '      foneifood = :foneifood,'
      '      idifood = :idifood,'
      '      logradouro = :logradouro,'
      '      nome = :nome,'
      '      nrendereco = :nrendereco,'
      '      phone_localizer = :phone_localizer,'
      '      pontoreferencia = :pontoreferencia,'
      '      statusativo = '#39'S'#39','
      '      uuidifood = :uuidifood'
      '  where (cdcliente = :cdcliente);')
    Left = 60
    Top = 332
    ParamData = <
      item
        Name = 'BAIRRO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
        Value = Null
      end
      item
        Name = 'CDMUNICIPIO'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'CDUF'
        DataType = ftString
        ParamType = ptInput
        Size = 2
      end
      item
        Name = 'CEP'
        DataType = ftString
        ParamType = ptInput
        Size = 8
      end
      item
        Name = 'CIDADE'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'COMPLEMENTOENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'CPF'
        DataType = ftString
        ParamType = ptInput
        Size = 11
      end
      item
        Name = 'FONEIFOOD'
        DataType = ftString
        ParamType = ptInput
        Size = 120
      end
      item
        Name = 'IDIFOOD'
        DataType = ftInteger
        ParamType = ptInput
      end
      item
        Name = 'LOGRADOURO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'NOME'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'NRENDERECO'
        DataType = ftString
        ParamType = ptInput
        Size = 60
      end
      item
        Name = 'PHONE_LOCALIZER'
        DataType = ftString
        ParamType = ptInput
        Size = 20
      end
      item
        Name = 'PONTOREFERENCIA'
        DataType = ftString
        ParamType = ptInput
        Size = 70
      end
      item
        Name = 'UUIDIFOOD'
        DataType = ftString
        ParamType = ptInput
        Size = 120
      end
      item
        Name = 'CDCLIENTE'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object _qryListaPedidoExport: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select'
      '  p.cdpedido,'
      '  p.cdcliente,'
      '  p.cdintegracao,'
      '  p.cdloja_gconnect,'
      '  p.changefor,'
      '  p.datapedido,'
      '  p.dataaceite,'
      '  p.deliverydatetimestart,'
      '  p.deliverydatetimeend,'
      '  p.deliveryfee,'
      '  p.nomeloja,'
      '  p.obs,'
      '  p.reference,'
      '  p.seqdelivery,'
      '  p.shortreference,'
      '  p.subtotal,'
      '  p.tableindoor,'
      '  p.taxaadicional,'
      '  p.tipoentrega,'
      '  p.totalprice,'
      '  i.externalcode,'
      '  i.externalcode_pai,'
      '  coalesce(pr.descricao, i.name) name,'
      '  i.isauxiliar,'
      '  i.nritem,'
      '  i.observations,'
      '  i.quantity,'
      '  i.discount,'
      '  i.price,'
      '  i.totalprice totalprice_item,'
      '  i.statusintegrado,'
      '  c.cdcliente,'
      '  c.cpf,'
      '  c.nome,'
      '  c.idifood,'
      '  c.foneifood,'
      '  c.email,'
      '  c.logradouro,'
      '  c.nrendereco,'
      '  c.cidade,'
      '  u.siglauf,'
      '  c.bairro,'
      '  c.complementoendereco,'
      '  c.cep,'
      '  c.phone_localizer,'
      '  c.pontoreferencia,'
      '  c.latitude,'
      '  c.longitude'
      'from ifood_pedidos p'
      'join ifood_pedidos_itens i on p.cdpedido = i.cdpedido'
      'left join tb_produto pr on pr.cdproduto = i.externalcode'
      'join tb_cliente c on c.cdcliente = p.cdcliente'
      'join uf u on u.cduf = c.cduf'
      'where i.cdpedido = :cdpedido and i.statusintegrado = '#39'S'#39
      'order by i.seq')
    Left = 746
    Top = 196
    ParamData = <
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
  end
  object _qryAtualizaNrGenerator: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      
        'select pvalor from sp_atualizanr_generator(:poperacao,:nomegener' +
        'ator,:pnumero)')
    Left = 648
    Top = 196
    ParamData = <
      item
        Name = 'POPERACAO'
        DataType = ftString
        ParamType = ptInput
        Size = 1
        Value = Null
      end
      item
        Name = 'NOMEGENERATOR'
        DataType = ftString
        ParamType = ptInput
        Size = 50
        Value = Null
      end
      item
        Name = 'PNUMERO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object _qryGetPedidosConfirmados: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select p.codigo,'
      '       ip.cdpedido'
      'from ifood_polling p'
      'left join ifood_pedidos ip on p.orderid = ip.reference'
      
        'where (p.code = '#39'CON'#39' and p.statuspedidoconfirmado = '#39'N'#39' and ip.' +
        'cdpedido  is not null)')
    Left = 550
    Top = 196
  end
  object _qryUpdateStatusPedidoConfirmado: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update ifood_pedidos p set'
      'p.statuspedido = :statuspedido,'
      'p.statuscancelar = '#39'N'#39
      'where (p.cdpedido = :cdpedido)')
    Left = 452
    Top = 196
    ParamData = <
      item
        Name = 'STATUSPEDIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
        Value = Null
      end
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object _qrySQL: TFDQuery
    Connection = FDConnection1
    Left = 354
    Top = 264
  end
  object _qryCdLoja_by_MerchanID: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select cdloja_gconnect'
      'from loja'
      'where id = :id')
    Left = 256
    Top = 264
    ParamData = <
      item
        Name = 'ID'
        DataType = ftString
        ParamType = ptInput
        Size = 255
        Value = Null
      end>
  end
  object _qryUpdateStatusPedidoRetirado: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'update ifood_pedidos p set'
      'p.statuspedido = :statuspedido,'
      'p.statuscancelar = '#39'N'#39
      'where (p.cdpedido = :cdpedido)')
    Left = 158
    Top = 264
    ParamData = <
      item
        Name = 'STATUSPEDIDO'
        DataType = ftString
        ParamType = ptInput
        Size = 3
        Value = Null
      end
      item
        Name = 'CDPEDIDO'
        DataType = ftInteger
        ParamType = ptInput
      end>
  end
  object _qryGetPedidosRetirados: TFDQuery
    Connection = FDConnection1
    SQL.Strings = (
      'select p.codigo,'
      '       ip.cdpedido'
      'from ifood_polling p'
      'left join ifood_pedidos ip on p.orderid = ip.reference'
      
        'where (p.code = '#39'RTP'#39' and p.statuspedidoretirado = '#39'N'#39' and ip.cd' +
        'pedido  is not null)')
    Left = 60
    Top = 264
  end
end
