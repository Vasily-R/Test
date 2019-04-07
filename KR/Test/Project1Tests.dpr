program Project1Tests;
{

  Delphi DUnit Test Project
  -------------------------
  This project contains the DUnit test framework and the GUI/Console test runners.
  Add "CONSOLE_TESTRUNNER" to the conditional defines entry in the project options
  to use the console test runner.  Otherwise the GUI test runner will be used by
  default.

}

{$IFDEF CONSOLE_TESTRUNNER}
{$APPTYPE CONSOLE}
{$ENDIF}

uses
  Forms,
  TestFramework,
  GUITestRunner,
  TextTestRunner,
  TestPhisicsControllerUnit in 'TestPhisicsControllerUnit.pas',
  PhisicsControllerUnit in '..\PhisicsControllerUnit.pas',
  ControllersUnit in '..\ControllersUnit.pas',
  MainUnit in '..\MainUnit.pas',
  Test1Unit in '..\Test1Unit.pas',
  TestsUnit in '..\TestsUnit.pas',
  AdaptersUnit in '..\AdaptersUnit.pas',
  AccessAdapterUnit in '..\AccessAdapterUnit.pas',
  MenuUnit in '..\MenuUnit.pas',
  TestMenuUnit in 'TestMenuUnit.pas',
  TestTest1Unit in 'TestTest1Unit.pas',
  AccessAdapterLoggingUnit in '..\AccessAdapterLoggingUnit.pas',
  PhisicsLoggingUnit in '..\PhisicsLoggingUnit.pas',
  MenuLoggingUnit in '..\MenuLoggingUnit.pas',
  Test1LoggingUnit in '..\Test1LoggingUnit.pas',
  Test1ExceptionUnit in '..\Test1ExceptionUnit.pas',
  MenuExceptionUnit in '..\MenuExceptionUnit.pas',
  AccessAdapterExceptionUnit in '..\AccessAdapterExceptionUnit.pas',
  PhisicsControllerExceptionUnit in '..\PhisicsControllerExceptionUnit.pas',
  TestAccessAdapterUnit in 'TestAccessAdapterUnit.pas';

{$R *.RES}

begin
  Application.Initialize;
  if IsConsole then
    with TextTestRunner.RunRegisteredTests do
      Free
  else
    GUITestRunner.RunRegisteredTests;
end.

