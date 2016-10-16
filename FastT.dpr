program FastT;

uses
  Vcl.Forms,
  LoadingUnit in 'LoadingUnit.pas' {Form1},
  Modul in 'Modul.pas' {DataModule2: TDataModule},
  LogPass in 'LogPass.pas' {Form3},
  Registration in 'Registration.pas' {Form2},
  Main in 'Main.pas' {Form4},
  PersonalArea in 'PersonalArea.pas' {Form5},
  AirTicket in 'AirTicket.pas' {Form6},
  Hotel in 'Hotel.pas' {Form7},
  WorldTime in 'WorldTime.pas' {Form8},
  Basket in 'Basket.pas' {Form9},
  CheckOut in 'CheckOut.pas' {Form10},
  Tour in 'Tour.pas' {Form11},
  Records in 'Records.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDataModule2, DataModule2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.CreateForm(TForm10, Form10);
  Application.CreateForm(TForm11, Form11);
  Application.Run;
end.
