object Form1: TForm1
  Left = 0
  Top = 0
  Caption = 'Form1'
  ClientHeight = 465
  ClientWidth = 920
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  object Button1: TButton
    Left = 0
    Top = 0
    Width = 920
    Height = 25
    Align = alTop
    Caption = 'Button1'
    TabOrder = 0
    OnClick = Button1Click
  end
  object memoLog: TRichEdit
    Left = 0
    Top = 224
    Width = 920
    Height = 241
    Align = alBottom
    Font.Charset = ANSI_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Segoe UI'
    Font.Style = []
    Lines.Strings = (
      'RichEdit1')
    ParentFont = False
    TabOrder = 1
  end
  object WebBrowser1: TWebBrowser
    Left = 0
    Top = 25
    Width = 920
    Height = 199
    Align = alClient
    TabOrder = 2
    SelectedEngine = EdgeOnly
    ExplicitLeft = 344
    ExplicitTop = 112
    ExplicitWidth = 300
    ExplicitHeight = 150
    ControlData = {
      4C000000165F0000911400000000000000000000000000000000000000000000
      000000004C000000000000000000000001000000E0D057007335CF11AE690800
      2B2E12620A000000000000004C0000000114020000000000C000000000000046
      8000000000000000000000000000000000000000000000000000000000000000
      00000000000000000100000000000000000000000000000000000000}
  end
  object SQLConnection1: TSQLConnection
    DriverName = 'Firebird'
    LoginPrompt = False
    Params.Strings = (
      'DriverUnit=Data.DBXFirebird'
      
        'DriverPackageLoader=TDBXDynalinkDriverLoader,DbxCommonDriver280.' +
        'bpl'
      
        'DriverAssemblyLoader=Borland.Data.TDBXDynalinkDriverLoader,Borla' +
        'nd.Data.DbxCommonDriver,Version=24.0.0.0,Culture=neutral,PublicK' +
        'eyToken=91d62ebb5b0d1b1b'
      
        'MetaDataPackageLoader=TDBXFirebirdMetaDataCommandFactory,DbxFire' +
        'birdDriver280.bpl'
      
        'MetaDataAssemblyLoader=Borland.Data.TDBXFirebirdMetaDataCommandF' +
        'actory,Borland.Data.DbxFirebirdDriver,Version=24.0.0.0,Culture=n' +
        'eutral,PublicKeyToken=91d62ebb5b0d1b1b'
      'GetDriverFunc=getSQLDriverINTERBASE'
      'LibraryName=dbxfb.dll'
      'LibraryNameOsx=libsqlfb.dylib'
      'VendorLib=fbclient.dll'
      'VendorLibWin64=fbclient.dll'
      'VendorLibOsx=/Library/Frameworks/Firebird.framework/Firebird'
      'Database=15.228.46.87:/home/ubuntu/banco/cm/bcnet.fdb'
      'User_Name=sysdba'
      'Password=masternet'
      'Role=RoleName'
      'MaxBlobSize=-1'
      'LocaleCode=0000'
      'IsolationLevel=ReadCommitted'
      'SQLDialect=3'
      'CommitRetain=False'
      'WaitOnLocks=True'
      'TrimChar=False'
      'BlobSize=-1'
      'ErrorResourceFile='
      'RoleName=RoleName'
      'ServerCharSet='
      'Trim Char=False')
    Left = 56
    Top = 48
  end
  object LocalConnection1: TLocalConnection
    Left = 56
    Top = 104
  end
  object sqlDataSetVendas: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = SQLConnection1
    Left = 64
    Top = 168
  end
  object dspVendas: TDataSetProvider
    DataSet = sqlDataSetVendas
    Options = [poAllowCommandText, poUseQuoteChar]
    Left = 96
    Top = 168
  end
  object cdsVendas: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspVendas'
    RemoteServer = LocalConnection1
    Left = 128
    Top = 168
  end
  object dsVendas: TDataSource
    DataSet = cdsVendas
    Left = 160
    Top = 168
  end
end
