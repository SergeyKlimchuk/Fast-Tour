unit Tour;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sPanel, Vcl.Buttons,
  sBitBtn, sLabel, acPNG, Vcl.ExtCtrls, acImage, acAlphaImageList,
  System.ImageList, Vcl.ImgList, sComboBox, sEdit, sCheckBox, Vcl.StdCtrls,
  sBevel, sScrollBox, Records, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  sTrackBar, Vcl.Mask, sMaskEdit, sCustomComboEdit, sToolEdit, Winapi.Windows, BTNlib, DateUtils,
  sPageControl, Vcl.Imaging.jpeg, sButton, sSpinEdit;

type
  TForm11 = class(TForm)
    BackGround: TsImage;
    Main_Panel: TsPanel;
    Control_Panel: TsPanel;
    sImage1: TsImage;
    sLabel26: TsLabel;
    Label_Basket_Count: TsLabel;
    Button_Exit: TsBitBtn;
    Button_Info: TsBitBtn;
    Button_Setting: TsBitBtn;
    Indo_Panel: TsPanel;
    Lbl_Records_count: TsLabel;
    Button_Refresh: TsBitBtn;
    Explorer_Panel: TsPanel;
    sGradientPanel5: TsGradientPanel;
    sEdit1: TsEdit;
    sGradientPanel1: TsGradientPanel;
    sGradientPanel6: TsGradientPanel;
    sGradientPanel7: TsGradientPanel;
    sComboBox2: TsComboBox;
    sGradientPanel2: TsGradientPanel;
    sGradientPanel8: TsGradientPanel;
    sComboBox1: TsComboBox;
    sCheckBox1: TsCheckBox;
    sGradientPanel3: TsGradientPanel;
    sGradientPanel9: TsGradientPanel;
    sComboBox3: TsComboBox;
    Browser_Panel: TsPanel;
    Panel_Button: TImage;
    Button_Next: TsBitBtn;
    Button_Prior: TsBitBtn;
    Main_Scroll: TsScrollBox;
    sPanel7: TsPanel;
    sBevel7: TsBevel;
    Button_Leave: TsBitBtn;
    Button_FullInfo: TsBitBtn;
    sBitBtn1: TsBitBtn;
    sCheckBox4: TsCheckBox;
    Info_Panel: TsPanel;
    sGradientPanel4: TsGradientPanel;
    sImage2: TsImage;
    sBevel8: TsBevel;
    sGradientPanel10: TsGradientPanel;
    sLabel14: TsLabel;
    sBevel9: TsBevel;
    sLabel15: TsLabel;
    sBevel10: TsBevel;
    sBevel11: TsBevel;
    sBevel12: TsBevel;
    sLabel16: TsLabel;
    sLabel17: TsLabel;
    sBevel13: TsBevel;
    sLabel18: TsLabel;
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
    Image1: TImage;
    sBitBtn2: TsBitBtn;
    sBitBtn3: TsBitBtn;
    sBevel21: TsBevel;
    sLabel27: TsLabel;
    sLabel28: TsLabel;
    Panel_FullInfo: TsPanel;
    sLabel29: TsLabel;
    Label_FWay: TsLabel;
    sLabel30: TsLabel;
    sLabel31: TsLabel;
    sLabel32: TsLabel;
    sLabel33: TsLabel;
    sLabel34: TsLabel;
    sLabel35: TsLabel;
    Label_FFlight: TsLabel;
    Label_FAirCompany: TsLabel;
    Label_FClass: TsLabel;
    Label_FPlane: TsLabel;
    Label_FFrom: TsLabel;
    Label_FTo: TsLabel;
    Image2: TImage;
    sBitBtn5: TsBitBtn;
    sPanel2: TsGradientPanel;
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
    sPanel1: TsPanel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sBevel1: TsBevel;
    sBevel2: TsBevel;
    sLabel4: TsLabel;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sBevel3: TsBevel;
    sLabel7: TsLabel;
    sBevel4: TsBevel;
    sLabel8: TsLabel;
    sLabel9: TsLabel;
    sLabel10: TsLabel;
    sBevel5: TsBevel;
    Image3: TImage;
    sBevel23: TsBevel;
    sLabel1: TsLabel;
    sBevel6: TsBevel;
    sEdit2: TsEdit;
    sEdit3: TsEdit;
    sComboBox5: TsComboBox;
    sComboBox6: TsComboBox;
    sDateEdit1: TsDateEdit;
    sDateEdit2: TsDateEdit;
    sCheckBox3: TsCheckBox;
    sCheckBox5: TsCheckBox;
    sCheckBox6: TsCheckBox;
    sCheckBox7: TsCheckBox;
    sCheckBox8: TsCheckBox;
    sCheckBox9: TsCheckBox;
    sPanel5: TsPanel;
    Image4: TImage;
    sLabel11: TsLabel;
    sBevel27: TsBevel;
    sBevel28: TsBevel;
    sLabel12: TsLabel;
    Image5: TImage;
    sGradientPanel11: TsGradientPanel;
    sBitBtn7: TsBitBtn;
    sBitBtn8: TsBitBtn;
    sCheckBox2: TsCheckBox;
    Timer: TTimer;
    sImage3: TsImage;
    Edit1: TEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
    procedure Button_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PanelOnClick(Sender: TObject);
    procedure sLabel26Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure sEdit2Exit(Sender: TObject);
    procedure sEdit3Exit(Sender: TObject);
    procedure sCheckBox4Click(Sender: TObject);
    procedure Button_RefreshClick(Sender: TObject);
    procedure sBitBtn3Click(Sender: TObject);
    procedure Button_NextClick(Sender: TObject);
    procedure Button_PriorClick(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure sLabel28Click(Sender: TObject);
    procedure sLabel29Click(Sender: TObject);
    procedure sLabel27Click(Sender: TObject);
    procedure sBitBtn4Click(Sender: TObject);
    procedure Button_FullInfoClick(Sender: TObject);
    procedure Button_LeaveClick(Sender: TObject);
    procedure sDateEdit2Exit(Sender: TObject);
    procedure sDateEdit1Exit(Sender: TObject);
    procedure sBitBtn8Click(Sender: TObject);
    procedure sBitBtn7Click(Sender: TObject);
    procedure Button_SettingClick(Sender: TObject);
    procedure Edit1KeyPress(Sender: TObject; var Key: Char);
    procedure Edit1Exit(Sender: TObject);
    procedure Panel_ButtonMouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel_ButtonMouseLeave(Sender: TObject);
    procedure Panel_ButtonMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Panel_ButtonMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

  Hotels_List: Array of THotel_Line;
  CButtons   : Array of TCButton;

  Page: TPage;

  Procedure BUILD_PAGE(Index: Integer);
  Procedure BUILD_LINE(Index: Integer);
  Procedure Panel_Active(Index: Integer);
  Procedure GET_INFO(Index: Integer);

implementation

{$R *.dfm}

uses Main, Modul, Basket;

procedure TForm11.PanelOnClick(Sender: TObject);
Begin
If (sender is TsPAnel) then Panel_Active((Sender as TsPanel).Tag);
If (sender is TsImage) then Panel_Active((Sender as TsImage).Tag);
If (sender is TsGradientPanel) then Panel_Active((Sender as TsGradientPanel).Tag);
If (sender is TsLabel) then Panel_Active((Sender as TsLabel).Tag);
End;

procedure TForm11.Panel_ButtonMouseDown(Sender: TObject; Button: TMouseButton;
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
    Panel_Button.Canvas.Draw(CButtons[I].Left,CButtons[I].Top, CButtons[I].Paint);
    End;
end;

procedure TForm11.Panel_ButtonMouseLeave(Sender: TObject);
Var
  I :integer;
begin
for I:=0 to (Page.Count - 1 )do
    Begin
    if CButtons[I].State<>cbLocked then
      CButtons[I].State:=cbStay;
    Panel_Button.Canvas.Draw(CButtons[I].Left,CButtons[I].Top, CButtons[I].Paint);
    End;
end;

procedure TForm11.Panel_ButtonMouseMove(Sender: TObject; Shift: TShiftState; X,
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
    Panel_Button.Canvas.Draw(CButtons[I].Left,CButtons[I].Top, CButtons[I].Paint);
    end
  else
  if CButtons[I].State<>cbLocked then
    begin
    CButtons[I].State:=cbStay;
    Panel_Button.Canvas.Draw(CButtons[I].Left,CButtons[I].Top, CButtons[I].Paint);
    end;
end;

procedure TForm11.Panel_ButtonMouseUp(Sender: TObject; Button: TMouseButton;
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
      if (Page.Current + 1) > Page.Count then Button_Next.Enabled:= False else Button_Next.Enabled:= True;
      if (Page.Current - 1) < 1 then Button_Prior.Enabled:= False else Button_Prior.Enabled:= True;
      End;
end;

procedure TForm11.Button_ExitClick(Sender: TObject);
begin
Form11.Hide;
Form4.Show;
end;

procedure TForm11.Button_FullInfoClick(Sender: TObject);
begin
GET_INFO((Sender as TsBitBtn).Tag);
end;

procedure TForm11.Button_LeaveClick(Sender: TObject);
begin

sBevel7.Visible:= False;
sPanel7.Visible:= False;
end;

procedure TForm11.Button_NextClick(Sender: TObject);
begin
if (Page.Current < Page.Count) then
  Begin
  Build_page(Page.Current + 1);
  Button_Prior.Enabled:= True;
  if (Page.Current = Page.Count) then
    Button_Next.Enabled:=False;
  End;
end;

procedure TForm11.Button_PriorClick(Sender: TObject);
begin
Button_Next.Enabled:= True;
Build_Page(Page.Current - 1);
if (Page.Current - 1) < 1 then Button_Prior.Enabled:= False;
end;

procedure TForm11.Button_RefreshClick(Sender: TObject);
begin
With DataModule2.Tour_Query do
  Begin
  Active:= False;
  Active:= True;
  BUILD_PAGE(Page.Current);
  End;
end;

procedure TForm11.Button_SettingClick(Sender: TObject);
begin
sPanel5.Visible:= true;
end;

procedure TForm11.Edit1Exit(Sender: TObject);
Var
  Error: Boolean;
begin
  Try
  Error:= True;
  if StrToInt(Edit1.Text) > 8  then Edit1.Text:= '8';
  if StrToInt(Edit1.Text) < 1  then Edit1.Text:= '1';
  Error:= False;
  Finally
  if Error then Edit1.Text:= '8';
  End;
end;

procedure TForm11.Edit1KeyPress(Sender: TObject; var Key: Char);
begin
if not (Key in ['0'..'9', #8]) then key:= #0;
end;

procedure TForm11.FormClose(Sender: TObject; var Action: TCloseAction);
begin
case MessageDlg('Вы точно хотите выйти?',mtConfirmation , [mbYes,mbCancel], 0) of
  mrYes:Application.Terminate;
  mrCancel:Abort;
end;
end;

procedure TForm11.FormCreate(Sender: TObject);
Var
  I:Integer;
  R, G, B, DR, DG, DB: double;
begin
Page.Current:= 1;
Page.Lines:= 6;
BackGround.Picture.LoadFromFile('Textures\BackGround\Plane.png');
BackGround.Width:= ClientWidth;
BackGround.Height:= ClientHeight;
SetLength(Hotels_List, Page.Lines);
for I:= 0 to (Page.Lines - 1) do
  Hotels_List[I].Create(8, (8 + (I * 80) + (I * 8)), I, Main_Scroll);
sBitBtn1Click(Sender);
With Image1.Canvas do
  Begin
  Brush.Color:= RGB(240, 240, 240);
  Pen.Color:= Brush.Color;
  Rectangle(0, 0, Image1.Width, Image1.Height);
  End;
// прогрузка картинок
Image_Comment.Picture.LoadFromFile( 'Textures\Comment.png' );
Image_Tag.Picture.LoadFromFile( 'Textures\Tag.png' );
Image_Phone.Picture.LoadFromFile( 'Textures\Phone.png' );
Image_Fax.Picture.LoadFromFile( 'Textures\Fax.png' );
Image_Web.Picture.LoadFromFile( 'Textures\Web.png' );
end;

procedure TForm11.FormResize(Sender: TObject);
begin
BackGround.Width:= ClientWidth;
BackGround.Height:= ClientHeight;
Main_Panel.Left:= (ClientWidth div 2) - 485;
Main_Panel.Height:= ClientHeight;
Explorer_Panel.Top:= Main_Panel.Height - 156;
Main_Scroll.Height:= Explorer_Panel.Top - 59;
if (sPanel2.Visible = True) then
  Begin
  sPanel2.Left:= (Form11.ClientWidth div 2) - 500;
  sPanel2.Top:= (Form11.Clientheight div 2) - 200;
  End;
end;

procedure TForm11.sBitBtn1Click(Sender: TObject);
Var
  MSG, F1, F2: String;
  R, G, B, DR, DG, DB: Double;
  I: Integer;
begin
MSG:= 'SELECT H.*, A.*, T.* FROM Hotels AS H, Air_Ticket AS A, Tours AS T WHERE (((H.ID )=[T].[Hotel_ID]) AND ((A.ID)=[T].[Air_ID])';
if sEdit1.Text <> '' then MSG:= MSG + ' AND ([H].[Name] LIKE ''' + sEdit1.Text + '%'')';           // Название отеля
if (sComboBox2.ItemIndex > 0) then MSG:= MSG + ' AND ([H].[Country]=''' + sComboBox2.Text + ''')'; // Страна
MSG:= MSG + ' AND ([H].[Food] LIKE ''%' + sComboBox3.Text + '%'')';                                // Тип питания
if (sCheckBox1.Checked = True) then                                                                // Уровень отеля
  MSG:= MSG + ' AND ([H].[Stars]>=' + IntToStr(sComboBox1.ItemIndex + 1) + ')'
    else
      MSG:= MSG + ' AND ([H].[Stars]=' + IntToStr(sComboBox1.ItemIndex + 1) + ')';
if sCheckBox3.Checked then
  Begin
  if sCheckBox5.Checked then
    MSG:= MSG + ' AND (DateDiff("d", T.Date_Start, T.Date_Finish) BETWEEN ' + sEdit2.Text + ' AND ' + sEdit3.Text + ' )';
  if sCheckBox6.Checked then
    MSG:= MSG + ' AND (T.Peoples=' + IntToStr(sComboBox5.ItemIndex) + ')';
  if sCheckBox7.Checked then
    MSG:= MSG + ' AND (T.Type=' + IntToStr(sComboBox6.ItemIndex) + ')';
  if (sCheckBox8.Checked) And (sDateEdit1.Text <> '  .  .    ') And (sDateEdit2.Text <> '  .  .    ') then
    Begin
    F1:= StringReplace(sDateEdit1.Text, '.', '/', [rfReplaceAll, rfIgnoreCase]); F1 := '#' + F1 + '#';
    F2:= StringReplace(sDateEdit2.Text, '.', '/', [rfReplaceAll, rfIgnoreCase]); F2 := '#' + F2 + '#';
    MSG:= MSG + ' AND (T.Date_Start BETWEEN ' + F1 + ' AND ' + F2 + ')';
    End;
  if sCheckBox9.Checked then MSG:= MSG + ' AND (T.Date_Start>=' + DateTimeToStr(Now) + ')';
  End;


MSG:= MSG + ')';
//ShowMessage(MSG);
With DataModule2.Tour_Query do
  Begin
  Active:= False;
  SQL.Clear;
  SQL.Add(MSG);
  Active:= True;
  End;
Lbl_Records_count.Caption:= 'По вашему запросу было найдено: ' + IntToStr(DataModule2.Tour_Query.RecordCount) + ' записей!';
Page.Count:= (DataModule2.Tour_Query.RecordCount div Page.Lines);
if (DataModule2.Tour_Query.RecordCount mod Page.Lines) > 0 then
  Page.Count:= (Page.Count + 1);
SetLength(CButtons, Page.Count);

BUILD_PAGE(1);
// Отрисовываем задний фон
R:=255.0; DR:= (247 - R) / 48;
G:=255.0; DG:= (247 - G) / 48;
B:=255.0; DB:= (247 - B) / 48;
for I:= 0 to 49 do
  Begin
  Panel_Button.Canvas.Pen.Color:=RGB(Trunc(R), Trunc(G), Trunc(B));
  Panel_Button.Canvas.MoveTo(0, I);
  Panel_Button.Canvas.LineTo(Panel_Button.Width, I);
  R:= R + DR;
  G:= G + DG;
  B:= B + DB;
  End;
if (DataModule2.Tour_Query.RecordCount > 0) then
  Begin
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
    Panel_Button.Canvas.Draw(CButtons[I].Left, CButtons[I].Top, CButtons[I].Paint);
    end;
  End;
end;

Function Get_Price(Start,Finish:TDateTime):Integer;
var
  CDate: TDateTime;
  Price: Integer;
  S: String;
Begin
Price:= 0;
CDate:= Start;
if (DataModule2.Tour_Query.FieldByName('FixPrice').AsBoolean) then
  while (CDate < Finish) do
    Begin
    CDate:= IncDay(CDate, 1);
    Price:= Price + DataModule2.Tour_Query.FieldByName('H.Price').AsInteger;
    End
else
  while (CDate < Finish) do
    Begin
    CDate:= IncDay(CDate, 1);
    S:= IntToStr(MonthOf(CDate));
    if (S.Length = 1) then S:= '0' + S;
    Price:= Price + DataModule2.Tour_Query.FieldByName('Price_' + S).AsInteger;
    End;
Result:= Price;
End;

procedure TForm11.sBitBtn2Click(Sender: TObject);
Var
  D: Integer;
begin
With DataModule2.Tour_Query do
  Begin
  DataModule2.Basket_Query.Insert;
  DataModule2.Basket_Query.FieldByName('B_Type').AsInteger:= 3;
  DataModule2.Basket_Query.FieldByName('B_ID').AsInteger:= FieldByName('T.ID').AsInteger;
  DataModule2.Basket_Query.FieldByName('Date_Start').AsDateTime:= FieldByName('Date_Start').AsDateTime;
  DataModule2.Basket_Query.FieldByName('Date_Finish').AsDateTime:= FieldByName('Date_Finish').AsDateTime;
  DataModule2.Basket_Query.FieldByName('Fly_Class').AsInteger:= FieldByName('Fly_Class').AsInteger;
  DataModule2.Basket_Query.FieldByName('Peoples').AsInteger:= FieldByName('Peoples').AsInteger;
  D:= 0;
  With DataModule2.Tour_Query do
    Begin
    if (FieldByName('Castom_Price').AsBoolean) then
      D:= FieldByName('T.Price').AsInteger
    else
      Begin
      D:= Get_Price(FieldByName('Date_Start').AsDateTime, FieldByName('Date_Finish').AsDateTime);
        case FieldByName('Fly_Class').Asinteger of
        1:D:= D + FieldByName('Price_FC').Asinteger;
        2:D:= D + FieldByName('Price_BC').Asinteger;
        3:D:= D + FieldByName('Price_EC').Asinteger;
        end;
      End;
    End;

  DataModule2.Basket_Query.FieldByName('Price').AsInteger:= D;
  DataModule2.Basket_Query.Post;
  End;
Info_Panel.Visible:= False;
DataModule2.REFRESH_BASKET;
ShowMessage('Тур был успешно добавлен в корзину');
end;

procedure TForm11.sBitBtn3Click(Sender: TObject);
begin
Info_Panel.Visible:= False;
end;

procedure TForm11.sBitBtn4Click(Sender: TObject);
begin
sPanel2.Visible:= False;
end;

procedure TForm11.sBitBtn7Click(Sender: TObject);
begin
sPanel5.Visible:= False;
Edit1.Text:= IntToStr(Page.Lines);
end;

procedure TForm11.sBitBtn8Click(Sender: TObject);
Var
  I: Integer;
  R, G, B, DR, DG, DB: Double;
begin
for I:= 0 to (Page.Lines - 1) do
  Hotels_List[I].Destroy;
Page.Lines:= StrToInt(Edit1.Text);
for I:= 0 to (Page.Lines - 1) do
  Hotels_List[I].Create(8, (8 + (I * 80) + (I * 8)), I, Main_Scroll);
Page.Current:= 1;
Page.Count:= (DataModule2.Tour_Query.RecordCount div Page.Lines);
if (DataModule2.Tour_Query.RecordCount mod Page.Lines) > 0 then
  Page.Count:= Page.Count + 1;
BUILD_PAGE(1);
// Отрисовываем задний фон
R:=255.0; DR:= (247 - R) / 48;
G:=255.0; DG:= (247 - G) / 48;
B:=255.0; DB:= (247 - B) / 48;
for I:= 0 to 49 do
  Begin
  Panel_Button.Canvas.Pen.Color:=RGB(Trunc(R), Trunc(G), Trunc(B));
  Panel_Button.Canvas.MoveTo(0, I);
  Panel_Button.Canvas.LineTo(Panel_Button.Width, I);
  R:= R + DR;
  G:= G + DG;
  B:= B + DB;
  End;
if (DataModule2.Tour_Query.RecordCount > 0) then
  Begin
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
    Panel_Button.Canvas.Draw(CButtons[I].Left, CButtons[I].Top, CButtons[I].Paint);
    end;
  End;
end;

procedure TForm11.sCheckBox1Click(Sender: TObject);
begin
//if sCheckBox1.Checked = True then
//  DBGrid1.Visible:= True
//    else
//      DBGrid1.Visible:= False;
end;

procedure TForm11.sCheckBox4Click(Sender: TObject);
begin
sPanel1.Visible:= sCheckBox4.Checked;
end;



procedure TForm11.sDateEdit1Exit(Sender: TObject);
Var
  Error: Boolean;
begin
  Try
  Error:= True;
  if (sDateEdit1.Date <= Now) or (sDateEdit1.Date > Now) then Error:= False;
  Finally
  if Error then
    Begin
    sDateEdit1.Date:= Now;
    ShowMessage('Была замечена ошибка в первой дате, теперь она испралена!');
    End;
  End;
end;

procedure TForm11.sDateEdit2Exit(Sender: TObject);
Var
  Error: Boolean;
begin
  Try
  Error:= True;
  if sDateEdit2.Date >= sDateEdit1.Date then Error:= False;
  Finally
  if Error then
    Begin
    sDateEdit2.Date:= sDateEdit1.Date;
    ShowMessage('Была замечена ошибка во второй дате, теперь она испралена!');
    End;
  End;
end;

procedure TForm11.sEdit2Exit(Sender: TObject);
begin
if sEdit2.Text = '' then sEdit2.Text:= '0';
end;

procedure TForm11.sEdit2KeyPress(Sender: TObject; var Key: Char);
begin
if Not (key in ['0'..'9', #8]) then key:= #0;
end;

procedure TForm11.sEdit3Exit(Sender: TObject);
begin
if sEdit3.Text = '' then sEdit3.Text:='0';
end;

procedure TForm11.sLabel26Click(Sender: TObject);
begin
Form11.Hide;
Form9.Show;
end;



procedure Set_Tags(Line:String);
var
  Tag: Array of string;
  I, D: Integer;
  S: String;
Begin
D:= 0;
for I:= 1 to Line.Length do
  if (Line[I] = ';') then D:= D + 1;
SetLength(Tag, D);
I:= D;
while (I > 0) do
  Begin
  Tag[D - I]:= Copy(Line, 1, AnsiPos(';', Line));
  Delete(Line, 1, AnsiPos(';', Line));
  I:= I - 1;
  End;

if (D > 0) then
  Begin
  Form11.Lbl_Tag1.Visible:= True;
  Form11.Lbl_Tag1.Caption:= Tag[0];
  End else Form11.Lbl_Tag1.Visible:= False;
if (D > 1) then
  Begin
  Form11.Lbl_Tag2.Visible:= True;
  Form11.Lbl_Tag2.Caption:= Tag[1];
  S:= Form11.Lbl_Tag1.Caption; S[S.Length]:= ','; Form11.Lbl_Tag1.Caption:= S;
  Form11.Lbl_Tag2.Left:= Form11.Lbl_Tag1.Left + Form11.Lbl_Tag1.Width + 6;
  End else Form11.Lbl_Tag2.Visible:= False;
if (D > 2) then
  Begin
  Form11.Lbl_Tag3.Visible:= True;
  Form11.Lbl_Tag3.Caption:= Tag[2];
  S:= Form11.Lbl_Tag2.Caption; S[S.Length]:= ','; Form11.Lbl_Tag2.Caption:= S;
  Form11.Lbl_Tag3.Left:= Form11.Lbl_Tag2.Left + Form11.Lbl_Tag2.Width + 6;
  End else Form11.Lbl_Tag3.Visible:= False;
if (D > 3) then
  Begin
  Form11.Lbl_Tag4.Visible:= True;
  Form11.Lbl_Tag4.Caption:= Tag[3];
  S:= Form11.Lbl_Tag3.Caption; S[S.Length]:= ','; Form11.Lbl_Tag3.Caption:= S;
  Form11.Lbl_Tag4.Left:= Form11.Lbl_Tag3.Left + Form11.Lbl_Tag3.Width + 6;
  End else Form11.Lbl_Tag4.Visible:= False;

if (D > 0) then
  case D of
  1:   Begin S:= Form11.Lbl_Tag1.Caption; SetLength(S, S.Length - 1); Form11.Lbl_Tag1.Caption:= S; end;
  2:   Begin S:= Form11.Lbl_Tag2.Caption; SetLength(S, S.Length - 1); Form11.Lbl_Tag2.Caption:= S; end;
  3:   Begin S:= Form11.Lbl_Tag3.Caption; SetLength(S, S.Length - 1); Form11.Lbl_Tag3.Caption:= S; end;
  else Begin S:= Form11.Lbl_Tag4.Caption; SetLength(S, S.Length - 1); Form11.Lbl_Tag4.Caption:= S; end;
  end;
End;

procedure TForm11.sLabel27Click(Sender: TObject);
Var
  I: Integer;
begin
With DataModule2.Tour_Query do
  Begin
  Lbl_HotelName.Caption:= Fields.FieldByName('Name').AsString;
  Panel_Stars.Caption:=   FieldByName('Stars').AsString + ' *';
  lbl_HotelInfo.Caption:= FieldByName('Comment').AsString;
  Set_Tags(FieldByName('Tags').AsString);
  info_image.Picture.Assign(FieldByName('Photo'));
  Lbl_Phone.Caption:= FieldByName('Phone').AsString;
  Lbl_Fax.Caption:= FieldByName('Fax').AsString;
  Lbl_Web.Caption:= FieldByName('Internet_Address').AsString;
  Lbl_Web.URL:= FieldByName('Internet_Address').AsString;
  lbl_info_hotel.Caption:= FieldByName('About_hotel').AsString;
  lbl_type_info_hotel.Caption:= FieldByName('Type_Rooms').AsString;
  lbl_food_hotel.Caption:= FieldByName('Food').AsString;
  lbl_rooms_hotel.Caption:= FieldByName('About_Room').AsString;
  lbl_Place_hotel.Caption:= FieldByName('About_Place').AsString;
  lbl_Children_hotel.Caption:=  FieldByName('About_For_Childrens').AsString;
  lbl_Entertainment_hotel.Caption:= FieldByName('About_Entertainment').AsString;
  lbl_Kids_hotel.Caption:= FieldByName('About_Baby').AsString;
  End;
//...
sBevel22.Width:= Lbl_HotelName.Width;
Panel_Stars.Left:= (sbevel22.Left + sbevel22.Width + 3);
lbl_HotelInfo.Height:=          100;
lbl_HotelInfo.Width:=           400;
lbl_info_hotel.Width:=          388;
lbl_type_info_hotel.Width:=     388;
lbl_food_hotel.Width:=          388;
lbl_rooms_hotel.Width:=         388;
lbl_Place_hotel.Width:=         388;
lbl_Children_hotel.Width:=      388;
lbl_Entertainment_hotel.Width:= 388;
lbl_Kids_hotel.Width:=          388;
sPanel2.Left:= (Form11.ClientWidth div 2) - 500;
sPanel2.Top:= (Form11.Clientheight div 2) - 200;
sPanel2.Visible:= True;
end;

Procedure _Date;
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
sDate1:= VarToDateTime(DataModule2.Tour_Query.FieldByName('Date_Start').AsString + ' ' + IntToStr(HourOf(VarToDateTime(DataModule2.Tour_Query.FieldByName('Time_D').AsString))) + ':' + IntToStr(MinuteOf(VarToDateTime(DataModule2.Tour_Query.FieldByName('Time_D').AsString))));
sDate2:= VarToDateTime(DataModule2.Tour_Query.FieldByName('Date_Finish').AsString + ' ' + IntToStr(HourOf(VarToDateTime(DataModule2.Tour_Query.FieldByName('Time_A').AsString))) + ':' + IntToStr(MinuteOf(VarToDateTime(DataModule2.Tour_Query.FieldByName('Time_A').AsString))));
// Формируем начало итоговой строки
Form11.Label_FFrom.Caption:= IntToStr(DayOf(sDate1)) + ' ' + sMouths[MonthOf(sDate1)] + ', ' + sDay[DayOfWeek(sDate1)] + ' ' +IntToStr(HourOf(sDate1)) + ':' + IntToStr(MinuteOf(sDate1)) + ', ' + DataModule2.Tour_Query.FieldByName('City_D').AsString;
// Берём оставшуюся часть в буффер
Form11.Label_FTo.Caption:=   IntToStr(DayOf(sDate2)) + ' ' + sMouths[MonthOf(sDate2)] + ', ' + sDay[DayOfWeek(sDate2)] + ' ' +IntToStr(HourOf(sDate2)) + ':' + IntToStr(MinuteOf(sDate2)) + ', ' + DataModule2.Tour_Query.FieldByName('City_A').AsString;
End;

procedure TForm11.sLabel28Click(Sender: TObject);
begin
Panel_FullInfo.Visible:= True;
Label_FWay.Caption:= DataModule2.Tour_Query.FieldByName('City_D').AsString + ' -> ' + DataModule2.Tour_Query.FieldByName('City_A').AsString;
Label_FAirCompany.Caption:= DataModule2.Tour_Query.FieldByName('Air_Company').AsString;
  case DataModule2.Tour_Query.FieldByName('Fly_Class').AsInteger of
  3:Label_FClass.Caption:= 'Эконом класс';
  2:Label_FClass.Caption:= 'Бизнес класс';
  1:Label_FClass.Caption:= 'Первый класс';
  end;
_Date;
end;

procedure TForm11.sLabel29Click(Sender: TObject);
begin
Panel_FullInfo.Visible:= False;
end;

Procedure BUILD_PAGE(Index: Integer);
Var
  I, Rest: Integer;
Begin
if (DataModule2.Tour_Query.RecordCount > 0) then
  Begin
  DataModule2.Tour_Query.First;
  DataModule2.Tour_Query.MoveBy((Index - 1) * Page.Lines);
  Rest:= DataModule2.Tour_Query.RecordCount - ((Page.Current - 1) * Page.Lines);
  I:= 1;
  while (DataModule2.Tour_Query.Eof = False) And (I <= (Rest)) And (I <= (Page.Lines)) do
    Begin
    BUILD_LINE(I - 1);
    I:= I + 1;
    DataModule2.Tour_Query.Next;
    End;
  Rest:= (DataModule2.Tour_Query.RecordCount - ((Index - 1) * Page.Lines));
  if (Rest >= Page.Lines) then
    for I:= 1 to (Page.Lines) do
      Hotels_List[I - 1].Main_Panel.Visible:= True
        else
          for I:= 1 to (Page.Lines) do
            if I <= Rest then
              Hotels_List[I - 1].Main_Panel.Visible:= True
                else
                  Hotels_List[I - 1].Main_Panel.Visible:= False;

  Page.Count:= DataModule2.Tour_Query.RecordCount div Page.Lines;
  if (DataModule2.Tour_Query.RecordCount mod Page.Lines) > 0 then
    Page.Count:= Page.Count + 1;
  if (Index < Page.Count) then Form11.Button_Next.Enabled:= True else Form11.Button_Next.Enabled:= False;
  if (Index = 1) then Form11.Button_Prior.Enabled:= False else Form11.Button_Prior.Enabled:= True;

  //...
  CButtons[Page.Current - 1].State:= cbStay;
  Form11.Panel_Button.Canvas.Draw(CButtons[Page.Current - 1].Left, CButtons[Page.Current - 1].Top, CButtons[Page.Current - 1].Paint);
  CButtons[Index - 1].State:= cbLocked;
  Form11.Panel_Button.Canvas.Draw(CButtons[Index - 1].Left, CButtons[Index - 1].Top, CButtons[Index - 1].Paint);
  //...
  Page.Current:= Index;
  End
else
  for I:= 1 to (Page.Lines) do Hotels_List[I - 1].Main_Panel.Visible:= False;
End;

Procedure BUILD_LINE(Index: Integer);
Var
  S: String;
  I, D: Integer;
Begin
Hotels_List[Index].Lbl_Name.Caption:=     DataModule2.Tour_Query.FieldByName('Name').AsString;
Hotels_List[Index].Lbl_Country.Caption:=  DataModule2.Tour_Query.FieldByName('Country').AsString + ',';
Hotels_List[Index].Lbl_City.Caption:=     DataModule2.Tour_Query.FieldByName('City').AsString;
Hotels_List[Index].Panel_level.Caption:=  DataModule2.Tour_Query.FieldByName('Stars').AsString + ' *';
Hotels_List[Index].Photo.Picture.Assign(DataModule2.Tour_Query.FieldByName('Photo'));
//...
D:= 0;
With DataModule2.Tour_Query do
  Begin
  if (FieldByName('Castom_Price').AsBoolean) then
    D:= FieldByName('T.Price').AsInteger
  else
    Begin
    D:= Get_Price(FieldByName('Date_Start').AsDateTime, FieldByName('Date_Finish').AsDateTime);
      case FieldByName('Fly_Class').Asinteger of
      1:D:= D + FieldByName('Price_FC').Asinteger;
      2:D:= D + FieldByName('Price_BC').Asinteger;
      3:D:= D + FieldByName('Price_EC').Asinteger;
      end;
    End;
  End;
Hotels_List[Index].Lbl_Price.Caption:=IntToStr(D);
Hotels_List[Index].Lbl_Price.Left:= Hotels_List[Index].Lbl_Visual_Price.Left;
//...
//Hotels_List[Index].Photo.Assign(DataModule2.Tour_Query.FieldByName('Photo'));
Hotels_List[Index].Panel_level.Refresh;
//...
Hotels_List[Index].Panel_level.Left:= Hotels_List[Index].Lbl_Name.Left + Hotels_List[Index].Lbl_Name.Width + 4;
Hotels_List[Index].Lbl_City.Left:=    Hotels_List[Index].Lbl_Country.Left + Hotels_List[Index].Lbl_Country.Width + 4;
//...
S:= DataModule2.Tour_Query.FieldByName('Comment').AsString;
if (S.Length > 163) then
  Begin
  Hotels_List[Index].Lbl_Comment.ShowHint:= True;
  Hotels_List[Index].Lbl_Comment.Hint:= S;
  S:=Copy(S, 1, 160) + '...';
  End 
else 
  Hotels_List[Index].Lbl_Comment.ShowHint:= False;
//
Hotels_List[Index].Lbl_Comment.Caption:= S;
Hotels_List[Index].Lbl_Comment.Width:= 330;
Hotels_List[Index].Lbl_Comment.Height:=64;
//...
S:= DataModule2.Tour_Query.FieldByName('Tags').AsString;
Hotels_List[Index].Lbl_Tag1.Visible:=False;
Hotels_List[Index].Lbl_Tag2.Visible:=False;
Hotels_List[Index].Lbl_Tag3.Visible:=False;
Hotels_List[Index].Lbl_Tag4.Visible:=False;
I:= 1;
While (S <> '') do
  Begin
  if pos(';', S) > 0 then
    begin
      case I of
      1:Begin Hotels_List[Index].Lbl_Tag1.Caption:=Copy(S,0,Pos(';',S)-1)+','; Hotels_List[Index].Lbl_Tag1.Visible:=True; end;

      2:Begin Hotels_List[Index].Lbl_Tag2.Caption:=Copy(S,0,Pos(';',S)-1)+','; Hotels_List[Index].Lbl_Tag2.Visible:=True; end;

      3:Begin Hotels_List[Index].Lbl_Tag3.Caption:=Copy(S,0,Pos(';',S)-1)+','; Hotels_List[Index].Lbl_Tag3.Visible:=True; end;

      4:Begin Hotels_List[Index].Lbl_Tag4.Caption:=Copy(S,0,Pos(';',S)-1)+','; Hotels_List[Index].Lbl_Tag4.Visible:=True; end;
      end;
    Delete(S, 1, Pos(';', S));
    end;
  inc(I);
  if (Pos(';', S) = 0) or (I = 4) then
    begin
    S:='';
      Case I of
      2:Hotels_List[Index].Lbl_Tag1.Caption:= Copy(Hotels_List[Index].Lbl_Tag1.Caption, 0, Length(Hotels_List[Index].Lbl_Tag1.Caption) - 1);
      3:Hotels_List[Index].Lbl_Tag2.Caption:= Copy(Hotels_List[Index].Lbl_Tag2.Caption, 0, Length(Hotels_List[Index].Lbl_Tag2.Caption) - 1);
      4:Hotels_List[Index].Lbl_Tag3.Caption:= Copy(Hotels_List[Index].Lbl_Tag3.Caption, 0, Length(Hotels_List[Index].Lbl_Tag3.Caption) - 1);
      5:Hotels_List[Index].Lbl_Tag4.Caption:= Copy(Hotels_List[Index].Lbl_Tag4.Caption, 0, Length(Hotels_List[Index].Lbl_Tag4.Caption) - 1);
      End;
    end;
  End;
Hotels_List[Index].Lbl_Tag2.Left:= Hotels_List[Index].Lbl_Tag1.Left + Hotels_List[Index].Lbl_Tag1.Width + 3;
Hotels_List[Index].Lbl_Tag3.Left:= Hotels_List[Index].Lbl_Tag2.Left + Hotels_List[Index].Lbl_Tag2.Width + 3;
Hotels_List[Index].Lbl_Tag4.Left:= Hotels_List[Index].Lbl_Tag3.Left + Hotels_List[Index].Lbl_Tag3.Width + 3;
S:= Hotels_List[Index].Lbl_Tag1.Caption + Hotels_List[Index].Lbl_Tag2.Caption + Hotels_List[Index].Lbl_Tag3.Caption + Hotels_List[Index].Lbl_Tag4.Caption;
if (S.Length > 38) then
  Begin
  Hotels_List[Index].Lbl_Tag2.Caption:= Copy(Hotels_List[Index].Lbl_Tag2.Caption, 1, Length(Hotels_List[Index].Lbl_Tag2.Caption) - 1);
  Hotels_List[Index].Lbl_Tag3.Visible:= False;
  End;
//...
End;

Procedure GET_INFO(Index: Integer);
var
  DaysCount, D: Integer;
Begin
With DataModule2.Tour_Query do
  Begin
  First;
  MoveBy(((Page.Current - 1) * Page.Lines) + Index);
  // Название отеля
  Form11.sgradientpanel4.Caption:= Fields.FieldByName('Name').AsString;
  // Уровень отеля
    Case (Fields.FieldByName('Stars').AsInteger) of
    1:Form11.sLabel25.Caption:='1 звезда';
    2:Form11.sLabel25.Caption:='2 звезды';
    3:Form11.sLabel25.Caption:='3 звезды';
    4:Form11.sLabel25.Caption:='4 звезды';
    5:Form11.sLabel25.Caption:='5 звезд ';
    End;
  // Кол-во дней
  DaysCount:= DaysBetween(FieldByName('Date_Start').AsDateTime, FieldByName('Date_Finish').AsDateTime);
  if DaysCount = (1 or 21 or 31) then
    Form11.slabel15.Caption:= IntToStr(DaysCount) + ' день' else
      if DaysCount = (2 or 3 or 4 or 22 or 23 or 24) then
        Form11.slabel15.Caption:= IntToStr(DaysCount) + ' дня' else
          Form11.slabel15.Caption:= IntToStr(DaysCount) + ' дней';
  // Тип заселения
  Form11.slabel17.Caption:= Form11.sComboBox5.Items[Fields.FieldByName('Peoples').AsInteger];
  // Тип тура
  Form11.slabel19.Caption:= Form11.sComboBox6.Items[Fields.FieldByName('Type').AsInteger];
  // Загрузка фото
  if Fields.FieldByName('Castom_Picture').AsBoolean = False then
    Form11.sImage2.Picture.Assign(Fields.FieldByName('Photo'));
  // Даты
  Form11.slabel21.Caption:= DateTimeToStr(Fields.FieldByName('Date_Start').AsDateTime);
  Form11.slabel22.Caption:= DateTimeToStr(Fields.FieldByName('Date_Finish').AsDateTime);
  // Цена
  D:= 0;
  With DataModule2.Tour_Query do
    Begin
    if (FieldByName('Castom_Price').AsBoolean) then
      D:= FieldByName('T.Price').AsInteger
    else
      Begin
      D:= Get_Price(FieldByName('Date_Start').AsDateTime, FieldByName('Date_Finish').AsDateTime);
        case FieldByName('Fly_Class').Asinteger of
        1:D:= D + FieldByName('Price_FC').Asinteger;
        2:D:= D + FieldByName('Price_BC').Asinteger;
        3:D:= D + FieldByName('Price_EC').Asinteger;
        end;
      End;
    End;
  Form11.sGradientPanel10.Caption:= IntToStr(D) + ' USD     ';
  End;
Form11.Info_Panel.Visible:= True;
End;


Procedure Panel_Active(Index: Integer);
Begin
Form11.sBevel7.Top:= (8 + (Index * 80) + (Index * 8));
Form11.sPanel7.Top:= Form11.sBevel7.Top + 4;
Form11.sBevel7.Visible:= True;
Form11.sPanel7.Visible:= True;
Form11.Button_FullInfo.Tag:= Index;
End;

end.
