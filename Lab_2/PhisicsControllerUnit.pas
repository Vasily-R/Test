unit PhisicsControllerUnit;

interface

uses
  Test1Unit,
  TestsUnit,
  MenuUnit,
  MainUnit,
  ControllersUnit,
  System.Generics.Collections,
  SysUtils,
  Dialogs;

type
  EPhisicsControllerError = class(Exception);
  // var
  // ErrorCondition: Boolean;
  // end;

  PhisicsController = class(TInterfacedObject, Controllers)
  private
    Test: Tests;
    /// <link>aggregation</link>
    Menu1: Main;
  public
    procedure setTest(caption: string);
    function getMenu: TList<string>;
    function getQuest: TList<string>;
    function getAnswer: TList<string>;
    function getCorrect: TDictionary<integer, integer>;
  end;

implementation

function PhisicsController.getAnswer: TList<string>;
// var
// d: real;
begin
  try
    // d := 3 / 0;
    result := TList<string>.create;
    result := Test.getAnswer;
    raise EPhisicsControllerError.create('1');
  except
    on E: EPhisicsControllerError do
      ShowMessage(E.Message);
  end;

end;

function PhisicsController.getCorrect: TDictionary<integer, integer>;
begin
  try
    result := TDictionary<integer, integer>.create;
    result := Test.getCorrect;
    raise EPhisicsControllerError.create('2');
  except
    on E: EPhisicsControllerError do
      ShowMessage(E.Message);
  end;
end;

function PhisicsController.getMenu: TList<string>;
begin
  try
    result := TList<string>.create;
    Menu1 := Menu.create;
    result := Menu1.getMenu;
    raise EPhisicsControllerError.create('3');
  except
    on E: EPhisicsControllerError do
      ShowMessage(E.Message);
  end;
  // result.Add('Test');
  // result.Add('Test2');
  // result.Add('Test3');
end;

function PhisicsController.getQuest: TList<string>;
begin
  try
    result := TList<string>.create;
    result := Test.getQuest;
    raise EPhisicsControllerError.create('4');
  except
    on E: EPhisicsControllerError do
      ShowMessage(E.Message);
  end;
end;

procedure PhisicsController.setTest(caption: string);
begin
  try
    Test := Test1.create;
    Test.setTest(caption);
    raise EPhisicsControllerError.create('5');
  except
    on E: EPhisicsControllerError do
      ShowMessage(E.Message);
  end;
end;

end.
