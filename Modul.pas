unit Modul;

interface

uses
  System.SysUtils, System.Classes, sSkinManager, Vcl.ExtCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdCustomTransparentProxy, IdSocks, IdMessage, sDialogs,
  acAlphaHints;

type
  TDataModule2 = class(TDataModule)
    sSkinManager1: TsSkinManager;
    Reg_Query: TADOQuery;
    Reg_Table: TADOTable;
    Reg_DS_Q: TDataSource;
    Reg_DS_T: TDataSource;
    Connect_to_DB: TADOConnection;
    Air_DS_Q: TDataSource;
    Air_Query: TADOQuery;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    IdSocksInfo1: TIdSocksInfo;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    sAlphaHints1: TsAlphaHints;
    sOpenDialog1: TsOpenDialog;
    Hotel_Query: TADOQuery;
    Hotel_DS_Query: TDataSource;
    Basket_Query: TADOQuery;
    Buffer: TADOQuery;
    Purchases_Query: TADOQuery;
    Tour_Query: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Send_Email(Address:String);
    Procedure REFRESH_BASKET;
  end;

var
  DataModule2: TDataModule2;
  LNG:AnsiString;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses AirTicket, Hotel;

{$R *.dfm}

Procedure TDataModule2.REFRESH_BASKET;
Var
  S: String;
Begin
if (DataModule2.Basket_Query.RecordCount > 0) then
  S:= 'В вашей корзине: ' + IntToStr(DataModule2.Basket_Query.RecordCount) + ' товаров!'
  else
    S:= 'Нет товаров!';
Form6.Label_Basket_Count.Caption:= S;
Form7.Label_Basket_Count.Caption:= S;
End;

procedure TDataModule2.DataModuleCreate(Sender: TObject);
const
  ss = 'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=%s;Persist Security Info=False';
var
  path,path0,path1: string;
begin
  path0:= ExtractFileDir(application.exename);
  path:= path0 +'\DB\DataBase.mdb';
  path1:= path0 + '\Style' ;
  sSkinManager1.SkinDirectory := path1 ;
  sSkinManager1.SkinName := 'gplus' ;
  sSkinManager1.Active := True;
  Connect_to_DB.Close;
  try
    Connect_to_DB.ConnectionString:= Format(ss, [path]);
    Connect_to_DB.Open;
    Air_Query.Active:= True;
    Reg_Query.Active:= True;
    Reg_Table.Active:= True;
    Hotel_Query.Active:= True;
    Basket_Query.Active:= True;
    Tour_Query.Active:= True;
  except
    ShowMessage('Connection Error !');
    exit;
  end;
  Connect_to_DB.Connected:= true;
end;

procedure TDataModule2.Send_Email(Address:String);
Begin

End;


end.
