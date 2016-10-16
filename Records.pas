unit Records;

interface

uses
  sPanel, sBitBtn, sLabel, sBevel, acImage, sScrollBox,Vcl.Graphics, Vcl.Controls, sysUtils;

Type
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

  TLine = record
    Count:Integer;   //Кол-во записей
    Current:Integer; // Текущая страница
  end;

implementation

uses
  Tour;

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
// Создание картинки и рамки
Photo:= TsImage.Create(Main_Panel);
Photo.Parent:= Main_Panel;
Photo.Left:= 10;
Photo.Top:= 10;
Photo.Width:= 90;
Photo.Height:= 60;

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
Lbl_Name.Caption:= 'Тест';       //
Lbl_Name.Font.Size:= 12;
Lbl_Name.Font.Style:= [fsBold];

Lbl_Country:= TsLabel.Create(Main_Panel);
Lbl_Country.Parent:= Main_Panel;
Lbl_Country.Left:= 107;
Lbl_Country.Top:= 33;
Lbl_Country.Caption:= 'Страна,'; //
Lbl_Country.Font.Size:= 8;
Lbl_Country.Font.Style:= [fsUnderline];
Lbl_Country.Cursor:= crhandPoint;

Lbl_City:= TsLabel.Create(Main_Panel);
Lbl_City.Parent:= Main_Panel;
Lbl_City.Left:= 151;
Lbl_City.Top:= 33;
Lbl_City.Caption:= 'Город,';     //
Lbl_City.Font.Size:= 8;
Lbl_City.Font.Style:= [fsUnderline];
Lbl_City.Cursor:= crhandPoint;

Lbl_Tag1:= TsLabel.Create(Main_Panel);
Lbl_Tag1.Parent:= Main_Panel;
Lbl_Tag1.Left:= 107;
Lbl_Tag1.Top:= 52;
Lbl_Tag1.Caption:= 'Тег1,';      //
Lbl_Tag1.Font.Size:= 8;
Lbl_Tag1.Font.Style:= [fsUnderline];
Lbl_Tag1.Cursor:= crhandPoint;

Lbl_Tag2:= TsLabel.Create(Main_Panel);
Lbl_Tag2.Parent:= Main_Panel;
Lbl_Tag2.Left:= 127;             //
Lbl_Tag2.Top:= 52;
Lbl_Tag2.Caption:= 'Тег2,';      //
Lbl_Tag2.Font.Size:= 8;
Lbl_Tag2.Font.Style:= [fsUnderline];
Lbl_Tag2.Cursor:= crhandPoint;

Lbl_Tag3:= TsLabel.Create(Main_Panel);
Lbl_Tag3.Parent:= Main_Panel;
Lbl_Tag3.Left:= 147;             //
Lbl_Tag3.Top:= 52;
Lbl_Tag3.Caption:= 'Тег3,';      //
Lbl_Tag3.Font.Size:= 8;
Lbl_Tag3.Font.Style:= [fsUnderline];
Lbl_Tag3.Cursor:= crhandPoint;

Lbl_Tag4:= TsLabel.Create(Main_Panel);
Lbl_Tag4.Parent:= Main_Panel;
Lbl_Tag4.Left:= 167;             //
Lbl_Tag4.Top:= 52;
Lbl_Tag4.Caption:= 'Тег4,';      //
Lbl_Tag4.Font.Size:= 8;
Lbl_Tag4.Font.Style:= [fsUnderline];
Lbl_Tag4.Cursor:= crhandPoint;

Panel_Level:= TsGradientPanel.Create(Main_Panel);
Panel_Level.Parent:= Main_Panel;
Panel_Level.Left:= 212;          //
Panel_Level.Top:= 7;
Panel_Level.Width:= 49;
Panel_Level.Height:= 22;
Panel_Level.Caption:= '3 *';     //
Panel_Level.PaintData.Color1.Color:= $00FF8000;
Panel_Level.PaintData.Color2.Color:= $00FF8000;
Panel_Level.PaintData.Color2.UseSkinColor:= False;
Panel_Level.Font.Color:= ClWhite;
Panel_Level.Font.Size:= 12;
Panel_Level.Font.Style:= [fsBold];
//
Lbl_Comment:= TsLabel.Create(Main_Panel);
Lbl_Comment.Parent:= Main_Panel;
Lbl_Comment.Font.Size:= 10;
Lbl_Comment.Left:= 360;               //
Lbl_Comment.Top:= 8;                  //
Lbl_Comment.Caption:= 'Тут текст';    //
Lbl_Comment.WordWrap:=True;
//
Lbl_Visual_Price:= TsLabel.Create(Main_Panel);
Lbl_Visual_Price.Parent:= Main_Panel;
Lbl_Visual_Price.Font.Size:= 12;
Lbl_Visual_Price.Left:= 711;          //
Lbl_Visual_Price.Top:= 9;             //
Lbl_Visual_Price.Caption:= 'Цена от:';//
//
Lbl_Price:= TsLabel.Create(Main_Panel);
Lbl_Price.Parent:= Main_Panel;
Lbl_Price.Font.Size:= 12;
Lbl_Price.Left:= 719;          //
Lbl_Price.Top:= 34;            //
Lbl_Price.Caption:= 'Цена';    //
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
