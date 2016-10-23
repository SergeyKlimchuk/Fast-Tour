unit PersonalArea;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, acImage, sPanel,
  Vcl.StdCtrls, sLabel, sButton, JPEG, Vcl.DBCtrls, sEdit, sBevel, Vcl.Mask,
  sMaskEdit, sCustomComboEdit, sToolEdit, sComboBox, Vcl.Buttons, sBitBtn,
  sScrollBox, acPNG, DateUtils;

type

  TPurchase = record
    Main_Panel: TsGradientPanel;
    Lbl_Name: TsLAbel;
    Secondary_Panel: TsGradientPanel;
    Lbl_Namber, LNumber: TsLabel;
    Lbl_Date, LDate: TsLAbel;
    Lbl_Type, LType: TsLabel;
    Lbl_Info: TsLAbel;
  end;


  TForm5 = class(TForm)
    sPanel1: TsPanel;
    sImage1: TsImage;
    sPanel3: TsPanel;
    sLabel1: TsLabel;
    sPanel4: TsPanel;
    sLabel2: TsLabel;
    sButton1: TsButton;
    sPanel5: TsPanel;
    Label_Name_SecName: TsLabel;
    sPanel6: TsPanel;
    sButton2: TsButton;
    EditPanel: TsPanel;
    sBevel1: TsBevel;
    Button4: TButton;
    sEdit1: TsEdit;
    sEdit2: TsEdit;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sBevel2: TsBevel;
    sBevel3: TsBevel;
    sLabel7: TsLabel;
    sEdit3: TsEdit;
    sEdit4: TsEdit;
    sLabel3: TsLabel;
    sComboBox1: TsComboBox;
    sLabel4: TsLabel;
    sDateEdit1: TsDateEdit;
    sLabel8: TsLabel;
    sEdit5: TsEdit;
    sLabel9: TsLabel;
    sLabel10: TsLabel;
    OpenDialog1: TOpenDialog;
    sLabel11: TsLabel;
    sComboBox2: TsComboBox;
    Label_Email: TsLabel;
    sBevel4: TsBevel;
    Label_sex: TsLabel;
    Label_Date: TsLabel;
    sPanel7: TsPanel;
    sLabel15: TsLabel;
    sComboBox3: TsComboBox;
    sEdit6: TsEdit;
    sLabel12: TsLabel;
    sLabel13: TsLabel;
    sButton3: TsButton;
    sButton4: TsButton;
    sLabel14: TsLabel;
    sGradientPanel1: TsGradientPanel;
    Purchases_List: TsScrollBox;
    sLabel16: TsLabel;
    Panel_INFO_Tour: TsPanel;
    Image3: TImage;
    sBitBtn6: TsBitBtn;
    sLabel17: TsLabel;
    sLabel18: TsLabel;
    sLabel19: TsLabel;
    sLabel20: TsLabel;
    sLabel21: TsLabel;
    sLabel22: TsLabel;
    sLabel23: TsLabel;
    sLabel24: TsLabel;
    sLabel25: TsLabel;
    sLabel26: TsLabel;
    sLabel27: TsLabel;
    sLabel28: TsLabel;
    sLabel29: TsLabel;
    Panel_INFO_Air: TsPanel;
    Image1: TImage;
    sLabel30: TsLabel;
    sLabel31: TsLabel;
    sLabel32: TsLabel;
    sLabel33: TsLabel;
    sLabel34: TsLabel;
    sLabel35: TsLabel;
    sLabel36: TsLabel;
    sLabel37: TsLabel;
    sLabel38: TsLabel;
    sLabel39: TsLabel;
    sLabel40: TsLabel;
    sLabel41: TsLabel;
    sLabel42: TsLabel;
    sBitBtn1: TsBitBtn;
    Panel_INFO_Hotel: TsPanel;
    Image2: TImage;
    sLabel43: TsLabel;
    sLabel44: TsLabel;
    sLabel45: TsLabel;
    sLabel46: TsLabel;
    sLabel47: TsLabel;
    sLabel48: TsLabel;
    sLabel49: TsLabel;
    sLabel50: TsLabel;
    sLabel51: TsLabel;
    sLabel52: TsLabel;
    sLabel53: TsLabel;
    sLabel54: TsLabel;
    sLabel55: TsLabel;
    sBitBtn2: TsBitBtn;
    sBevel5: TsBevel;
    sPanel2: TsPanel;
    sImage2: TsImage;
    procedure sButton2Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button4Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure sEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure sEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure sEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure sComboBox2Change(Sender: TObject);
    procedure sDateEdit1Change(Sender: TObject);
    procedure sComboBox1Change(Sender: TObject);
    procedure sComboBox3Change(Sender: TObject);
    procedure sEdit6KeyPress(Sender: TObject; var Key: Char);
    procedure sButton3Click(Sender: TObject);
    procedure sButton4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sDateEdit1Exit(Sender: TObject);
    procedure sBitBtn6Click(Sender: TObject);
    procedure GET_INFO(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;

  Edit_PictureB   :boolean;
  Edit_NameB      :boolean;
  Edit_SecNameB   :Boolean;
  Edit_ActualPassB:Boolean;
  Edit_NewPassB   :Boolean;
  Edit_MailB      :Boolean;
  Edit_SexB       :Boolean;
  Edit_TimeB      :Boolean;
  Edit_DateB      :Boolean;
  ECHO_WARNING    :Boolean;
  Edit_Secret_Q   :Boolean;
  Edit_Secret_A   :Boolean;

  Purchases:Array of TPurchase;

  Procedure Profile_EClear;

  Procedure ADD_LINES;
  Procedure ADD_LINE(Index:Integer);
  Procedure DELETE_LINES;

implementation

{$R *.dfm}

uses Main, Modul, LogPass, Tour;

procedure TForm5.GET_INFO(Sender: TObject);
Var
  S, D: String;
  bmp:TbitMap;
  bmp2: TPicture;
Begin
bmp:=tbitmap.Create;
bmp2:=TPicture.Create;
bmp2.LoadFromFile('Textures\BackGround\Shadow.png');
bmp.Width:=form5.Width-15;
bmp.Height:=form5.Height-30;
BitBlt(bmp.Canvas.Handle,0,0,form5.Width,form5.Height,getdc(form5.handle),0,0,SRCCOPY);
SPanel2.BringToFront;
sPanel2.Visible:= True;
sImage2.Picture.Assign(bmp);
sImage2.Canvas.Draw(0,0,bmp2.Bitmap);
bmp2.Free;
bmp.Free;

DataModule2.Purchases_Query.First;
DataModule2.Purchases_Query.MoveBy((Sender as TsLabel).Tag);
if (DataModule2.Purchases_Query.FieldByName('Type_Product').AsInteger = 3) then
Begin
With DataModule2.Buffer do
  Begin
  Active:= False;
  SQL.Clear;
  SQL.Add('SELECT H.*, A.*, T.* FROM Hotels AS H, Air_Ticket AS A, Tours AS T WHERE (((H.ID )=[T].[Hotel_ID]) AND ((A.ID)=[T].[Air_ID]) AND (T.ID=' + DataModule2.Purchases_Query.FieldByName('ID_Product').AsString + '))');
  Active:= True;
  // Заполнение
  sLabel19.Caption:= FieldByName('Name').AsString;
  sLabel25.Caption:= Form11.sComboBox5.Items[FieldByName('Peoples').AsInteger];
  sLabel26.Caption:= FieldByName('Food_Type').AsString;
  D:= IntToStr(Daysbetween(DataModule2.Purchases_Query.FieldByName('Date_Start').AsDateTime, DataModule2.Purchases_Query.FieldByName('Date_Finish').AsDateTime));
  if D[D.Length] = '1' then
    S:= ' День';
  if D[D.Length] in ['2'..'4'] then
    S:= ' Дня';
  if D[D.Length] in ['5'..'9', '0'] then
    S:= ' Дней';
  sLabel27.Caption:= D + S;
  sLabel28.Caption:= DataModule2.Purchases_Query.FieldByName('Price').AsString + ' $';
  sLabel29.Caption:= DateTimeToStr(DataModule2.Purchases_Query.FieldByName('Buy_Time').AsDateTime);
  Panel_INFO_Tour.Visible:= True;
  End;
End;

if (DataModule2.Purchases_Query.FieldByName('Type_Product').AsInteger = 2) then
Begin
With DataModule2.Buffer do
  Begin
  Active:= False;
  SQL.Clear;
  SQL.Add('SELECT H.* FROM Hotels AS H WHERE (H.ID=' + DataModule2.Purchases_Query.FieldByName('ID_Product').AsString + ')');
  Active:= True;
  // Заполнение
  sLabel45.Caption:= FieldByName('Name').AsString;
  sLabel51.Caption:= FieldByName('Country').AsString + ' \ ' + FieldByName('City').AsString;
  sLabel52.Caption:= DateTimeToStr(DataModule2.Purchases_Query.FieldByName('Date_Start').AsDateTime);
  D:= IntToStr(Daysbetween(DataModule2.Purchases_Query.FieldByName('Date_Start').AsDateTime, DataModule2.Purchases_Query.FieldByName('Date_Finish').AsDateTime));
  if D[D.Length] = '1' then
    S:= ' День';
  if D[D.Length] in ['2'..'4'] then
    S:= ' Дня';
  if D[D.Length] in ['5'..'9', '0'] then
    S:= ' Дней';
  sLabel53.Caption:= D + S;
  sLabel54.Caption:= DataModule2.Purchases_Query.FieldByName('Price').AsString + ' $';
  sLabel55.Caption:= DateTimeToStr(DataModule2.Purchases_Query.FieldByName('Buy_Time').AsDateTime);
  Panel_INFO_Hotel.Visible:= True;
  End;
End;

if (DataModule2.Purchases_Query.FieldByName('Type_Product').AsInteger = 1) then
Begin
With DataModule2.Buffer do
  Begin
  Active:= False;
  SQL.Clear;
  SQL.Add('SELECT A.* FROM Air_Ticket AS A WHERE (A.ID=' + DataModule2.Purchases_Query.FieldByName('ID_Product').AsString + ')');
  Active:= True;
  // Заполнение
  sLabel32.Caption:= FieldByName('City_D').AsString + ' -> ' + FieldByName('City_A').AsString;
  sLabel38.Caption:= FieldByName('Air_company').AsString;
  sLabel39.Caption:= DateTimeToStr(DataModule2.Purchases_Query.FieldByName('Date_Start').AsDateTime) + ' ' + TimeToStr(TimeOf(FieldByName('Time_D').AsDateTime));
  sLabel40.Caption:= DateTimeToStr(DataModule2.Purchases_Query.FieldByName('Date_Finish').AsDateTime) + ' ' + TimeToStr(TimeOf(FieldByName('Time_A').AsDateTime));
  sLabel41.Caption:= DataModule2.Purchases_Query.FieldByName('Price').AsString + ' $';
  sLabel42.Caption:= DateTimeToStr(DataModule2.Purchases_Query.FieldByName('Buy_Time').AsDateTime);
  Panel_INFO_Air.Visible:= True;
  End;
End;
End;


Procedure ADD_LINES;
Var
  I:Integer;
Begin
DataModule2.Purchases_Query.First;
SetLength(Purchases, DataModule2.Purchases_Query.RecordCount);
I:= 0;
while (DataModule2.Purchases_Query.Eof = False) do
  Begin
  ADD_LINE(I);
  DataModule2.Purchases_Query.Next;
  I:= I + 1;
  End;

End;

Procedure ADD_LINE(Index:Integer);
Begin
With DataModule2.Buffer do
  Begin
  Active:= False;
  SQL.Clear;
  case DataModule2.Purchases_Query.FieldByName('Type_Product').AsInteger of
  1:SQL.Add('SELECT * FROM Air_Ticket WHERE ID=' + IntToStr(DataModule2.Purchases_Query.FieldByName('ID_Product').AsInteger));
  2:SQL.Add('SELECT * FROM Hotels WHERE ID=' + IntToStr(DataModule2.Purchases_Query.FieldByName('ID_Product').AsInteger));
  3:SQL.Add('SELECT T.*, [H].[Name] FROM Tours AS T, Hotels AS H WHERE ((H.ID)=[T].[Hotel_ID]) AND (T.ID=' + IntToStr(DataModule2.Purchases_Query.FieldByName('ID_Product').AsInteger) + ')');
  end;
  Active:= True;
  End;
// Панель
Purchases[Index].Main_Panel:= TsGradientPanel.Create(Form5);
Purchases[Index].Main_Panel.Parent:= Form5.Purchases_List;
if (DataModule2.Purchases_Query.RecordCount > 4) then
  Purchases[Index].Main_Panel.Left:= 7
    else
      Purchases[Index].Main_Panel.Left:= 18;
Purchases[Index].Main_Panel.Top:= (Index * 80) + (Index * 10) + 8;
Purchases[Index].Main_Panel.Width:= 363;
Purchases[Index].Main_Panel.Height:= 80;
Purchases[Index].Main_Panel.PaintData.Color1.Color:= $00FF8000;
Purchases[Index].Main_Panel.PaintData.Color2.Color:= $00FF8000;
Purchases[Index].Main_Panel.PaintData.Color2.UseSkinColor:= False;
// Лейбел первой панели
Purchases[Index].Lbl_Name:= TsLabel.Create(Form5);
Purchases[Index].Lbl_Name.Parent:= Purchases[Index].Main_Panel;
Purchases[Index].Lbl_Name.Top:= 51;
Purchases[Index].Lbl_Name.Font.Size:= 11;
Purchases[Index].Lbl_Name.Font.Style:= [fsBold];
Purchases[Index].Lbl_Name.Font.Color:= ClWhite;
Purchases[Index].Lbl_Name.UseSkinColor:= False;
Purchases[Index].Lbl_Name.Font.Style:= [fsBold];
case DataModule2.Purchases_Query.FieldByName('Type_Product').AsInteger of
1:Purchases[Index].Lbl_Name.Caption:= 'Билет: ' + DataModule2.Buffer.FieldByName('City_D').AsString + ' -> ' + DataModule2.Buffer.FieldByName('City_A').AsString;
2:Purchases[Index].Lbl_Name.Caption:= 'Отель: ' + DataModule2.Buffer.Fields.FieldByName('Name').AsString;
3:Purchases[Index].Lbl_Name.Caption:= 'Тур: ' + DataModule2.Buffer.Fields.FieldByName('Name').AsString;
end;
Purchases[Index].Lbl_Name.Left:= (363 div 2) - (Purchases[Index].Lbl_Name.Width div 2);
// Вторичная Панель
Purchases[Index].Secondary_Panel:= TsGradientPanel.Create(Form5);
Purchases[Index].Secondary_Panel.Parent:= Purchases[Index].Main_Panel;
Purchases[Index].Secondary_Panel.Left:= 0;
Purchases[Index].Secondary_Panel.Top:= 0;
Purchases[Index].Secondary_Panel.Width:= 363;
Purchases[Index].Secondary_Panel.Height:= 45;
Purchases[Index].Secondary_Panel.Font.Size:= 10;
Purchases[Index].Secondary_Panel.PaintData.Color1.Color:= $00EDEDED;
Purchases[Index].Secondary_Panel.PaintData.Color2.Color:= $00EDEDED;
Purchases[Index].Secondary_Panel.PaintData.Color2.UseSkinColor:= False;
// Номер покупки
Purchases[Index].Lbl_Namber:= TsLabel.Create(Form5);
Purchases[Index].Lbl_Namber.Parent:= Purchases[Index].Secondary_Panel;
Purchases[Index].Lbl_Namber.Left:= 8;
Purchases[Index].Lbl_Namber.Top:= 4;
Purchases[Index].Lbl_Namber.Font.Color:= $00646464;
Purchases[Index].Lbl_Namber.UseSkinColor:= False;
Purchases[Index].Lbl_Namber.Caption:= 'Номер заказа №:';
// Сам номер
Purchases[Index].LNumber:= TsLabel.Create(Form5);
Purchases[Index].LNumber.Parent:= Purchases[Index].Secondary_Panel;
Purchases[Index].LNumber.Left:= 118;
Purchases[Index].LNumber.Top:= 4;
Purchases[Index].LNumber.Caption:= IntToStr(DataModule2.Purchases_Query.FieldByName('ID').AsInteger);
// Время покупки
Purchases[Index].Lbl_Date:= TsLabel.Create(Form5);
Purchases[Index].Lbl_Date.Parent:= Purchases[Index].Secondary_Panel;
Purchases[Index].Lbl_Date.Left:= 8;
Purchases[Index].Lbl_Date.Top:= 22;
Purchases[Index].Lbl_Date.Font.Color:= $00646464;
Purchases[Index].Lbl_Date.UseSkinColor:= False;
Purchases[Index].Lbl_Date.Caption:= 'Время заказа:';
// Само время
Purchases[Index].LDate:= TsLabel.Create(Form5);
Purchases[Index].LDate.Parent:= Purchases[Index].Secondary_Panel;
Purchases[Index].LDate.Left:= 98;
Purchases[Index].LDate.Top:= 22;
Purchases[Index].LDate.Caption:= DateTimeToStr(DataModule2.Purchases_Query.FieldByName('Buy_Time').AsDateTime);
// Тип покупки
Purchases[Index].Lbl_Type:= TsLabel.Create(Form5);
Purchases[Index].Lbl_Type.Parent:= Purchases[Index].Secondary_Panel;
Purchases[Index].Lbl_Type.Left:= 254;
Purchases[Index].Lbl_Type.Top:= 4;
Purchases[Index].Lbl_Type.Font.Color:= $00646464;
Purchases[Index].Lbl_Type.UseSkinColor:= False;
Purchases[Index].Lbl_Type.Caption:= 'Тип:';
// Сам тип
Purchases[Index].LType:= TsLabel.Create(Form5);
Purchases[Index].LType.Parent:= Purchases[Index].Secondary_Panel;
Purchases[Index].LType.Left:= 281;
Purchases[Index].LType.Top:= 4;
case DataModule2.Purchases_Query.FieldByName('Type_Product').AsInteger of
1:Purchases[Index].LType.Caption:= 'Авиабилет';
2:Purchases[Index].LType.Caption:= 'Отель';
3:Purchases[Index].LType.Caption:= 'Тур';
end;
// Выбор информации
Purchases[Index].Lbl_Info:= TsLabel.Create(Form5);
Purchases[Index].Lbl_Info.Parent:= Purchases[Index].Secondary_Panel;
Purchases[Index].Lbl_Info.Left:= 270;
Purchases[Index].Lbl_Info.Top:= 26;
Purchases[Index].Lbl_Info.Font.Style:= [fsUnderLine];
Purchases[Index].Lbl_Info.UseSkinColor:= False;
Purchases[Index].Lbl_Info.Cursor:= crHandPoint;
Purchases[Index].Lbl_Info.Tag:= Index;
Purchases[Index].Lbl_Info.Caption:= 'Подробнее';
Purchases[Index].Lbl_Info.OnClick:=Form5.GET_INFO;
End;

Procedure DELETE_LINES;
Var
  I:Integer;
Begin
if (Length(Purchases) > 0) then
  for I:= 0 to (Length(Purchases) - 1) do
    Begin
    Purchases[I].Lbl_Namber.Free;
    Purchases[I].LNumber.Free;
    Purchases[I].Lbl_Date.Free;
    Purchases[I].LDate.Free;
    Purchases[I].Lbl_Type.Free;
    Purchases[I].LType.Free;
    Purchases[I].Lbl_Info.Free;
    Purchases[I].Secondary_Panel.Free;
    Purchases[I].Lbl_Name.Free;
    Purchases[I].Main_Panel.Free;
    End;
SetLength(Purchases, 0);
End;

Procedure Profile_EClear;
Begin
  Edit_PictureB   :=False;
  Edit_NameB      :=False;
  Edit_SecNameB   :=False;
  Edit_ActualPassB:=False;
  Edit_NewPassB   :=False;
  Edit_MailB      :=False;
  Edit_SexB       :=False;
  Edit_TimeB      :=False;
  Edit_DateB      :=False;
  ECHO_WARNING    :=False;
  Edit_Secret_Q   :=False;
  Edit_Secret_A   :=False;
  Form5.sEdit1.Text:='';
  Form5.sEdit2.Text:='';
  Form5.sEdit3.Text:=DataModule2.Reg_Query.Fields.Fields[3].AsString;
  Form5.sEdit4.Text:=DataModule2.Reg_Query.Fields.Fields[4].AsString;
  Form5.sEdit5.Text:=DataModule2.Reg_Query.Fields.Fields[5].AsString;
  Form5.sEdit6.Text:='';
  if DataModule2.Reg_Query.Fields.Fields[12].AsString<>'' then Form5.sComboBox3.ItemIndex:=StrToInt(DataModule2.Reg_Query.Fields.Fields[12].AsString);

  Form5.sComboBox1.ItemIndex:=2;

if DataModule2.Reg_Query.Fields.Fields[9].AsString='муж' then Form5.sComboBox1.ItemIndex:=0;
if DataModule2.Reg_Query.Fields.Fields[9].AsString='жен' then Form5.sComboBox1.ItemIndex:=1;
  Form5.Label_Email.Caption:='Email: '+DataModule2.Reg_Query.Fields.Fields[5].AsString;
  Form5.Label_sex.Caption:='Пол: '+DataModule2.Reg_Query.Fields.Fields[9].AsString;
  Form5.Label_Name_SecName.Caption:=DataModule2.Reg_Query.Fields.Fields[3].AsString+' '+DataModule2.Reg_Query.Fields.Fields[4].AsString;
  Form5.Label_Date.Caption:='Дата рождения: '+DataModule2.Reg_Query.Fields.Fields[10].AsString;
End;


procedure TForm5.Button4Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  Edit_PictureB:=True;
end;

procedure TForm5.FormClose(Sender: TObject; var Action: TCloseAction);
begin
case MessageDlg('Вы точно хотите выйти?',mtConfirmation , [mbYes,mbCancel], 0) of
mrYes:Application.Terminate;
mrCancel:Abort;
end;
end;

procedure TForm5.FormShow(Sender: TObject);
begin
DELETE_LINES;
if (DataModule2.Purchases_Query.RecordCount > 0) then
  Begin
  With DataModule2.Purchases_Query do
    Begin
    Active:= False;
    SQL.Clear;
    SQL.Add('Select * From Purchases Where ID_Buyer=' + DataModule2.Reg_Query.FieldByName('ID').AsString);
    Active:= True;
    End;
  ADD_LINES;
  End;
end;

procedure TForm5.sBitBtn1Click(Sender: TObject);
begin
sImage2.Picture:= Nil;
sPanel2.Visible:= False;
Panel_INFO_Air.Visible:= False;
end;

procedure TForm5.sBitBtn2Click(Sender: TObject);
begin
sImage2.Picture:= Nil;
sPanel2.Visible:= False;
Panel_INFO_Hotel.Visible:= False;
end;

procedure TForm5.sBitBtn6Click(Sender: TObject);
begin
sImage2.Picture:= Nil;
sPanel2.Visible:= False;
Panel_INFO_Tour.Visible:= False;
end;

procedure TForm5.sButton1Click(Sender: TObject);
begin
Profile_EClear;
EditPanel.Visible:=True;
end;

procedure TForm5.sButton2Click(Sender: TObject);
begin
Form5.Hide;
Form4.show;
end;

procedure TForm5.sButton3Click(Sender: TObject);
begin
Profile_EClear;
EditPanel.Visible:=False;
end;

Procedure Set_Image;
Var
  pins:TPicture;
  jpg: TJPEGImage;
  bmp: TBitmap;
Begin
  if LowerCase(Copy(Form5.OpenDialog1.FileName,Length(Form5.OpenDialog1.FileName)-2,3))='jpg' then
  Begin
  jpg:=TJPEGImage.Create;
  bmp:=TBitmap.Create;
  jpg.LoadFromFile(Form5.OpenDialog1.FileName);
  bmp.Assign(jpg);
  DataModule2.Reg_Query.Edit;
  DataModule2.Reg_Query.FieldByName('U_Picture').Assign(bmp);
  DataModule2.Reg_Query.Post;
  jpg.Free;
  bmp.Free;
  End;

  if LowerCase(Copy(Form5.OpenDialog1.FileName,Length(Form5.OpenDialog1.FileName)-2,3))='bmp' then
  Begin
  pins:=Tpicture.Create;
  pins.LoadFromFile(Form5.OpenDialog1.FileName);
  DataModule2.Reg_Query.Edit;
  DataModule2.Reg_Query.FieldByName('U_Picture').Assign(pins);
  DataModule2.Reg_Query.Post;
  pins.Free;
  End;

Form5.sImage1.Picture.Assign(DataModule2.Reg_Query.FieldByName('U_Picture'));
End;

procedure TForm5.sButton4Click(Sender: TObject);
const
  Mails:Array [1..3] of String = ('@mail.ru', '@gmail.com', '@yandex.ru');
Var
  jpg: TJPEGImage;
  bmp: TBitmap;
  Mail: String;
  I, D: Integer;
begin
if (Edit_MailB = True) AND (sEdit2.Text=DataModule2.Reg_Query.Fields.Fields[2].AsString) then
  Begin
    D:= 0;
    if (Length(sEdit5.Text) <> 0)then
      for I:= 1 to Length(sEdit5.Text) do
        if sEdit5.Text[I] = '@' then
          D:= D + 1;
    if (D <> 1) then
      begin
      ShowMessage('Проверьте корректность почты!');
      Abort;
      end;
    Mail:= Copy(sEdit5.Text, Pos('@', sEdit5.Text), length(sEdit5.Text) - Pos('@', sEdit5.Text) + 1);
    Mail:=LowerCase(Mail);
    ShowMessage(Mail);
    if (Mail = '@mail.ru') or (Mail = '@gmail.com') or (Mail = '@yandex.ru') then
      Begin
      DataModule2.Reg_Query.Edit;
      DataModule2.Reg_Query.Fields.Fields[5].AsString := sEdit5.Text ;
      DataModule2.Reg_Query.Post;
      End
    else
      Begin
      ShowMessage('Данная почта не поддерживается нашим приложением! Почты которые поддерживаются: "Mail.ru", "Gmail.com", "Yandex.ru"');
      End;
  End
    else
      if (sEdit2.Text <> DataModule2.Reg_Query.Fields.Fields[2].AsString) then
        ShowMessage('Некоторые данные не были изменены, т.к. текущий пароль был введён не верно!');

  if (Edit_PictureB = True) then
    Set_Image;

  DataModule2.Reg_Query.Edit;

  if Edit_NameB=True then
    DataModule2.Reg_Query.Fields.Fields[3].AsString := sEdit3.Text ;

  if Edit_SecNameB=True then
    DataModule2.Reg_Query.Fields.Fields[4].AsString := sEdit4.Text ;

  if Edit_SexB=True then
    DataModule2.Reg_Query.Fields.Fields[9].AsString := Copy(sComboBox1.Text,1,3) ;

  if Edit_DateB=True then
    if sDateEdit1.Date > Now then
      ShowMessage('Дата рождения не может быть больше чем текущая дата!')
        else
          DataModule2.Reg_Query.Fields.Fields[10].AsString := sDateEdit1.Text ;

  if Edit_TimeB = True then
    DataModule2.Reg_Query.Fields.Fields[11].AsString := sComboBox2.Text ;

  if Edit_Secret_Q = True then
    DataModule2.Reg_Query.Fields.Fields[12].AsString := IntToStr(sComboBox3.ItemIndex) ;

  if (Edit_Secret_A = True) and (sEdit6.Text <> '') then
    DataModule2.Reg_Query.Fields.Fields[13].AsString := sEdit6.Text ;

DataModule2.Reg_Query.Post;

if Edit_ActualPassB=True then
  Begin
  if sEdit2.Text=DataModule2.Reg_Query.Fields.Fields[2].AsString then
    Begin
    DataModule2.Reg_Query.Edit;
    DataModule2.Reg_Query.Fields.Fields[2].AsString := sEdit1.Text ;
    DataModule2.Reg_Query.Post;
    End
      else
        ECHO_WARNING:=True;
  End;

if (ECHO_WARNING=True) AND ((Edit_PictureB=True) OR (Edit_TimeB=True) OR (Edit_DateB=True) OR (Edit_SexB=True) OR (Edit_NameB=True) OR (Edit_SecNameB=True) OR (Edit_ActualPassB=True))
then ShowMessage('Изменения были сохранены, кроме тех что требуют пароля!') else ShowMessage('Все изменения были сохранены!');


Profile_EClear;
EditPanel.Visible:=False;
end;

procedure TForm5.sComboBox1Change(Sender: TObject);
begin
Edit_SexB:=True;
end;

procedure TForm5.sComboBox2Change(Sender: TObject);
begin
Edit_TimeB:=True;
end;

procedure TForm5.sComboBox3Change(Sender: TObject);
begin
Edit_Secret_Q:=True;
end;

procedure TForm5.sDateEdit1Change(Sender: TObject);
begin
Edit_DateB:=True;
end;

procedure TForm5.sDateEdit1Exit(Sender: TObject);
begin
if sDateEdit1.Text = '  .  .    ' then
  sDateEdit1.Date:= Now;
end;

procedure TForm5.sEdit1KeyPress(Sender: TObject; var Key: Char);
begin
Edit_NewPassB:=True;
end;

procedure TForm5.sEdit3KeyPress(Sender: TObject; var Key: Char);
begin
Edit_NameB:=True;
end;

procedure TForm5.sEdit4KeyPress(Sender: TObject; var Key: Char);
begin
Edit_SecNameB:=True;
end;

procedure TForm5.sEdit5KeyPress(Sender: TObject; var Key: Char);
begin
Edit_MailB:=True;
end;

procedure TForm5.sEdit6KeyPress(Sender: TObject; var Key: Char);
begin
Edit_Secret_A:=true;
end;

end.
