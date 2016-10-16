object DataModule2: TDataModule2
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 406
  Width = 597
  object sSkinManager1: TsSkinManager
    Active = False
    InternalSkins = <>
    SkinDirectory = 
      'C:\Users\'#1057#1077#1088#1075#1077#1081'\Desktop\Fast Tour\Fast tour RELOAD\Win32\Release' +
      '\Style'
    SkinName = 'gplus'
    SkinInfo = 'N/A'
    ThirdParty.ThirdEdits = ' '
    ThirdParty.ThirdButtons = 'TButton'
    ThirdParty.ThirdBitBtns = ' '
    ThirdParty.ThirdCheckBoxes = ' '
    ThirdParty.ThirdGroupBoxes = ' '
    ThirdParty.ThirdListViews = ' '
    ThirdParty.ThirdPanels = ' '
    ThirdParty.ThirdGrids = ' '
    ThirdParty.ThirdTreeViews = ' '
    ThirdParty.ThirdComboBoxes = ' '
    ThirdParty.ThirdWWEdits = ' '
    ThirdParty.ThirdVirtualTrees = ' '
    ThirdParty.ThirdGridEh = ' '
    ThirdParty.ThirdPageControl = ' '
    ThirdParty.ThirdTabControl = ' '
    ThirdParty.ThirdToolBar = ' '
    ThirdParty.ThirdStatusBar = ' '
    ThirdParty.ThirdSpeedButton = ' '
    ThirdParty.ThirdScrollControl = ' '
    ThirdParty.ThirdUpDown = ' '
    ThirdParty.ThirdScrollBar = ' '
    ThirdParty.ThirdStaticText = ' '
    ThirdParty.ThirdNativePaint = ' '
    Left = 384
    Top = 296
  end
  object Reg_Query: TADOQuery
    Connection = Connect_to_DB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'SELECT * FROM LogPass')
    Left = 544
    Top = 24
  end
  object Reg_Table: TADOTable
    Connection = Connect_to_DB
    CursorType = ctStatic
    TableName = 'LogPass'
    Left = 544
    Top = 72
  end
  object Reg_DS_Q: TDataSource
    DataSet = Reg_Query
    Left = 512
    Top = 24
  end
  object Reg_DS_T: TDataSource
    DataSet = Reg_Query
    Left = 512
    Top = 72
  end
  object Connect_to_DB: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\Users\'#1057#1077#1088#1075#1077#1081'\Des' +
      'ktop\DB\Win32\Debug\DB\Test.mdb;Persist Security Info=False;'
    LoginPrompt = False
    Mode = cmShareDenyNone
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 293
    Top = 168
  end
  object Air_DS_Q: TDataSource
    DataSet = Air_Query
    Left = 61
    Top = 16
  end
  object Air_Query: TADOQuery
    Connection = Connect_to_DB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Air_Ticket')
    Left = 29
    Top = 16
  end
  object IdMessage1: TIdMessage
    AttachmentEncoding = 'UUE'
    BccList = <>
    CCList = <>
    Encoding = meDefault
    FromList = <
      item
      end>
    Recipients = <>
    ReplyTo = <>
    ConvertPreamble = True
    Left = 496
    Top = 320
  end
  object IdSMTP1: TIdSMTP
    SASLMechanisms = <>
    Left = 496
    Top = 352
  end
  object IdSocksInfo1: TIdSocksInfo
    Left = 496
    Top = 256
  end
  object IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL
    MaxLineAction = maException
    Port = 0
    DefaultPort = 0
    SSLOptions.Mode = sslmUnassigned
    SSLOptions.VerifyMode = []
    SSLOptions.VerifyDepth = 0
    Left = 496
    Top = 288
  end
  object sAlphaHints1: TsAlphaHints
    Templates = <>
    TemplateName = 'Test'
    SkinSection = 'HINT'
    Left = 384
    Top = 326
  end
  object sOpenDialog1: TsOpenDialog
    Filter = 'JPG|*.jpg|BMP|*.bmp|ALL|*.*'
    Left = 384
    Top = 358
  end
  object Hotel_Query: TADOQuery
    Connection = Connect_to_DB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Hotels')
    Left = 24
    Top = 72
  end
  object Hotel_DS_Query: TDataSource
    DataSet = Hotel_Query
    Left = 56
    Top = 72
  end
  object Basket_Query: TADOQuery
    Connection = Connect_to_DB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Basket')
    Left = 48
    Top = 296
  end
  object Buffer: TADOQuery
    Connection = Connect_to_DB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Basket')
    Left = 48
    Top = 336
  end
  object Purchases_Query: TADOQuery
    Connection = Connect_to_DB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Purchases')
    Left = 168
    Top = 296
  end
  object Tour_Query: TADOQuery
    Connection = Connect_to_DB
    CursorType = ctStatic
    Parameters = <>
    SQL.Strings = (
      'Select * from Tours as T;')
    Left = 168
    Top = 344
  end
end
