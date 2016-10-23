unit WorldTime;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sComboBox, sLabel,
  Vcl.ExtCtrls, acImage, sButton, sPanel, sBevel, sRadioButton, acPNG, sListBox,
  sCheckListBox, Vcl.Mask, sMaskEdit, sCustomComboEdit, sToolEdit, Vcl.ComCtrls,
  sMonthCalendar, sScrollBox, sFrameBar, sComboEdit, acPopupCtrls, Vcl.Menus,
  sCurrEdit, sEdit, acMagn, Vcl.Buttons, sBitBtn, Dateutils;

type
  TForm8 = class(TForm)
    WorldTime1: TTimer;
    WorldTime2: TTimer;
    sPanel1: TsPanel;
    Exit: TsBitBtn;
    sBitBtn1: TsBitBtn;
    sPanel2: TsPanel;
    sPanel3: TsPanel;
    sPanel4: TsPanel;
    sPanel5: TsPanel;
    sPanel6: TsPanel;
    sLabel1: TsLabel;
    sComboBox2: TsComboBox;
    sBevel1: TsBevel;
    sLabel2: TsLabel;
    RB_2: TsRadioButton;
    sComboBox1: TsComboBox;
    RB_1: TsRadioButton;
    sButton1: TsButton;
    sBevel2: TsBevel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure WorldTime1Timer(Sender: TObject);
    procedure ExitClick(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure sBitBtn1Click(Sender: TObject);
    procedure WorldTime2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    SecondTime:TTime;
    NewGMT    :Integer;
    Procedure StartTime;
    Procedure StopTime;
  end;

var
  Form8: TForm8;

implementation

{$R *.dfm}

uses Main;

procedure TForm8.ExitClick(Sender: TObject);
begin
Form8.Hide;
Form8.StopTime;
Form4.show;
end;

procedure TForm8.FormClose(Sender: TObject; var Action: TCloseAction);
begin
case MessageDlg('Вы точно хотите выйти?',mtConfirmation , [mbYes,mbCancel], 0) of
mrYes:Application.Terminate;
mrCancel:Abort;
end;
end;

procedure TForm8.WorldTime1Timer(Sender: TObject);
Var
  Tme : TSYSTEMTIME;
Begin
GetLocalTime(Tme);
sPanel2.Caption:= IntToStr(Tme.wHour)+' : '+IntToStr(Tme.wMinute)
end;

procedure TForm8.WorldTime2Timer(Sender: TObject);
Var
  Tme : TSYSTEMTIME;
begin
GetSyStemTime(Tme);
Tme.wHour:= Tme.wHour + NewGMT;
sPanel4.Caption:= IntToStr(Tme.wHour)+' : '+IntToStr(Tme.wMinute)
end;

procedure TForm8.sBitBtn1Click(Sender: TObject);
begin
if ClientHeight= 180 then ClientHeight:= 300 else ClientHeight:= 180;
sPanel6.Visible:= True;
end;

procedure TForm8.sButton1Click(Sender: TObject);
begin
if sComboBox2.Text[3] = ':' then
  NewGMT:= StrToInt(sComboBox2.Text[1] + sComboBox2.Text[2]);

if sComboBox2.Text[4] = ':' then
  NewGMT:= StrToInt(sComboBox2.Text[1] + sComboBox2.Text[2] + sComboBox2.Text[3]);

if NewGMT >= 0 then
  sPanel5.Caption:= '   Вторичный временной пояс: +' + IntTostr(NewGMT) + ':00'
    else
      sPanel5.Caption:= '   Вторичный временной пояс: ' + IntTostr(NewGMT) + ':00';

Form8.ClientHeight:= 180;
sPanel6.Visible:= False;
end;

Procedure TForm8.StartTime;
Var
  Buf1, Buf2 : TSYSTEMTIME;
Begin
GetLocalTime(Buf1);
GetSyStemTime(Buf2);
if (Buf1.wHour -  Buf2.wHour) > 0 then
  sPanel3.Caption:='   Ваш временной пояс: +' + IntToStr(Buf1.wHour -  Buf2.wHour) + ':00'
    else
      sPanel3.Caption:='   Ваш временной пояс: ' + IntToStr(Buf1.wHour -  Buf2.wHour) + ':00';
if NewGMT = Null then
  sPanel5.Caption:= '   Временной пояс: +0:00'
    else
      if NewGMT >= 0 then
        sPanel5.Caption:= '   Временной пояс: +' + IntTostr(NewGmt) + ':00'
          else
            sPanel5.Caption:= '   Временной пояс: ' + IntTostr(NewGmt) + ':00';
WorldTime1.Enabled:=True;
WorldTime2.Enabled:=True;
End;

Procedure TForm8.StopTime;
Begin
WorldTime1.Enabled:=False;
WorldTime2.Enabled:=False;
End;


end.
