unit Hotel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sPanel, Vcl.StdCtrls, sLabel,
  Vcl.ExtCtrls, sBevel, acImage, sButton, Vcl.ComCtrls,
  Data.DB, Data.Win.ADODB,
  acAlphaHints, Vcl.Grids, Vcl.DBGrids, sDialogs, PNGImage, Vcl.Buttons, sBitBtn,
  sPageControl, BTNlib, acPNG, sToolEdit, Dateutils,
  sScrollBox, sEdit, sCheckBox, sComboBox, Vcl.Mask, sMaskEdit, sCustomComboEdit;

type
  TForm7 = class(TForm)
    Panel_Stars: TsGradientPanel;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Info_Image: TImage;
    TabSheet2: TTabSheet;
    Price_panel: TsGradientPanel;
    Info_Panel: TsGradientPanel;
    sBevel3: TsBevel;
    Lbl_HotelName: TsLabel;
    Lbl_tag1: TsLabel;
    Lbl_tag2: TsLabel;
    Lbl_tag3: TsLabel;
    Lbl_tag4: TsLabel;
    lbl_HotelInfo: TsLabel;
    Image_Comment: TsImage;
    Image_tag: TsImage;
    Control_Panel: TsPanel;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    Button_Exit: TsBitBtn;
    Button_add_OBJECT: TsBitBtn;
    sBitBtn3: TsBitBtn;
    Image_Phone: TsImage;
    Lbl_Phone: TsLabel;
    sBevel1: TsBevel;
    sBevel2: TsBevel;
    Lbl_Fax: TsLabel;
    Image_Fax: TsImage;
    sBevel4: TsBevel;
    Lbl_Web: TsWebLabel;
    Image_Web: TsImage;
    sImage1: TsImage;
    sLabel26: TsLabel;
    Label_Basket_Count: TsLabel;
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
    sPanel1: TsPanel;
    sDateEdit1: TsDateEdit;
    sLabel1: TsLabel;
    sDateEdit2: TsDateEdit;
    sBevel5: TsBevel;
    sLabel2: TsLabel;
    sButton2: TsButton;
    BackGround_Image_Shadow: TsImage;
    BackGround_Image: TsImage;
    sPanel3: TsPanel;
    sPanel2: TsPanel;
    Explorer_Panel: TsPanel;
    Button_Panel: TImage;
    Next_Button: TsBitBtn;
    Prior_button: TsBitBtn;
    sScrollBox1: TsScrollBox;
    sPanel4: TsPanel;
    Lbl_Records_count: TsLabel;
    sGradientPanel2: TsGradientPanel;
    sGradientPanel8: TsGradientPanel;
    sComboBox1: TsComboBox;
    sCheckBox1: TsCheckBox;
    sGradientPanel3: TsGradientPanel;
    sGradientPanel9: TsGradientPanel;
    sComboBox3: TsComboBox;
    sGradientPanel5: TsGradientPanel;
    sEdit1: TsEdit;
    sGradientPanel1: TsGradientPanel;
    sGradientPanel6: TsGradientPanel;
    sGradientPanel7: TsGradientPanel;
    sComboBox2: TsComboBox;
    Button1: TButton;
    sBevel6: TsBevel;
    sComboBox4: TsComboBox;
    sLabel3: TsLabel;
    Button_Refresh: TsBitBtn;
    procedure FormCreate(Sender: TObject);
    procedure FormResize(Sender: TObject);
    Procedure Show_info1(Sender: TObject);
    Procedure Show_info2(Sender: TObject);
    Procedure Show_info3(Sender: TObject);
    Procedure Show_info4(Sender: TObject);
    Procedure Show_info5(Sender: TObject);
    Procedure Show_info6(Sender: TObject);
    Procedure Show_info7(Sender: TObject);
    procedure Prior_buttonClick(Sender: TObject);
    procedure Next_ButtonClick(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure Button_ExitClick(Sender: TObject);
    procedure Button_PanelMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Button_PanelMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Button_PanelMouseLeave(Sender: TObject);
    procedure Button_PanelMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Button_add_OBJECTClick(Sender: TObject);
    procedure sLabel26Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure sButton2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure sEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure sEdit3KeyPress(Sender: TObject; var Key: Char);
    procedure sEdit4KeyPress(Sender: TObject; var Key: Char);
    procedure sEdit5KeyPress(Sender: TObject; var Key: Char);
    procedure Button_RefreshClick(Sender: TObject);
  private
    { Private declarations }
  public
    Shadow_Image:TPNGObject;
  end;

const
  Line_Count=8;

var
  Form7: TForm7;

  Button_Count:integer=1;

  //Динамические объекты......................//
  Panel_mas    :Array [1..Line_Count] of tsPanel;//......//
  GPanel_star  :Array [1..Line_Count] of TsGradientPanel;//
  CButtons     :Array                 of TCButton;//...//
  Image_photo  :Array [1..Line_Count] of TsImage;//......//
  Bevel_photo  :Array [1..Line_Count] of TsBevel;//
  Bevel_1      :Array [1..Line_Count] of TsBevel;//
  Bevel_2      :Array [1..Line_Count] of TsBevel;//
  Label_name   :Array [1..Line_Count] of tsLabel;//
  Label_country:Array [1..Line_Count] of tsLabel;//
  Label_city   :Array [1..Line_Count] of tsLabel;//
  Label_tag1   :Array [1..Line_Count] of tsLabel;//
  Label_tag2   :Array [1..Line_Count] of tsLabel;//
  Label_tag3   :Array [1..Line_Count] of tsLabel;//
  Label_tag4   :Array [1..Line_Count] of tsLabel;//
  Label_comment:Array [1..Line_Count] of tsLabel;//
  Label_price  :Array [1..Line_Count] of tsLabel;//
  Label_other  :Array [1..Line_Count] of tsLabel;//
  //..........................................//


  Page_Current:Integer;

  Procedure ADD_OBJECTS;
  Procedure GET_INFO(Line:Integer);
  Function  GET_PRICE(Start,Finish:TDateTime):Integer;

  Procedure BUILD_PAGE(Index:Integer);
  Procedure BUILD_LINE(Index:Integer);

implementation

{$R *.dfm}

uses Modul, Main, Basket;

Function Get_Price(Start,Finish:TDateTime):Integer;
var
  CDate:TDateTime;
  Res, Price:Integer;
  LP: String;
Begin
Res:= 0;
CDate:= Start;
if DataModule2.Hotel_Query.FieldByName('FixPrice').AsBoolean = True then
while (CDate < Finish) do
  Begin
  CDate:=IncDay(CDate, 1);
  Price:= DataModule2.Hotel_Query.FieldByName('Price').AsInteger;
  Res:= Res + Price;
  End
else
while (CDate < Finish) do
  Begin
  CDate:=IncDay(CDate, 1);
  LP:= IntToStr(monthof(CDate));
  if LP.Length = 1 then LP:= '0' + LP;
  Price:= DataModule2.Hotel_Query.FieldByName('Price_' + LP).AsInteger;
  Res:= Res + Price;
  End;
Result:= Res;
End;

procedure TForm7.Button1Click(Sender: TObject);
Var
  S: String;
  R, G, B, DR, DG, DB: Double;
  I: Integer;
begin
With DataModule2.Hotel_Query do
  Begin
  Active:= False;
  SQL.Clear;
  S:= 'SELECT * FROM HOTELS AS H WHERE (H.Food LIKE ''%' + sComboBox3.Text + '%'')';
  if sComboBox2.ItemIndex > 0 then S:= S + ' AND (H.Country=''' + sComboBox2.Text + ''')';
  if sCheckBox1.Checked then S:= S + ' AND (H.Stars>=' + IntToStr(sComboBox1.ItemIndex + 1) + ')'
    else S:= S + ' AND (H.Stars=' + IntToStr(sComboBox1.ItemIndex + 1) + ')';
  SQL.Add(S);
  Active:= True;
  End;
Lbl_Records_count.Caption:= DataModule2.CHECK_RecordCount(DataModule2.Hotel_Query.RecordCount);
Lbl_Records_count.left:= 232 - (Lbl_Records_count.Width div 2);
if (DataModule2.Hotel_Query.RecordCount > 0) then
  Begin
  // Находим кол-во страниц
  Button_Count:=(DataModule2.Hotel_Query.Recordcount Div Line_Count);
  if (DataModule2.Hotel_Query.Recordcount Mod Line_Count) > 0 then
    Button_Count:= Button_Count + 1;
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

  SetLength(CButtons,Button_Count);
  for I:= 0 to Button_count-1 do
    begin
    CButtons[I].BorderWidth:=1;
    CButtons[I].Left:= I * 35;
    CButtons[I].Top:=8;
    CButtons[I].Height:=32;

    CButtons[I].Width:=32;
    CButtons[I].BorderRadius:=8;
    CButtons[I].BorderColor:=RGB(220,220,220);
    CButtons[I].Color:=RGB(237,237,237);
    CButtons[I].Color_off:=RGB(0,128,255);
    CButtons[I].BackColor:=ClWhite;
    CButtons[I].BackGradient.Enabled:= True;
    CButtons[I].BackGradient.Color1:= RGB(253,253,253);
    CButtons[I].BackGradient.Color2:= RGB(248,248,248);
    CButtons[I].Gradient.Color1:=RGB(254,254,254);
    CButtons[I].Gradient.Color2:=RGB(221,221,221);
    CButtons[I].Caption:=IntToStr(I+1);
    CButtons[I].State:=cbStay;
    CButtons[I].Create;
    Button_panel.Canvas.Draw(CButtons[I].Left,CButtons[I].Top, CButtons[I].Paint);
    end;
  //...
  CButtons[0].State:=cbLocked;
  End;
BUILD_PAGE(1);
end;

procedure TForm7.Button_add_OBJECTClick(Sender: TObject);
begin
DataModule2.Basket_Query.Active:= False;
DataModule2.Basket_Query.SQL.Clear;
DataModule2.Basket_Query.SQL.Add('Select * From Basket');
DataModule2.Basket_Query.Active:= True;
DataModule2.Basket_Query.Insert;
DataModule2.Basket_Query.FieldByName('B_Type').AsString:= '2';
DataModule2.Basket_Query.FieldByName('B_ID').AsString:= DataModule2.Hotel_Query.FieldByName('ID').AsString;
DataModule2.Basket_Query.FieldByName('Date_Start').AsString:= sDateEdit1.Text;
DataModule2.Basket_Query.FieldByName('Date_Finish').AsString:= sDateEdit2.Text;
DataModule2.Basket_Query.FieldByName('Price').AsString:= IntToStr(Get_Price(sDateEdit1.Date, sDateEdit2.Date));
DataModule2.Basket_Query.FieldByName('Peoples').AsString:= IntToStr(sComboBox4.ItemIndex);
DataModule2.Basket_Query.Post;
Info_Panel.Visible:= False;
Button_add_OBJECT.Enabled:= False;
sDateEdit1.Text:= '';
sDateEdit2.Text:= '';
DataModule2.REFRESH_BASKET;
ShowMessage('Отель был успешно добавлен в корзину!');
end;

procedure TForm7.Button_ExitClick(Sender: TObject);
begin
Info_Panel.Visible:= False;
sDateEdit1.Text:= '';
sDateEdit2.Text:= '';
end;

procedure TForm7.Button_PanelMouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
Var
  I, D :Integer;
begin
for I:=0 to Button_Count-1 do
  if (CButtons[I].Left <= X) AND (X <= CButtons[I].Left + CButtons[I].Width)
  AND (CButtons[I].Top <= Y) AND (Y <= CButtons[I].Top + CButtons[I].Height) then
    if CButtons[I].State<>cbLocked then
    Begin
    CButtons[I].State:= cbPressed;
    Form7.Button_panel.Canvas.Draw(CButtons[I].Left,CButtons[I].Top, CButtons[I].Paint);
    End;
end;

procedure TForm7.Button_PanelMouseLeave(Sender: TObject);
Var
  I :integer;
begin
for I:=0 to Button_Count-1 do
    Begin
    if CButtons[I].State<>cbLocked then
      CButtons[I].State:=cbStay;
    Form7.Button_panel.Canvas.Draw(CButtons[I].Left,CButtons[I].Top, CButtons[I].Paint);
    End;
end;

procedure TForm7.Button_PanelMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var
  I:Integer;
begin
//...
for I:=0 to Button_Count-1 do
  if (CButtons[I].Left <= X) AND (X <= CButtons[I].Left + CButtons[I].Width)
  AND (CButtons[I].Top <= Y) AND (Y <= CButtons[I].Top + CButtons[I].Height) then
    begin
    if CButtons[I].State<>cbLocked then
      if GetKeyState(VK_LBUTTON)<0 then
        CButtons[I].State:=cbPressed
          else 
            CButtons[I].State:=cbHover;
    Form7.Button_panel.Canvas.Draw(CButtons[I].Left,CButtons[I].Top, CButtons[I].Paint);
    end
  else
  if CButtons[I].State<>cbLocked then
    begin
    CButtons[I].State:=cbStay;
    Form7.Button_panel.Canvas.Draw(CButtons[I].Left,CButtons[I].Top, CButtons[I].Paint);
    end;
//...
end;

procedure TForm7.Button_PanelMouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
Var
  I, D :Integer;
begin
for I:=0 to Button_Count-1 do
  if (CButtons[I].Left <= X) AND (X <= CButtons[I].Left+CButtons[I].Width)
  AND (CButtons[I].Top <= Y) AND (Y <= CButtons[I].Top + CButtons[I].Height) then
    if Page_Current<>(X div 35)+1 then
      Begin
      Build_Page((X div 35)+1);
      End;
end;

procedure TForm7.Button_RefreshClick(Sender: TObject);
begin
With DataModule2.Hotel_Query do
  Begin
  Active:= False;
  Active:= True;
  End;
BUILD_PAGE(Page_Current);
end;

procedure TForm7.FormClose(Sender: TObject; var Action: TCloseAction);
begin
case MessageDlg('Вы точно хотите выйти?',mtConfirmation , [mbYes,mbCancel], 0) of
mrYes:Application.Terminate;
mrCancel:Abort;
end;
end;

procedure TForm7.FormCreate(Sender: TObject);
var
  I :Integer;
  R,G,B,DR,DG,DB:Double;
begin
Application.HintHidePause:= 50000;
Add_objects;
// Для создания проекта
Image_Comment.Picture.LoadFromFile( 'Textures\Comment.png' );
Image_Tag.Picture.LoadFromFile( 'Textures\Tag.png' );
Image_Phone.Picture.LoadFromFile( 'Textures\Phone.png' );
Image_Fax.Picture.LoadFromFile( 'Textures\Fax.png' );
Image_Web.Picture.LoadFromFile( 'Textures\Web.png' );

// Кнопки експлорера
Button_Count:=(DataModule2.Hotel_Query.Recordcount Div Line_Count);
if (DataModule2.Hotel_Query.Recordcount Mod Line_Count) > 0 then
  Button_Count:=Button_Count+1;
SetLength(CButtons,Button_Count);
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
for I:=0 to Button_count-1 do
  begin
  CButtons[I].BorderWidth:=1;
  CButtons[I].Left:= I * 35;
  CButtons[I].Top:=8;
  CButtons[I].Height:=32;
  CButtons[I].Width:=32;
  CButtons[I].BorderRadius:=8;
  CButtons[I].BorderColor:=RGB(220,220,220);
  CButtons[I].Color:=RGB(237,237,237);
  CButtons[I].Color_off:=RGB(0,128,255); 
  CButtons[I].BackColor:=ClWhite;
  CButtons[I].BackGradient.Enabled:= True;
  CButtons[I].BackGradient.Color1:= RGB(253,253,253);
  CButtons[I].BackGradient.Color2:= RGB(248,248,248);
  CButtons[I].Gradient.Color1:=RGB(254,254,254);
  CButtons[I].Gradient.Color2:=RGB(221,221,221);
  CButtons[I].Caption:=IntToStr(I+1);
  CButtons[I].State:=cbStay;
  CButtons[I].Create;
  Button_panel.Canvas.Draw(CButtons[I].Left,CButtons[I].Top, CButtons[I].Paint);
  end;
//...
CButtons[0].State:=cbLocked;
Page_Current:=1;
Build_Page(Page_Current);
if Button_Count > 1 then
Next_Button.Enabled:=True;
Lbl_Records_count.Caption:='По вашему запросу было найденно: '+IntToStr(DataModule2.Hotel_Query.Recordcount)+' записей';
//Lbl_Records_count.Left:=Back_Gradient.Width-Lbl_Records_count.width-10;
end;

procedure TForm7.FormResize(Sender: TObject);
var
  I: Integer;
begin
BackGround_Image.Width:= ClientWidth;
BackGround_Image.Height:= ClientHeight;
sPanel3.Left:= (ClientWidth div 2) - 480;
sPanel4.Left:= (sPanel3.Left + sPanel3.Width - 464);
Control_Panel.Left:= sPanel3.Left;
sPanel3.Height:= ClientHeight - 52;
sPanel2.Top:= sPanel3.Height - 156;
sScrollBox1.Height:= sPanel2.Top - 12;
end;

procedure TForm7.FormShow(Sender: TObject);
begin
DataModule2.REFRESH_BASKET;
end;

procedure TForm7.sBitBtn1Click(Sender: TObject);
begin
Form7.Hide;
// Код для показа меню
Form4.show;
end;

Procedure CHK_Date;
Begin
if (Pos(' ', Form7.sDateEdit1.Text) > 0) or (Pos(' ', Form7.sDateEdit2.Text) > 0) then
  Begin
  ShowMessage('Был найден пропущенный символ, проверьте дату!');
  Abort;
  End;

if (Form7.sDateEdit1.Date < Now) then
  Begin
  ShowMessage('Дата которую вы выбрали нельзя использовать, т.к. нельзя забронировать билет за прошлые дни!');
  Abort;
  End;

if (Form7.sDateEdit2.Date > IncMonth((Form7.sDateEdit1.Date), 3)) then
  Begin
  ShowMessage('Нельзя бронировать отель более чем на 3 месяца!');
  Abort;
  End;

if (Form7.sDateEdit2.Date < Form7.sDateEdit1.Date) then
  Begin
  ShowMessage('Дата окончания бронирования не должна быть меньше чем день начала бронирования!');
  Abort;
  End;

// Скрываем прудпредительный знак
Form7.Price_Panel.Caption:= '     Цена:  ' + IntToStr(Get_Price(Form7.sDateEdit1.Date, Form7.sDateEdit2.Date))+' $';
Form7.Price_Panel.Refresh;
// Показываем кнопку добавления
Form7.Button_add_OBJECT.Enabled:= True;
End;

procedure TForm7.sButton2Click(Sender: TObject);
begin
CHK_Date;
end;

procedure TForm7.sEdit2KeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in ['0'..'9', #8]) then Key:= #0;
end;

procedure TForm7.sEdit3KeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in ['0'..'9', #8]) then Key:= #0;
end;

procedure TForm7.sEdit4KeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in ['0'..'9', #8]) then Key:= #0;
end;

procedure TForm7.sEdit5KeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in ['0'..'9', #8]) then Key:= #0;
end;

Procedure TForm7.Show_info1(Sender: TObject);
Begin
Get_INFO(1);
End;

Procedure TForm7.Show_info2(Sender: TObject);
Begin
Get_INFO(2);
End;

Procedure TForm7.Show_info3(Sender: TObject);
Begin
Get_INFO(3);
End;

Procedure TForm7.Show_info4(Sender: TObject);
Begin
Get_INFO(4);
End;

Procedure TForm7.Show_info5(Sender: TObject);
Begin
Get_INFO(5);
End;

Procedure TForm7.Show_info6(Sender: TObject);
Begin
Get_INFO(6);
End;

Procedure TForm7.Show_info7(Sender: TObject);
Begin
Get_INFO(7);
End;


procedure TForm7.sLabel26Click(Sender: TObject);
begin
Form7.Hide;
Form9.Show;
end;

procedure TForm7.Prior_buttonClick(Sender: TObject);
begin
Next_button.Enabled:= True;
Build_Page(Page_Current - 1);
if Page_Current-1 < 1 then Prior_button.Enabled:= False;
end;

procedure TForm7.Next_ButtonClick(Sender: TObject);
begin
Prior_button.Enabled:= True;
Build_Page(Page_Current + 1);
if Page_Current+1 > Button_Count then Next_button.Enabled:= False;
end;

Procedure Get_INFO(Line:Integer);
Var
  I, D:integer;
Begin
With Form7 do
  Begin
  DataModule2.Hotel_Query.First;
  if Page_Current > 1 then
    for I:=2 to Page_Current do
      for D:=1 to Line_Count do
        DataModule2.Hotel_Query.Next;

  if Line > 1 then
    for I:=2 to Line do
      DataModule2.Hotel_Query.Next;

  Lbl_HotelName.Caption:=DataModule2.Hotel_Query.Fields.FieldByName('Name').AsString;
  sBevel3.Width:=Lbl_HotelName.Width;
  Panel_Stars.Caption:=DataModule2.Hotel_Query.FieldByName('Stars').AsString + ' *';
  Panel_Stars.Left:=sbevel3.Left+sbevel3.Width+3;
  if Label_tag1[Line].visible=True then
    Begin Lbl_tag1.Caption:=Label_tag1[Line].Caption; Lbl_tag1.Visible:=True; end
      else Lbl_tag1.Visible:=False;
  Lbl_tag2.Left:=Lbl_tag1.Left+Lbl_tag1.Width+3;
  if Label_tag2[Line].visible=True then
    Begin Lbl_tag2.Caption:=Label_tag2[Line].Caption; Lbl_tag2.Visible:=True; end
      else Lbl_tag2.Visible:=False;
  Lbl_tag3.Left:=Lbl_tag2.Left+Lbl_tag2.Width+3;
  if Label_tag3[Line].visible=True then
    Begin Lbl_tag3.Caption:=Label_tag3[Line].Caption; Lbl_tag3.Visible:=True; end
      else Lbl_tag3.Visible:=False;
  Lbl_tag4.Left:=Lbl_tag3.Left+Lbl_tag3.Width+3;
  if Label_tag4[Line].visible=True then
    Begin Lbl_tag4.Caption:=Label_tag4[Line].Caption; Lbl_tag4.Visible:=True; end
      else Lbl_tag4.Visible:=False;
  lbl_HotelInfo.Caption:=DataModule2.Hotel_Query.FieldByName('Comment').AsString;
  lbl_HotelInfo.Height:=100;
  lbl_HotelInfo.Width:=400;
  Price_Panel.Caption:='     Цена:  ' + Label_Price[Line].caption;
  info_image.Picture.Assign(DataModule2.Hotel_Query.FieldByName('Photo'));

  lbl_info_hotel.Caption:=DataModule2.Hotel_Query.FieldByName('About_hotel').AsString;
  lbl_info_hotel.Width:=388;
  lbl_type_info_hotel.Caption:=DataModule2.Hotel_Query.FieldByName('Type_Rooms').AsString;
  lbl_type_info_hotel.Width:=388;
  lbl_food_hotel.Caption:=DataModule2.Hotel_Query.FieldByName('Food').AsString;
  lbl_food_hotel.Width:=388;
  lbl_rooms_hotel.Caption:=DataModule2.Hotel_Query.FieldByName('About_Room').AsString;
  lbl_rooms_hotel.Width:=388;
  lbl_Place_hotel.Caption:=DataModule2.Hotel_Query.FieldByName('About_Place').AsString;
  lbl_Place_hotel.Width:=388;
  lbl_Children_hotel.Caption:=DataModule2.Hotel_Query.FieldByName('About_For_Childrens').AsString;
  lbl_Children_hotel.Width:=388;
  lbl_Entertainment_hotel.Caption:=DataModule2.Hotel_Query.FieldByName('About_Entertainment').AsString;
  lbl_Entertainment_hotel.Width:=388;
  lbl_Kids_hotel.Caption:=DataModule2.Hotel_Query.FieldByName('About_Baby').AsString;
  lbl_Kids_hotel.Width:=388;
  Lbl_Phone.Caption:=DataModule2.Hotel_Query.FieldByName('Phone').AsString;
  Lbl_Fax.Caption:=DataModule2.Hotel_Query.FieldByName('Fax').AsString;
  Lbl_Web.Caption:=DataModule2.Hotel_Query.FieldByName('Internet_Address').AsString;
  Lbl_Web.URL:=DataModule2.Hotel_Query.FieldByName('Internet_Address').AsString;
  Info_Panel.Left:= (Clientwidth div 2) - (Info_Panel.Width div 2);
  Info_Panel.Visible:=True;
  End;
End;


Procedure Add_objects;
Var
I :Integer;
Begin
for I:=1 to Line_Count do
  Begin
  Panel_mas[I]:=TSpanel.create(Form7);
  Panel_mas[I].Parent:= Form7.sScrollBox1;
  GPanel_star[I]:=TsGradientPanel.create(Form7);
  GPanel_star[I].Parent:=Panel_mas[I];
  Bevel_photo[I]:=TsBevel.create(Form7);
  Bevel_photo[I].Parent:=Panel_mas[I];
  Bevel_1[I]:=TsBevel.create(Form7);
  Bevel_1[I].Parent:=Panel_mas[I];
  Bevel_2[I]:=TsBevel.create(Form7);
  Bevel_2[I].Parent:=Panel_mas[I];
  Image_photo[I]:=TsImage.create(Form7);
  Image_photo[I].Parent:=Panel_mas[I];
  Label_name[I]:=TsLabel.Create(Form7);
  Label_name[I].Parent:=Panel_mas[I];
  Label_country[I]:=TsLabel.Create(Form7);
  Label_country[I].Parent:=Panel_mas[I];
  Label_city[I]:=TsLabel.Create(Form7);
  Label_city[I].Parent:=Panel_mas[I];
  Label_tag1[I]:=TsLabel.Create(Form7);
  Label_tag1[I].Parent:=Panel_mas[I];
  Label_tag2[I]:=TsLabel.Create(Form7);
  Label_tag2[I].Parent:=Panel_mas[I];
  Label_tag3[I]:=TsLabel.Create(Form7);
  Label_tag3[I].Parent:=Panel_mas[I];
  Label_tag4[I]:=TsLabel.Create(Form7);
  Label_tag4[I].Parent:=Panel_mas[I];
  Label_comment[I]:=TsLabel.Create(Form7);
  Label_comment[I].Parent:=Panel_mas[I];
  Label_price[I]:=TsLabel.Create(Form7);
  Label_price[I].Parent:=Panel_mas[I];
  Label_other[I]:=TsLabel.Create(Form7);
  Label_other[I].Parent:=Panel_mas[I];

  Panel_mas[I].Left:=0;
  Panel_mas[I].Width:=935;
  Panel_mas[I].Height:=70;
  Panel_mas[I].Top:=((I - 1) * 70) + (I * 10);
  GPanel_star[I].Width:=30;
  GPanel_star[I].Height:=17;
  GPanel_star[I].Alignment:=taCenter;
  GPanel_star[I].Top:=8;
  GPanel_star[I].PaintData.CustomGradient:='16744448;16744448;97;0;0;16744448;16744448;0;0;0';
  GPanel_star[I].Font.Color:=ClWhite;
  Bevel_photo[I].Left:=8;
  Bevel_photo[I].Top:=7;
  Bevel_photo[I].Width:=106;
  Bevel_photo[I].Height:=56;

  Bevel_1[I].Left:=400;
  Bevel_1[I].Top:=0;
  Bevel_1[I].Width:=2;
  Bevel_1[I].Height:=73;

  Bevel_2[I].Left:=830;
  Bevel_2[I].Top:=0;
  Bevel_2[I].Width:=2;
  Bevel_2[I].Height:=73;

  Image_photo[I].Left:=11;
  Image_photo[I].Top:=10;
  Image_photo[I].Width:=100;
  Image_photo[I].Height:=50;
  Image_photo[I].Picture.LoadFromFile('Textures\BackGround\mountains_1.jpg');
  Image_photo[I].Stretch:=True;
  Label_name[I].Left:=128;
  Label_name[I].Top:=8;
  Label_name[I].Font.Style:= [fsBold];
  Label_country[I].Left:=128;
  Label_country[I].Top:=27;
  Label_city[I].Left:=175;
  Label_city[I].Top:=27;
  Label_tag1[I].Left:=128;
  Label_tag1[I].Top:=46;
  Label_tag1[I].Font.Style:=[fsUnderline];
  Label_tag1[I].Cursor:= crHandPoint;
  Label_tag2[I].Left:=161;
  Label_tag2[I].Top:=46;
  Label_tag2[I].Font.Style:=[fsUnderline];
  Label_tag2[I].Cursor:= crHandPoint;
  Label_tag3[I].Left:=194;
  Label_tag3[I].Top:=46;
  Label_tag3[I].Font.Style:=[fsUnderline];
  Label_tag3[I].Cursor:= crHandPoint;
  Label_tag4[I].Left:=227;
  Label_tag4[I].Top:=46;
  Label_tag4[I].Font.Style:=[fsUnderline];
  Label_tag4[I].Cursor:= crHandPoint;
  Label_comment[I].Left:=406;
  Label_comment[I].Top:=15;
  Label_comment[I].WordWrap:=True;
  Label_price[I].Left:=836;
  Label_price[I].Top:=9;
  Label_price[I].Font.Size:= 12;
  Label_price[I].Font.Style:= [fsBold];
  Label_other[I].Left:=836;
  Label_other[I].Top:=41;
  Label_other[I].Caption:='Подробнее...';
  Label_other[I].Cursor:=crHandPoint;
  Label_other[I].Font.Style:=[fsUnderline];
    case I of
    1:Label_other[I].OnClick:=Form7.Show_info1;
    2:Label_other[I].OnClick:=Form7.Show_info2;
    3:Label_other[I].OnClick:=Form7.Show_info3;
    4:Label_other[I].OnClick:=Form7.Show_info4;
    5:Label_other[I].OnClick:=Form7.Show_info5;
    6:Label_other[I].OnClick:=Form7.Show_info6;
    7:Label_other[I].OnClick:=Form7.Show_info7;
    end;
  End;
  Form7.Info_Panel.BringToFront;

Form7.BackGround_Image.Width:=Form7.ClientWidth;
Form7.BackGround_Image.Height:=Form7.ClientHeight;
case Random(3) of
0:Form7.BackGround_Image.Picture.LoadFromFile('Textures\BackGround\mountains_1.jpg');
1:Form7.BackGround_Image.Picture.LoadFromFile('Textures\BackGround\mountains_2.jpg');
2:Form7.BackGround_Image.Picture.LoadFromFile('Textures\BackGround\mountains_3.jpg');
end;
Form7.BackGround_Image.Stretch:=True;
End;


Procedure Build_Line(Index:Integer);
Var
  D :Integer;
  S :String;
Begin
Panel_mas[Index].Visible:=True;
Label_name[Index].Caption:=DataModule2.Hotel_Query.Fields.FieldByName('Name').AsString;
Label_country[Index].Caption:=DataModule2.Hotel_Query.FieldByName('Country').AsString+',';
Label_city[Index].Left:=Label_country[Index].Left+Label_country[Index].Width+6;
Label_city[Index].Caption:=DataModule2.Hotel_Query.FieldByName('City').AsString;
//...
S:=DataModule2.Hotel_Query.FieldByName('Comment').AsString;
if Length(S)>183 then
  Begin
  Label_comment[Index].ShowHint:=True;
  Label_comment[Index].Hint:=S;
  S:=Copy(S,1,180)+'...';
  End else Label_comment[Index].ShowHint:=False;
Label_comment[Index].Caption:=S;
Label_comment[Index].Width:=390;
//... Недофича (Нужен запрос онлайн времени!)
if DataModule2.Hotel_Query.FieldByName('FixPrice').AsBoolean then
  Label_price[Index].Caption:=DataModule2.Hotel_Query.FieldByName('Price').AsString + ' USD'
else
  Label_price[Index].Caption:=DataModule2.Hotel_Query.FieldByName('Price_' + IntToStr(MonthOf(Now))).AsString + ' USD';
//...
GPanel_star[Index].Left:=Label_name[Index].Left+Label_name[Index].Width+6;
GPanel_star[Index].Caption:=DataModule2.Hotel_Query.FieldByName('Stars').AsString + ' *';
//...
Image_photo[Index].Picture.Assign(DataModule2.Hotel_Query.FieldByName('Photo'));
//...
S:=DataModule2.Hotel_Query.FieldByName('Tags').AsString;
Label_tag1[Index].Visible:=False;
Label_tag2[Index].Visible:=False;
Label_tag3[Index].Visible:=False;
Label_tag4[Index].Visible:=False;
D:=1;
While (S<>'') do
  Begin
  if pos(';',S)>0 then
    begin
      case D of
      1:Begin Label_tag1[Index].Caption:=Copy(S,0,Pos(';',S)-1)+','; Label_tag1[Index].Visible:=True; end;

      2:Begin Label_tag2[Index].Caption:=Copy(S,0,Pos(';',S)-1)+','; Label_tag2[Index].Visible:=True; end;

      3:Begin Label_tag3[Index].Caption:=Copy(S,0,Pos(';',S)-1)+','; Label_tag3[Index].Visible:=True; end;

      4:Begin Label_tag4[Index].Caption:=Copy(S,0,Pos(';',S)-1)+','; Label_tag4[Index].Visible:=True; end;
      end;
    Delete(S,1,Pos(';',S));
    end;
  inc(D);
  if (Pos(';',S)=0) or (D=4) then
    begin
    S:='';
      Case D of
      2:Label_tag1[Index].Caption:=Copy(Label_tag1[Index].Caption,0,Length(Label_tag1[Index].Caption)-1);
      3:Label_tag2[Index].Caption:=Copy(Label_tag2[Index].Caption,0,Length(Label_tag2[Index].Caption)-1);
      4:Label_tag3[Index].Caption:=Copy(Label_tag3[Index].Caption,0,Length(Label_tag3[Index].Caption)-1);
      5:Label_tag4[Index].Caption:=Copy(Label_tag4[Index].Caption,0,Length(Label_tag4[Index].Caption)-1);
      End;
    end;
  End;
Label_tag2[Index].Left:=Label_tag1[Index].Left+Label_tag1[Index].Width+3;
Label_tag3[Index].Left:=Label_tag2[Index].Left+Label_tag2[Index].Width+3;
Label_tag4[Index].Left:=Label_tag3[Index].Left+Label_tag3[Index].Width+3;
//...
End;

Procedure Build_Page(Index:Integer);
var
  I, D: Integer;
Begin
if (DataModule2.Hotel_Query.RecordCount > 0) then
  Begin
  DataModule2.Hotel_Query.First;
  for I:=1 to Line_Count do
    Panel_Mas[I].Visible:=False;
  // Перемещение по страницам
  if Index > 1 then
    for I:=2 to Index do
      for D:=1 to Line_Count do DataModule2.Hotel_Query.Next;
  // Вывод текущей страницы
  I:=1;
  if DataModule2.Hotel_Query.RecordCount>0 then
  while (DataModule2.Hotel_Query.Eof=False) AND (I<=Line_Count) do
    Begin
    Build_Line(I);
    DataModule2.Hotel_Query.Next;
    Inc(I);
    End;
  // Изменение кнопок
  for I:=0 to Button_Count - 1 do
    if CButtons[I].State=cbLocked then
      begin
      CButtons[I].State:=cbStay;
      Form7.Button_panel.Canvas.Draw(CButtons[I].Left,CButtons[I].Top, CButtons[I].Paint);
      end;
  CButtons[Index - 1].State:=cbLocked;
  Form7.Button_panel.Canvas.Draw(CButtons[Index - 1].Left,CButtons[Index - 1].Top, CButtons[Index - 1].Paint);
  Page_Current:=Index;
  if Index + 1 > Button_Count then Form7.Next_button.Enabled:= False else Form7.Next_button.Enabled:= True;
  if Index - 1 < 1 then Form7.Prior_button.Enabled:= False else Form7.Prior_button.Enabled:= True;
  End
else
  Begin
  for I:= 1 to Line_Count do
    Panel_Mas[I].Visible:= False;
  End;
End;

end.
