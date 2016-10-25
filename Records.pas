unit Records;

interface

uses
  sPanel, sBitBtn, sLabel, sBevel, acImage, sScrollBox,Vcl.Graphics, Vcl.Controls, sysUtils,VCL.Dialogs;

Type
  TAir_Line = record
    Main_Panel: TsPanel;
    Label_Way: TsLabel;
    Picture_Plane: TsImage;
    Label_AirCompany: TsLabel;
    Label_Days: TsLabel;
    Label_Date: TsLabel;
    Home_Bevel: TsBevel;
    Label_Info: TsLabel;
    Label_Type: TsLabel;
    Label_FlightTime: TsLabel;
    Picture_AirCompany: TsImage;
    Panel_Explorer: TsGradientPanel;
    Label_Price: TsLabel;
    Label_Currency: TsLabel;
    Label_Message: TsLabel;
    Button_Choose: TsBitBtn;
    Explorer_Bevel: TsBevel;
    Public
      Procedure Create(X,Y,Index:Integer; Parent:TObject);
      Procedure Destroy;
  end;

  THotel_Line = record
    Main_Panel: TsPanel;
    Photo: TsImage;
    Photo_B:TsBevel;
    Lbl_Name:TsLabel;
    Lbl_Country:TsLabel;
    Lbl_City:TsLabel;
    Lbl_Tag1,Lbl_Tag2,Lbl_Tag3,Lbl_Tag4:TsLabel;
    Panel_Level:TsGradientPanel;
    Lbl_Comment:TsLabel;
    Lbl_Visual_Price:TsLAbel;
    Lbl_Price:TsLAbel;
    Public
      Procedure Create(X,Y,Index:Integer; Parent:TObject);
      Procedure Destroy;
  end;

  TPage = record
    Lines, Current, Count:Integer;
  end;

implementation

uses
  Tour, AirTicket;

Procedure TAir_Line.Create(X,Y,Index:Integer; Parent:TObject);
Var
  Plane_IMG: TPicture;
Begin
Main_Panel:=TsPanel.create( (Parent as TsScrollBox) );
Main_Panel.Parent:= (Parent as TsScrollBox);
Main_Panel.Width:= 800;
Main_Panel.Height:= 100;
Main_Panel.Left:= X;
Main_Panel.Top:= Y;
// Лейбел ""
Panel_Explorer:=TsGradientPanel.create(Main_Panel);
Panel_Explorer.Parent:= Main_Panel;
Panel_Explorer.Left:= 600;
Panel_Explorer.Top:= 0;
Panel_Explorer.Width:= 200;
Panel_Explorer.Height:= 100;
Panel_Explorer.PaintData.Color1.Color:= $00EBEBEB;
Panel_Explorer.PaintData.Color2.UseSkinColor:= False;
Panel_Explorer.PaintData.Color2.Color:= $00EBEBEB;
// Лейбел "Авиакомпания:"
Label_AirCompany:=TsLabel.create(Main_Panel);
Label_AirCompany.Parent:= Main_Panel;
Label_AirCompany.Left:= 15;
Label_AirCompany.Top:= 8;
Label_AirCompany.Font.Style:=[fsBold];
// Лейбел "Авиакомпания:"
Picture_Plane:=TsImage.create(Main_Panel);
Picture_Plane.Parent:= Main_Panel;
Picture_Plane.Left:= 5;
Picture_Plane.Top:= 27;
Picture_Plane.Width:= 16;
Picture_Plane.Height:= 16;
Plane_IMG:= TPicture.Create;
Plane_IMG.LoadFromFile('Textures\Plane.png');
Picture_Plane.Picture.Assign(Plane_IMG);
FreeAndNil(Plane_IMG);
// Лейбел "Путь"
Label_Way:=TsLabel.create(Main_Panel);
Label_Way.Parent:= Main_Panel;
Label_Way.Left:= 27;
Label_Way.Top:= 27;
// Лейбел "Дата полёта / время:"
Label_Date:=TsLabel.create(Main_Panel);
Label_Date.Parent:= Main_Panel;
Label_Date.Left:= 27;
Label_Date.Top:= 46;
// Лейбел "Дни вылетов:"
Label_Days:=TsLabel.create(Main_Panel);
Label_Days.Parent:= Main_Panel;
Label_Days.Left:= 27;
Label_Days.Top:= 65;
// Bevel заграничитель
Home_Bevel:=TsBevel.create(Main_Panel);
Home_Bevel.Parent:=Main_Panel;
Home_Bevel.Left:= 200;
Home_Bevel.Top:= -1;
Home_Bevel.Width:= 3;
Home_Bevel.Height:= 102;
// Лейбел ""
Label_Info:=TsLabel.create(Main_Panel);
Label_Info.Parent:= Main_Panel;
Label_Info.Left:= 206;
Label_Info.Top:= 8;
Label_Info.Font.Style:= [fsUnderline];
Label_Info.Cursor:= crHandPoint;
Label_Info.Caption:= 'Детали перелёта';
Label_Info.OnClick:= Form6.sLabel28Click;
Label_Info.Tag:= Index;
// Лейбел ""
Label_Type:=TsLabel.create(Main_Panel);
Label_Type.Parent:= Main_Panel;
Label_Type.Left:= 209;
Label_Type.Top:= 27;
Label_Type.UseSkinColor:= False;
Label_Type.Font.Style:= [fsBold];
Label_Type.Color:= $0000BE93;
// Лейбел "Время полёта"
Label_FlightTime:=TsLabel.create(Main_Panel);
Label_FlightTime.Parent:= Main_Panel;
Label_FlightTime.Left:= 209;
Label_FlightTime.Top:= 46;
// Лейбел "Авиакомпания"
Picture_AirCompany:=TsImage.create(Main_Panel);
Picture_AirCompany.Parent:= Main_Panel;
Picture_AirCompany.Left:= 209;
Picture_AirCompany.Top:= 0;
Picture_AirCompany.Width:= 400;
Picture_AirCompany.Height:= 100;
Picture_AirCompany.SendToBack;
// Лейбел ""
Label_Price:=TsLabel.create(Main_Panel);
Label_Price.Parent:= Panel_Explorer;
Label_Price.Left:= 55;
Label_Price.Top:= 24;
Label_Price.Font.Size:= 16;
// Лейбел ""
Label_Currency:=TsLabel.create(Main_Panel);
Label_Currency.Parent:= Panel_Explorer;
Label_Currency.Left:= 123;
Label_Currency.Top:= 32;
Label_Currency.Caption:= ' USD';
Label_Currency.Font.Size:= 9;
// Лейбел ""
Label_Message:=TsLabel.create(Main_Panel);
Label_Message.Parent:= Panel_Explorer;
Label_Message.Left:= 28;
Label_Message.Top:= 44;
Label_Message.Caption:='Цена за всех пассажиров';
Label_Message.Font.Size:= 9;
// Лейбел ""
Button_Choose:=TsBitBtn.create(Main_Panel);
Button_Choose.Parent:= Panel_Explorer;
Button_Choose.Left:= 50;
Button_Choose.Top:= 64;
Button_Choose.Width:= 100;
Button_Choose.Height:= 25;
Button_Choose.Cursor:= crHandPoint;
Button_Choose.Caption:= 'Выбрать';
Button_Choose.Tag:= Index;
Button_Choose.OnClick:= Form6.Get_Info;
// Кнопка с капчей ""
Explorer_Bevel:=TsBevel.Create(Main_Panel);
Explorer_Bevel.Parent:= Panel_Explorer;
Explorer_Bevel.Left:= 0;
Explorer_Bevel.Top:= 0;
Explorer_Bevel.Width:= 200;
Explorer_Bevel.Height:= 100;
End;

Procedure TAir_Line.Destroy;
Begin
Label_Way.Free;
Label_AirCompany.Free;
Label_Days.Free;
Label_Date.Free;
Label_Info.Free;
Label_Type.Free;
Label_FlightTime.Free;
Label_Price.Free;
Label_Currency.Free;
Label_Message.Free;
Picture_Plane.Free;
Picture_AirCompany.Free;
Home_Bevel.Free;
Explorer_Bevel.Free;
Button_Choose.Free;
Panel_Explorer.Free;
Main_Panel.Free;
End;


Procedure THotel_Line.Create(X,Y,Index:Integer; Parent:TObject);
Begin
// Создание панели
Main_Panel:= TsPanel.Create(( Parent as Tsscrollbox));
Main_Panel.Parent:=( Parent as Tsscrollbox);
Main_Panel.Left:= X;
Main_Panel.Top:= Y;
Main_Panel.Width:= 800;
Main_Panel.Height:= 80;
Main_Panel.Tag:= Index;
Main_Panel.OnClick:= Form11.PanelOnClick;
// Создание картинки и рамки
Photo:= TsImage.Create(Main_Panel);
Photo.Parent:= Main_Panel;
Photo.Left:= 10;
Photo.Top:= 10;
Photo.Width:= 90;
Photo.Height:= 60;
Photo.Tag:= Index;
Photo.Stretch:= True;
Photo.OnClick:= Form11.PanelOnClick;

Photo_B:= TsBevel.Create(Main_Panel);
Photo_B.Parent:= Main_Panel;
Photo_B.Left:= 9;
Photo_B.Top:= 9;
Photo_B.Width:= 92;
Photo_B.Height:= 62;
// Создание левой части лейблов
Lbl_Name:= TsLabel.Create(Main_Panel);
Lbl_Name.Parent:= Main_Panel;
Lbl_Name.Left:= 107;             //
Lbl_Name.Top:= 8;
Lbl_Name.Font.Size:= 12;
Lbl_Name.Font.Style:= [fsBold];
Lbl_Name.Tag:= Index;
Lbl_Name.OnClick:= Form11.PanelOnClick;

Lbl_Country:= TsLabel.Create(Main_Panel);
Lbl_Country.Parent:= Main_Panel;
Lbl_Country.Left:= 107;
Lbl_Country.Top:= 33;
Lbl_Country.Font.Size:= 8;
Lbl_Country.Font.Style:= [fsUnderline];
Lbl_Country.Cursor:= crhandPoint;
Lbl_Country.Tag:= Index;
Lbl_Country.OnClick:= Form11.PanelOnClick;

Lbl_City:= TsLabel.Create(Main_Panel);
Lbl_City.Parent:= Main_Panel;
Lbl_City.Left:= 151;
Lbl_City.Top:= 33;
Lbl_City.Font.Size:= 8;
Lbl_City.Font.Style:= [fsUnderline];
Lbl_City.Cursor:= crhandPoint;
Lbl_City.Tag:= Index;
Lbl_City.OnClick:= Form11.PanelOnClick;

Lbl_Tag1:= TsLabel.Create(Main_Panel);
Lbl_Tag1.Parent:= Main_Panel;
Lbl_Tag1.Left:= 107;
Lbl_Tag1.Top:= 52;
Lbl_Tag1.Font.Size:= 8;
Lbl_Tag1.Font.Style:= [fsUnderline];
Lbl_Tag1.Cursor:= crhandPoint;

Lbl_Tag2:= TsLabel.Create(Main_Panel);
Lbl_Tag2.Parent:= Main_Panel;
Lbl_Tag2.Left:= 127;             //
Lbl_Tag2.Top:= 52;
Lbl_Tag2.Font.Size:= 8;
Lbl_Tag2.Font.Style:= [fsUnderline];
Lbl_Tag2.Cursor:= crhandPoint;

Lbl_Tag3:= TsLabel.Create(Main_Panel);
Lbl_Tag3.Parent:= Main_Panel;
Lbl_Tag3.Left:= 147;             //
Lbl_Tag3.Top:= 52;
Lbl_Tag3.Font.Size:= 8;
Lbl_Tag3.Font.Style:= [fsUnderline];
Lbl_Tag3.Cursor:= crhandPoint;

Lbl_Tag4:= TsLabel.Create(Main_Panel);
Lbl_Tag4.Parent:= Main_Panel;
Lbl_Tag4.Left:= 167;             //
Lbl_Tag4.Top:= 52;
Lbl_Tag4.Font.Size:= 8;
Lbl_Tag4.Font.Style:= [fsUnderline];
Lbl_Tag4.Cursor:= crhandPoint;

Panel_Level:= TsGradientPanel.Create(Main_Panel);
Panel_Level.Parent:= Main_Panel;
Panel_Level.Left:= 212;          //
Panel_Level.Top:= 7;
Panel_Level.Width:= 49;
Panel_Level.Height:= 22;
Panel_Level.PaintData.Color1.Color:= $00FF8000;
Panel_Level.PaintData.Color2.Color:= $00FF8000;
Panel_Level.PaintData.Color2.UseSkinColor:= False;
Panel_Level.Font.Color:= ClWhite;
Panel_Level.Font.Size:= 12;
Panel_Level.Font.Style:= [fsBold];
Panel_Level.Tag:= Index;
Panel_Level.OnClick:= Form11.PanelOnClick;
//
Lbl_Comment:= TsLabel.Create(Main_Panel);
Lbl_Comment.Parent:= Main_Panel;
Lbl_Comment.Font.Size:= 10;
Lbl_Comment.Left:= 360;               //
Lbl_Comment.Top:= 8;                  //
Lbl_Comment.WordWrap:=True;
Lbl_Comment.Tag:= Index;
Lbl_Comment.OnClick:= Form11.PanelOnClick;
//
Lbl_Visual_Price:= TsLabel.Create(Main_Panel);
Lbl_Visual_Price.Parent:= Main_Panel;
Lbl_Visual_Price.Font.Size:= 12;
Lbl_Visual_Price.Left:= 711;
Lbl_Visual_Price.Top:= 9;
Lbl_Visual_Price.Caption:= 'Цена от:';
Lbl_Visual_Price.Tag:= Index;
Lbl_Visual_Price.OnClick:= Form11.PanelOnClick;
//
Lbl_Price:= TsLabel.Create(Main_Panel);
Lbl_Price.Parent:= Main_Panel;
Lbl_Price.Font.Size:= 12;
Lbl_Price.Top:= 34;
Lbl_Price.Tag:= Index;
Lbl_Price.OnClick:= Form11.PanelOnClick;
End;

Procedure THotel_Line.Destroy;
Begin
FreeAndNil(Lbl_Price);
FreeAndNil(Lbl_Visual_Price);
FreeAndNil(Lbl_Comment);
FreeAndNil(Panel_Level);
FreeAndNil(Lbl_Tag4);
FreeAndNil(Lbl_Tag3);
FreeAndNil(Lbl_Tag2);
FreeAndNil(Lbl_Tag1);
FreeAndNil(Lbl_City);
FreeAndNil(Lbl_Country);
FreeAndNil(Lbl_Name);
FreeAndNil(Photo_B);
FreeAndNil(Photo);
FreeAndNil(Main_Panel);
End;

end.
