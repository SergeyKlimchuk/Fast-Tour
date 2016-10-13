unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.Buttons, sSpeedButton, sPanel, Vcl.StdCtrls, sLabel,
  Vcl.Imaging.jpeg;

type
  TForm4 = class(TForm)
    sPanel3: TsPanel;
    Image1: TImage;
    sPanel4: TsPanel;
    sPanel2: TsPanel;
    sLabel1: TsLabel;
    sLabel3: TsLabel;
    sPanel1: TsPanel;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    sSpeedButton5: TsSpeedButton;
    sSpeedButton6: TsSpeedButton;
    Timer1: TTimer;
    sLabel2: TsLabel;
    sSpeedButton4: TsSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sSpeedButton5Click(Sender: TObject);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Timer1Timer(Sender: TObject);
    procedure sSpeedButton4Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

  BackGround:Tbitmap;

implementation

{$R *.dfm}

Uses Modul, PersonalArea,  AirTicket, Hotel, WorldTime, Basket;

procedure TForm4.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  case MessageDlg('Вы точно хотите выйти?',mtConfirmation , [mbYes,mbCancel], 0) of
  mrYes:Application.Terminate;
  mrCancel:Abort;
  end;
end;

procedure TForm4.FormCreate(Sender: TObject);
begin
BackGround:= Tbitmap.Create;
end;

procedure TForm4.sSpeedButton1Click(Sender: TObject);
begin
Form4.Hide;
Form5.Show;
end;

procedure TForm4.sSpeedButton2Click(Sender: TObject);
begin
Form4.Hide;
Form6.Show;
end;

procedure TForm4.sSpeedButton3Click(Sender: TObject);
begin
Form4.Hide;
Form7.Show;
end;

procedure TForm4.sSpeedButton4Click(Sender: TObject);
begin
Form4.Hide;
Form9.Position:= PoDeskTopCenter;
Form9.Show;
end;

procedure TForm4.sSpeedButton5Click(Sender: TObject);
begin
Form4.Hide;
Form8.StartTime;
Form8.Show;
end;

procedure TForm4.Timer1Timer(Sender: TObject);
begin
if (slabel2.Left+sLabel2.Width > 0) then
  (slabel2.Left:=slabel2.Left - 1)
    else
      slabel2.Left:= ClientWidth;
end;

end.
