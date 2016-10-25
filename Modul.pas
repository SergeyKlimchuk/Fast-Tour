unit Modul;

interface

uses
  System.SysUtils, System.Classes, sSkinManager, Vcl.ExtCtrls, Data.DB,
  Data.Win.ADODB, Vcl.Forms, Vcl.Dialogs, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdCustomTransparentProxy, IdSocks, IdMessage, sDialogs,
  acAlphaHints, IdAttachment;

type
  TDataModule2 = class(TDataModule)
    sSkinManager1: TsSkinManager;
    Reg_Query: TADOQuery;
    Reg_Table: TADOTable;
    Connect_to_DB: TADOConnection;
    Air_Query: TADOQuery;
    IdMessage1: TIdMessage;
    IdSMTP1: TIdSMTP;
    IdSocksInfo1: TIdSocksInfo;
    IdSSLIOHandlerSocketOpenSSL1: TIdSSLIOHandlerSocketOpenSSL;
    sAlphaHints1: TsAlphaHints;
    sOpenDialog1: TsOpenDialog;
    Hotel_Query: TADOQuery;
    Basket_Query: TADOQuery;
    Buffer: TADOQuery;
    Purchases_Query: TADOQuery;
    Tour_Query: TADOQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    const
      KZT= 333;
      USD= 1;
      EUR= 0.89;
      RUB= 62;
      AUD= 1.32;
      GBP= 0.79;
      DKK= 6.65;
      AED= 3.67;
    Procedure REFRESH_BASKET;
    Function CHECK_RecordCount(Index: Integer):String;
  end;

var
  DataModule2: TDataModule2;
  LNG:AnsiString;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses AirTicket, Hotel, Tour;

{$R *.dfm}

Procedure TDataModule2.REFRESH_BASKET;
Var
  S: String;
  I: Integer;
Begin
I:= DataModule2.Basket_Query.RecordCount;
S:= 'В вашей корзине: ';
if (I in [1, 21, 31, 41]) then
  S:= S + IntToStr(I) + ' товар!';
if (I in [2..4, 22..24, 32..34, 42..44]) then
  S:= S + IntToStr(I) + ' товара!';
if (I in [5..10, 25..30, 35..40, 45..50]) then
  S:= S + IntToStr(I) + ' товаров!';
if (I = 0) then
    S:= 'Нет товаров!';
Form6.Label_Basket_Count.Caption:=  S;
Form7.Label_Basket_Count.Caption:=  S;
Form11.Label_Basket_Count.Caption:= S;
End;

Function TDataModule2.CHECK_RecordCount(Index: Integer):String;
Var
  Number, Str: String;
Begin
Number:= IntToStr(Index);
if (Index = 0) then
  Str:= 'По вашему запросу не было найдено записей!'
else
  Str:= 'По вашему запросу было найден';
if (Number[Number.length] = '1') and (Index <> 11) then
  Str:= Str + 'а: ' + Number + ' запись!';
if (Number[Number.length] in ['2'..'4']) then
  Str:= Str + 'о: ' + Number + ' записи!';
if (Number[Number.length] in ['5'..'9', '0']) then
  Str:= Str + 'о: ' + Number + ' записей!';
Result:= Str;
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

end.
