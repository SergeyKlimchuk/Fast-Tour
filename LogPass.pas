unit LogPass;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Buttons, sSpeedButton, Vcl.ExtCtrls,
  sPanel, Vcl.StdCtrls, sLabel, sEdit, sBevel, Data.DB, Data.Win.ADODB,
  Vcl.Grids, Vcl.DBGrids, Vcl.DBCtrls, Vcl.ComCtrls, sRadioButton, acImage, IdAttachment,
  sButton, sBitBtn,

  IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, IdExplicitTLSClientServerBase, IdMessageClient,
  IdSMTPBase, IdSMTP, IdIOHandler, IdIOHandlerSocket, IdIOHandlerStack, IdSSL,
  IdSSLOpenSSL, IdCustomTransparentProxy, IdSocks, IdMessage, sCheckBox;

type
  TForm3 = class(TForm)
    sPanel1: TsPanel;
    sEdit1: TsEdit;
    sLabel1: TsLabel;
    sEdit2: TsEdit;
    sLabel2: TsLabel;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    sBevel1: TsBevel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sPanel2: TsPanel;
    sLabel5: TsLabel;
    sImage1: TsImage;
    sPanel3: TsPanel;
    sLabel10: TsLabel;
    sEdit3: TsEdit;
    sLabel6: TsLabel;
    sBevel2: TsBevel;
    sButton1: TsButton;
    sBitBtn1: TsBitBtn;
    sEdit4: TsEdit;
    sBevel3: TsBevel;
    sLabel7: TsLabel;
    sButton2: TsButton;
    sButton3: TsButton;
    sSpeedButton4: TsSpeedButton;
    sSpeedButton5: TsSpeedButton;
    sLabel8: TsLabel;
    sBevel4: TsBevel;
    sBevel5: TsBevel;
    sBevel6: TsBevel;
    sCheckBox1: TsCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton3MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sSpeedButton3MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure sEdit2KeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sLabel4Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure sButton3Click(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);
    procedure sSpeedButton5Click(Sender: TObject);
  private

  public
    { Public declarations }
  end;

Const
  Mail_Loggin='FastTour@yandex.ru';
  Mail_Password='1337sergo228MAGA';
  Port=465;

var
  Form3: TForm3;

  REFRESH_KODE:String;
  Mode0:Boolean=False;


  Procedure Send_Message(Email,Password:String);
  Procedure MSG_REFRESH_KODE(Mail:String);
  Function Hard_Password(sLength:Integer):String;


implementation

{$R *.dfm}

uses Registration, Main, Modul, PersonalArea, Basket;

procedure TForm3.FormClose(Sender: TObject; var Action: TCloseAction);
begin
case MessageDlg('Вы точно хотите выйти?',mtConfirmation , [mbYes,mbCancel], 0) of
mrYes:Application.Terminate;
mrCancel:Abort;
end;
end;

procedure TForm3.sBitBtn1Click(Sender: TObject);
Var
NewPassword:String;
I:Integer;
Next1:Boolean;
begin
NewPassword:=Hard_Password(10);
if mode0=False then
  Begin
  if sEdit4.Text=REFRESH_KODE then
    Begin
    Send_Message(Datamodule2.Reg_Query.Fields.Fields[5].AsString,NewPassword);
    With Datamodule2.Reg_Query do
      Begin
      Edit;
      DataModule2.Reg_Query.Fields.Fields[2].AsString:=NewPassword;
      Post;
      End;
    End;
    sPanel3.Visible:=False;
    sLabel4.Visible:=True;
    sPanel1.Visible:=True;
    sEdit3.Text:='';
    sEdit4.Text:='';
    sEdit3.Enabled:=True;
    sButton1.Enabled:=True;
    sPanel3.Height:=89;
  Showmessage('Если код востановления правильный, то мы отправим новый пароль вам на почту!');
  End;

if mode0=True then
Begin
if Datamodule2.Reg_Query.Fields.Fields[13].AsString=sEdit4.Text then
  Begin
  Send_Message(Datamodule2.Reg_Query.Fields.Fields[5].AsString,NewPassword);
  With Datamodule2.Reg_Query do
    Begin
    Edit;
    DataModule2.Reg_Query.Fields.Fields[2].AsString:=NewPassword;
    Post;
    End;
  End;
  sPanel3.Visible:=False;
  sPanel1.Visible:=True;
  sButton1.Enabled:=True;
  sEdit3.Text:='';
  sEdit4.Text:='';
  sEdit3.Enabled:=True;
  sPanel3.Height:=89;
  sLabel4.Visible:=True;
  Showmessage('Если ответ на секретный вопрос правильный то мы сгенерируем новый пароль и отправим его вам на почту!');
  end;
end;

procedure TForm3.sButton1Click(Sender: TObject);
begin
With Datamodule2.Reg_Query do
  Begin
  Active:=False;
  SQL.Clear;
  SQL.Add('SELECT * FROM LogPass Where (U_Login="'+sEdit3.Text+'") OR (U_Mail="'+sEdit3.Text+'")');
  Active:=True;
  End;

  if Datamodule2.Reg_Query.RecordCount = 1 then
  Begin
  sButton2.Enabled:= True;
  sEdit4.Text:='';
  sEdit3.Enabled:=False;
  sButton1.Enabled:=False;
  sPanel3.Height:=149;
  if DataModule2.Reg_Query.Fields.Fields[12].AsString<>'' then sSpeedButton5.Enabled:=True else sSpeedButton5.Enabled:=False;
  End
  else
  ShowMessage('Извините, но такой логин или почта не найдены!');

end;

procedure TForm3.sButton2Click(Sender: TObject);
begin
sButton2.Enabled:= False;
sEdit3.Enabled:=True;
sButton1.Enabled:=True;
sPanel3.Height:=89;
end;

procedure TForm3.sButton3Click(Sender: TObject);
begin
sPanel3.Visible:=False;
sPanel1.Visible:=True;
sEdit3.Text:='';
sEdit4.Text:='';
sEdit3.Enabled:=True;
sButton1.Enabled:=True;
sLabel4.Visible:=True;
sPanel3.Height:=89;
end;

procedure TForm3.sEdit2KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if key=13 then sSpeedButton1.OnClick(sender);
end;

procedure TForm3.sLabel4Click(Sender: TObject);
begin
sPanel3.Visible:=True;
sEdit3.Text:='';
sEdit3.Enabled:=True;
spanel1.Visible:=False;
sLabel4.Visible:=False;
sButton2.Enabled:= False;
end;

procedure TForm3.sSpeedButton1Click(Sender: TObject);
begin
With Datamodule2.Reg_Query do
  Begin
  Active:=False;
  SQL.Clear;
  SQL.Add('SELECT * FROM LogPass Where (U_Login="'+sEdit1.Text+'") AND (U_Password="'+sEdit2.Text+'")');
  Active:=True;
  End;


if (Datamodule2.Reg_Query.RecordCount = 1) then
  Begin
    DataModule2.Purchases_Query.Active:= False;
    DataModule2.Purchases_Query.SQL.Clear;
    DataModule2.Purchases_Query.SQL.Add('Select * From Purchases Where ID_Buyer=' + IntToStr(DataModule2.Reg_Query.FieldByName('ID').AsInteger));

    DataModule2.Purchases_Query.Active:= True;
    Form4.show;
    Form3.Hide;
    Form4.sLabel3.Caption:= sEdit1.Text;
    Form9.Nick_Name.Caption:= 'Вы вошли как - ' + sEdit1.Text + '!';
    Form5.sImage1.Picture.Assign(DataModule2.Reg_Query.Fields.FieldByName('U_Picture'));
    Form5.Label_Name_SecName.Caption:= DataModule2.Reg_Query.Fields.Fields[3].AsString + ' ' + DataModule2.Reg_Query.Fields.Fields[4].AsString;
    Form5.Label_Email.caption:= 'Email: ' + DataModule2.Reg_Query.Fields.Fields[5].AsString;
    Form5.Label_Sex.caption:= 'Пол: ' + DataModule2.Reg_Query.Fields.Fields[9].AsString;
    Form5.Label_Date.caption:= 'Дата рождения: ' + DataModule2.Reg_Query.Fields.Fields[10].AsString;
    Form5.sLabel15.Caption:= DataModule2.Reg_Query.Fields.Fields[6].AsString;
    sLabel3.Visible:= False;
    sBevel1.Visible:= False;
  End
  else
  Begin
  slabel3.Visible:= True;
  sBevel1.Visible:= True;
  End;
end;

procedure TForm3.sSpeedButton2Click(Sender: TObject);
begin
Form3.Hide;
Form2.Show;
end;

procedure TForm3.sSpeedButton3MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
sEdit2.PasswordChar:= #0;
end;

procedure TForm3.sSpeedButton3MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
sEdit2.PasswordChar:= '*';
end;

procedure TForm3.sSpeedButton4Click(Sender: TObject);
begin
MSG_REFRESH_KODE(Datamodule2.Reg_Query.Fields.Fields[5].AsString);
sPanel3.Height:= 209;
sLabel7.Caption:= 'Код который мы отправили вам на почту:';
Mode0:= False;
end;

procedure TForm3.sSpeedButton5Click(Sender: TObject);
begin
  case StrToInt(DataModule2.Reg_Query.Fields.Fields[12].AsString) of
  0:sLabel7.Caption:= 'Секретный вопрос: " Как звали вашего первого питомца? "';
  1:sLabel7.Caption:= 'Секретный вопрос: " Фамилия вашего любимого музыканта? "';
  2:sLabel7.Caption:= 'Секретный вопрос: " Название улицы, на которой вы выросли? "';
  3:sLabel7.Caption:= 'Секретный вопрос: " Вваш любимый киногерой? "';
  4:sLabel7.Caption:= 'Секретный вопрос: " Почтовый индекс родителей? "';
  5:sLabel7.Caption:= 'Секретный вопрос: " Марка вашей первой машины? "';
  6:sLabel7.Caption:= 'Секретный вопрос: " Фамилия вашего любимого учителя? "';
  7:sLabel7.Caption:= 'Секретный вопрос: " Ваша любимая книга в детстве? "';
  8:sLabel7.Caption:= 'Секретный вопрос: " Ваша любимая компьютерная игра? "';
  end;
sPanel3.Height:= 209;
Mode0:= True;
end;

Procedure Send_Message(Email,Password:String);
var
  ATT: TIdAttachment;
  OMessage:Tstrings;
begin
With DataModule2 do
  Begin
  IdSMTP1.Disconnect;                                          // Отключаем Smtp Для редактирования его свойств
  IdSocksInfo1.Authentication:=saNoAuthentication;             // Выставляем значение - Без аутентификации
  IdSocksInfo1.Port:=Port;                                     // Порт по которому мы будем связываться
  IdSocksInfo1.Version:=svNoSocks;                             // ...

  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method:=sslvTLSv1;
  IdSMTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
  IdSMTP1.UseTLS := utUseImplicitTLS;
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method := sslvTLSv1;
  IdSMTP1.Host := 'smtp.yandex.ru';
  IdSMTP1.Port := Port;
  IdSMTP1.AuthType := satDefault;
  IdSMTP1.UserName := Mail_Loggin;
  IdSMTP1.Password := Mail_Password;

  IdMessage1.Clear;
  IdMessage1.From.Name :='FastTour';
  IdMessage1.From.Address := Mail_Loggin;
  IdMessage1.Body.Text:='Здравствуйте, '+DataModule2.Reg_Query.Fields.Fields[3].AsString+'! Теперь у вас новый пароль: '+Password;
  //IdMessage1.Body.LoadFromFile('Index.html');
  IdMessage1.Subject:='Сброс пароля учетной записи Fast-Tour';
  idMessage1.Recipients.EMailAddresses:=Email;

  IdMessage1.ContentType:='text/html; charset=UTF-8;';

  IdSMTP1.Connect;                                             // Пытаемся подключиться...
  if IdSMTP1.Connected then IdSMTP1.Send(IdMessage1) else ShowMessage('Ахтунг, сообщение нне было отправлено!');
  IdSMTP1.Disconnect;                                          // По завершению мы отключаемся
  end;
End;

Procedure MSG_REFRESH_KODE(Mail:String);
Var
I:Integer;
Begin
randomize;
REFRESH_KODE:=Hard_Password(10);
//...
With DataModule2 do
  Begin
  IdSMTP1.Disconnect;                                          // Отключаем Smtp Для редактирования его свойств
  IdSocksInfo1.Authentication:=saNoAuthentication;             // Выставляем значение - Без аутентификации
  IdSocksInfo1.Port:=Port;                                     // Порт по которому мы будем связываться
  IdSocksInfo1.Version:=svNoSocks;                             // ...
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method:=sslvTLSv1;
  IdSMTP1.IOHandler := IdSSLIOHandlerSocketOpenSSL1;
  IdSMTP1.UseTLS := utUseImplicitTLS;
  IdSSLIOHandlerSocketOpenSSL1.SSLOptions.Method := sslvTLSv1;
  IdSMTP1.Host := 'smtp.yandex.ru';
  IdSMTP1.Port := Port;
  IdSMTP1.AuthType := satDefault;
  IdSMTP1.UserName := Mail_Loggin;
  IdSMTP1.Password := Mail_Password;

  IdMessage1.Clear;
  IdMessage1.From.Name :='FastTour';
  IdMessage1.From.Address := Mail_Loggin;
  IdMessage1.Body.Text:='Здравствуйте, <b>'+DataModule2.Reg_Query.Fields.Fields[3].AsString+'</b>! Код для востановления: '+REFRESH_KODE;
  IdMessage1.Subject:='Сброс пароля учетной записи Fast-Tour';
  idMessage1.Recipients.EMailAddresses:=Mail;
  IdMessage1.ContentType:='text/html; charset=UTF-8;';

  IdSMTP1.Connect;                                             // Пытаемся подключиться...
  if IdSMTP1.Connected then IdSMTP1.Send(IdMessage1) else ShowMessage('Ахтунг, сообщение нне было отправлено!');
  IdSMTP1.Disconnect;                                          // По завершению мы отключаемся
  end;
//...
End;


Function Hard_Password(sLength:Integer):String;
Var
I:integer;
Str:String;
Begin
Str:='';
for I:=0 to slength do
Str:=concat(Str,chr(Random(ord('z')-ord('a')+1) + ord('a')));
if Length(Str)>1 then
for I:=0 to Random(Length(Str) div 2) do
Begin
Insert(IntToStr(Random(10)),Str,Random(Length(Str)));
End;
Result:=Str;
End;



end.
