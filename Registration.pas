unit Registration;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sLabel, Vcl.Buttons,
  sSpeedButton, Vcl.ExtCtrls, sBevel, sEdit, sMemo, sRadioButton, sButton,
  sCheckBox;

type
  TForm2 = class(TForm)
    sSpeedButton1: TsSpeedButton;
    sLabel1: TsLabel;
    sEdit1: TsEdit;
    sLabel2: TsLabel;
    sLabel3: TsLabel;
    sEdit2: TsEdit;
    sEdit3: TsEdit;
    sBevel1: TsBevel;
    sBevel2: TsBevel;
    sMemo1: TsMemo;
    sLabel4: TsLabel;
    sButton1: TsButton;
    sCheckBox1: TsCheckBox;
    sLabel5: TsLabel;
    sEdit4: TsEdit;
    sBevel3: TsBevel;
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sButton1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure sCheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

uses LogPass, Modul;

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  case MessageDlg('�� ����� ������ �����?',mtConfirmation , [mbYes,mbCancel], 0) of
  mrYes:Application.Terminate;
  mrCancel:Abort;
  end;
end;

procedure TForm2.sButton1Click(Sender: TObject);
begin
Form2.Hide;
Form3.Show;
end;

procedure TForm2.sCheckBox1Click(Sender: TObject);
begin
if sCheckBox1.Checked=true then sSpeedButton1.Enabled:=True else sSpeedButton1.Enabled:=False;
end;

procedure TForm2.sSpeedButton1Click(Sender: TObject);
Var
chk1,chk2,chk3,chk4,chk5:Boolean;
strend:String;
begin
/////////////////////////////////////////////////////////////////////////
strend:='�� ��� ���� ���������! ��������� ��������� ����:';            //
if (sEdit1.Text='') then strend:=strend+' �����,';                     //
if (sEdit2.Text='') then strend:=strend+' ������,';                    //
if (sEdit3.Text='') then strend:=strend+' ������(2),';                 //
if (sEdit4.Text='') then strend:=strend+' �������� ����,';             //
Delete(strend,Length(strend),1);                                       //
if (sEdit1.Text<>'') and (sEdit2.Text<>'') and (sEdit3.Text<>'') then  //
/////////////////////////////////////////////////////////////////////////
Begin
if (Length(sEdit1.Text)<6) or (Length(sEdit2.Text)<6) or (Length(sEdit3.Text)<6) then
  Begin
  ////////////////////////////////////////////////////////////////////////////////////////////////////////
  strend:='��� ���� ������ ���� ��������� �� ����� ��� 6 ���������! ��������/��������� ��������� ����:';//
  if (Length(sEdit1.Text)<6) then strend:=strend+' �����,';                                             //
  if (Length(sEdit2.Text)<6) then strend:=strend+' ������,';                                            //
  if (Length(sEdit3.Text)<6) then strend:=strend+' ������(2),';                                         //
  if (Length(sEdit4.Text)<6) then strend:=strend+' �������� ����,';                                     //
  if strend[strend.Length] = ',' then strend[strend.Length]:= #0;                                       //
  ShowMessage(strend);                                                                                  //
  ////////////////////////////////////////////////////////////////////////////////////////////////////////
  End else
  Begin
  if (pos('@mail.ru',LowerCase(sEdit4.Text))=0) and (pos('@yandex.ru',LowerCase(sEdit4.Text))=0) and (pos('@gmail.com',LowerCase(sEdit4.Text))=0) then
    Begin
    Showmessage('����� ������� �� ����� �� �������������� ����� �����������, �������� ���� ���������!');
    sEdit4.Text:='';
    End
  else
  if not (sEdit2.Text=sEdit3.Text) then
    Begin
    Showmessage('������ ���������� ���� �� �����, ���������� ������ ������ ��� ���!');
    sEdit2.Text:='';
    sEdit3.Text:='';
    End else
    Begin
    With Datamodule2.Reg_Query do
      Begin
      Active:=False;
      SQL.Clear;
      SQL.Add('SELECT * FROM LogPass Where (U_Login="'+sEdit1.Text+'")');
      Active:=True;
      End;
    if Datamodule2.Reg_Query.RecordCount=0 then chk4:=False else chk4:=True;
    With Datamodule2.Reg_Query do
      Begin
      Active:=False;
      SQL.Clear;
      SQL.Add('SELECT * FROM LogPass Where (U_Mail="'+sEdit4.Text+'")');
      Active:=True;
      End;
    if Datamodule2.Reg_Query.RecordCount=0 then chk5:=False else chk5:=True;

    if (chk4=False) and (Chk5=False) then
    Begin
      DataModule2.Reg_Table.Insert;
      DataModule2.Reg_Table.Fields.Fields[1].AsString := sEdit1.Text;
      DataModule2.Reg_Table.Fields.Fields[2].AsString := sEdit2.Text;
      DataModule2.Reg_Table.Fields.Fields[5].AsString := sEdit4.Text;
      DataModule2.Reg_Table.Fields.Fields[6].AsString := '������������';
      DataModule2.Reg_Table.Post;
      Showmessage('�� ������� ������������������! ��� ������ ����������� � ����������� ������������� �������� ������� � ������ ������� � ��������� ����������!');
      Form2.Hide;
      Form3.Show;
    End else Showmessage('������������ � ����� ������� ��� ������ ��� ���������������! ���� ��� ��� ����� ��� ����� �� �������� ��������� �������������!');

    End;

  End;
End else
ShowMessage(strend);
end;

end.
