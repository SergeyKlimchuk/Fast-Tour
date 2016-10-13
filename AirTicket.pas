unit AirTicket;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.ExtCtrls, sPanel, sSkinManager, sLabel,
  sBevel, sComboBox, sButton, Vcl.Mask, sMaskEdit, sToolEdit, sCheckBox, sEdit,
  Vcl.ActnPopup, sCheckListBox, Vcl.Buttons, sBitBtn, acPNG, acImage,
  BTNlib, sRadioButton, DateUtils, Vcl.Imaging.jpeg, sCustomComboEdit, sListBox;

type
  TForm6 = class(TForm)
    sPanel2: TsPanel;
    sPanel1: TsPanel;
    Explorer_Panel: TsPanel;
    Button_Panel: TImage;
    Next_Button: TsBitBtn;
    Prior_button: TsBitBtn;
    Search_Panel: TsPanel;
    sBevel1: TsBevel;
    sBevel2: TsBevel;
    sBevel3: TsBevel;
    sBevel4: TsBevel;
    sBevel5: TsBevel;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    sBevel14: TsBevel;
    sCheckBox1: TsCheckBox;
    sCheckBox2: TsCheckBox;
    sCheckBox4: TsCheckBox;
    sCheckBox5: TsCheckBox;
    sCheckBox6: TsCheckBox;
    sCheckBox7: TsCheckBox;
    sCheckListBox1: TsCheckListBox;
    sComboBox2: TsComboBox;
    sComboBox3: TsComboBox;
    sComboBox4: TsComboBox;
    sDateEdit1: TsDateEdit;
    sDateEdit2: TsDateEdit;
    sEdit1: TsEdit;
    sEdit2: TsEdit;
    Main_Panel: TsGradientPanel;
    sBitBtn2: TsBitBtn;
    sBitBtn3: TsBitBtn;
    sImage1: TsImage;
    Label_Basket_Explorer: TsLabel;
    Label_Basket_Count: TsLabel;
    sBitBtn1: TsBitBtn;
    sBitBtn4: TsBitBtn;
    Main_Bevel: TsBevel;
    BackGround_Image: TsImage;
    Castom_Way: TsGradientPanel;
    sBevel15: TsBevel;
    Label_Air_Company: TsLabel;
    Button_Exit: TsBitBtn;
    Button_add_OBJECT: TsBitBtn;
    sLabel28: TsLabel;
    Panel_Citys: TsGradientPanel;
    Edit_Date: TsDateEdit;
    sBevel7: TsBevel;
    sComboBox1: TsComboBox;
    sLabel27: TsLabel;
    sLabel8: TsLabel;
    sLabel9: TsLabel;
    sLabel10: TsLabel;
    Panel_FullInfo: TsPanel;
    sBitBtn5: TsBitBtn;
    sLabel11: TsLabel;
    Label_FWay: TsLabel;
    sLabel13: TsLabel;
    sLabel14: TsLabel;
    sLabel15: TsLabel;
    sLabel16: TsLabel;
    sLabel17: TsLabel;
    sLabel18: TsLabel;
    Label_FFlight: TsLabel;
    Label_FAirCompany: TsLabel;
    LAbel_FClass: TsLabel;
    Label_FPlane: TsLabel;
    Label_FFrom: TsLabel;
    Label_FTo: TsLabel;
    Image1: TImage;
    Label_Not_Found: TLabel;
    sBevel6: TsBevel;
    sLabel12: TsLabel;
    sBevel8: TsBevel;
    sBevel9: TsBevel;
    sBevel10: TsBevel;
    procedure FormCreate(Sender: TObject);
    procedure sLabel1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Next_ButtonClick(Sender: TObject);
    procedure Prior_buttonClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure Button_PanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button_PanelMouseLeave(Sender: TObject);
    procedure Button_PanelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button_PanelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Label_Basket_ExplorerClick(Sender: TObject);
    procedure Button_add_OBJECTClick(Sender: TObject);
    procedure Button_ExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sComboBox1Change(Sender: TObject);
    Procedure Get_Info(Sender: TObject);
    procedure Edit_DateChange(Sender: TObject);
    procedure sLabel28Click(Sender: TObject);
    procedure sBitBtn5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

Const
  Panel_Count=6;
  KZT= 333;
  USD= 1;
  EUR= 0.89;
  RUB= 62;
  AUD= 1.32;
  GBP= 0.79;
  DKK= 6.65;
  AED= 3.67;

var
  Form6: TForm6;
  Button_Count  :integer = 1; // Количетво кнопок
  Pages_count   :Integer;     // Количество страниц
  Page_Current  :Integer;     // Текущая страница

//.........Блок динамических объектов..........................//
  Home_Panel        :Array [1..Panel_Count] of TsGradientPanel;//
  Label_Way         :Array [1..Panel_Count] of TsLabel;        //
  Picture_Plane     :Array [1..Panel_Count] of TsImage;        //
  Label_AirCompany  :Array [1..Panel_Count] of TsLabel;        //
  Label_Days        :Array [1..Panel_Count] of TsLabel;        //
  Label_Date        :Array [1..Panel_Count] of TsLabel;        //
  Home_Bevel        :Array [1..Panel_Count] of TsBevel;        //
  Label_Info        :Array [1..Panel_Count] of TsLabel;        //
  Label_Type        :Array [1..Panel_Count] of TsLabel;        //
  Label_FlightTime  :Array [1..Panel_Count] of TsLabel;        //
  Picture_AirCompany:Array [1..Panel_Count] of TsImage;        //
  Panel_Explorer    :Array [1..Panel_Count] of TsGradientPanel;//
  Label_Price       :Array [1..Panel_Count] of TsLabel;        //
  Label_Currency    :Array [1..Panel_Count] of TsLabel;        //
  Label_Message     :Array [1..Panel_Count] of TsLabel;        //
  Button_Choose     :Array [1..Panel_Count] of TsBitBtn;       //
  Explorer_Bevel    :Array [1..Panel_Count] of TsBevel;        //
//.............................................................//

//.........Блок кнопок.........................//
  Pages_mas:Array                  of String;  //
  CButtons :Array                  of TCButton;//
//.............................................//

//.........Блок процедур...............................//
  procedure BUILD_PAGE(Index:Integer);                 //
  Procedure BUILD_LINE(Index:Integer; OnNext:Boolean); //
  Procedure CHECK_BASKET;                              //
  Procedure REFRESH_PRICE;                             //
//.....................................................//

implementation

{$R *.dfm}

uses Modul, Main, Basket;

Procedure TForm6.GET_INFO(Sender: TObject);
Var
  I, D:integer;
  S, P:String;
//  FYearBoldManager: TYearBoldManager;
Begin
// Переход к началу
DataModule2.Air_Query.First;
// Переход к нужной записи
DataModule2.Air_Query.MoveBy(((Page_Current - 1) * Panel_Count) + ((Sender as TsBitBtn).Tag - 1));
// Заполняем поля
Label_Air_Company.Caption:= DataModule2.Air_Query.FieldByName('Air_company').AsString;
Label_Air_Company.Left:= sBevel15.Left + ((sBevel15.Width div 2) - (Label_Air_Company.Width div 2));
Panel_Citys.Caption:= DataModule2.Air_Query.FieldByName('City_D').AsString + ' -> ' + DataModule2.Air_Query.FieldByName('City_A').AsString;
Panel_Citys.Refresh;
if DataModule2.Air_Query.FieldByName('Regular').AsString = '+' then
  Begin
  // Выставляем дни вылетов
  sLabel10.Caption:= 'Летает по: ( ' + StringReplace(DataModule2.Air_Query.FieldByName('Days').AsString, ';', ', ', [rfReplaceAll, rfIgnoreCase]);
  sLabel10.Caption:= Copy(sLabel10.Caption, 1 , Length(sLabel10.Caption) - 2) + ' )';
  sLabel10.Left:= 448 - (sLabel10.Width div 2);
  Button_add_OBJECT.Enabled:= False;
  sLabel10.Visible:= True;
  Edit_Date.Visible:= True;
  End
  else
  Begin
  Button_add_OBJECT.Enabled:= True;
  sLabel10.Visible:= False;
  Edit_Date.Visible:= False;
  End;
// Перекидываем тег
sLabel28.Tag:= (Sender as TsBitBtn).Tag;
// Показываем
Castom_Way.Visible:= True;
End;

Procedure Check_Basket;
Begin
if (DataModule2.Basket_Query.RecordCount > 0) then
  Form6.Label_Basket_Count.Caption:= 'В вашей корзине: ' + IntToStr(DataModule2.Basket_Query.RecordCount) + ' товаров!'
    else
      Form6.Label_Basket_Count.Caption:= 'Нет товаров!';
End;

procedure BUILD_PAGE(Index:integer); // Построение страницы
Var
  I, D, Residue :integer;
Begin
// Скрываем поле
if Form6.Castom_Way.Visible = True then
   Form6.Castom_Way.Visible:= False;
// Делаем проверку на присутствие записей на странице
if (DataModule2.Air_Query.RecordCount > 0) then
  Begin
  // Убираем надпись об отсутствии записей
  Form6.Label_Not_Found.Visible:= False;
  // Переход на первую запись нашей страницы
  DataModule2.Air_Query.First;
  if (Index > 1) then
    DataModule2.Air_Query.MoveBy((Index - 1) * Panel_count);
  // Узнаем остаточное кол-во записей
  Residue:= DataModule2.Air_Query.RecordCount - ((Index - 1) * Panel_count);
  // Отключаем все не задействующиеся формы
  if (Residue < Panel_count) then
    for I:= 1 to Panel_count do
      if (I <= Residue) then
        Home_Panel[I].Visible:= True
          else
            Home_Panel[I].Visible:= False
              else
                for I:= 1 to Panel_count do
                  Home_Panel[I].Visible:= True;
  // Создание страницы
  if (Residue >= Panel_count)  then
    for I:= 1 to Panel_Count do
      Build_Line(I, True)
        else
          for I:= 1 to Residue do
            Build_Line(I, True);
  End
else  // В случае если послали пустую страницу на отрисовку
  begin
  for I:= 1 to Panel_count do
    Home_Panel[I].Visible:= False;
  Form6.Label_Not_Found.visible:= True;
  end;
// Изменение кнопок
CButtons[Page_Current - 1].State:= cbStay;
Form6.Button_panel.Canvas.Draw(CButtons[Page_Current - 1].Left, CButtons[Page_Current - 1].Top, CButtons[Page_Current - 1].Paint);
CButtons[Index - 1].State:= cbLocked;
Form6.Button_panel.Canvas.Draw(CButtons[Index - 1].Left, CButtons[Index - 1].Top, CButtons[Index - 1].Paint);
Page_Current:= Index;
// Обновление цены
REFRESH_PRICE;
End;

Function _Date:String;
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
if (DataModule2.Air_Query.FieldByName('Regular').AsString = '+') then
  sLine:= 'Время перелёта: ' + IntToStr(HourOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_D').AsString))) + ':' + IntToStr(MinuteOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_D').AsString))) + ' - ' + IntToStr(HourOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_A').AsString))) + ':' + IntToStr(MinuteOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_A').AsString)))
    else
    begin
    // Фиксируем даты
    sDate1:= VarToDateTime(DataModule2.Air_Query.FieldByName('Date_D').AsString + ' ' + IntToStr(HourOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_D').AsString))) + ':' + IntToStr(MinuteOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_D').AsString))));
    sDate2:= VarToDateTime(DataModule2.Air_Query.FieldByName('Date_A').AsString + ' ' + IntToStr(HourOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_A').AsString))) + ':' + IntToStr(MinuteOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_A').AsString))));
    // Формируем начало итоговой строки
    sLine:= IntToStr(DayOf(sDate1)) + ' ' + sMouths[MonthOf(sDate1)] + ', ' + sDay[DayOfWeek(sDate1)];
    // Берём оставшуюся часть в буффер
    Buf:=   IntToStr(DayOf(sDate2)) + ' ' + sMouths[MonthOf(sDate2)] + ', ' + sDay[DayOfWeek(sDate2)];
    // Проверка на совподение
    if (sLine = Buf) then
      sLine:= sLine + ' ' +IntToStr(HourOf(sDate1)) + ':' + IntToStr(MinuteOf(sDate1)) + ' — ' + IntToStr(HourOf(sDate2)) + ':' + IntToStr(MinuteOf(sDate2))
        else
          sLine:= sLine + ' ' + IntToStr(HourOf(sDate1)) + ':' + IntToStr(MinuteOf(sDate1)) + ' — ' + #13#10 + Buf + ' ' + IntToStr(HourOf(sDate2)) + ':' + IntToStr(MinuteOf(sDate2))
    end;
Result:= sLine;
End;

Function _Days:String;
Var
  sLine         :String;
  sDate1, sDate2:TDateTime;
Begin
if (DataModule2.Air_Query.FieldByName('Regular').AsString = '+') then
  Begin
  sLine:= 'Дни полёта: ' + StringReplace(DataModule2.Air_Query.FieldByName('Days').AsString, ';', ', ',[rfReplaceAll, rfIgnoreCase]);
  Delete(sLine, Length(sLine)-1,  2);
  End
  else
    sLine:= '';
Result:= sLine;
End;

Function _Time:String;
Var
  Dt1,Dt2:TDateTime;
  Minutes:integer;
  Output :String;
Begin
// Формируем первую дату
Dt1:=VarToDateTime(DataModule2.Air_Query.FieldByName('Date_D').AsString+' '+TimeToStr(TimeOf(StrToDateTime(DataModule2.Air_Query.FieldByName('Time_D').AsString))));
// Формируем вторую дату
Dt2:=VarToDateTime(DataModule2.Air_Query.FieldByName('Date_A').AsString+' '+TimeToStr(TimeOf(StrToDateTime(DataModule2.Air_Query.FieldByName('Time_A').AsString))));
// Сохранение часов и времени
Minutes:=MinutesBetween(Dt1,Dt2);
// Формируем
Output:='Общее время перелёта: ';
if (Minutes Div 60) > 0 then
  Output:= Output + IntToStr((Minutes Div 60)) + 'ч ';
if Minutes > 0 then
  Output:= Output + IntToStr(Minutes - ((Minutes Div 60) * 60)) + 'м';
// Вывод
Result:= Output;
End;

Procedure Build_Line(Index:integer; OnNext:Boolean); // Построение строки
Begin
// Выводим информацию в поля
  Label_Way         [Index].Caption:= DataModule2.Air_Query.FieldByName('City_D').AsString + ' -> ' + DataModule2.Air_Query.FieldByName('City_A').AsString;
  Label_AirCompany  [Index].Caption:= DataModule2.Air_Query.FieldByName('Air_Company').AsString;
  Label_Days        [Index].Caption:= _Days;
  Label_Date        [Index].Caption:= _Date;
  Label_Type        [Index].Caption:='Прямой рейс';
  Label_Type        [Index].Font.Color:= $0000BE93;
  Label_FlightTime  [Index].Caption:= _Time;
//  Picture_AirCompany[Index]
// Переключаемся на следующую запись
if (DataModule2.Air_Query.Eof = False) and (OnNext = true) then 
  DataModule2.Air_Query.Next;
End;

procedure TForm6.Button_add_OBJECTClick(Sender: TObject);
begin
DataModule2.Basket_Query.Insert;
DataModule2.Basket_Query.FieldByName('B_Type').AsString:= '1';
DataModule2.Basket_Query.FieldByName('B_ID').AsString:= DataModule2.Air_Query.FieldByName('ID_of_recrod').AsString;
if (DataModule2.Air_Query.FieldByName('Regular').AsString = '+') then
  Begin
  DataModule2.Basket_Query.FieldByName('Date_Start').AsString:= Edit_Date.Text;
  DataModule2.Basket_Query.FieldByName('Date_Finish').AsString:= Edit_Date.Text;
  End
    else
      Begin
      DataModule2.Basket_Query.FieldByName('Date_Start').AsString:= DataModule2.Air_Query.FieldByName('Date_D').AsString;
      DataModule2.Basket_Query.FieldByName('Date_Finish').AsString:= DataModule2.Air_Query.FieldByName('Date_A').AsString;
      End;
DataModule2.Basket_Query.FieldByName('Price').AsString:= '1000';
DataModule2.Basket_Query.Post;
// Проверка корзины
Check_Basket;
// Закрытие нашей формы
Castom_Way.Visible:= False;
// Вывод сообщение об успешном добавлении
ShowMessage('Билет был успешно добавлен в корзину');
end;

procedure TForm6.Button_ExitClick(Sender: TObject);
begin
Castom_Way.Visible:= False;
end;

procedure TForm6.Button_PanelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
Var
  I, D :Integer;
begin
for I:=0 to Button_Count-1 do
  if (CButtons[I].Left <= X) AND (X <= CButtons[I].Left+CButtons[I].Width)
  AND (CButtons[I].Top <= Y) AND (Y <= CButtons[I].Top + CButtons[I].Height) then
    if CButtons[I].State<>cbLocked then
    Begin
    CButtons[I].State:=cbPressed;
    Form6.Button_panel.Canvas.Draw(CButtons[I].Left,CButtons[I].Top, CButtons[I].Paint);
    End;
end;

procedure TForm6.Button_PanelMouseLeave(Sender: TObject);
Var
  I :integer;
begin
for I:=0 to Button_Count-1 do
    Begin
    if CButtons[I].State<>cbLocked then
      CButtons[I].State:=cbStay;
    Form6.Button_panel.Canvas.Draw(CButtons[I].Left,CButtons[I].Top, CButtons[I].Paint);
    End;
end;

procedure TForm6.Button_PanelMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  I:Integer;
begin
for I:=0 to Button_Count-1 do
  if (CButtons[I].Left <= X) AND (X <= CButtons[I].Left + CButtons[I].Width)
  AND (CButtons[I].Top <= Y) AND (Y <= CButtons[I].Top + CButtons[I].Height) then
    begin
    if CButtons[I].State<>cbLocked then
      if GetKeyState(VK_LBUTTON)<0 then
        CButtons[I].State:=cbPressed
          else
            CButtons[I].State:=cbHover;
    Form6.Button_panel.Canvas.Draw(CButtons[I].Left,CButtons[I].Top, CButtons[I].Paint);
    end
  else
  if CButtons[I].State<>cbLocked then
    begin
    CButtons[I].State:=cbStay;
    Form6.Button_panel.Canvas.Draw(CButtons[I].Left,CButtons[I].Top, CButtons[I].Paint);
    end;
end;

procedure TForm6.Button_PanelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
Var
  I, D :Integer;
begin
for I:=0 to Button_Count-1 do
  if (CButtons[I].Left <= X) AND (X <= CButtons[I].Left + CButtons[I].Width)
  AND (CButtons[I].Top <= Y) AND (Y <= CButtons[I].Top + CButtons[I].Height) then
    if (Page_Current <> (X div 35) + 1) then
      Begin
      // Построение страницы
      Build_Page((X div 35) + 1);
      // Открытие кнопок перемещения
      if (Page_Current + 1) > Length(Pages_mas) then Next_button.Enabled:= False else Next_button.Enabled:= True;
      if (Page_Current - 1) < 1 then Prior_button.Enabled:= False else Prior_button.Enabled:= True;
      End;
end;

procedure TForm6.Edit_DateChange(Sender: TObject);
Var
  Tr:Boolean;
  S:String;
begin
// Проверка на вхождение
Tr:= False;
S:= DataModule2.Air_Query.FieldByName('Days').AsString;
case DayOfWeek(Edit_Date.Date) of
2:if Pos('ПН;', S) <> 0 then Tr:= True;
3:if Pos('ВТ;', S) <> 0 then Tr:= True;
4:if Pos('СР;', S) <> 0 then Tr:= True;
5:if Pos('ЧТ;', S) <> 0 then Tr:= True;
6:if Pos('ПТ;', S) <> 0 then Tr:= True;
7:if Pos('СБ;', S) <> 0 then Tr:= True;
1:if Pos('ВС;', S) <> 0 then Tr:= True;
end;
if (Tr = True) then
  Begin
  sLabel8.Visible:= False;
  sLabel9.Visible:= False;
  Button_add_OBJECT.Enabled:= True;
  Edit_Date.Tag:= 1;
  End
  else
  Begin
  sLabel8.Visible:= True;
  sLabel9.Visible:= True;
  Button_add_OBJECT.Enabled:= False;
  Edit_Date.Tag:= 0;
  End;
end;

procedure TForm6.FormActivate(Sender: TObject);
begin
sLabel1Click(sender);
end;

procedure TForm6.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  case MessageDlg('Вы точно хотите выйти?',mtConfirmation , [mbYes,mbCancel], 0) of
  mrYes:Application.Terminate;
  mrCancel:Abort;
  end;
end;

procedure TForm6.FormCreate(Sender: TObject);
Var
I:Integer;
CHK1,CHK2,CHK3:Boolean;
Img:TPicture;
R,G,B:Double;
DR,DG,DB:Double;
begin
// Загрузка изображения
Img:= TPicture.Create;
Img.LoadFromFile('Textures\Plane.png');
// Создание динамических элементов
For I:=1 to Panel_Count do
  Begin
    Home_Panel[I]:=TsGradientPanel.create(Owner);
    Home_Panel[I].Parent:= Main_Panel;
    Home_Panel[I].Width:= 800;
    Home_Panel[I].Height:= 100;
    Home_Panel[I].Left:= 0;
    case I of
    1:Home_Panel[I].Top:= 100;
    2:Home_Panel[I].Top:= 210;
    3:Home_Panel[I].Top:= 320;
    4:Home_Panel[I].Top:= 430;
    5:Home_Panel[I].Top:= 540;
    6:Home_Panel[I].Top:= 650;
    end;
    // Лейбел "Авиакомпания:"
    Label_AirCompany[I]:=TsLabel.create(Owner);
    Label_AirCompany[I].Parent:= Home_Panel[I];
    Label_AirCompany[I].Left:= 15;
    Label_AirCompany[I].Top:= 8;
    Label_AirCompany[I].Font.Style:=[fsBold];
    // Лейбел "Авиакомпания:"
    Picture_Plane[I]:=TsImage.create(Owner);
    Picture_Plane[I].Parent:= Home_Panel[I];
    Picture_Plane[I].Left:= 5;
    Picture_Plane[I].Top:= 27;
    Picture_Plane[I].Width:= 16;
    Picture_Plane[I].Height:= 16;
    Picture_Plane[I].Picture.Assign(Img);
    // Лейбел "Путь"
    Label_Way[I]:=TsLabel.create(Owner);
    Label_Way[I].Parent:= Home_Panel[I];
    Label_Way[I].Left:= 27;
    Label_Way[I].Top:= 27;
    // Лейбел "Дата полёта / время:"
    Label_Date[I]:=TsLabel.create(Owner);
    Label_Date[I].Parent:= Home_Panel[I];
    Label_Date[I].Left:= 27;
    Label_Date[I].Top:= 46;
    // Лейбел "Дни вылетов:"
    Label_Days[I]:=TsLabel.create(Owner);
    Label_Days[I].Parent:= Home_Panel[I];
    Label_Days[I].Left:= 27;
    Label_Days[I].Top:= 65;
    // Bevel заграничитель
    Home_Bevel[I]:=TsBevel.create(Owner);
    Home_Bevel[I].Parent:=Home_Panel[I];
    Home_Bevel[I].Left:= 200;
    Home_Bevel[I].Top:= -1;
    Home_Bevel[I].Width:= 3;
    Home_Bevel[I].Height:= 102;
    // Лейбел ""
    Label_Info[I]:=TsLabel.create(Owner);
    Label_Info[I].Parent:= Home_Panel[I];
    Label_Info[I].Left:= 206;
    Label_Info[I].Top:= 8;
    Label_Info[I].Font.Style:= [fsUnderline];
    Label_Info[I].Cursor:= crHandPoint;
    Label_Info[I].Caption:= 'Детали перелёта';
    Label_Info[I].OnClick:= sLabel28Click;
    Label_Info[I].Tag:= I;
    // Лейбел ""
    Label_Type[I]:=TsLabel.create(Owner);
    Label_Type[I].Parent:= Home_Panel[I];
    Label_Type[I].Left:= 209;
    Label_Type[I].Top:= 27;
    Label_Type[I].UseSkinColor:= False;
    Label_Type[I].Font.Style:= [fsBold];
    Label_Type[I].Color:= $0000BE93;
    // Лейбел "Время полёта"
    Label_FlightTime[I]:=TsLabel.create(Owner);
    Label_FlightTime[I].Parent:= Home_Panel[I];
    Label_FlightTime[I].Left:= 209;
    Label_FlightTime[I].Top:= 46;
    // Лейбел "Авиакомпания"
    Picture_AirCompany[I]:=TsImage.create(Owner);
    Picture_AirCompany[I].Parent:= Home_Panel[I];
    Picture_AirCompany[I].Left:= 209;
    Picture_AirCompany[I].Top:= 0;
    Picture_AirCompany[I].Width:= 400;
    Picture_AirCompany[I].Height:= 100;
    Picture_AirCompany[I].SendToBack;
    // Лейбел ""
    Panel_Explorer[I]:=TsGradientPanel.create(Owner);
    Panel_Explorer[I].Parent:= Home_Panel[I];
    Panel_Explorer[I].Left:= 600;
    Panel_Explorer[I].Top:= 0;
    Panel_Explorer[I].Width:= 200;
    Panel_Explorer[I].Height:= 100;
    Panel_Explorer[I].PaintData.Color1.Color:= $00EBEBEB;
    Panel_Explorer[I].PaintData.Color2.UseSkinColor:= False;
    Panel_Explorer[I].PaintData.Color2.Color:= $00EBEBEB;
    // Лейбел ""
    Label_Price[I]:=TsLabel.create(Owner);
    Label_Price[I].Parent:= Panel_Explorer[I];
    Label_Price[I].Left:= 55;
    Label_Price[I].Top:= 24;
    Label_Price[I].Font.Size:= 16;
    // Лейбел ""
    Label_Currency[I]:=TsLabel.create(Owner);
    Label_Currency[I].Parent:= Panel_Explorer[I];
    Label_Currency[I].Left:= 123;
    Label_Currency[I].Top:= 32;
    Label_Currency[I].Caption:= 'KZT';
    Label_Currency[I].Font.Size:= 9;
    // Лейбел ""
    Label_Message[I]:=TsLabel.create(Owner);
    Label_Message[I].Parent:= Panel_Explorer[I];
    Label_Message[I].Left:= 28;
    Label_Message[I].Top:= 44;
    Label_Message[I].Caption:='Цена за всех пассажиров';
    Label_Message[I].Font.Size:= 9;
    // Лейбел ""
    Button_Choose[I]:=TsBitBtn.create(Owner);
    Button_Choose[I].Parent:= Panel_Explorer[I];
    Button_Choose[I].Left:= 50;
    Button_Choose[I].Top:= 64;
    Button_Choose[I].Width:= 100;
    Button_Choose[I].Height:= 25;
    Button_Choose[I].Cursor:= crHandPoint;
    Button_Choose[I].Caption:= 'Выбрать';
    Button_Choose[I].Tag:= I;
    Button_Choose[I].OnClick:= Get_Info;
    // Кнопка с капчей ""
    Explorer_Bevel[I]:=TsBevel.Create(Owner);
    Explorer_Bevel[I].Parent:= Panel_Explorer[I];
    Explorer_Bevel[I].Left:= 0;
    Explorer_Bevel[I].Top:= 0;
    Explorer_Bevel[I].Width:= 200;
    Explorer_Bevel[I].Height:= 100;
    Explorer_Bevel[I].Style:= bsLowered;
  End;
// Создание списка
SetLength(Pages_mas, (DataModule2.Air_Query.Recordcount Div Panel_count));
if (DataModule2.Air_Query.Recordcount Mod Panel_count) > 0 then
  SetLength(Pages_mas, Length(Pages_mas) + 1);
// Кнопки експлорера
// Находим общее кол-во кнопок
Button_Count:= (DataModule2.Air_Query.Recordcount Div Panel_count);
if (DataModule2.Air_Query.Recordcount Mod Panel_count) > 0 then
  Button_Count:= Button_Count + 1;
SetLength(CButtons, Button_Count);
// Отрисовываем задний фон
R:=255.0; DR:= (247 - R) / Button_Panel.Height;
G:=255.0; DG:= (247 - G) / Button_Panel.Height;
B:=255.0; DB:= (247 - B) / Button_Panel.Height;
for I:= 0 to Button_Panel.Height+1 do
  Begin
  Button_Panel.Canvas.Pen.Color:=RGB(Trunc(R), Trunc(G), Trunc(B));
  Button_Panel.Canvas.MoveTo(0, I);
  Button_Panel.Canvas.LineTo(Button_Panel.Width, I);
  R:= R + DR;
  G:= G + DG;
  B:= B + DB;
  End;
// Создаем массив кнопок
for I:= 0 to (Button_count - 1) do
  begin
  CButtons[I].BorderWidth:= 1;
  CButtons[I].Left:= I * 35;
  CButtons[I].Top:= 8;
  CButtons[I].Height:= 32;
  CButtons[I].Width:= 32;
  CButtons[I].BorderRadius:= 8;
  CButtons[I].BorderColor:= RGB(220,220,220);
  CButtons[I].Color:= RGB(237,237,237);
  CButtons[I].Color_off:= RGB(0,128,255);
  CButtons[I].BackColor:= ClWhite;
  CButtons[I].Gradient.Color1:= RGB(254,254,254);
  CButtons[I].Gradient.Color2:= RGB(221,221,221);
  CButtons[I].Caption:= IntToStr(I + 1);
  CButtons[I].BackGradient.Enabled:=True;
  CButtons[I].BackGradient.Color1:=RGB(253,253,253);
  CButtons[I].BackGradient.Color2:=RGB(248,248,248);
  if (I = 0) then
    CButtons[I].State:= cbLocked
      else
        CButtons[I].State:= cbStay;
  CButtons[I].Create;
  Button_panel.Canvas.Draw(CButtons[I].Left, CButtons[I].Top, CButtons[I].Paint);
  end;

  // Заполнение комбобокса предметами где предметы - (Названия городов)
  DataModule2.Air_Query.First; // переключаемс на самое начало
  while DataModule2.Air_Query.Eof = False do
  Begin
  CHK1:= False; // Наден элемент = ложь
  for I:=1 to DataModule2.Air_Query.RecordCount do
    Begin
    if LowerCase(sComboBox3.Items[I - 1] )= LowerCase(DataModule2.Air_Query.Fields.Fields[1].AsString) then
      CHK1:= True; // Наден элемент = правда
    if LowerCase(sComboBox2.Items[I - 1]) = LowerCase(DataModule2.Air_Query.Fields.Fields[5].AsString) then
      CHK2:= True; // Наден элемент = правда
    if LowerCase(sComboBox4.Items[I - 1]) = LowerCase(DataModule2.Air_Query.Fields.Fields[9].AsString) then
      CHK3:= True; // Наден элемент = правда
    end;
  if (CHK1 = False) then // Если мы не нашли похожий элемент в нашем комбобоксе то мы его добавляем
    sComboBox3.Items.Add(DataModule2.Air_Query.Fields.Fields[1].AsString);
  if (CHK2 = False) then // Если мы не нашли похожий элемент в нашем комбобоксе то мы его добавляем
    sComboBox2.Items.Add(DataModule2.Air_Query.Fields.Fields[5].AsString); 
  if (CHK3 = False) then // Если мы не нашли похожий элемент в нашем комбобоксе то мы его добавляем
    sComboBox4.Items.Add(DataModule2.Air_Query.Fields.Fields[9].AsString);   
  DataModule2.Air_Query.Next; // Переходим к следующей записи
  End;
// Выставляем значения поисковиков на стартовые позиции
sComboBox3.ItemIndex:= 0;
sComboBox2.ItemIndex:= 0;
sComboBox2.ItemIndex:= 0;
sComboBox4.ItemIndex:= 0;
// Вычисляем кол-во страниц
Pages_count:= (DataModule2.Air_Query.RecordCount div Panel_Count);
if (DataModule2.Air_Query.RecordCount mod Panel_Count) > 0 then
  Pages_count:= Pages_count + 1;
// Выставляем текущей страницей - страницу 1
Page_Current:= 1;
// проверяем будут ли кнопки активны
if (Page_Current + 1) <= Pages_count then
  Next_Button.Enabled:= True;
// Строим список
Build_page(Page_Current);
end;

procedure TForm6.FormResize(Sender: TObject);
begin
Search_Panel.left:=(ClientWidth div 2) - (Search_Panel.Width div 2);
Explorer_Panel.Left:= Search_Panel.left;
Explorer_Panel.Top:= sPanel2.Top - Explorer_Panel.Height;
Main_Panel.Left:= (ClientWidth div 2) - (Main_Panel.Width div 2);
Main_Panel.Height:= ClientHeight;
sPanel1.Left:= (ClientWidth div 2) - (sPanel1.Width div 2);
Main_Bevel.Height:= Main_Panel.Height-1;
BackGround_Image.Width:= ClientWidth;
BackGround_Image.Height:= ClientHeight;
Castom_Way.Left:= Main_Panel.Left + 40;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
Check_Basket;
end;

procedure TForm6.Label_Basket_ExplorerClick(Sender: TObject);
begin
Form6.Hide;
Form9.show;
end;

procedure TForm6.Next_ButtonClick(Sender: TObject);
begin
if (Page_Current < Pages_Count) then
  Begin
  Build_page(Page_Current+1);
  Prior_Button.Enabled:= True;
  if (Page_Current = Pages_Count) then
    Next_Button.Enabled:=False;
  End;
end;

procedure TForm6.Prior_buttonClick(Sender: TObject);
begin
if (Page_Current > 1) then
  Begin
  Build_page(Page_Current - 1);
  Next_Button.Enabled:= True;
  if (Page_Current = 1) then
    Prior_Button.Enabled:= False;
  End;
end;

procedure TForm6.sBitBtn2Click(Sender: TObject);
begin
Form6.Hide;
Form4.show;
end;

procedure TForm6.sBitBtn5Click(Sender: TObject);
begin
Panel_FullInfo.Visible:= False;
end;

Procedure REFRESH_PRICE; // Процедура обновления цены (Активируется при смене валюты)
Var
  I, Price:Integer;
  Price2  :String;
  EndPrice:Integer;
Begin
DataModule2.Air_Query.First;
// Переход на первую запись нашей страницы
if (Page_Current > 1) then
  for I:= 2 to Page_Current do
    for EndPrice:= 1 to Panel_count do
      DataModule2.Air_Query.Next;
EndPrice:=0;
for I:= 1 to Panel_Count do
  Begin
  Label_Currency[I].Caption:= Copy(Form6.sComboBox1.Text, 1, 3);
  case Form6.sComboBox1.ItemIndex of
  0:Price:= DataModule2.Air_Query.FieldByName('Price_EC').AsInteger * KZT;
  1:Price:= DataModule2.Air_Query.FieldByName('Price_EC').AsInteger;
  2:Price:= Trunc(DataModule2.Air_Query.FieldByName('Price_EC').AsInteger * EUR);
  3:Price:= DataModule2.Air_Query.FieldByName('Price_EC').AsInteger * RUB;
  4:Price:= Trunc(DataModule2.Air_Query.FieldByName('Price_EC').AsInteger * AUD);
  5:Price:= Trunc(DataModule2.Air_Query.FieldByName('Price_EC').AsInteger * GBP);
  6:Price:= Trunc(DataModule2.Air_Query.FieldByName('Price_EC').AsInteger * DKK);
  7:Price:= Trunc(DataModule2.Air_Query.FieldByName('Price_EC').AsInteger * AED);
  end;
  EndPrice:= EndPrice + Price;
  Price2:= IntToStr(Price);
  if Length(Price2) > 3 then
    Insert(' ',Price2,Length(Price2)-2);
  Label_Price[I].Caption:= Price2;
  Label_Price[I].Left:= (Panel_Explorer[I].Width div 2) - ((Label_Currency[I].Width + Label_Price[I].Width + 6) div 2);
  Label_Currency[I].Left:= Label_Price[I].Left + Label_Price[I].Width + 6;
  DataModule2.Air_Query.Next;
  End;
Form6.sLabel6.Caption:= Copy(Form6.sComboBox1.Text, 1, 3);
Form6.sLabel7.Caption:= Form6.sLabel6.Caption;
End;

procedure TForm6.sComboBox1Change(Sender: TObject);
begin
REFRESH_PRICE;
end;

procedure TForm6.sLabel1Click(Sender: TObject);
Var
MSG      :String;
I        :integer;
FRST     :Boolean;
Prm1,Prm2:String;
R,G,B,DR,DG,DB:Double;
begin
//Формирование запроса по городам
MSG:='SELECT * FROM Air_Ticket ';
FRST:=True;
if (sCheckBox2.Checked=True) AND (sComboBox3.ItemIndex<>0) then
  case FRST of
  True:Begin MSG:=MSG+' WHERE (City_D="'+sComboBox3.Text+'")'; FRST:=False; end;
  False:MSG:=MSG+' AND (City_D="'+sComboBox3.Text+'")';
  end;
if (sCheckBox1.Checked=True) AND (sComboBox2.ItemIndex<>0) then
  case FRST of
  True:Begin MSG:=MSG+' WHERE (City_A="'+sComboBox2.Text+'")'; FRST:=False; end;
  False:MSG:=MSG+' AND (City_A="'+sComboBox2.Text+'")';
end;
//..............................................................................
  case Form6.sComboBox1.ItemIndex of
  0:Prm1:= IntToStr(Trunc(StrToInt(sEdit1.Text) / KZT));
  1:Prm1:= sEdit1.Text;
  2:Prm1:= IntToStr(Trunc(StrToInt(sEdit1.Text) / EUR));
  3:Prm1:= IntToStr(Trunc(StrToInt(sEdit1.Text) / RUB));
  4:Prm1:= IntToStr(Trunc(StrToInt(sEdit1.Text) / AUD));
  5:Prm1:= IntToStr(Trunc(StrToInt(sEdit1.Text) / GBP));
  6:Prm1:= IntToStr(Trunc(StrToInt(sEdit1.Text) / DKK));
  7:Prm1:= IntToStr(Trunc(StrToInt(sEdit1.Text) / AED));
  end;
  case Form6.sComboBox1.ItemIndex of
  0:Prm2:= IntToStr(Trunc(StrToInt(sEdit2.Text) / KZT));
  1:Prm2:= sEdit2.Text;
  2:Prm2:= IntToStr(Trunc(StrToInt(sEdit2.Text) / EUR));
  3:Prm2:= IntToStr(Trunc(StrToInt(sEdit2.Text) / RUB));
  4:Prm2:= IntToStr(Trunc(StrToInt(sEdit2.Text) / AUD));
  5:Prm2:= IntToStr(Trunc(StrToInt(sEdit2.Text) / GBP));
  6:Prm2:= IntToStr(Trunc(StrToInt(sEdit2.Text) / DKK));
  7:Prm2:= IntToStr(Trunc(StrToInt(sEdit2.Text) / AED));
  end;
if (sCheckBox6.Checked=True) and (sCheckBox7.Checked=True) then
  Begin
  if sCheckListBox1.Checked[0] then  //Первый
    case FRST of
    True:Begin MSG:= MSG + ' WHERE (Price_FC BETWEEN ' + Prm1 + ' AND '+Prm2 + ')'; FRST:=False; end;
    False:MSG:= MSG + ' AND (Price_FC BETWEEN ' + Prm1 + ' AND ' + Prm2 + ')';
    end;

  if sCheckListBox1.Checked[1] then  //Бизнес
    case FRST of
    True:Begin MSG:= MSG + ' WHERE (Price_BC BETWEEN ' + Prm1 + ' AND '+Prm2 + ')'; FRST:=False; end;
    False:MSG:= MSG + ' AND (Price_BC BETWEEN ' + Prm1 + ' AND ' + Prm2 + ')';
    end;

  if sCheckListBox1.Checked[2] then  //Эконом
    case FRST of
    True:Begin MSG:= MSG + ' WHERE (Price_EC BETWEEN ' + Prm1 + ' AND '+Prm2 + ')'; FRST:=False; end;
    False:MSG:= MSG + ' AND (Price_EC BETWEEN ' + Prm1 + ' AND ' + Prm2 + ')';
    end;
  End;
//..............................................................................
if (sCheckBox4.Checked = True) then
  Begin
  Prm1:=StringReplace(sDateEdit1.text, '.', '-', [rfReplaceAll, rfIgnoreCase]);
  Prm2:=StringReplace(sDateEdit2.text, '.', '-', [rfReplaceAll, rfIgnoreCase]);
    case FRST of
    True:Begin MSG:=MSG+' WHERE (Date_D BETWEEN #'+Prm1+'# AND #'+Prm2+'#)'; FRST:=False; end;
    False:MSG:=MSG+' AND (Date_D BETWEEN #'+Prm1+'# AND #'+Prm2+'#)';
    end;
  End;
//..............................................................................
if (sCheckBox5.Checked = True) then
  case FRST of
  True:Begin MSG:=MSG+' WHERE (Air_company="'+sComboBox4.Text+'")'; FRST:=False; end;
  False:MSG:=MSG+' AND (Air_company="'+sComboBox4.Text+'")';
  end;
//..............................................................................
if (sCheckBox7.Checked = True) AND (sCheckListBox1.Checked[0] = True) then
  case FRST of
  True:Begin MSG:=MSG+' WHERE (Free_places_FC > 0)'; FRST:=False; end;
  False:MSG:=MSG+' AND (Free_places_FC > 0)';
  end;
if (sCheckBox7.Checked = True) AND (sCheckListBox1.Checked[1] = True) then
  case FRST of
  True:Begin MSG:=MSG+' WHERE (Free_places_BC > 0)'; FRST:=False; end;
  False:MSG:=MSG+' AND (Free_places_BC > 0)';
  end;
if (sCheckBox7.Checked = True) AND (sCheckListBox1.Checked[2] = True) then
  case FRST of
  True:Begin MSG:=MSG+' WHERE (Free_places_EC > 0)'; FRST:=False; end;
  False:MSG:=MSG+' AND (Free_places_EC > 0)';
  end;
// Отправка запроса
With DataModule2.Air_Query do
  Begin
  Active:=False;
  SQL.Clear;
  SQL.Add(MSG);
  Active:=True;
  End;
// Узнаем точное кол-во страниц (Integer)
Pages_Count:= (DataModule2.Air_Query.Recordcount Div Panel_Count);
if (DataModule2.Air_Query.Recordcount Mod Panel_Count) > 0 then
  Inc(Pages_Count);
// Снимаем залок клавиши
CButtons[Page_Current - 1].State:= cbStay;
// Ставим кол-во клавишь равное кол-ву страниц
Button_count:= Pages_Count;
// Выставляем текущей страницей - страницу 1
Build_page(1);
// Проверяем будут ли кнопки активны
if (Page_Current + 1) <= Pages_count then
  Next_Button.Enabled:= True;
Prior_button.Enabled:= False;
// Перерисовка кнопочной панели
// Отрисовываем задний фон
R:=255.0; DR:= (247 - R) / Button_Panel.Height;
G:=255.0; DG:= (247 - G) / Button_Panel.Height;
B:=255.0; DB:= (247 - B) / Button_Panel.Height;
for I:= 0 to Button_Panel.Height+1 do
  Begin
  Button_Panel.Canvas.Pen.Color:=RGB(Trunc(R), Trunc(G), Trunc(B));
  Button_Panel.Canvas.MoveTo(0, I);
  Button_Panel.Canvas.LineTo(Button_Panel.Width, I);
  R:= R + DR;
  G:= G + DG;
  B:= B + DB;
  End;
// Переформатирование кнопок
for I:= 0 to Button_count - 1 do
  begin
  CButtons[I].BorderWidth:= 1;
  CButtons[I].Left:= I * 35;
  CButtons[I].Top:= 8;
  CButtons[I].Height:= 32;
  CButtons[I].Width:= 32;
  CButtons[I].BorderRadius:= 8;
  CButtons[I].BorderColor:= RGB(220,220,220);
  CButtons[I].Color:= RGB(237,237,237);
  CButtons[I].Color_off:= RGB(0,128,255);
  CButtons[I].BackColor:= ClWhite;
  CButtons[I].BackGradient.Enabled:= True;
  CButtons[I].BackGradient.Color1:= RGB(253,253,253);
  CButtons[I].BackGradient.Color2:= RGB(248,248,248);
  CButtons[I].Gradient.Color1:= RGB(254,254,254);
  CButtons[I].Gradient.Color2:= RGB(221,221,221);
  CButtons[I].Caption:= IntToStr(I + 1);
  if (I = 0) then
    CButtons[I].State:= cbLocked
      else
        CButtons[I].State:= cbStay;
  CButtons[I].Create;
  Button_panel.Canvas.Draw(CButtons[I].Left, CButtons[I].Top, CButtons[I].Paint);
  end;
//   ShowMEssage('-->  ' + MSG + '  <--');
end;


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
// Фиксируем даты
if (DataModule2.Air_Query.FieldByName('Regular').AsString = '+') then
  if I = 'From' then
    sDate1:= VarToDateTime(DateToStr(Form6.Edit_Date.Date) + ' ' + IntToStr(HourOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_D').AsString))) + ':' + IntToStr(MinuteOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_D').AsString))))
      else
        sDate1:= VarToDateTime(DateToStr(Form6.Edit_Date.Date) + ' ' + IntToStr(HourOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_A').AsString))) + ':' + IntToStr(MinuteOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_A').AsString))))
          else
            if I = 'From' then
              sDate1:= VarToDateTime(DataModule2.Air_Query.FieldByName('Date_D').AsString + ' ' + IntToStr(HourOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_D').AsString))) + ':' + IntToStr(MinuteOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_D').AsString))))
                else
                  sDate1:= VarToDateTime(DataModule2.Air_Query.FieldByName('Date_A').AsString + ' ' + IntToStr(HourOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_A').AsString))) + ':' + IntToStr(MinuteOf(VarToDateTime(DataModule2.Air_Query.FieldByName('Time_A').AsString))));
// Формируем начало итоговой строки
sLine:= IntToStr(DayOf(sDate1)) + ' ' + sMouths[MonthOf(sDate1)] + ', ' + sDay[DayOfWeek(sDate1)];
sLine:= sLine + ' ' +IntToStr(HourOf(sDate1)) + ':' + IntToStr(MinuteOf(sDate1));
if (I = 'From') then
  sLine:= sLine + ', ' + #13#10 + DataModule2.Air_Query.FieldByName('Airport_D').AsString
    else
      sLine:= sLine + ', ' + #13#10 + DataModule2.Air_Query.FieldByName('Airport_A').AsString;
// Вывод
Result:= sLine;
End;


Procedure TForm6.sLabel28Click(Sender: TObject);
Var
  I, D:Integer;
begin
DataModule2.Air_Query.First;
DataModule2.Air_Query.MoveBy(((Page_Current - 1) * Panel_Count) + ((Sender as TsLabel).Tag - 1));

if (DataModule2.Air_Query.FieldByName('Regular').AsString = '+') then
  if (Edit_Date.Tag = 1) then
    Begin
    // Показ формы
    Label_FWay.Caption:= DataModule2.Air_Query.FieldByName('City_D').AsString + ' -> ' + DataModule2.Air_Query.FieldByName('City_A').AsString;
    Label_FAirCompany.Caption:= DataModule2.Air_Query.FieldByName('Air_company').AsString;
    Label_FFrom.Caption:= Date_Info('From');
    Label_FTo.Caption:= Date_Info('To');
    // Смещение формы (Центр)
    Panel_FullInfo.Left:= (ClientWidth div 2) - (Panel_FullInfo.Width div 2);
    Panel_FullInfo.Top:= (ClientHeight div 2) - (Panel_FullInfo.Height div 2);
    Panel_FullInfo.Visible:= True;
    End
  else
    ShowMessage('Введите правильно дату!')
      else
        Begin
        // Показ формы
        Label_FWay.Caption:= DataModule2.Air_Query.FieldByName('City_D').AsString + ' -> ' + DataModule2.Air_Query.FieldByName('City_A').AsString;
        Label_FAirCompany.Caption:= DataModule2.Air_Query.FieldByName('Air_company').AsString;
        Label_FFrom.Caption:= Date_Info('From');
        Label_FTo.Caption:= Date_Info('To');
        // Смещение формы (Центр)
        Panel_FullInfo.Left:= (ClientWidth div 2) - (Panel_FullInfo.Width div 2);
        Panel_FullInfo.Top:= (ClientHeight div 2) - (Panel_FullInfo.Height div 2);
        Panel_FullInfo.Visible:= True;
        End;
end;

end.
