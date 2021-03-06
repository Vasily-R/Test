unit TestTest1Unit;
{

  Delphi DUnit Test Case
  ----------------------
  This unit contains a skeleton test case class generated by the Test Case Wizard.
  Modify the generated code to correctly setup and call the methods from the unit
  being tested.

}

interface

uses
  TestFramework, AdaptersUnit, System.Generics.Collections, Test1Unit,
  TestsUnit,
  AccessAdapterUnit;

type
  // Test methods for class Test1

  TestTest1 = class(TTestCase)
  strict private
    Fest1: Test1;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestsetTest;
    procedure TestgetQuest;
    procedure TestgetAnswer;
    procedure TestgetCorrect;
  end;

implementation

procedure TestTest1.SetUp;
begin
  Fest1 := Test1.Create;
end;

procedure TestTest1.TearDown;
begin
  Fest1.Free;
  Fest1 := nil;
end;

procedure TestTest1.TestsetTest;
var
  caption: string;
  ReturnValue: TList<string>;
begin
  // TODO: Setup method call parameters
  caption := '�������� � ���������� ����������';
  Fest1.setTest(caption);
  ReturnValue := Fest1.getQuest;
  CheckEquals(ReturnValue.Items[4], '��� ����� �������� ������������ �����?');
  CheckNotEquals(ReturnValue.Items[4], '+++');
  CheckNotEquals(ReturnValue.Items[4], ReturnValue.Items[5]);

  // TODO: Validate method results
end;

procedure TestTest1.TestgetQuest;
var
  ReturnValue: TList<string>;
begin
  Fest1.setTest('�������� � ���������� ����������');
  ReturnValue := Fest1.getQuest;
  CheckEquals(ReturnValue.Items[0], '����� ����������� ������������ �����.');
  CheckNotEquals(ReturnValue.Items[0], '+++');
  CheckEquals(ReturnValue.count, 9);
  CheckNotEquals(ReturnValue.count, 11);
  // TODO: Validate method results

end;

procedure TestTest1.TestgetAnswer;
var
  ReturnValue: TList<string>;
begin
  Fest1.setTest('�������� � ���������� ����������');
  ReturnValue := Fest1.getAnswer;
  CheckEquals(ReturnValue.Items[0],
    '����������� ������ (������), �� ������� ��������, �� ���������� ������� ����������������');
  CheckNotEquals(ReturnValue.Items[0], '+++');
  CheckEquals(ReturnValue.Items[9], '������������ �� ������� ��������:');
  CheckNotEquals(ReturnValue.Items[9], '+++');
  CheckEquals(ReturnValue.count, 10);
  CheckNotEquals(ReturnValue.count, 11);
  // TODO: Validate method results
end;

procedure TestTest1.TestgetCorrect;
var
  ReturnValue: TDictionary<integer, integer>;
begin
  Fest1.setTest('�������� � ���������� ����������');
  ReturnValue := Fest1.getCorrect;
  CheckEquals(ReturnValue.Items[13], 3);
  CheckEquals(ReturnValue.Items[14], 4);
  CheckNotEquals(ReturnValue.Items[15], 15);
  CheckEquals(ReturnValue.count, 24);
  // TODO: Validate method results
end;

initialization

// Register any test cases with the test runner
RegisterTest(TestTest1.Suite);

end.
