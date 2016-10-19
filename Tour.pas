unit Tour;

interface

uses
  Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, sPanel, Vcl.Buttons,
  sBitBtn, sLabel, acPNG, Vcl.ExtCtrls, acImage, acAlphaImageList,
  System.ImageList, Vcl.ImgList, sComboBox, sEdit, sCheckBox, Vcl.StdCtrls,
  sBevel, sScrollBox, Records, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  sTrackBar, Vcl.Mask, sMaskEdit, sCustomComboEdit, sToolEdit;

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
    Button_Print: TsBitBtn;
    Button_Setting: TsBitBtn;
    Indo_Panel: TsPanel;
    Lbl_Records_count: TsLabel;
    sLabel1: TsLabel;
    Button_Refresh: TsBitBtn;
    sComboBox4: TsComboBox;
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
    Button_Choose: TsBitBtn;
    Button_FullInfo: TsBitBtn;
    sLabel38: TsLabel;
    sBitBtn1: TsBitBtn;
    DBGrid1: TDBGrid;
    sPanel1: TsPanel;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sBevel1: TsBevel;
    sBevel2: TsBevel;
    sEdit2: TsEdit;
    sLabel4: TsLabel;
    sEdit3: TsEdit;
    sLabel5: TsLabel;
    sLabel6: TsLabel;
    sBevel3: TsBevel;
    sComboBox5: TsComboBox;
    sLabel7: TsLabel;
    sBevel4: TsBevel;
    sComboBox6: TsComboBox;
    sLabel8: TsLabel;
    sDateEdit1: TsDateEdit;
    sLabel9: TsLabel;
    sLabel10: TsLabel;
    sDateEdit2: TsDateEdit;
    sCheckBox2: TsCheckBox;
    sEdit4: TsEdit;
    sEdit5: TsEdit;
    sLabel11: TsLabel;
    sLabel12: TsLabel;
    sLabel13: TsLabel;
    sBevel5: TsBevel;
    sBevel6: TsBevel;
    sCheckBox3: TsCheckBox;
    sCheckBox4: TsCheckBox;
    Info_Panel: TsPanel;
    sGradientPanel4: TsGradientPanel;
    sImage2: TsImage;
    sBevel8: TsBevel;
    sGradientPanel10: TsGradientPanel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sEdit2KeyPress(Sender: TObject; var Key: Char);
    procedure FormResize(Sender: TObject);
    procedure sLabel38Click(Sender: TObject);
    procedure Button_ExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PanelOnClick(Sender: TObject);
    procedure sLabel26Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure sEdit2Exit(Sender: TObject);
    procedure sEdit3Exit(Sender: TObject);
    procedure sCheckBox4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form11: TForm11;

  Hotels_List:Array of THotel_Line;
  Page:TPage;
  Page_Count:Integer;

  Procedure BUILD_PAGE(Index: Integer);
  Procedure BUILD_LINE(Index: Integer);
  Procedure Panel_Active(Index: Integer);

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

procedure TForm11.Button_ExitClick(Sender: TObject);
begin
Form11.Hide;
Form4.Show;
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
begin
Page.Current:= 1;
Page.Lines:= 6;
BackGround.Picture.LoadFromFile('Textures\BackGround\Plane.png');
BackGround.Width:= ClientWidth;
BackGround.Height:= ClientHeight;
SetLength(Hotels_List, Page.Lines);
for I:= 0 to (Page.Lines - 1) do
  Begin
  Hotels_List[I].Create(8, (8 + (I * 80) + (I * 8)), I, Main_Scroll);
  End;
sBitBtn1Click(Sender);
end;

procedure TForm11.FormResize(Sender: TObject);
begin
BackGround.Width:= ClientWidth;
BackGround.Height:= ClientHeight;
Main_Panel.Left:= (ClientWidth div 2) - 485;
Main_Panel.Height:= ClientHeight;
Explorer_Panel.Top:= Main_Panel.Height - 156;
Main_Scroll.Height:= Explorer_Panel.Top - 59;
end;

procedure TForm11.sBitBtn1Click(Sender: TObject);
Var
  MSG: String;
begin
MSG:= 'SELECT H.*, A.* FROM Hotels AS H, Air_Ticket AS A, Tours AS T WHERE (((H.ID )=[T].[Hotel_ID]) AND ((A.ID_of_recrod )=[T].[Air_ID])';
if (sComboBox2.ItemIndex > 0) then MSG:= MSG + ' AND ([H].[Country]=''' + sComboBox2.Text + ''')';
if (sCheckBox1.Checked = True) then
  MSG:= MSG + ' AND ([H].[Stars]>=' + IntToStr(sComboBox1.ItemIndex + 1) + ')'
    else
      MSG:= MSG + ' AND ([H].[Stars]=' + IntToStr(sComboBox1.ItemIndex + 1) + ')';
MSG:= MSG + ' AND ([H].[Food] LIKE ''%' + sComboBox3.Text + '%'')';
if sEdit1.Text <> '' then MSG:= MSG + ' AND ([H].[Name] LIKE ''' + sEdit1.Text + '%'')';
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
BUILD_PAGE(1);
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
if sCheckBox4.Checked = True then
  sPanel1.Visible:= True else sPanel1.Visible:= False;
end;

procedure TForm11.sEdit2Exit(Sender: TObject);
begin
if sEdit2.Text = '' then sEdit2.Text:='0';
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

procedure TForm11.sLabel38Click(Sender: TObject);
begin
sLabel38.Visible:= False;
sBevel7.Visible:= False;
sPanel7.Visible:= False;
end;

Procedure BUILD_PAGE(Index: Integer);
Var
  I, Rest: Integer;
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
Rest:= (DataModule2.Tour_Query.RecordCount - ((Page.Current - 1) * Page.Lines));
if (Rest >= Page.Lines) then
  for I:= 1 to (Page.Lines) do
    Hotels_List[I - 1].Main_Panel.Visible:= True
      else
        for I:= 1 to (Page.Lines) do
          if I <= Rest then
            Hotels_List[I - 1].Main_Panel.Visible:= True
              else   
                Hotels_List[I - 1].Main_Panel.Visible:= False;

Page_Count:= DataModule2.Tour_Query.RecordCount div Page.Lines;
if (DataModule2.Tour_Query.RecordCount mod Page.Lines) > 0 then
  Page_Count:= Page_Count + 1;
if (Page_Count > 1) then Form11.Button_Next.Enabled:= False;
Page.Current:= 1;
Form11.Button_Prior.Enabled:= False;
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
//...
if (DataModule2.Tour_Query.FieldByName('FixPrice').AsBoolean= True) then
  Hotels_List[Index].Lbl_Price.Caption:= 'от: ' + IntToStr(DataModule2.Tour_Query.FieldByName('Price_EC').AsInteger + DataModule2.Tour_Query.FieldByName('Price').AsInteger) + ' KZT'
    else
      Begin
      D:= D.MaxValue;
      for I:= 1 to 12 do
        Begin
        if (I < 10) AND (DataModule2.Tour_Query.FieldByName('Price_0' + IntToStr(I) ).AsInteger < D) then
          D:= DataModule2.Tour_Query.FieldByName('Price_0' + IntToStr(I) ).AsInteger;
        if (I >= 10) AND (DataModule2.Tour_Query.FieldByName('Price_' + IntToStr(I) ).AsInteger < D) then
          D:= DataModule2.Tour_Query.FieldByName('Price_' + IntToStr(I) ).AsInteger;
        End;
      Hotels_List[Index].Lbl_Price.Caption:= 'от: ' + IntToStr(D + DataModule2.Tour_Query.FieldByName('Price_EC').AsInteger) + ' KZT';
      End;
Hotels_List[Index].Lbl_Price.Left:= Hotels_List[Index].Lbl_Visual_Price.Left - ((Hotels_List[Index].Lbl_Price.Width - Hotels_List[Index].Lbl_Visual_Price.Width) div 2);
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
if S.Length > 38 then
  Begin
  Hotels_List[Index].Lbl_Tag2.Caption:= Copy(Hotels_List[Index].Lbl_Tag2.Caption, 1, Length(Hotels_List[Index].Lbl_Tag2.Caption) - 1);
  Hotels_List[Index].Lbl_Tag3.Visible:= False;
  End;
//...
End;

Procedure Panel_Active(Index: Integer);
Begin
Form11.sBevel7.Top:= (8 + (Index * 80) + (Index * 8));
Form11.sPanel7.Top:= Form11.sBevel7.Top + 4;
Form11.sLabel38.Top:= Form11.sBevel7.Top + Form11.sBevel7.Height + 4; 
Form11.sBevel7.Visible:= True;
Form11.sPanel7.Visible:= True;
Form11.sLabel38.Visible:= True;
End;

end.
