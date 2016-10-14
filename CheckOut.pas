unit CheckOut;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sPanel, Vcl.StdCtrls, sEdit, sLabel,
  Vcl.ExtCtrls, sBevel, sComboBox, sScrollBox, Vcl.Buttons, sBitBtn, acImage, Dateutils,
  Data.DB, Vcl.Grids, Vcl.DBGrids, acPNG, Vcl.Mask, sMaskEdit;

type

  TLine = record
    Panel_Main         :TsGradientPanel;
    Label_Type         :TsLabel;
    Label_Date         :TsLabel;
    Label_Way_Name     :TsLabel;
    Label_Time_Country :TsLabel;
    First_Bevel        :TsBevel;
    Panel_Price        :TsGradientPanel;
  end;

  TForm10 = class(TForm)
    sPanel1: TsPanel;
    Panel_Step1: TsPanel;
    Panel_Step2: TsPanel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sBevel2: TsBevel;
    sLabel7: TsLabel;
    sLabel8: TsLabel;
    sEdit3: TsEdit;
    sGradientPanel2: TsGradientPanel;
    sComboBox2: TsComboBox;
    sEdit4: TsEdit;
    sBitBtn3: TsBitBtn;
    sBitBtn4: TsBitBtn;
    sGradientPanel1: TsGradientPanel;
    sPanel3: TsPanel;
    sLabel1: TsLabel;
    sBitBtn1: TsBitBtn;
    SB_Items: TsScrollBox;
    sLabel2: TsLabel;
    sBevel1: TsBevel;
    sLabel3: TsLabel;
    sLabel4: TsLabel;
    Exit: TsBitBtn;
    Info: TsBitBtn;
    Print: TsBitBtn;
    sComboBox1: TsComboBox;
    sLabel11: TsLabel;
    sLabel18: TsLabel;
    sLabel19: TsLabel;
    sGradientPanel5: TsGradientPanel;
    sGradientPanel6: TsGradientPanel;
    sGradientPanel7: TsGradientPanel;
    Panel_Step3: TsPanel;
    sLabel9: TsLabel;
    sLabel10: TsLabel;
    sBevel3: TsBevel;
    sLabel12: TsLabel;
    sLabel13: TsLabel;
    sLabel14: TsLabel;
    sLabel15: TsLabel;
    sGradientPanel3: TsGradientPanel;
    sComboBox3: TsComboBox;
    sBitBtn2: TsBitBtn;
    sBitBtn5: TsBitBtn;
    Panel_Step4: TsPanel;
    sBevel4: TsBevel;
    sGradientPanel4: TsGradientPanel;
    sGradientPanel8: TsGradientPanel;
    sBitBtn6: TsBitBtn;
    sLabel16: TsLabel;
    sLabel17: TsLabel;
    sImage1: TsImage;
    sBevel5: TsBevel;
    sEdit1: TsEdit;
    sEdit2: TsEdit;
    sEdit5: TsEdit;
    sEdit6: TsEdit;
    sEdit7: TsEdit;
    sEdit8: TsEdit;
    sLabel20: TsLabel;
    procedure ExitClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sBitBtn4Click(Sender: TObject);
    procedure sBitBtn5Click(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
    procedure sBitBtn6Click(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure sEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure FormHide(Sender: TObject);
    procedure sComboBox1Change(Sender: TObject);
    procedure sEdit1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sEdit2KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sEdit5KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sEdit7KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure sEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure sEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure sEdit6KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    Currency:String;
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
  Form10: TForm10;

  List:Array of TLine;

  Procedure BUILD_ALL;    // Запрещается использовать без использования процедуры "DESTROY_ALL"!
  Procedure BUILD_LINE(Index:Integer);   // Используется переменная, ибо нужна работа с индексами массива
  Procedure DESTROY_ALL;  //

  // Вспомогательных функций блок
  Function GET_TimeORCountry(O_Type:Integer):String;
  Function GET_WAY_NAME(O_Type:Integer):String;
  Function GET_DATE(O_Type:Integer):String;

  Procedure PAINT_PANELS;

implementation

{$R *.dfm}

uses Basket, Modul, Main;

Procedure DESTROY_ALL;
Var
  I:Integer;
Begin
if (Length(List) > 0) then
  Begin
  DataModule2.Basket_Query.First; // переходим на начало
  I:= 0; // Подготавливаем переменную для работы в цикле
  while (I < Length(List)) do
    Begin
    FreeAndNil(List[I].Label_Type);
    FreeAndNil(List[I].Label_Date);
    FreeAndNil(List[I].Label_Way_Name);
    FreeAndNil(List[I].Label_Time_Country);
    FreeAndNil(List[I].First_Bevel);
    FreeAndNil(List[I].Panel_Price);
    FreeAndNil(List[I].Panel_Main);
    // Переходим к следующей записи
    DataModule2.Basket_Query.Next;
    // Постинкриментируем переменную
    Inc(I);
    End;
  SetLength(List, 0);
  End;
End;

Procedure BUILD_LINE(Index:Integer);
Var
  OType:Integer;
Begin
With DataModule2.Buffer do
  Begin
  Active:= False;
  SQL.Clear;
    case StrToInt(DataModule2.Basket_Query.FieldByName('B_Type').AsString) of
    1:SQL.Add('Select * From Air_Ticket Where ID_of_recrod=' + DataModule2.Basket_Query.FieldByName('B_ID').AsString);
    2:SQL.Add('Select * From Hotels Where ID=' + DataModule2.Basket_Query.FieldByName('B_ID').AsString);
    3:;
    end;
  Active:= True;
  End;
// Создание Меин формы
List[Index].Panel_Main:= TsGradientPanel.Create(Form10);
List[Index].Panel_Main.Parent:= Form10.SB_Items;
List[Index].Panel_Main.Left:= 10;
List[Index].Panel_Main.Top:= 10 + (Index * 66{6});
List[Index].Panel_Main.Width:= 678;
List[Index].Panel_Main.Height:= 60;
List[Index].Panel_Main.PaintData.Color2.Color:= ClWhite;
List[Index].Panel_Main.PaintData.Color2.UseSkinColor:= False;
// Определение типа объекта
OType:= StrToInt(DataModule2.Basket_Query.FieldByName('B_Type').AsString);
// Создание лейбла 1
List[Index].Label_Type:= TsLabel.Create(Form10);
List[Index].Label_Type.Parent:= List[Index].Panel_Main;
List[Index].Label_Type.Left:= 8;
List[Index].Label_Type.Top:= 8;
List[Index].Label_Type.Font.Style:= [fsBold];
case OType of
  1:List[Index].Label_Type.Caption:= 'Авиабилет';
  2:List[Index].Label_Type.Caption:= 'Отель';
  3:List[Index].Label_Type.Caption:= 'Тур';
end;
// Создание лейбла 2
List[Index].Label_Date:= TsLabel.Create(Form10);
List[Index].Label_Date.Parent:= List[Index].Panel_Main;
List[Index].Label_Date.Left:= 8;
List[Index].Label_Date.Top:= 31;
List[Index].Label_Date.Caption:= GET_DATE(OType);
// Создание лейбла 3
List[Index].Label_Way_Name:= TsLabel.Create(Form10);
List[Index].Label_Way_Name.Parent:= List[Index].Panel_Main;
List[Index].Label_Way_Name.Left:= 220;
List[Index].Label_Way_Name.Top:= 8;
List[Index].Label_Way_Name.Caption:= GET_WAY_NAME(OType);
// Создание лейбла 4
List[Index].Label_Time_Country:= TsLabel.Create(Form10);
List[Index].Label_Time_Country.Parent:= List[Index].Panel_Main;
List[Index].Label_Time_Country.Left:= 220;
List[Index].Label_Time_Country.Top:= 31;
List[Index].Label_Time_Country.Caption:= GET_TimeORCountry(OType);
// Создание панели с ценой
List[Index].Panel_Price:= TsGradientPanel.Create(Form10);
List[Index].Panel_Price.Parent:= List[Index].Panel_Main;
List[Index].Panel_Price.Left:= List[Index].Panel_Main.Width - 200;
List[Index].Panel_Price.Top:= 35;
List[Index].Panel_Price.Width:= 200;
List[Index].Panel_Price.Height:= 25;
List[Index].Panel_Price.PaintData.Color1.Color:= $00FF8000;
List[Index].Panel_Price.PaintData.Color2.Color:= $00FF8000;
List[Index].Panel_Price.PaintData.Color2.UseSkinColor:= False;
List[Index].Panel_Price.Font.Style:= [fsBold];
List[Index].Panel_Price.Font.Color:= ClWhite;
List[Index].Panel_Price.Font.Size:= 12;
List[Index].Panel_Price.Caption:= DataModule2.Basket_Query.FieldByName('Price').AsString + ' KZT';
// Создание Bevel'ов
// 1 Bevel
List[Index].First_Bevel:= TsBevel.Create(Form10);
List[Index].First_Bevel.Parent:= List[Index].Panel_Main;
List[Index].First_Bevel.Left:= 200;
List[Index].First_Bevel.Top:= 0;
List[Index].First_Bevel.Width:= 3;
List[Index].First_Bevel.Height:= 60;
End;

Procedure BUILD_ALL;
Var
  I:Integer;
  EndPrice:Integer;
Begin
// Выбираем весь список
With DataModule2.Basket_Query do
  Begin
  Active:= False;
  SQL.Clear;
  SQL.Add( 'Select * From Basket' );
  Active:= True;
  End;
// Переходим на первую запись и стартуем работу с неё
DataModule2.Basket_Query.First;
// Устанавливаем размер массива
SetLength(List, DataModule2.Basket_Query.RecordCount);
I:= 0; // Подготавливаем переменную для работы в цикле
EndPrice:= 0;
while (DataModule2.Basket_Query.Eof = False) do
  Begin
  // Отправляем линию на построение
  BUILD_LINE(I);
  // Добавляем к общей цене цену данной покупки
  EndPrice:= EndPrice + StrToInt(DataModule2.Basket_Query.FieldByName('Price').AsString);
  // Переходим к следующей записи
  DataModule2.Basket_Query.Next;
  // Постинкриментируем переменную
  Inc(I);
  End;
Form10.sLabel2.Caption:= IntToStr(EndPrice) + ' USD';
End;

procedure TForm10.ExitClick(Sender: TObject);
begin
Form10.Hide;
Form9.Show;
end;

procedure TForm10.FormClose(Sender: TObject; var Action: TCloseAction);
begin
// Выборка пользователя о его намерении 1. Вернуться назад. 2. Выйти из программы
case MessageDlg('Вы точно хотите выйти?', mtConfirmation, [mbYes,mbCancel], 0) of
  mrYes:Application.Terminate;  // Если да - то закрытие программы
  mrCancel:Abort;               // Если же нет то отмена процедуры
end;
end;

procedure TForm10.FormHide(Sender: TObject);
begin
// Удаляем все объекты
DESTROY_ALL;
end;

procedure TForm10.FormShow(Sender: TObject);
begin
// Создаем все объекты
BUILD_ALL;
// Красим панели в красный цвет (Т.к. еще не заполнены)
PAINT_PANELS;
// Выставляем первую панель
Panel_Step1.Visible:= True;
Panel_Step2.Visible:= False;
Panel_Step3.Visible:= False;
Panel_Step4.Visible:= False;
sComboBox1.ItemIndex:= Form9.sComboBox1.ItemIndex;
sComboBox1.OnChange(Sender);
end;


procedure TForm10.sBitBtn1Click(Sender: TObject);
begin
Panel_Step1.Visible:= False;
Panel_Step2.Visible:= True;
sGradientPanel5.PaintData.Color1.Color:= $0000BE93;
sGradientPanel5.PaintData.Color2.Color:= $0000BE93;
sGradientPanel6.PaintData.Color1.Color:= $0000EAEA;
sGradientPanel6.PaintData.Color2.Color:= $0000EAEA;
end;

procedure TForm10.sBitBtn2Click(Sender: TObject);
Var
  I:Integer;
  S:String;
  Date1,Date2:TDate;
begin
if (Length(sEdit1.Text) < 4) or (Length(sEdit2.Text) < 4) or (Length(sEdit5.Text) < 4) or (Length(sEdit6.Text) < 4) then
  Begin
  ShowMessage('Номер карты заполнен не до конца!');
  Abort;
  End;

if (Length(sEdit7.Text) < 2) or (Length(sEdit8.Text) < 2) then
  Begin
  ShowMessage('Заполните дату по формату: mm / yy !');
  Abort;
  End;

if (StrToint(sEdit7.Text) > 12) then
  Begin
  ShowMessage('Неправильн введена дата окончания действия карты!');
  Abort;
  End;

Date1:= StrToDate('1.' + sEdit7.Text + '.' + sEdit8.Text);
Date2:= Now;
if date2 > Date1 then
  Begin
  ShowMessage('Срок вашей карты не удовлетворяет требованиям!');
  Abort;
  End;

With DataModule2 do
  Begin
  // Подготовка первой базы
  Purchases_Query.Active:= False;
  Purchases_Query.SQL.Clear;
  Purchases_Query.SQL.Add('Select * From Purchases');
  Purchases_Query.Active:= True;
  Purchases_Query.First;
  // Подготовка второй базы
  Basket_Query.Active:= False;
  Basket_Query.SQL.Clear;
  Basket_Query.SQL.Add('Select * From Basket');
  Basket_Query.Active:= True;
  Basket_Query.First;
  for I:= 1 to Basket_Query.RecordCount do
    Begin
    Purchases_Query.Insert;
    Purchases_Query.FieldByName('ID_Buyer').AsInteger:= DataModule2.Reg_Query.FieldByName('ID').AsInteger; // true
    Purchases_Query.FieldByName('ID_Product').AsInteger:= DataModule2.Basket_Query.FieldByName('B_ID').AsInteger;
    Purchases_Query.FieldByName('Buy_Time').AsDateTime:= Now;
    Purchases_Query.FieldByName('Type_Product').AsInteger:= DataModule2.Basket_Query.FieldByName('B_Type').AsInteger;
    Purchases_Query.Post;
    Basket_Query.Next;
    End;
  End;
sGradientPanel7.PaintData.Color1.Color:= $0000BE93;
sGradientPanel7.PaintData.Color2.Color:= $0000BE93;
sGradientPanel8.PaintData.Color1.Color:= $0000EAEA;
sGradientPanel8.PaintData.Color2.Color:= $0000EAEA;
Panel_Step3.Visible:= False;
Panel_Step4.Visible:= True;
Form9.sBitBtn1Click(Form9);
end;

procedure TForm10.sBitBtn3Click(Sender: TObject);
begin
if (sEdit3.Text <> '') and (sEdit4.Text <> '') then
  Begin
  Panel_Step2.Visible:= False;
  Panel_Step3.Visible:= True;
  sGradientPanel6.PaintData.Color1.Color:= $0000BE93;
  sGradientPanel6.PaintData.Color2.Color:= $0000BE93;
  sGradientPanel7.PaintData.Color1.Color:= $0000EAEA;
  sGradientPanel7.PaintData.Color2.Color:= $0000EAEA;
  End
  else
  ShowMessage('Сначало заполните все поля!');
end;

procedure TForm10.sBitBtn4Click(Sender: TObject);
begin
Panel_Step2.Visible:= False;
Panel_Step1.Visible:= True;
sGradientPanel6.PaintData.Color1.Color:= $000000D7;
sGradientPanel6.PaintData.Color2.Color:= $000000D7;
sGradientPanel5.PaintData.Color1.Color:= $0000EAEA;
sGradientPanel5.PaintData.Color2.Color:= $0000EAEA;
end;

procedure TForm10.sBitBtn5Click(Sender: TObject);
begin
Panel_Step3.Visible:= False;
Panel_Step2.Visible:= True;
sGradientPanel7.PaintData.Color1.Color:= $000000D7;
sGradientPanel7.PaintData.Color2.Color:= $000000D7;
sGradientPanel6.PaintData.Color1.Color:= $0000EAEA;
sGradientPanel6.PaintData.Color2.Color:= $0000EAEA;
end;

procedure TForm10.sBitBtn6Click(Sender: TObject);
begin
Form10.Hide;
Form4.Show;
end;

procedure TForm10.sComboBox1Change(Sender: TObject);
Var
  I, EndPrice: Integer;
  S: String;
begin
DataModule2.Basket_Query.First;
I:= 0;
EndPrice:= 0;
while (DataModule2.Basket_Query.Eof = false) do
  Begin
  case sComboBox1.ItemIndex of
    0:S:= IntToStr(DataModule2.Basket_Query.FieldByName('Price').AsInteger * KZT);
    1:S:= IntToStr(DataModule2.Basket_Query.FieldByName('Price').AsInteger);
    2:S:= IntToStr(Trunc(DataModule2.Basket_Query.FieldByName('Price').AsInteger * EUR));
    3:S:= IntToStr(DataModule2.Basket_Query.FieldByName('Price').AsInteger * RUB);
    4:S:= IntToStr(Trunc(DataModule2.Basket_Query.FieldByName('Price').AsInteger * AUD));
    5:S:= IntToStr(Trunc(DataModule2.Basket_Query.FieldByName('Price').AsInteger * GBP));
    6:S:= IntToStr(Trunc(DataModule2.Basket_Query.FieldByName('Price').AsInteger * DKK));
    7:S:= IntToStr(Trunc(DataModule2.Basket_Query.FieldByName('Price').AsInteger * AED));
  end;
  EndPrice:= EndPrice + StrToInt(S);
  if (S.Length > 3) then
    Insert(' ', S, S.Length - 2);
  S:= S + ' ' + Copy(sComboBox1.Text, 1, 3);
  List[I].Panel_Price.Caption:=S; List[I].Panel_Price.Refresh;
  I:= I + 1; DataModule2.Basket_Query.Next;
  End;
sLabel2.Caption:= IntToStr(EndPrice) + ' ' + Copy(sComboBox1.Text, 1, 3);
end;

procedure TForm10.sEdit1KeyPress(Sender: TObject; var Key: Char);
begin
If not (Key in ['0'..'9', #8]) then
  Begin
  Key:=#0;
  Beep;
  End;
end;

procedure TForm10.sEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Length(sEdit1.Text) = 4 then
  ActiveControl:= sEdit2;
end;

procedure TForm10.sEdit2KeyPress(Sender: TObject; var Key: Char);
begin
If not (Key in ['0'..'9', #8]) then
  Begin
  Key:=#0;
  Beep;
  End;
end;

procedure TForm10.sEdit2KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Length(sEdit2.Text) = 4 then
  ActiveControl:= sEdit5;
end;

procedure TForm10.sEdit3KeyPress(Sender: TObject; var Key: Char);
begin
if Key in ['0'..'9'] then key :=#0;
end;

procedure TForm10.sEdit4KeyPress(Sender: TObject; var Key: Char);
begin
if Key in ['0'..'9'] then key :=#0;
end;

procedure TForm10.sEdit5KeyPress(Sender: TObject; var Key: Char);
begin
If not (Key in ['0'..'9', #8]) then
  Begin
  Key:=#0;
  Beep;
  End;
end;

procedure TForm10.sEdit5KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Length(sEdit5.Text) = 4 then
  ActiveControl:= sEdit6;
end;

procedure TForm10.sEdit6KeyPress(Sender: TObject; var Key: Char);
begin
If not (Key in ['0'..'9', #8]) then
  Begin
  Key:=#0;
  Beep;
  End;
end;

procedure TForm10.sEdit7KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Length(sEdit7.Text) = 2 then
  ActiveControl:= sEdit8;
end;

Function GET_WAY_NAME(O_Type:Integer):String;
Begin
  case O_Type of
  1:Result:= DataModule2.Buffer.FieldByName('City_D').AsString + ' -> ' + DataModule2.Buffer.FieldByName('City_A').AsString;
  2:Result:= '"' + DataModule2.Buffer.FieldByName('H_Name').AsString + '"';
  3:Result:= '';  
  end;
End;

Function GET_DATE(O_Type:Integer):String;
Const
  // Месяци года
  sMouths:Array [1..12] of String = ('янв', 'фев', 'мар', 'апр', 'май', 'июн', 'июл', 'авг', 'сен', 'окт', 'ноя', 'дек');
  // Дни недели
  sDay   :Array [1..7]  of String = ('ВС', 'ПН', 'ВТ', 'СР', 'ЧТ', 'ПТ', 'СБ');
Var
  Date1, Date2:TDateTime;
  S:String;
Begin
// первая выборка
if (O_Type = 1) then
  Begin    
  Date1:= DataModule2.Buffer.FieldByName('Time_D').AsDateTime;
  ReplaceDate(Date1, DataModule2.Basket_Query.FieldByName('Date_Start').AsDateTime);
  // Конвертируем первую часть строку
  S:= IntToStr(DayOf(Date1)) + ' ' + sMouths[MonthOf(Date1)] + ', ' + sDay[DayOfWeek(Date1)] + ' ' + IntToStr(HourOF(Date1)) + ':' + IntToStr(MinuteOF(Date1));
  if S[S.Length-1] = ':' then S:= S + '0';
  // И по второму кругу для второй даты
  Date2:= DataModule2.Buffer.FieldByName('Time_A').AsDateTime;
    ReplaceDate(Date2, DataModule2.Basket_Query.FieldByName('Date_Finish').AsDateTime);
  // Конвертируем вторую часть строки
  S:= S + ' - ' + IntToStr(DayOf(Date2)) + ' ' + sMouths[MonthOf(Date2)] + ', ' + sDay[DayOfWeek(Date2)] + ' ' + IntToStr(HourOF(Date2)) + ':' + IntToStr(MinuteOF(Date2));
  if S[S.Length-1] = ':' then S:= S + '0';
  End;
// Вторая выборка
if (O_Type = 2) then
  Begin
  Date1:= DataModule2.Basket_Query.FieldByName('Date_Start').AsDateTime;
  Date2:= DataModule2.Basket_Query.FieldByName('Date_Finish').AsDateTime;
  S:= IntToStr(DayOf(Date1)) + ' ' + sMouths[MonthOf(Date1)] + ', ' + sDay[DayOfWeek(Date1)];
  S:= S + ' - ' + IntToStr(DayOf(Date2)) + ' ' + sMouths[MonthOf(Date2)] + ', ' + sDay[DayOfWeek(Date2)];
  End;
// Вывод результата
Result:= S;
End;

// Доделать
Procedure PAINT_PANELS;
Begin
Form10.sGradientPanel5.PaintData.Color1.Color:= $0000EAEA;
Form10.sGradientPanel5.PaintData.Color2.Color:= $0000EAEA;
Form10.sGradientPanel6.PaintData.Color1.Color:= $000000D7;
Form10.sGradientPanel6.PaintData.Color2.Color:= $000000D7;
Form10.sGradientPanel7.PaintData.Color1.Color:= $000000D7;
Form10.sGradientPanel7.PaintData.Color2.Color:= $000000D7;
Form10.sGradientPanel8.PaintData.Color1.Color:= $000000D7;
Form10.sGradientPanel8.PaintData.Color2.Color:= $000000D7;
End;

Function GET_TimeORCountry(O_Type:Integer):String;
Var
  Dt1,Dt2:TDateTime;
  Minutes,Hours:Integer;
  Output:String;
Begin
if (O_Type = 1) then
  Begin
  // Формируем первую дату
  if (DataModule2.Buffer.FieldByName('Regular').AsString = '-') then
    Dt1:= VarToDateTime(DateTimeToStr(DataModule2.Buffer.FieldByName('Date_D').AsDateTime) + ' ' + TimeToStr(TimeOf(DataModule2.Buffer.FieldByName('Time_D').AsDateTime)))
      else
        Dt1:= VarToDateTime(DateTimeToStr(DataModule2.Buffer.FieldByName('Time_D').AsDateTime));
  // Формируем вторую дату
  if (DataModule2.Buffer.FieldByName('Regular').AsString = '-') then
    Dt2:= VarToDateTime(DateTimeToStr(DataModule2.Buffer.FieldByName('Date_A').AsDateTime) + ' ' + TimeToStr(TimeOf(DataModule2.Buffer.FieldByName('Time_A').AsDateTime)))
      else
        Dt2:= VarToDateTime(DateTimeToStr(DataModule2.Buffer.FieldByName('Time_A').AsDateTime));
  // Сохранение часов и времени
  Hours:=   HoursBetween(Dt1, Dt2);
  Minutes:= MinutesBetween(Dt1, Dt2);
  // Формируем
  Output:='Общее время перелёта: ';
  if (Hours > 0) then Output:= Output + IntToStr(Hours) + 'ч ';
  if (Minutes > 0) then Output:= Output + IntToStr(Minutes - ((Minutes Div 60) * 60)) + 'м';
  End;
if (O_Type = 2) then
  Begin
  Output:= 'Количество человек = 2'
  End;
// Вывод
Result:= Output;
End;


end.
