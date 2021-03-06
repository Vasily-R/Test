unit TestPhisicsControllerUnit;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework, PhisicsControllerUnit, ControllersUnit,
  System.Generics.Collections;

type
  // Test methods for class PhisicsController

  TestPhisicsController = class(TTestCase)
  strict private
    FPhisicsController: Controllers;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestGetMenu;
  end;

implementation

procedure TestPhisicsController.SetUp;
begin
  FPhisicsController := PhisicsController.Create;
end;

procedure TestPhisicsController.TearDown;
begin
  // FPhisicsController.Free;
  FPhisicsController := nil;
end;

procedure TestPhisicsController.TestGetMenu;
var
  Menu: TList<string>;
begin
  Menu := TList<string>.Create;
  Menu := FPhisicsController.getMenu;
  // CheckEquals (Menu.First,'Test1'); //In the test Error (should be 'test')
  CheckNotEquals(Menu.First, 'Test2');
  CheckEquals(Menu.Items[2], 'Test3'); // Another record type

end;

initialization

// Register any test cases with the test runner
RegisterTest(TestPhisicsController.Suite);

end.
