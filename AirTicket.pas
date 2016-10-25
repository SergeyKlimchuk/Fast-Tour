unit AirTicket;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.Win.ADODB,
  Vcl.StdCtrls, Vcl.ExtCtrls, sPanel, sSkinManager, sLabel,
  sBevel, sComboBox, sButton, Vcl.Mask, sMaskEdit, sToolEdit, sCheckBox, sEdit,
  Vcl.ActnPopup, sCheckListBox, Vcl.Buttons, sBitBtn, acPNG, acImage,
  BTNlib, sRadioButton, DateUtils, Vcl.Imaging.jpeg, sCustomComboEdit, sListBox,
  sScrollBox, sGroupBox, Records;

type
  TForm6 = class(TForm)
    BackGround_Image: TsImage;
    Castom_Way: TsGradientPanel;
    sBevel15: TsBevel;
    Label_Air_Company: TsLabel;
    Button_Exit: TsBitBtn;
    Button_add_OBJECT: TsBitBtn;
    sLabel28: TsLabel;
    Panel_Citys: TsGradientPanel;
    Edit_Date: TsDateEdit;
    sLabel10: TsLabel;
    sBevel6: TsBevel;
    sLabel12: TsLabel;
    sBevel8: TsBevel;
    sBevel9: TsBevel;
    sBevel10: TsBevel;
    sBevel11: TsBevel;
    Panel1: TPanel;
    Main_Scroll: TsScrollBox;
    Label_Not_Found: TLabel;
    Search_Panel: TsPanel;
    sBevel1: TsBevel;
    sBevel2: TsBevel;
    sBevel3: TsBevel;
    sBevel4: TsBevel;
    sLabel1: TsLabel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sLabel7: TsLabel;
    sBevel14: TsBevel;
    sBevel7: TsBevel;
    sLabel27: TsLabel;
    sCheckBox1: TsCheckBox;
    sCheckBox2: TsCheckBox;
    sCheckBox4: TsCheckBox;
    sCheckBox5: TsCheckBox;
    sCheckBox6: TsCheckBox;
    sComboBox2: TsComboBox;
    sComboBox3: TsComboBox;
    sComboBox4: TsComboBox;
    sDateEdit1: TsDateEdit;
    sDateEdit2: TsDateEdit;
    sEdit1: TsEdit;
    sEdit2: TsEdit;
    sComboBox1: TsComboBox;
    sRadioGroup1: TsRadioGroup;
    sPanel1: TsPanel;
    sImage1: TsImage;
    Label_Basket_Explorer: TsLabel;
    Label_Basket_Count: TsLabel;
    sBitBtn2: TsBitBtn;
    sBitBtn3: TsBitBtn;
    sBitBtn4: TsBitBtn;
    Explorer_Panel: TsPanel;
    Button_Panel: TImage;
    Next_Button: TsBitBtn;
    Prior_button: TsBitBtn;
    sPanel2: TsPanel;
    Lbl_Records_count: TsLabel;
    Button_Refresh: TsBitBtn;
    Panel_FullInfo: TsPanel;
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
    Label_FClass: TsLabel;
    Label_FPlane: TsLabel;
    Label_FFrom: TsLabel;
    Label_FTo: TsLabel;
    Image1: TImage;
    sBitBtn5: TsBitBtn;
    sPanel5: TsPanel;
    Image4: TImage;
    sLabel8: TsLabel;
    sBevel27: TsBevel;
    sBevel28: TsBevel;
    sLabel9: TsLabel;
    Image5: TImage;
    sGradientPanel11: TsGradientPanel;
    sBitBtn7: TsBitBtn;
    sBitBtn8: TsBitBtn;
    sCheckBox3: TsCheckBox;
    Edit1: TEdit;
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
    procedure sLabel28Click(Sender: TObject);
    procedure sBitBtn5Click(Sender: TObject);
    procedure sEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure sEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure sEdit1Exit(Sender: TObject);
    procedure sEdit2Exit(Sender: TObject);
    procedure sDateEdit1Exit(Sender: TObject);
    procedure sDateEdit2Exit(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
    procedure Edit_DateKeyPress(Sender: TObject; var Key: Char);
    procedure Edit_DateCloseUp(Sender: TObject);
    procedure Button_RefreshClick(Sender: TObject);
    procedure sBitBtn8Click(Sender: TObject);
    procedure sBitBtn7Click(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;


  Page: TPage;

  Air_List: Array of TAir_Line;

//.........Блок кнопок.........................//
  CButtons :Array                  of TCButton;//
//.............................................//

//.........Блок процедур...............................//
  procedure BUILD_PAGE(Index:Integer);                 //
  Procedure BUILD_LINE(Index:Integer; OnNext:Boolean); //
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
Edit_Date.Text:= '';
// Переход к началу
DataModule2.Air_Query.First;
// Переход к нужной записи
DataModule2.Air_Query.MoveBy(((Page.Current - 1) * Page.Lines) + ((Sender as TsBitBtn).Tag - 1));
// Заполняем поля
Label_Air_Company.Caption:= DataModule2.Air_Query.FieldByName('Air_company').AsString;
Label_Air_Company.Left:= sBevel15.Left + ((sBevel15.Width div 2) - (Label_Air_Company.Width div 2));
Panel_Citys.Caption:= DataModule2.Air_Query.FieldByName('City_D').AsString + ' -> ' + DataModule2.Air_Query.FieldByName('City_A').AsString;
Panel_Citys.Refresh;
if DataModule2.Air_Query.FieldByName('Regular').AsBoolean = True then
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
Castom_Way.Left:= (ClientWidth div 2) - (Castom_Way.Width div 2);
Castom_Way.Visible:= True;
End;

procedure BUILD_PAGE(Index:integer); // Построение страницы
Var
  I, D, Residue :integer;
Begin
// Скрываем поле
if Form6.Castom_Way.Visible then Form6.Castom_Way.Visible:= False;
// Делаем проверку на присутствие записей на странице
if (DataModule2.Air_Query.RecordCount > 0) then
  Begin
  // Убираем надпись об отсутствии записей
  Form6.Label_Not_Found.Visible:= False;
  // Переход на первую запись нашей страницы
  DataModule2.Air_Query.First;
  if (Index > 1) then
    DataModule2.Air_Query.MoveBy((Index - 1) * Page.Lines);
  // Узнаем остаточное кол-во записей
  Residue:= DataModule2.Air_Query.RecordCount - ((Index - 1) * Page.Lines);
  // Отключаем все не задействующиеся формы
  if (Residue < Page.Lines) then
    for I:= 1 to Page.Lines do
      if (I <= Residue) then
        Air_List[I - 1].Main_Panel.Visible:= True
          else
            Air_List[I - 1].Main_Panel.Visible:= False
              else
                for I:= 0 to (Page.Lines - 1) do
                  Air_List[I].Main_Panel.Visible:= True;
  // Создание страницы
  if (Residue >= Page.Lines)  then
    for I:= 0 to (Page.Lines - 1) do
      Build_Line(I, True)
        else
          for I:= 0 to (Residue - 1) do
            Build_Line(I, True);
  End
else  // В случае если послали пустую страницу на отрисовку
  begin
  for I:= 1 to Page.Lines do
    Air_List[I - 1].Main_Panel.Visible:= False;
  Form6.Label_Not_Found.visible:= True;
  end;
// Изменение кнопок
CButtons[Page.Current - 1].State:= cbStay;
Form6.Button_panel.Canvas.Draw(CButtons[Page.Current - 1].Left, CButtons[Page.Current - 1].Top, CButtons[Page.Current - 1].Paint);
CButtons[Index - 1].State:= cbLocked;
Form6.Button_panel.Canvas.Draw(CButtons[Index - 1].Left, CButtons[Index - 1].Top, CButtons[Index - 1].Paint);
Page.Current:= Index;
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
if (DataModule2.Air_Query.FieldByName('Regular').AsBoolean = True) then
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
  sLine: String;
  sDate1, sDate2: TDateTime;
Begin
if (DataModule2.Air_Query.FieldByName('Regular').AsBoolean = True) then
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
  Air_List[Index].Label_Way.Caption:= DataModule2.Air_Query.FieldByName('City_D').AsString + ' -> ' + DataModule2.Air_Query.FieldByName('City_A').AsString;
  Air_List[Index].Label_AirCompany.Caption:= DataModule2.Air_Query.FieldByName('Air_Company').AsString;
  Air_List[Index].Label_Days.Caption:= _Days;
  Air_List[Index].Label_Date.Caption:= _Date;
  Air_List[Index].Label_Type.Caption:='Прямой рейс';
  Air_List[Index].Label_Type.Font.Color:= $0000BE93;
  Air_List[Index].Label_FlightTime.Caption:= _Time;
//  Picture_AirCompany[Index]
// Переключаемся на следующую запись
if (DataModule2.Air_Query.Eof = False) and (OnNext = true) then 
  DataModule2.Air_Query.Next;
End;

procedure TForm6.Button_add_OBJECTClick(Sender: TObject);
begin
DataModule2.Basket_Query.Insert;
DataModule2.Basket_Query.FieldByName('B_Type').AsString:= '1';
DataModule2.Basket_Query.FieldByName('B_ID').AsString:= DataModule2.Air_Query.FieldByName('ID').AsString;
if (DataModule2.Air_Query.FieldByName('Regular').AsBoolean = True) then
  Begin
  DataModule2.Basket_Query.FieldByName('Date_Start').AsString:= Edit_Date.Text;
  DataModule2.Basket_Query.FieldByName('Date_Finish').AsString:= Edit_Date.Text;
  End
else
  Begin
  DataModule2.Basket_Query.FieldByName('Date_Start').AsString:= DataModule2.Air_Query.FieldByName('Date_D').AsString;
  DataModule2.Basket_Query.FieldByName('Date_Finish').AsString:= DataModule2.Air_Query.FieldByName('Date_A').AsString;
  End;
case sRadioGroup1.ItemIndex of
  0:DataModule2.Basket_Query.FieldByName('Price').AsString:= DataModule2.Air_Query.FieldByName('Price_FC').AsString;
  1:DataModule2.Basket_Query.FieldByName('Price').AsString:= DataModule2.Air_Query.FieldByName('Price_BC').AsString;
  2:DataModule2.Basket_Query.FieldByName('Price').AsString:= DataModule2.Air_Query.FieldByName('Price_EC').AsString;
end;
DataModule2.Basket_Query.Post;
// Проверка корзины
DataModule2.REFRESH_BASKET;
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
for I:=0 to (Page.Count - 1 )do
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
for I:=0 to (Page.Count - 1 )do
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
for I:=0 to (Page.Count - 1) do
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
for I:=0 to (Page.Count - 1) do
  if (CButtons[I].Left <= X) AND (X <= CButtons[I].Left + CButtons[I].Width)
  AND (CButtons[I].Top <= Y) AND (Y <= CButtons[I].Top + CButtons[I].Height) then
    if (Page.Current <> (X div 35) + 1) then
      Begin
      // Построение страницы
      Build_Page((X div 35) + 1);
      // Открытие кнопок перемещения
      if (Page.Current + 1) > Page.Count then Next_button.Enabled:= False else Next_button.Enabled:= True;
      if (Page.Current - 1) < 1 then Prior_button.Enabled:= False else Prior_button.Enabled:= True;
      End;
end;

procedure TForm6.Button_RefreshClick(Sender: TObject);
begin
With DataModule2.Air_Query do
  Begin
  Active:= False;
  Active:= True;
  End;
BUILD_PAGE(Page.Current);
end;

Procedure CHECK_DATE;
Var
  Tr:Boolean;
  S:String;
begin
if Pos(' ', Form6.Edit_Date.Text) > 0 then
  Begin
  ShowMessage('Был найден пропущенный символ, проверьте дату!');
  Abort;
  End;

if (Form6.Edit_Date.Date > IncYear(Now)) then
  Begin
  ShowMessage('Нельзя забронировать авиабилет за год!');
  Abort;
  End;

if (Form6.Edit_Date.Date < Now) then
  Begin
  ShowMessage('Дата которую вы выбрали нельзя использовать, т.к. нельзя забронировать билет за прошлые дни!');
  Abort;
  End;
// Проверка на вхождение
Tr:= False;
S:= DataModule2.Air_Query.FieldByName('Days').AsString;
case DayOfWeek(Form6.Edit_Date.Date) of
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
  Form6.Button_add_OBJECT.Enabled:= True;
  Form6.Edit_Date.Tag:= 1;
  End
  else
  Begin
  Form6.Button_add_OBJECT.Enabled:= False;
  Form6.Edit_Date.Tag:= 0;
  End;
End;

procedure TForm6.Edit1Exit(Sender: TObject);
Var
  Error: Boolean;
begin
  Try
  Error:= True;
  if StrToInt(Edit1.Text) > 10  then Edit1.Text:= '10';
  if StrToInt(Edit1.Text) < 1  then Edit1.Text:= '1';
  Error:= False;
  Finally
  if Error then Edit1.Text:= '8';
  End;
end;

procedure TForm6.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8]) then key:= #0;
end;

procedure TForm6.Edit_DateCloseUp(Sender: TObject);
begin
CHECK_DATE;
end;

procedure TForm6.Edit_DateKeyPress(Sender: TObject; var Key: Char);
begin
if key = #13 then
  CHECK_DATE;
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
R,G,B:Double;
DR,DG,DB:Double;
begin
Page.Current:= 1;
Page.Lines:= 8;
SetLength(Air_List, Page.Lines);
// Создание динамических элементов
For I:= 1 to Page.Lines do
  Air_List[I - 1].Create(80, ((I - 1) * 100) + (10 * I), I, Main_Scroll);
// Создание списка
Page.Count:= (DataModule2.Air_Query.Recordcount Div Page.Lines);
if (DataModule2.Air_Query.Recordcount Mod Page.Lines) > 0 then
  Page.Count:= Page.Count + 1;
// Кнопки експлорера
SetLength(CButtons, Page.Count);
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
for I:= 0 to (Page.Count - 1) do
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
  while DataModule2.Air_Query.Eof = False do
  Begin
  CHK1:= False; // Наден элемент = ложь
  for I:=1 to DataModule2.Air_Query.RecordCount do
    Begin
    if LowerCase(sComboBox3.Items[I - 1] )= LowerCase(DataModule2.Air_Query.Fields.Fields[1].AsString) then
      CHK1:= True; // Найден элемент = правда
    if LowerCase(sComboBox2.Items[I - 1]) = LowerCase(DataModule2.Air_Query.Fields.Fields[5].AsString) then
      CHK2:= True; // Найден элемент = правда
    if LowerCase(sComboBox4.Items[I - 1]) = LowerCase(DataModule2.Air_Query.Fields.Fields[9].AsString) then
      CHK3:= True; // Найден элемент = правда
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
// проверяем будут ли кнопки активны
if (Page.Current + 1) <= Page.Count then
  Next_Button.Enabled:= True;
// Строим список
Build_page(1);
BackGround_Image.Picture.LoadFromFile('Textures\BackGround\sky.png');
end;

procedure TForm6.FormResize(Sender: TObject);
begin
panel1.Left:= (ClientWidth div 2) - 480;
panel1.Height:= ClientHeight - 53;
Explorer_Panel.Top:= Panel1.Height - 180;
Search_Panel.Top:= Explorer_Panel.Top + 50;
Main_Scroll.Height:= Explorer_Panel.Top;
sPanel1.Left:= panel1.Left;
sPanel2.Left:= Panel1.Left + 506;
BackGround_Image.Width:= ClientWidth;
BackGround_Image.Height:= ClientHeight;

if Panel_FullInfo.Visible then
  Begin
  Panel_FullInfo.Left:= (ClientWidth div 2) - 350;
  Panel_FullInfo.Top:= (ClientHeight div 2) - 76;
  End;

if Castom_Way.Visible then
  Begin
  Castom_Way.Left:= (ClientWidth div 2) - 500;
  Castom_Way.Top:= (ClientHeight div 2) - 48;
  End;
end;

procedure TForm6.FormShow(Sender: TObject);
begin
DataModule2.REFRESH_BASKET;
end;

procedure TForm6.Label_Basket_ExplorerClick(Sender: TObject);
begin
Form6.Hide;
Form9.show;
end;

procedure TForm6.Next_ButtonClick(Sender: TObject);
begin
if (Page.Current < Page.Count) then
  Begin
  Build_page(Page.Current+1);
  Prior_Button.Enabled:= True;
  if (Page.Current = Page.Count) then
    Next_Button.Enabled:=False;
  End;
end;

procedure TForm6.Prior_buttonClick(Sender: TObject);
begin
if (Page.Current > 1) then
  Begin
  Build_page(Page.Current - 1);
  Next_Button.Enabled:= True;
  if (Page.Current = 1) then
    Prior_Button.Enabled:= False;
  End;
end;

procedure TForm6.sBitBtn2Click(Sender: TObject);
begin
Form6.Hide;
Form4.Show;
end;

procedure TForm6.sBitBtn3Click(Sender: TObject);
begin
sPanel5.Visible:= True;
end;

procedure TForm6.sBitBtn5Click(Sender: TObject);
begin
Panel_FullInfo.Visible:= False;
end;

procedure TForm6.sBitBtn7Click(Sender: TObject);
begin
sPanel5.Visible:= False;
edit1.Text:= IntToStr(Page.Lines);
end;

procedure TForm6.sBitBtn8Click(Sender: TObject);
Var
  I: Integer;
  R, G, B, DR, DG, DB: Double;
begin
for I:= 0 to (Page.Lines - 1) do
  Air_List[I].Destroy;
Page.Lines:= StrToInt(Edit1.Text);
SetLength(Air_List, Page.Lines);
for I:= 1 to Page.Lines do
  Air_List[I - 1].Create(80, ((I - 1) * 100) + (10 * I), I, Main_Scroll);
Page.Current:= 1;
Page.Count:= (DataModule2.Air_Query.RecordCount div Page.Lines);
if (DataModule2.Air_Query.RecordCount mod Page.Lines) > 0 then
  Page.Count:= Page.Count + 1;
BUILD_PAGE(1);
sPanel5.Visible:= False;
// Кнопки експлорера
SetLength(CButtons, Page.Count);
// Отрисовываем задний фон
R:=255.0; DR:= (247 - R) / Button_Panel.Height;
G:=255.0; DG:= (247 - G) / Button_Panel.Height;
B:=255.0; DB:= (247 - B) / Button_Panel.Height;
for I:= 0 to 49 do
  Begin
  Button_Panel.Canvas.Pen.Color:=RGB(Trunc(R), Trunc(G), Trunc(B));
  Button_Panel.Canvas.MoveTo(0, I);
  Button_Panel.Canvas.LineTo(Button_Panel.Width, I);
  R:= R + DR;
  G:= G + DG;
  B:= B + DB;
  End;
// Создаем массив кнопок
for I:= 0 to (Page.Count - 1) do
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
ShowMessage('Готово!');
end;

Procedure REFRESH_PRICE; // Процедура обновления цены (Активируется при смене валюты)
Var
  I, Price: Integer;
  Price2,tpe, currency: String;
  EndPrice: Integer;
Begin
DataModule2.Air_Query.First;
// Переход на первую запись нашей страницы
DataModule2.Air_Query.MoveBy(((Page.Current - 1) * Page.Lines));
EndPrice:= 0;
currency:= Copy(Form6.sComboBox1.Text, 1, 3);
  case Form6.sRadioGroup1.ItemIndex of
    0:tpe:= 'FC';
    1:tpe:= 'BC';
    2:tpe:= 'EC';
  end;
for I:= 0 to (Page.Lines - 1) do
  Begin
  Air_List[I].Label_Currency.Caption:= currency;
  case Form6.sComboBox1.ItemIndex of
    0:Price:= DataModule2.Air_Query.FieldByName('Price_' + tpe).AsInteger * KZT;
    1:Price:= DataModule2.Air_Query.FieldByName('Price_' + tpe).AsInteger;
    2:Price:= Trunc(DataModule2.Air_Query.FieldByName('Price_' + tpe).AsInteger * EUR);
    3:Price:= DataModule2.Air_Query.FieldByName('Price_' + tpe).AsInteger * RUB;
    4:Price:= Trunc(DataModule2.Air_Query.FieldByName('Price_' + tpe).AsInteger * AUD);
    5:Price:= Trunc(DataModule2.Air_Query.FieldByName('Price_' + tpe).AsInteger * GBP);
    6:Price:= Trunc(DataModule2.Air_Query.FieldByName('Price_' + tpe).AsInteger * DKK);
    7:Price:= Trunc(DataModule2.Air_Query.FieldByName('Price_' + tpe).AsInteger * AED);
  end;
  EndPrice:= EndPrice + Price;
  Price2:= IntToStr(Price);
  if Length(Price2) > 3 then
    Insert(' ',Price2,Length(Price2)-2);
  Air_List[I].Label_Price.Caption:= Price2;
  Air_List[I].Label_Price.Left:= (Air_List[I].Panel_Explorer.Width div 2) - ((Air_List[I].Label_Currency.Width + Air_List[I].Label_Price.Width + 6) div 2);
  Air_List[I].Label_Currency.Left:= Air_List[I].Label_Price.Left + Air_List[I].Label_Price.Width + 6;
  DataModule2.Air_Query.Next;
  End;
Form6.sLabel6.Caption:= Copy(Form6.sComboBox1.Text, 1, 3);
Form6.sLabel7.Caption:= Form6.sLabel6.Caption;
End;

procedure TForm6.sComboBox1Change(Sender: TObject);
begin
REFRESH_PRICE;
end;


// Блок защиты
procedure TForm6.sDateEdit1Exit(Sender: TObject);
begin
if sDateEdit1.Text = '  .  .    ' then
  sDateEdit1.Date:= Now;
end;
procedure TForm6.sDateEdit2Exit(Sender: TObject);
begin
if sDateEdit2.Text = '  .  .    ' then
  sDateEdit2.Date:= Now;
end;
procedure TForm6.sEdit1Exit(Sender: TObject);
begin
if (sEdit1.Text = '') then sEdit1.Text:= '0';
end;
procedure TForm6.sEdit1KeyPress(Sender: TObject; var Key: Char);
begin
If not (Key in ['0'..'9', #8]) then
  Begin
  Key:=#0;
  Beep;
  End;
end;
procedure TForm6.sEdit2Exit(Sender: TObject);
begin
if (sEdit2.Text = '') then sEdit2.Text:= '0';
end;
procedure TForm6.sEdit2KeyPress(Sender: TObject; var Key: Char);
begin
If not (Key in ['0'..'9', #8]) then
  Begin
  Key:=#0;
  Beep;
  End;
end;
// Конец блока защиты


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
if (sCheckBox6.Checked=True) then
  Begin
  if sRadioGroup1.ItemIndex = 0 then  //Первый
    case FRST of
    True:Begin MSG:= MSG + ' WHERE (Price_FC BETWEEN ' + Prm1 + ' AND '+Prm2 + ')'; FRST:=False; end;
    False:MSG:= MSG + ' AND (Price_FC BETWEEN ' + Prm1 + ' AND ' + Prm2 + ')';
    end;

  if sRadioGroup1.ItemIndex = 1 then  //Бизнес
    case FRST of
    True:Begin MSG:= MSG + ' WHERE (Price_BC BETWEEN ' + Prm1 + ' AND '+Prm2 + ')'; FRST:=False; end;
    False:MSG:= MSG + ' AND (Price_BC BETWEEN ' + Prm1 + ' AND ' + Prm2 + ')';
    end;

  if sRadioGroup1.ItemIndex = 2 then  //Эконом
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
if (sRadioGroup1.ItemIndex = 0) then
  case FRST of
  True:Begin MSG:=MSG+' WHERE (Free_places_FC > 0)'; FRST:=False; end;
  False:MSG:=MSG+' AND (Free_places_FC > 0)';
  end;
if (sRadioGroup1.ItemIndex = 1) then
  case FRST of
  True:Begin MSG:=MSG+' WHERE (Free_places_BC > 0)'; FRST:=False; end;
  False:MSG:=MSG+' AND (Free_places_BC > 0)';
  end;
if (sRadioGroup1.ItemIndex = 2) then
  case FRST of
  True:Begin MSG:=MSG+' WHERE (Free_places_EC > 0)'; FRST:=False; end;
  False:MSG:=MSG+' AND (Free_places_EC > 0)';
  end;
//..............................................................................
// Отправка запроса
With DataModule2.Air_Query do
  Begin
  Active:=False;
  SQL.Clear;
  SQL.Add(MSG);
  Active:=True;
  End;
Lbl_Records_count.Caption:= DataModule2.CHECK_RecordCount(DataModule2.Air_Query.RecordCount);
Lbl_Records_count.left:= 227 - (Lbl_Records_count.Width div 2);
// Узнаем точное кол-во страниц (Integer)
Page.Count:= (DataModule2.Air_Query.Recordcount Div Page.Lines);
if (DataModule2.Air_Query.Recordcount Mod Page.Lines) > 0 then
  Inc(Page.Count);
// Снимаем залок клавиши
CButtons[Page.Current - 1].State:= cbStay;
// Выставляем текущей страницей - страницу 1
Build_page(1);
// Проверяем будут ли кнопки активны
//ShowMessage('Page_Current= ' + IntToStr(Page_Current) + ' <= ' + IntToStr(Pages_count));
if (Page.Current + 1) <= Page.Count then
  Next_Button.Enabled:= True
    else
      Next_Button.Enabled:= False;
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
for I:= 0 to Page.Count - 1 do
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
if (DataModule2.Air_Query.FieldByName('Regular').AsBoolean = True) then
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
DataModule2.Air_Query.MoveBy(((Page.Current - 1) * Page.Lines) + ((Sender as TsLabel).Tag - 1));
case sRadioGroup1.ItemIndex of
  0:Label_FClass.Caption:= 'Первый класс';
  1:Label_FClass.Caption:= 'Бизнес класс';
  2:Label_FClass.Caption:= 'Эконом класс';
end;

// Смещение формы (Центр)
Panel_FullInfo.Left:= (ClientWidth div 2) - 350;
Panel_FullInfo.Top:= (ClientHeight div 2) - 76;

if (DataModule2.Air_Query.FieldByName('Regular').AsBoolean = True) then
  if (Edit_Date.Tag = 1) then
    Begin
    // Показ формы
    Label_FWay.Caption:= DataModule2.Air_Query.FieldByName('City_D').AsString + ' -> ' + DataModule2.Air_Query.FieldByName('City_A').AsString;
    Label_FAirCompany.Caption:= DataModule2.Air_Query.FieldByName('Air_company').AsString;
    Label_FFrom.Caption:= Date_Info('From');
    Label_FTo.Caption:= Date_Info('To');
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
    Panel_FullInfo.Visible:= True;
    End;
end;

end.
