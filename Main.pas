unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.ExtCtrls, Vcl.Buttons, sSpeedButton, sPanel, Vcl.StdCtrls, sLabel,
  Vcl.Imaging.jpeg, sBitBtn;

type
  TForm4 = class(TForm)
    sPanel2: TsPanel;
    sLabelFX1: TsLabelFX;
    sLabelFX2: TsLabelFX;
    sPanel3: TsPanel;
    Label_Info: TsLabelFX;
    Button_Air: TsBitBtn;
    Button_Hotel: TsBitBtn;
    Button_Tour: TsBitBtn;
    sBitBtn1: TsBitBtn;
    sBitBtn2: TsBitBtn;
    sLabel1: TsLabel;
    procedure FormCreate(Sender: TObject);
    procedure sSpeedButton5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sBitBtn1MouseEnter(Sender: TObject);
    procedure Button_AirMouseEnter(Sender: TObject);
    procedure Button_HotelMouseEnter(Sender: TObject);
    procedure Button_TourMouseEnter(Sender: TObject);
    procedure sBitBtn2MouseEnter(Sender: TObject);
    procedure sBitBtn1MouseLeave(Sender: TObject);
    procedure Button_AirMouseLeave(Sender: TObject);
    procedure Button_HotelMouseLeave(Sender: TObject);
    procedure Button_TourMouseLeave(Sender: TObject);
    procedure sBitBtn2MouseLeave(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure Button_AirClick(Sender: TObject);
    procedure Button_HotelClick(Sender: TObject);
    procedure sBitBtn2Click(Sender: TObject);
    procedure Button_TourClick(Sender: TObject);
    procedure sLabel1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form4: TForm4;

  BackGround:Tbitmap;

  Procedure SHOW_LABEL;

implementation

{$R *.dfm}

Uses Modul, PersonalArea,  AirTicket, Hotel, WorldTime, Basket, Tour, LogPass;

Procedure SHOW_LABEL;
Begin
Form4.Label_Info.Left:= (Form4.sPanel3.Width div 2) - (Form4.Label_Info.Width div 2);
Form4.Label_Info.Visible:= True;
End;

procedure TForm4.Button_AirClick(Sender: TObject);
begin
Form4.Hide;
Form6.Show;
end;

procedure TForm4.Button_AirMouseEnter(Sender: TObject);
begin
Form4.Label_Info.Caption:= 'Заказать авиабилет';
SHOW_LABEL;
end;

procedure TForm4.Button_AirMouseLeave(Sender: TObject);
begin
Form4.Label_Info.Visible:= False;
end;

procedure TForm4.Button_HotelClick(Sender: TObject);
begin
Form4.Hide;
Form7.Show;
end;

procedure TForm4.Button_HotelMouseEnter(Sender: TObject);
begin
Form4.Label_Info.Caption:= 'Заказать отель';
SHOW_LABEL;
end;

procedure TForm4.Button_HotelMouseLeave(Sender: TObject);
begin
Form4.Label_Info.Visible:= False;
end;

procedure TForm4.Button_TourClick(Sender: TObject);
begin
//ShowMessage('В разработке: [Стадия 3] - (Связь реляционных баз)!');
Form4.Hide;
Form11.Show;
end;

procedure TForm4.Button_TourMouseEnter(Sender: TObject);
begin
Form4.Label_Info.Caption:= 'Заказать тур';
SHOW_LABEL;
end;

procedure TForm4.Button_TourMouseLeave(Sender: TObject);
begin
Form4.Label_Info.Visible:= False;
end;

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

procedure TForm4.sBitBtn1Click(Sender: TObject);
begin
Form4.Hide;
Form5.Show;
end;

procedure TForm4.sBitBtn1MouseEnter(Sender: TObject);
begin
Form4.Label_Info.Caption:= 'Личный кабинет';
SHOW_LABEL;
end;

procedure TForm4.sBitBtn1MouseLeave(Sender: TObject);
begin
Form4.Label_Info.Visible:= False;
end;

procedure TForm4.sBitBtn2Click(Sender: TObject);
begin
Form4.Hide;
Form9.Position:= PoDeskTopCenter;
Form9.Show;
end;

procedure TForm4.sBitBtn2MouseEnter(Sender: TObject);
begin
Form4.Label_Info.Caption:= 'Ваша корзина';
SHOW_LABEL;
end;

procedure TForm4.sBitBtn2MouseLeave(Sender: TObject);
begin
Form4.Label_Info.Visible:= False;
end;

procedure TForm4.sLabel1Click(Sender: TObject);
begin
Form3.sLabel3.Visible:= False;
Form3.sBevel1.Visible:= False;
Form3.sEdit2.Text:= '';
Form4.Hide;
Form3.Show;
end;

procedure TForm4.sSpeedButton5Click(Sender: TObject);
begin
Form4.Hide;
Form8.StartTime;
Form8.Show;
end;

end.
