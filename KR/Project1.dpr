program Project1;

uses
  Vcl.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  ControllersUnit in 'ControllersUnit.pas',
  PhisicsControllerUnit in 'PhisicsControllerUnit.pas',
  MenuUnit in 'MenuUnit.pas',
  MainUnit in 'MainUnit.pas',
  AdaptersUnit in 'AdaptersUnit.pas',
  AccessAdapterUnit in 'AccessAdapterUnit.pas',
  TestsUnit in 'TestsUnit.pas',
  Test1Unit in 'Test1Unit.pas',
  PhisicsControllerExceptionUnit in 'PhisicsControllerExceptionUnit.pas',
  AccessAdapterExceptionUnit in 'AccessAdapterExceptionUnit.pas',
  MenuExceptionUnit in 'MenuExceptionUnit.pas',
  Test1ExceptionUnit in 'Test1ExceptionUnit.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
