unit LoadingUnit;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls, acProgressBar,
  sSkinManager, sCalculator, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure FormPaint(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

  Background: Tbitmap;
  Timestep:shortint = 100;
  R:Real            = 255;
  G:Real            = 106;
  B:Real            = 0;

implementation

{$R *.dfm}

uses LogPass, Modul, WorldTime, AirTicket, Basket;



procedure TForm1.FormCreate(Sender: TObject);
begin
Background:= TBitmap.Create;
Background.LoadFromFile('Textures/Logo.bmp');
Width:= 400;
Height:= 360;
end;

procedure TForm1.FormPaint(Sender: TObject);
begin
Canvas.Draw(0, 0, Background);
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
if (Timestep < 1) then
  Begin
  Timer1.Enabled:= False;
  Form1.Hide;
  Form3.Show;
  End
else
  Begin
  canvas.Pen.Style:=psClear;
  Canvas.Brush.Color:=RGB(round(R),round(G),round(B));
  Canvas.Rectangle((Form1.ClientWidth - (Timestep * 4)),
                   350,
                   (Form1.ClientWidth - (Timestep * 4) + 5),
                   361);
  Timestep:=Timestep-1;
  if (Timestep = 50) then
    Form3.simage1.picture.LoadFromFile('Textures/Logo.png');
  R:= (R - 2.5);
  G:= (G + 0.4);
  B:= (B + 2.5);
  End;
end;

end.
