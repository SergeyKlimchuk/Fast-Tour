unit BTNlib;

interface

uses
  Winapi.Windows, Vcl.Graphics   ,Vcl.dialogs, System.SysUtils, math;

Const
      cbStay    =0; // Состояние покоя
      cbHover   =1; // Состояние навидения
      cbPressed =2; // Состояние нажатия
      cbLocked  =3; // Состояние блокировки

type
  TRGB = record // RGB для хранения разности цветов под градиенты
  R,G,B:Byte;
  end;

  TGradient = record
  Color1:tColor;
  Color2:tColor;
  isVertical:Boolean;
  Enabled:Boolean;
  end;

  TCButton = record // Кастомные кнопки
  BorderWidth :Integer;
  BorderColor :TColor;
  BorderRadius:Integer;
  BackGradient:TGradient;
  BackColor   :TColor;
  Caption     :Shortstring;
  Color       :TColor;
  Color_off   :TColor;
  Gradient    :TGradient;
  Height      :Integer;
  Left        :Integer;
  State       :Integer;
  Top         :integer;
  Width       :Integer;

  Public
    procedure Create;
    Function Paint:Tbitmap;
  Private
    Function Create_Stay:Tbitmap;
    Function Create_Hover:Tbitmap;
    Function Create_Pressed:Tbitmap;
    Function Create_Locked:Tbitmap;
    var
      opStay    :Tbitmap; // Состояние покоя
      opHover   :Tbitmap; // Состояние навидения
      opPressed :Tbitmap; // Состояние нажатия
      opLocked  :Tbitmap; // Состояние блокировки
  end;

implementation

Var
  I :TCButton;

Function TCButton.Create_Stay:Tbitmap;
Var
  a :Tbitmap;
  CR,CG,CB:Double;
  R,G,B:Double;
  Wdth,Hght:Integer;
begin
a:=Tbitmap.create;
a.Width:= Width;     // Создаем изображение
a.Height:= Height;
if (BackGradient.Enabled = True) then
  Begin
  CR:= GetRValue(BackGradient.Color1);
  CG:= GetGValue(BackGradient.Color1);  // Задаем стартующий цвет
  CB:= GetBValue(BackGradient.Color1);
  R:= (GetRValue(BackGradient.Color2) - CR) / Height;
  G:= (GetGValue(BackGradient.Color2) - CG) / Height;   // Находим разницу
  B:= (GetBValue(BackGradient.Color2) - CB) / Height;
  //ShowMEssage('R =' + FloatToStr(R));
  for Hght:= 0 to Height - 1 do
    Begin
    // Закрашиваем пиксель нашим цветом
    for Wdth:= 0 to Width - 1 do
      a.Canvas.Pixels[Wdth,Hght]:= RGB(Trunc(CR), Trunc(CG), Trunc(CB));
    // Изменяем цвет с учетом погрешности
    CR:= CR + R;
    CG:= CG + G;  // Задаем стартующий цвет
    CB:= CB + B;
    End;
  end
  else
  Begin
  a.Canvas.Brush.Color:=BackColor;
  a.Canvas.Pen.Color:=BackColor;
  a.Canvas.Rectangle(0, 0, Width ,Height);
  end;    
  a.Canvas.Pen.Width:=BorderWidth;
  a.Canvas.Pen.Color:=BorderColor;
  a.Canvas.Brush.Color:=Color;
  a.Canvas.RoundRect(0,0,Width,Height,BorderRadius,BorderRadius);      
  a.Canvas.Brush.Style:=bsClear;
  a.Canvas.Font.Size:=12;    
  a.Canvas.TextOut( 
                  (Width div 2)-((a.Canvas.TextWidth(Caption) div 2)),
                  (Height div 2)-((a.Canvas.TextHeight(Caption) div 2)), 
                  Caption
                  ); 
//a.SaveToFile('1.bmp');
Result:= a;
End;

Function TCButton.Create_Hover:Tbitmap;
Var
  a :Tbitmap;
  wdth,hght:Integer;
  VarColorR:Double; StepR:Double;
  VarColorG:Double; StepG:Double;
  VarColorB:Double; StepB:Double;
begin
// Рефакторинг
a:=Tbitmap.create;
a.Width:= Width;
a.Height:= Height + 2;
if (BackGradient.Enabled = True) then
  Begin
  VarColorR:= GetRValue(BackGradient.Color1);
  VarColorG:= GetGValue(BackGradient.Color1);  // Задаем стартующий цвет
  VarColorB:= GetBValue(BackGradient.Color1);
  StepR:= (GetRValue(BackGradient.Color2) - VarColorR) / Height;
  StepG:= (GetGValue(BackGradient.Color2) - VarColorG) / Height;   // Находим разницу
  StepB:= (GetBValue(BackGradient.Color2) - VarColorB) / Height;
  //ShowMEssage('R =' + FloatToStr(R));
  for Hght:= 0 to a.Height - 1 do
    Begin   
    // Закрашиваем пиксель нашим цветом
    for Wdth:= 0 to a.Width - 1 do
      a.Canvas.Pixels[Wdth,Hght]:= RGB(Trunc(VarColorR), Trunc(VarColorG), Trunc(VarColorB));
    // Изменяем цвет с учетом погрешности
    VarColorR:= VarColorR + StepR;
    VarColorG:= VarColorG + StepG;  // Задаем стартующий цвет
    VarColorB:= VarColorB + StepB;           
    End;  
  End
  else
  Begin
  a.Canvas.Brush.Color:=BackColor;
  a.Canvas.Pen.Color:=BackColor;
  a.Canvas.Rectangle(0, 0, a.Width ,a.Height);
  End;
// Конец
  a.Canvas.Pen.Width:=BorderWidth;
  a.Canvas.Brush.Color:=clLime;
  a.Canvas.Pen.Color:=RGB(222,222,222);
  a.Canvas.RoundRect(0,0,Width,a.Height-2,BorderRadius,BorderRadius);
  a.Canvas.Pen.Color:=RGB(188,188,188);
  a.Canvas.RoundRect(0,0,Width,a.Height-3,BorderRadius,BorderRadius); 
//...
a.Canvas.Pen.Color:=RGB(GetRvalue(BackColor)-70,GetGvalue(BackColor)-70,GetBvalue(BackColor)-70);
a.Canvas.RoundRect(0,0,Width,Height-2,BorderRadius,BorderRadius);
VarColorR:=GetRValue(Gradient.Color1);
VarColorG:=GetGValue(Gradient.Color1);
VarColorB:=GetBValue(Gradient.Color1);
StepR:=(GetRValue(Gradient.Color2) - GetRValue(Gradient.Color1)) / (a.Height - 4);
StepG:=(GetGValue(Gradient.Color2) - GetGValue(Gradient.Color1)) / (a.Height - 4);
StepB:=(GetBValue(Gradient.Color2) - GetBValue(Gradient.Color1)) / (a.Height - 4);
for hght:=1 to a.Height-4 do
  begin
  VarColorR:=VarColorR+StepR;
  VarColorG:=VarColorG+StepG;
  VarColorB:=VarColorB+StepB;
  for wdth:=1 to a.Width do
    if (GetRValue(a.Canvas.Pixels[wdth,hght])=0) and (GetGValue(a.Canvas.Pixels[wdth,hght])=255) and (GetBValue(a.Canvas.Pixels[wdth,hght])=0)
      then
        a.Canvas.Pixels[wdth,hght]:=RGB(Trunc(VarColorR),Trunc(VarColorG),Trunc(VarColorB));
  end;
a.Canvas.Brush.Style:=bsClear;
a.Canvas.Font.Size:=12;
a.Canvas.TextOut( (Width div 2)-((a.Canvas.TextWidth(Caption) div 2)),(Height div 2)-((a.Canvas.TextHeight(Caption) div 2)), Caption);
//a.SaveToFile('2.bmp');
Result:=a;
end;

Function TCButton.Create_Pressed:Tbitmap;
Var
  a :Tbitmap;
  wdth,hght:Integer;
  R,G,B,CR,CG,CB:Double;
begin
a:=Tbitmap.create;
a.Width:= Width;
a.Height:= Height;
if (BackGradient.Enabled = True) then
  Begin
  CR:= GetRValue(BackGradient.Color1);
  CG:= GetGValue(BackGradient.Color1);  // Задаем стартующий цвет
  CB:= GetBValue(BackGradient.Color1);
  R:= (GetRValue(BackGradient.Color2) - CR) / Height;
  G:= (GetGValue(BackGradient.Color2) - CG) / Height;   // Находим разницу
  B:= (GetBValue(BackGradient.Color2) - CB) / Height;
  //ShowMEssage('R =' + FloatToStr(R));
  for Hght:= 0 to Height - 1 do
    Begin
    // Закрашиваем пиксель нашим цветом
    for Wdth:= 0 to Width - 1 do
      a.Canvas.Pixels[Wdth,Hght]:= RGB(Trunc(CR), Trunc(CG), Trunc(CB));
    // Изменяем цвет с учетом погрешности
    CR:= CR + R;
    CG:= CG + G;  // Задаем стартующий цвет
    CB:= CB + B;
    End;
  End
  else
  With a.Canvas do
    Begin
    Brush.Color:=BackColor;
    Pen.Color:=BackColor;
    Rectangle(0, 0, Width ,Height+2);
    End;
a.Canvas.Pen.Width:=BorderWidth;
a.Canvas.Pen.Color:=RGB(GetRvalue(BackColor)-70,GetGvalue(BackColor)-70,GetBvalue(BackColor)-70);
a.Canvas.Brush.Color:=Color;
a.Canvas.RoundRect(0,0,Width,Height,BorderRadius,BorderRadius);
a.Canvas.Pen.Color:=RGB(GetRvalue(BackColor)-40,GetGvalue(BackColor)-40,GetBvalue(BackColor)-40);
a.Canvas.RoundRect(1,1,Width-1,Height-1,BorderRadius-2,BorderRadius-2);
a.Canvas.Pen.Color:=RGB(GetRvalue(BackColor)-9,GetGvalue(BackColor)-9,GetBvalue(BackColor)-9);
a.Canvas.RoundRect(1,2,Width-1,Height-1,BorderRadius-2,BorderRadius-2);
a.Canvas.Brush.Style:=bsClear;
a.Canvas.Font.Size:=12;
a.Canvas.TextOut(
                (Width div 2)-((a.Canvas.TextWidth(Caption) div 2)),
                (Height div 2)-((a.Canvas.TextHeight(Caption) div 2)),
                Caption
                );
//a.SaveToFile('3.bmp');
Result:=a;
end;

Function TCButton.Create_Locked:Tbitmap;
Var
  a :Tbitmap;
  wdth,hght:Integer;
  R,G,B,CR,CG,CB:Double;
begin
a:=Tbitmap.create;
a.Width:=Width;
a.Height:=Height;
if (BackGradient.Enabled = True) then
  Begin
  CR:= GetRValue(BackGradient.Color1);
  CG:= GetGValue(BackGradient.Color1);  // Задаем стартующий цвет
  CB:= GetBValue(BackGradient.Color1);
  R:= (GetRValue(BackGradient.Color2) - CR) / Height;
  G:= (GetGValue(BackGradient.Color2) - CG) / Height;   // Находим разницу
  B:= (GetBValue(BackGradient.Color2) - CB) / Height;
  //ShowMEssage('R =' + FloatToStr(R));
  for Hght:= 0 to Height - 1 do
    Begin
    // Закрашиваем пиксель нашим цветом
    for Wdth:= 0 to Width - 1 do
      a.Canvas.Pixels[Wdth,Hght]:= RGB(Trunc(CR), Trunc(CG), Trunc(CB));
    // Изменяем цвет с учетом погрешности
    CR:= CR + R;
    CG:= CG + G;  // Задаем стартующий цвет
    CB:= CB + B;
    End;
  End
  else
  Begin
  a.Canvas.Brush.Color:=BackColor;
  a.Canvas.Pen.Color:=BackColor;
  a.Canvas.Rectangle(0, 0, Width ,Height+2);
  End;
a.Canvas.Pen.Width:=BorderWidth;
a.Canvas.Pen.Color:=RGB(GetRvalue(BackColor)-70,GetGvalue(BackColor)-70,GetBvalue(BackColor)-70);
a.Canvas.Brush.Color:=Color_off;
a.Canvas.RoundRect(0,0,Width,Height-2,BorderRadius,BorderRadius);
a.Canvas.Pen.Color:=RGB(GetRvalue(Color_off),GetGvalue(Color_off)-40,GetBvalue(Color_off)-40);
a.Canvas.RoundRect(1,1,Width-1,Height-3,BorderRadius-2,BorderRadius-2);
a.Canvas.Pen.Color:=RGB(GetRvalue(Color_off)+9,GetGvalue(Color_off)-20,GetBvalue(Color_off)-20);
a.Canvas.RoundRect(1,2,Width-1,Height-3,BorderRadius-2,BorderRadius-2);
a.Canvas.Brush.Style:=bsClear;
a.Canvas.Font.Size:=12;
a.Canvas.Font.Color:=ClWhite;
a.Canvas.TextOut( (Width div 2)-((a.Canvas.TextWidth(Caption) div 2)),(Height div 2)-((a.Canvas.TextHeight(Caption) div 2)), Caption);
//a.SaveToFile('4.bmp');
Result:=a;
end;


Function TCButton.Paint:Tbitmap;
begin
  case State of
  0:Result:=opStay;
  1:Result:=opHover;
  2:Result:=opPressed;
  3:Result:=opLocked;
  end;
end;

procedure TCButton.Create;
Begin
opStay    :=Create_Stay; // Состояние покоя
opHover   :=Create_Hover; // Состояние навидения
opPressed :=Create_Pressed; // Состояние нажатия
opLocked  :=Create_Locked; // Состояние блокировки
End;


end.
