unit Basket;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, sPanel, Vcl.StdCtrls,
  Vcl.Buttons, sBitBtn, sScrollBox, sBevel, sLabel, sButton, acImage, sComboBox, Dateutils,
  Data.DB, Vcl.Grids, Vcl.DBGrids, sPageControl, Vcl.ComCtrls, acPNG, ShellApi;

type

  TLine = record
    Panel_Main         :TsGradientPanel;
    Label_Type         :TsLAbel;
    Label_Time         :TsLAbel;
    Label_Way_Name     :TsLAbel;
    Label_Time_Country :TsLAbel;
    Picture            :TsImage;
    Picture_Bevel      :TsBevel;
    Main_Bevel         :TsBevel;
    Label_Price        :TsLAbel;
    Label_Currency     :TsLAbel;
    Button_Delete      :TsBitbtn;
    Button_Info        :TsBitbtn;
    Additional_Panel   :TsGradientPanel;
  end;

  TForm9 = class(TForm)
    Explorer_Panel: TsGradientPanel;
    Main_Box: TsScrollBox;
    Exit: TsBitBtn;
    Info: TsBitBtn;
    Choose_Panel: TsGradientPanel;
    Label2: TLabel;
    sButton4: TsButton;
    sLabel10: TsLabel;
    sLabel11: TsLabel;
    sComboBox1: TsComboBox;
    Label3: TLabel;
    sBitBtn1: TsBitBtn;
    sImage1: TsImage;
    Main_Panel: TsPanel;
    Nick_Name: TsGradientPanel;
    Panel_Hotel: TsGradientPanel;
    sBevel22: TsBevel;
    Lbl_HotelName: TsLabel;
    Lbl_tag1: TsLabel;
    Lbl_tag2: TsLabel;
    Lbl_tag3: TsLabel;
    Lbl_tag4: TsLabel;
    lbl_HotelInfo: TsLabel;
    Image_Comment: TsImage;
    Image_tag: TsImage;
    sBitBtn4: TsBitBtn;
    sBitBtn6: TsBitBtn;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Info_Image: TImage;
    TabSheet2: TTabSheet;
    Image_Phone: TsImage;
    Lbl_Phone: TsLabel;
    sBevel24: TsBevel;
    sBevel25: TsBevel;
    Lbl_Fax: TsLabel;
    Image_Fax: TsImage;
    sBevel26: TsBevel;
    Lbl_Web: TsWebLabel;
    Image_Web: TsImage;
    TabSheet3: TTabSheet;
    lbl_room_hotel: TsPageControl;
    sTabSheet1: TsTabSheet;
    lbl_info_hotel: TsLabel;
    sTabSheet2: TsTabSheet;
    lbl_type_info_hotel: TsLabel;
    sTabSheet3: TsTabSheet;
    lbl_food_hotel: TsLabel;
    sTabSheet4: TsTabSheet;
    lbl_rooms_hotel: TsLabel;
    sTabSheet5: TsTabSheet;
    lbl_Place_hotel: TsLabel;
    sTabSheet6: TsTabSheet;
    lbl_Children_hotel: TsLabel;
    sTabSheet7: TsTabSheet;
    lbl_Entertainment_hotel: TsLabel;
    sTabSheet8: TsTabSheet;
    lbl_Kids_hotel: TsLabel;
    Panel_Stars: TsGradientPanel;
    Panel_Tour: TsPanel;
    Image2: TImage;
    sImage2: TsImage;
    sBevel8: TsBevel;
    sLabel2: TsLabel;
    sBevel9: TsBevel;
    sLabel3: TsLabel;
    sBevel10: TsBevel;
    sBevel11: TsBevel;
    sBevel12: TsBevel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sBevel13: TsBevel;
    sLabel6: TsLabel;
    sBevel14: TsBevel;
    sLabel19: TsLabel;
    sBevel15: TsBevel;
    sLabel21: TsLabel;
    sLabel22: TsLabel;
    sLabel23: TsLabel;
    sLabel20: TsLabel;
    sBevel16: TsBevel;
    sBevel17: TsBevel;
    sBevel18: TsBevel;
    sBevel19: TsBevel;
    sLabel24: TsLabel;
    sLabel25: TsLabel;
    sBevel20: TsBevel;
    sBevel21: TsBevel;
    sLabel27: TsLabel;
    sLabel28: TsLabel;
    sGradientPanel4: TsGradientPanel;
    sGradientPanel10: TsGradientPanel;
    sBitBtn3: TsBitBtn;
    Panel_Air: TsPanel;
    sLabel29: TsLabel;
    sLabel7: TsLabel;
    sLabel30: TsLabel;
    sLabel31: TsLabel;
    sLabel32: TsLabel;
    sLabel33: TsLabel;
    sLabel34: TsLabel;
    sLabel35: TsLabel;
    sLabel8: TsLabel;
    sLabel9: TsLabel;
    sLabel12: TsLabel;
    sLabel26: TsLabel;
    sLabel36: TsLabel;
    sLabel37: TsLabel;
    Image3: TImage;
    sBitBtn7: TsBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ExitClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    Procedure TsClick(Sender:TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sComboBox1Change(Sender: TObject);
    procedure sButton4Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure GET_INFO(Sender: TObject);
    procedure sBitBtn7Click(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
    procedure sLabel27Click(Sender: TObject);
    procedure sLabel28Click(Sender: TObject);
    procedure sBitBtn4Click(Sender: TObject);
    procedure InfoClick(Sender: TObject);
  private
    { НЕ ГОДНОТА declarations }
  public
    { ГОДНОТА declarations }
  end;

const
  KZT= 333; 
  USD= 1;
  EUR= 0.89;
  RUB= 62;
  AUD= 1.32;
  GBP= 0.79;
  DKK= 6.65;
  AED= 3.67;
  
var
  Form9: TForm9;
  Lines:array of TLine; // Массив из панелей (Объектов корзины)

  IDLine:String;

  // Процедурный блок
  Procedure REFRESH_PRICE; // Процедура обновления цены (Активируется при смене валюты)
  Procedure ADD_LINES;     // Создание линии
  Procedure LINE_DELETE(Index:Integer);
  Procedure DELETE_LINES;
  Function Get_difference(A1, B1 :String; A2, B2:String):String;

implementation

{$R *.dfm}

uses Main, Modul, CheckOut, Tour;

Function Date_Info(I:String):String;
const
  // Месяци года
  sMouths:Array [1..12] of String = ('янв', 'фев', 'мар', 'апр',
                                'май', 'июн', 'июл', 'авг',
                                'сен', 'окт', 'ноя', 'дек');
  // Дни недели
  sDay:Array [1..7] of String = ('ВС', 'ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ');
Var
  sLine, Buf    :String;
  sDate1, sDate2:TDateTime;
Begin
With DataModule2.Buffer do
Begin
// Фиксируем даты
if (FieldByName('Regular').AsBoolean = True) then
  if I = 'From' then
    sDate1:= VarToDateTime(DataModule2.Basket_Query.FieldByName('Date_Start').AsString + ' ' + IntToStr(HourOf(VarToDateTime(FieldByName('Time_D').AsString))) + ':' + IntToStr(MinuteOf(VarToDateTime(FieldByName('Time_D').AsString))))
      else
        sDate1:= VarToDateTime(DataModule2.Basket_Query.FieldByName('Date_Start').AsString + ' ' + IntToStr(HourOf(VarToDateTime(FieldByName('Time_A').AsString))) + ':' + IntToStr(MinuteOf(VarToDateTime(FieldByName('Time_A').AsString))))
          else
            if I = 'From' then
              sDate1:= VarToDateTime(FieldByName('Date_D').AsString + ' ' + IntToStr(HourOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_D').AsString))) + ':' + IntToStr(MinuteOf(VarToDateTime(FieldByName('Time_D').AsString))))
                else
                  sDate1:= VarToDateTime(FieldByName('Date_A').AsString + ' ' + IntToStr(HourOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_A').AsString))) + ':' + IntToStr(MinuteOf(VarToDateTime(FieldByName('Time_A').AsString))));
// Формируем начало итоговой строки
sLine:= IntToStr(DayOf(sDate1)) + ' ' + sMouths[MonthOf(sDate1)] + ', ' + sDay[DayOfWeek(sDate1)];
sLine:= sLine + ' ' +IntToStr(HourOf(sDate1)) + ':' + IntToStr(MinuteOf(sDate1));
if (I = 'From') then
  sLine:= sLine + ', ' + #13#10 + FieldByName('Airport_D').AsString
    else
      sLine:= sLine + ', ' + #13#10 + FieldByName('Airport_A').AsString;
// Вывод
end;
Result:= sLine;
End;



procedure TForm9.GET_INFO(Sender: TObject);
Var
  LType: Integer;
  Ds: String;
  ID: Integer;
Begin
With DataModule2 do
  Begin
  Basket_Query.First;
  Basket_Query.MoveBy((Sender as TBitBtn).Tag - 1);
  LType:= Basket_Query.FieldByName('B_Type').Asinteger;
  Buffer.Active:= False;
  Buffer.SQL.Clear;
    case LType of
    1:Buffer.SQL.Add('SELECT * FROM Air_Ticket AS A WHERE (A.ID=' + Basket_Query.FieldByName('B_ID').AsString + ')');
    2:Buffer.SQL.Add('SELECT * FROM Hotels AS H WHERE (H.ID=' + Basket_Query.FieldByName('B_ID').AsString + ')');
    3:Buffer.SQL.Add('SELECT * FROM Tours AS T WHERE (T.ID=' + Basket_Query.FieldByName('B_ID').AsString + ')');
    end;
  Buffer.Active:= True;
  // Защита от багов
  Panel_Air.Visible:= False;
  Panel_Hotel.Visible:= False;
  Panel_Tour.Visible:= False;
  // Вывод информации
  case LType of
  1:Begin
    sLabel7.Caption:= Buffer.FieldByName('City_D').AsString + ' -> ' + Buffer.FieldByName('City_A').AsString;
    sLabel9.Caption:= Buffer.FieldByName('Air_company').AsString;
      case Basket_Query.FieldByName('Fly_Class').AsInteger of
      1:sLabel9.Caption:= 'Первый класс';
      2:sLabel9.Caption:= 'Бизнес класс';
      3:sLabel9.Caption:= 'Эконом класс';
      end;
    sLabel36.Caption:= Date_Info('From');
    sLabel37.Caption:= Date_Info('To');
    Panel_Air.Visible:= True;
    End;
  2:With DataModule2.Buffer do
    Begin
    Lbl_HotelName.Caption:= Fields.FieldByName('Name').AsString;
    sBevel22.Width:=Lbl_HotelName.Width;
    Panel_Stars.Caption:= FieldByName('Stars').AsString + ' *';
    Panel_Stars.Left:=sbevel22.Width + 19;
    Lbl_tag1.Visible:=False;
    Lbl_tag2.Visible:=False;
    Lbl_tag3.Visible:=False;
    Lbl_tag4.Visible:=False;
    lbl_HotelInfo.Caption:= FieldByName('Comment').AsString;
    lbl_HotelInfo.Height:=100;
    lbl_HotelInfo.Width:=400;
    info_image.Picture.Assign(FieldByName('Photo'));
    lbl_info_hotel.Caption:= FieldByName('About_hotel').AsString;
    lbl_info_hotel.Width:=388;
    lbl_type_info_hotel.Caption:= FieldByName('Type_Rooms').AsString;
    lbl_type_info_hotel.Width:=388;
    lbl_food_hotel.Caption:= FieldByName('Food').AsString;
    lbl_food_hotel.Width:=388;
    lbl_rooms_hotel.Caption:= FieldByName('About_Room').AsString;
    lbl_rooms_hotel.Width:=388;
    lbl_Place_hotel.Caption:= FieldByName('About_Place').AsString;
    lbl_Place_hotel.Width:=388;
    lbl_Children_hotel.Caption:= FieldByName('About_For_Childrens').AsString;
    lbl_Children_hotel.Width:=388;
    lbl_Entertainment_hotel.Caption:= FieldByName('About_Entertainment').AsString;
    lbl_Entertainment_hotel.Width:=388;
    lbl_Kids_hotel.Caption:= FieldByName('About_Baby').AsString;
    lbl_Kids_hotel.Width:=388;
    Lbl_Phone.Caption:= FieldByName('Phone').AsString;
    Lbl_Fax.Caption:= FieldByName('Fax').AsString;
    Lbl_Web.Caption:= FieldByName('Internet_Address').AsString;
    Lbl_Web.URL:= FieldByName('Internet_Address').AsString;
    Panel_Hotel.Top:= (ClientHeight div 2 - 200);
    Panel_Hotel.Left:= (ClientWidth div 2 - 500);
    Panel_Hotel.Visible:= True;
    End;
  3:Begin
    Ds:= IntToStr(DaysBetween(Buffer.FieldByName('Date_Start').AsDateTime, Buffer.FieldByName('Date_Finish').AsDateTime));
      case Integer(Ds[Ds.Length]) of
      1:sLabel3.Caption:= Ds + ' ночь';
      2,3,4:sLabel3.Caption:= Ds + ' ночи';
      5,6,7,8,9,0:sLabel3.Caption:= Ds + ' ночей';
      end;
    sLabel5.Caption:= Form11.sComboBox5.Items[Buffer.FieldByName('Peoples').AsInteger];
    sLabel21.Caption:= DateToStr(Buffer.FieldByName('Date_Start').AsDateTime);
    sLabel22.Caption:= DateToStr(Buffer.FieldByName('Date_Finish').AsDateTime);
    ID:= Buffer.FieldByName('Hotel_ID').AsInteger;
    sLabel27.Tag:= Buffer.FieldByName('Hotel_ID').AsInteger;
    sLabel28.Tag:= Buffer.FieldByName('Air_ID').AsInteger;
    Buffer.Active:= False;
    Buffer.SQL.Clear;
    Buffer.SQL.ADD('SELECT H.* FROM Hotels AS H WHERE (ID=' + IntToStr(ID) + ')');
    Buffer.Active:= True;
    try
    sImage2.Picture.Assign(Buffer.FieldByName('Photo'));
    finally
    end;
    sGradientPanel4.Caption:= Buffer.FieldByName('Name').AsString;
    sLabel25.Caption:= IntToStr(Buffer.Fields.FieldByName('Stars').AsInteger) + ' *';
    Panel_Tour.Visible:= True;
    End;
  end;
  End;
End;

procedure TForm9.InfoClick(Sender: TObject);
begin
ShellExecute(Handle, 'open',
  'Help\Help.chm', nil, nil, SW_SHOWNORMAL);
end;

Function Get_difference(A1, B1 :String; A2, B2:String):String;
Var
  Dt1,Dt2:TDateTime;
  Minutes,Hours:integer;
  Output:String;
Begin
// Формируем первую дату
Dt1:=VarToDateTime(A1+' '+TimeToStr(TimeOf(StrToDateTime(A2))));
// Формируем вторую дату
Dt2:=VarToDateTime(B1+' '+TimeToStr(TimeOf(StrToDateTime(B2))));
// Сохранение часов и времени
Hours:=HoursBetween(Dt1,Dt2);
Minutes:=MinutesBetween(Dt1,Dt2);
// Формируем
Output:='Общее время перелёта: ';
if Hours > 0 then
  Output:= Output + IntToStr(Hours) + 'ч ';
if Minutes > 0 then
  Output:= Output + IntToStr(Minutes - ((Minutes Div 60) * 60)) + 'м';
// Вывод
Result:= Output;
End;

Procedure LINE_DELETE(Index:Integer);
var
  I: Integer;
Begin
// Перемещение на начало
DataModule2.Basket_Query.First;
// Перемещение к объкту
DataModule2.Basket_Query.MoveBy(Index);
// Удаление объекта
DataModule2.Basket_Query.Delete;
End;


// Полная очистка от объектов
Procedure DELETE_LINES;
var
I :Integer;
Begin
// Очистка массива
for I:= 0 to Length(Lines) - 1 do
  Begin
  FreeAndNil(Lines[I].Label_Type);
  FreeAndNil(Lines[I].Label_Time);
  FreeAndNil(Lines[I].Label_Way_Name);
  FreeAndNil(Lines[I].Label_Time_Country);
  FreeAndNil(Lines[I].Label_Price);
  FreeAndNil(Lines[I].Label_Currency);
  FreeAndNil(Lines[I].Panel_Main);
  End;
// Обнуление длины
SetLength(Lines, 0);
End;

// Динамическая процедура нажатия на динамическую кнопку
Procedure Tform9.TsClick(Sender:Tobject);
Var
  I:Integer;
Begin
case MessageDlg('Вы точно хотите удалить товар из корзины?',mtConfirmation , [mbYes,mbCancel], 0) of
  mrYes:
    Begin
    // Удаление записи
    LINE_DELETE((Sender as TsBitbtn).Tag);
    // Перезапись объектов
    ADD_LINES;
    // Пересчитываем цену
    REFRESH_PRICE;
    // Текстовое подтверждение
    ShowMessage('Объект был удален из корзины!');
    End;
  mrCancel:Abort;
end;
End;

// Кнопка перехода в главное меню
procedure TForm9.ExitClick(Sender: TObject);
begin
Form9.Hide; // Скрытие текущей формы
Form4.Show; // Показ главного меню
end;

// Предпроверка на случайное закрытие формы
procedure TForm9.FormClose(Sender: TObject; var Action: TCloseAction);
begin
// Выборка пользователя о его намерении 1. Вернуться назад. 2. Выйти из программы
case MessageDlg('Вы точно хотите выйти?', mtConfirmation, [mbYes,mbCancel], 0) of
  mrYes:Application.Terminate;  // Если да - то закрытие программы
  mrCancel:Abort;               // Если же нет то отмена процедуры
end;
end;

// Кастомные настройки которые активируется при старте
procedure TForm9.FormCreate(Sender: TObject);
begin
Main_Box.Color:= RGB(204,204,204);
sImage1.Picture.LoadFromFile('Textures\BackGround\Basket.png');
// Для создания проекта
Image_Comment.Picture.LoadFromFile( 'Textures\Comment.png' );
Image_Tag.Picture.LoadFromFile( 'Textures\Tag.png' );
Image_Phone.Picture.LoadFromFile( 'Textures\Phone.png' );
Image_Fax.Picture.LoadFromFile( 'Textures\Fax.png' );
Image_Web.Picture.LoadFromFile( 'Textures\Web.png' );
end;

procedure TForm9.FormDestroy(Sender: TObject);
begin
DataModule2.Basket_Query.First;
while DataModule2.Basket_Query.RecordCount > 0 do
  DataModule2.Basket_Query.Delete;
end;

// Динамическое изменение положений объектов на форме
procedure TForm9.FormResize(Sender: TObject);
begin
sImage1.Width:=    ClientWidth;
sImage1.Height:=   ClientHeight;
Main_Panel.Left:=  (ClientWidth div 2) - 440;
Main_Panel.Height:= ClientHeight;
Main_Box.Height:=  Main_Panel.Height - 110;
Choose_Panel.Top:= Main_Box.Height + 56;
if Panel_Hotel.Visible then
  Begin
  Panel_Hotel.Top:= (ClientHeight div 2 - 200);
  Panel_Hotel.Left:= (ClientWidth div 2 - 500);
  End;
if Panel_Tour.Visible then
  Begin
  Panel_Tour.Top:= (ClientHeight div 2 - 253);
  Panel_Tour.Left:= (ClientWidth div 2 - 485);
  End;
if Panel_Air.Visible then
  Begin
  Panel_Air.Top:= (ClientHeight div 2 - 76);
  Panel_Air.Left:= (ClientWidth div 2 - 350);
  End;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
ADD_LINES;
Form9.sComboBox1.ItemIndex:= 0;
sComboBox1Change(Sender);
end;

procedure TForm9.sBitBtn1Click(Sender: TObject);
begin
DELETE_LINES;
//
DataModule2.Basket_Query.First;
while DataModule2.Basket_Query.Eof = False do
  DataModule2.Basket_Query.Delete;  
end;

procedure TForm9.sBitBtn3Click(Sender: TObject);
begin
Panel_Tour.Visible:= False;
end;

procedure TForm9.sBitBtn4Click(Sender: TObject);
begin
Panel_Hotel.Visible:= False;
end;

procedure TForm9.sBitBtn7Click(Sender: TObject);
begin
Panel_Air.Visible:= False;
end;

procedure TForm9.sButton4Click(Sender: TObject);
begin
if (DataModule2.Basket_Query.RecordCount > 0) then
  Begin
  Form9.Hide;
  Form10.Show;
  End
  else
  ShowMessage('Корзина пуста!');
end;

procedure TForm9.sComboBox1Change(Sender: TObject);
begin
REFRESH_PRICE;
end;

procedure TForm9.sLabel27Click(Sender: TObject);
begin
With DataModule2.Buffer do
  Begin
  Active:= False;
  SQL.Clear;
  SQL.Add('SELECT * FROM Hotels WHERE (ID=' + IntToStr(sLAbel27.Tag) + ')');
  Active:= True;

  Lbl_HotelName.Caption:= Fields.FieldByName('Name').AsString;
  sBevel22.Width:=Lbl_HotelName.Width;
  Panel_Stars.Caption:= FieldByName('Stars').AsString + ' *';
  Panel_Stars.Left:=sbevel22.Width + 19;
  Lbl_tag1.Visible:=False;
  Lbl_tag2.Visible:=False;
  Lbl_tag3.Visible:=False;
  Lbl_tag4.Visible:=False;
  lbl_HotelInfo.Caption:= FieldByName('Comment').AsString;
  lbl_HotelInfo.Height:=100;
  lbl_HotelInfo.Width:=400;
  info_image.Picture.Assign(FieldByName('Photo'));
  lbl_info_hotel.Caption:= FieldByName('About_hotel').AsString;
  lbl_info_hotel.Width:=388;
  lbl_type_info_hotel.Caption:= FieldByName('Type_Rooms').AsString;
  lbl_type_info_hotel.Width:=388;
  lbl_food_hotel.Caption:= FieldByName('Food').AsString;
  lbl_food_hotel.Width:=388;
  lbl_rooms_hotel.Caption:= FieldByName('About_Room').AsString;
  lbl_rooms_hotel.Width:=388;
  lbl_Place_hotel.Caption:= FieldByName('About_Place').AsString;
  lbl_Place_hotel.Width:=388;
  lbl_Children_hotel.Caption:= FieldByName('About_For_Childrens').AsString;
  lbl_Children_hotel.Width:=388;
  lbl_Entertainment_hotel.Caption:= FieldByName('About_Entertainment').AsString;
  lbl_Entertainment_hotel.Width:=388;
  lbl_Kids_hotel.Caption:= FieldByName('About_Baby').AsString;
  lbl_Kids_hotel.Width:=388;
  Lbl_Phone.Caption:= FieldByName('Phone').AsString;
  Lbl_Fax.Caption:= FieldByName('Fax').AsString;
  Lbl_Web.Caption:= FieldByName('Internet_Address').AsString;
  Lbl_Web.URL:= FieldByName('Internet_Address').AsString;
  Panel_Hotel.Top:= (ClientHeight div 2 - 200);
  Panel_Hotel.Left:= (ClientWidth div 2 - 500);
  Panel_Hotel.Visible:= True;
  End;
end;

procedure TForm9.sLabel28Click(Sender: TObject);
begin
With DataModule2.Buffer do
  Begin
  Active:= False;
  SQL.Clear;
  SQL.Add('SELECT * FROM Air_Ticket WHERE (ID=' + IntToStr(sLAbel28.Tag) + ')');
  Active:= True;
  sLabel7.Caption:= FieldByName('City_D').AsString + ' -> ' + FieldByName('City_A').AsString;
  sLabel9.Caption:= FieldByName('Air_company').AsString;
    case DataModule2.Basket_Query.FieldByName('Fly_Class').AsInteger of
    1:sLabel9.Caption:= 'Первый класс';
    2:sLabel9.Caption:= 'Бизнес класс';
    3:sLabel9.Caption:= 'Эконом класс';
    end;
  sLabel36.Caption:= Date_Info('From');
  sLabel37.Caption:= Date_Info('To');
  Panel_Air.Visible:= True;
  End;
end;

Procedure REFRESH_PRICE; // Процедура обновления цены (Активируется при смене валюты)
Var
  I, Price:Integer;
  Price2:String;
  EndPrice:Integer;
Begin
EndPrice:=0;
DataModule2.Basket_Query.First;
for I:=0 to Length(Lines) - 1 do
  Begin
  Lines[I].Label_Currency.Caption:= Copy(Form9.sComboBox1.Text, 1, 3);
  case Form9.sComboBox1.ItemIndex of
  0:Price:= DataModule2.Basket_Query.FieldByName('Price').AsInteger * KZT;
  1:Price:= DataModule2.Basket_Query.FieldByName('Price').AsInteger;
  2:Price:= Trunc(DataModule2.Basket_Query.FieldByName('Price').AsInteger * EUR);
  3:Price:= DataModule2.Basket_Query.FieldByName('Price').AsInteger * RUB;
  4:Price:= Trunc(DataModule2.Basket_Query.FieldByName('Price').AsInteger * AUD);
  5:Price:= Trunc(DataModule2.Basket_Query.FieldByName('Price').AsInteger * GBP);
  6:Price:= Trunc(DataModule2.Basket_Query.FieldByName('Price').AsInteger * DKK);
  7:Price:= Trunc(DataModule2.Basket_Query.FieldByName('Price').AsInteger * AED); 
  end;
  EndPrice:= EndPrice + Price;
  Price2:= IntToStr(Price);      
  if Length(IntToStr(Price)) > 3 then
    Insert(' ',Price2,Length(Price2)-2);    
  Lines[I].Label_Price.Caption:= Price2;
  Lines[I].Label_Price.Left:= (Lines[I].Additional_Panel.Width div 2) - ((Lines[I].Label_Currency.Width + Lines[I].Label_Price.Width + 6) div 2);
  Lines[I].Label_Currency.Left:= Lines[I].Label_Price.Left + Lines[I].Label_Price.Width + 6;
  DataModule2.Basket_Query.Next;
  End;

Price2:= IntToStr(EndPrice);
 if Price2.Length > 3 then
  Insert(' ', Price2, Price2.Length - 2);
Form9.sLabel10.Caption:= Price2;

Form9.Label2.Caption:= Copy(Form9.sComboBox1.Text, 1, 3); 
Form9.sLabel10.Left:= Form9.Label2.Left -6 - Form9.sLabel10.Width;
Form9.sLabel11.Left:= Form9.sLabel10.Left -6 - Form9.sLabel11.Width; 
End;

// Создание линий
Procedure ADD_LINES;
Var
  B_Type:String;
  I     :Integer;
Begin
// насильная очистка корзины
DELETE_LINES;
// Формирование длины массива
SetLength(Lines,DataModule2.Basket_Query.RecordCount);
// Переход к самому началу
DataModule2.Basket_Query.First;
for I:= 0 to DataModule2.Basket_Query.RecordCount - 1 do
  Begin
    case DataModule2.Basket_Query.FieldByName('B_Type').AsInteger of
    1:B_Type:= 'Air';
    2:B_Type:= 'Hotel';
    3:B_Type:= 'Tour';
    end;
  // Формирование запроса
  DataModule2.Buffer.Active:= False;
  DataModule2.Buffer.SQL.Clear;
  if (B_Type = 'Air') then
    DataModule2.Buffer.SQL.Add('SELECT * FROM Air_Ticket WHERE [ID]=' + DataModule2.Basket_Query.FieldByName('B_ID').AsString);
  if (B_Type = 'Hotel') then
    DataModule2.Buffer.SQL.Add('SELECT * FROM Hotels WHERE [ID]=' + DataModule2.Basket_Query.FieldByName('B_ID').AsString);
  if (B_Type = 'Tour') then
    DataModule2.Buffer.SQL.Add('SELECT H.*, A.*, T.* FROM Hotels AS H, Air_Ticket AS A, Tours AS T WHERE (((H.ID )=[T].[Hotel_ID]) AND ((A.ID)=[T].[Air_ID]) AND ([T].[ID]=' + DataModule2.Basket_Query.FieldByName('B_ID').AsString + '))');

  DataModule2.Buffer.Active:= True;
  // Цонец формирования запроса

  // Формирование панели
  Lines[I].Panel_Main:= TsGradientPanel.Create(Form9);
  Lines[I].Panel_Main.Parent:= Form9.Main_Box;
  Lines[I].Panel_Main.Left:= 3;
  Lines[I].Panel_Main.Height:= 56;
  Lines[I].Panel_Main.Top:= 10 + (I * (Lines[I].Panel_Main.Height+ 6));
  Lines[I].Panel_Main.Width:= 870;
  Lines[I].Panel_Main.PaintData.Color1.Color:= ClWhite;
  Lines[I].Panel_Main.PaintData.Color1.UseSkinColor:= False;
  Lines[I].Panel_Main.PaintData.Color2.Color:= ClWhite;
  Lines[I].Panel_Main.PaintData.Color2.UseSkinColor:= False;
  
  // Формирование типового лейбла
  Lines[I].Label_Type:= TsLabel.Create(Form9);
  Lines[I].Label_Type.Parent:= Lines[I].Panel_Main;
  Lines[I].Label_Type.Font.Style:= [fsBold];
  Lines[I].Label_Type.Left:= 122;
  Lines[I].Label_Type.Top:= 12;
  if (B_Type = 'Hotel') then
    Lines[I].Label_Type.Caption:= 'Отель';
  if (B_Type = 'Air') then
    Lines[I].Label_Type.Caption:= 'Авиабилет';
  if (B_Type = 'Tour') then
    Lines[I].Label_Type.Caption:= 'Тур';
  // Формирование типового лейбла
  Lines[I].Label_Time:= TsLabel.Create(Form9);
  Lines[I].Label_Time.Parent:= Lines[I].Panel_Main;
  Lines[I].Label_Time.Left:= 122;
  Lines[I].Label_Time.Top:= 31;
  Lines[I].Label_Time.Caption:= 
  DataModule2.Basket_Query.FieldByName('Date_Start').AsString+' - '+DataModule2.Basket_Query.FieldByName('Date_Finish').AsString;
  // Формирование типового лейбла
  Lines[I].Label_Way_Name:= TsLabel.Create(Form9);
  Lines[I].Label_Way_Name.Parent:= Lines[I].Panel_Main;
  Lines[I].Label_Way_Name.Left:=334;
  Lines[I].Label_Way_Name.Top:=12;
  if B_Type = 'Air' then   // Air
    Lines[I].Label_Way_Name.Caption:= DataModule2.Buffer.FieldByName('City_D').AsString+' -> '+DataModule2.Buffer.FieldByName('City_A').AsString;
  if B_Type = 'Hotel' then // Hotel
    Lines[I].Label_Way_Name.Caption:= 'Название отеля: ' + DataModule2.Buffer.Fields.FieldByName('Name').AsString;
  if B_Type = 'Tour' then // Tour
    Lines[I].Label_Way_Name.Caption:= 'Отель: ' + DataModule2.Buffer.Fields.FieldByName('Name').AsString;
  // Формирование типового лейбла
  Lines[I].Label_Time_Country:= TsLabel.Create(Form9);
  Lines[I].Label_Time_Country.Parent:= Lines[I].Panel_Main;
  Lines[I].Label_Time_Country.Left:= 334;
  Lines[I].Label_Time_Country.Top:= 31;
  if B_Type = 'Air' then // Air
    Lines[I].Label_Time_Country.Caption:=
    Get_difference(
      DataModule2.Buffer.FieldByName('Date_D').AsString,
      DataModule2.Buffer.FieldByName('Date_A').AsString,
      DataModule2.Buffer.FieldByName('Time_D').AsString,
      DataModule2.Buffer.FieldByName('Time_A').AsString
    );
  if B_Type = 'Hotel' then // Hotel
    Lines[I].Label_Time_Country.Caption:=
      DataModule2.Buffer.FieldByName('Country').AsString +
      ' / ' +
      DataModule2.Buffer.FieldByName('City').AsString;

  if B_Type = 'Tour' then
    case DataModule2.Buffer.FieldByName('Peoples').AsInteger of
    0:Lines[I].Label_Time_Country.Caption:= 'Тип заселения: 1 Взрослый';
    1:Lines[I].Label_Time_Country.Caption:= 'Тип заселения: 1 Взрослый и 1 Ребёнок';
    2:Lines[I].Label_Time_Country.Caption:= 'Тип заселения: 1 Взрослый и 2 Ребёнока';
    3:Lines[I].Label_Time_Country.Caption:= 'Тип заселения: 2 Взрослых';
    4:Lines[I].Label_Time_Country.Caption:= 'Тип заселения: 2 Взрослых и 1 Ребёнок';
    5:Lines[I].Label_Time_Country.Caption:= 'Тип заселения: 2 Взрослых и 2 Ребёнока';
    6:Lines[I].Label_Time_Country.Caption:= 'Тип заселения: 3 Взрослых';
    7:Lines[I].Label_Time_Country.Caption:= 'Тип заселения: 3 Взрослых и 1 Ребёнок';
    8:Lines[I].Label_Time_Country.Caption:= 'Тип заселения: 4 Взрослых';
    end;

  // Формирование Bevel'а
  Lines[I].Picture_Bevel:=TsBevel.Create(Form9);
  Lines[I].Picture_Bevel.Parent:=Lines[I].Panel_Main;
  Lines[I].Picture_Bevel.Left:= 4;
  Lines[I].Picture_Bevel.Top:= 4;
  Lines[I].Picture_Bevel.Width:= 100;
  Lines[I].Picture_Bevel.Height:= 50;
  // Формирование изображения
  Lines[I].Picture:= TsImage.Create(Form9);
  Lines[I].Picture.Parent:= Lines[I].Panel_Main;
  Lines[I].Picture.Left:= 4;
  Lines[I].Picture.Top:= 4;
  Lines[I].Picture.Width:= 100;
  Lines[I].Picture.Height:= 50;
  Lines[I].Picture.Stretch:= True;
  if B_Type = 'Air' then
    Begin
    Lines[I].Picture.Visible:= False;
    Lines[I].Picture_Bevel.Visible:= False;
    End
  else
    Begin
    Lines[I].Picture.Visible:= True;
    Lines[I].Picture_Bevel.Visible:= True;
    End;
  if B_Type = 'Hotel' then
    Lines[I].Picture.Picture.Assign(DataModule2.Buffer.FieldByName('Photo'));
  if B_Type = 'Tour' then
    Lines[I].Picture.Picture.Assign(DataModule2.Buffer.FieldByName('Photo'));

  // Формирование Bevel'а
  Lines[I].Main_Bevel:=TsBevel.Create(Form9);
  Lines[I].Main_Bevel.Parent:=Lines[I].Panel_Main;
  Lines[I].Main_Bevel.Left:= 312;
  Lines[I].Main_Bevel.Top:= 0;
  Lines[I].Main_Bevel.Width:= 3;
  Lines[I].Main_Bevel.Height:= 57;
  // Формирование Дополнительной формы
  Lines[I].Additional_Panel:=TsGradientPanel.Create(Form9);
  Lines[I].Additional_Panel.Parent:=Lines[I].Panel_Main;
  Lines[I].Additional_Panel.Left:= 650;
  Lines[I].Additional_Panel.Top:= 0;
  Lines[I].Additional_Panel.Width:= 220;
  Lines[I].Additional_Panel.Height:= 57;
  Lines[I].Additional_Panel.PaintData.Color1.Color:= RGB(235,235,235);
  Lines[I].Additional_Panel.PaintData.Color1.UseSkinColor:= False;
  Lines[I].Additional_Panel.PaintData.Color2.Color:= RGB(235,235,235);
  Lines[I].Additional_Panel.PaintData.Color2.UseSkinColor:= False;
  // Формирование кнопки (удаления)
  Lines[I].Button_Delete:=TsBitbtn.Create(Form9);
  Lines[I].Button_Delete.Parent:=Lines[I].Additional_Panel;
  Lines[I].Button_Delete.Left:= 6;
  Lines[I].Button_Delete.Top:= 34;
  Lines[I].Button_Delete.Width:= 100;
  Lines[I].Button_Delete.Height:= 20;
  Lines[I].Button_Delete.Caption:='Убрать';
  Lines[I].Button_Delete.Tag:=I;
  Lines[I].Button_Delete.OnClick:= Form9.TsClick;
  Lines[I].Button_Delete.ShowFocus:= False;
  // Формирование кнопки (информации)
  Lines[I].Button_Info:=TsBitbtn.Create(Form9);
  Lines[I].Button_Info.Parent:=Lines[I].Additional_Panel;
  Lines[I].Button_Info.Left:= 112;
  Lines[I].Button_Info.Top:= 34;
  Lines[I].Button_Info.Width:= 100;
  Lines[I].Button_Info.Height:= 20;
  Lines[I].Button_Info.Caption:='Информация';
  Lines[I].Button_Info.Tag:= I;
  Lines[I].Button_Info.ShowFocus:= False;
  Lines[I].Button_Info.OnClick:= Form9.GET_INFO;
  // Формирование типового лейбла
  Lines[I].Label_Price:= TsLabel.Create(Form9);
  Lines[I].Label_Price.Parent:= Lines[I].Additional_Panel;
  Lines[I].Label_Price.Left:= 78;
  Lines[I].Label_Price.Top:= 3;
  Lines[I].Label_Price.Caption:= '25 000';
  Lines[I].Label_Price.Font.Size:= 16;
  Lines[I].Label_Price.Font.Color:= RGB(50, 50, 50);
  // Формирование типового лейбла
  Lines[I].Label_Currency:= TsLabel.Create(Form9);
  Lines[I].Label_Currency.Parent:= Lines[I].Additional_Panel;
  Lines[I].Label_Currency.Left:= 146;
  Lines[I].Label_Currency.Top:= 14;
  Lines[I].Label_Currency.Font.Size:= 9;
  Lines[I].Label_Currency.Font.Color:= RGB(50, 50, 50);
  Lines[I].Label_Currency.Caption:= Copy(Form9.sComboBox1.Items[Form9.sComboBox1.Itemindex], 1, 3);
  // Переход на следующую линию
  DataModule2.Basket_Query.Next;
  End;
End;

end.
