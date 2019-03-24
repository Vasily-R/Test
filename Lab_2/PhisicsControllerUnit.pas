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
  Dialogs,
  CodeSiteLogging;

const  //
  a = 3;
  b = 2;
  c = 5;
  d = 4;
  e = 1;

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
begin
  try
    result := TList<string>.create;
    result := Test.getAnswer;
    raise EPhisicsControllerError.create('1');
  except
    on e: EPhisicsControllerError do
      ShowMessage(e.Message);
  end;
  CodeSite.Send('getAnswer');
  CodeSite.Send('A', a);
  CodeSite.Assert(a < b, 'Error');

end;

function PhisicsController.getCorrect: TDictionary<integer, integer>;
begin
  try
    result := TDictionary<integer, integer>.create;
    result := Test.getCorrect;
    raise EPhisicsControllerError.create('2');
  except
    on e: EPhisicsControllerError do
      ShowMessage(e.Message);
  end;
  CodeSite.Send('getCorrect');
  CodeSite.Send('B', b);
  CodeSite.Assert(c < b, 'Error');
end;

function PhisicsController.getMenu: TList<string>;
begin
  try
    result := TList<string>.create;
    Menu1 := Menu.create;
    result := Menu1.getMenu;
    raise EPhisicsControllerError.create('3');
  except
    on e: EPhisicsControllerError do
      ShowMessage(e.Message);
  end;
  // result.Add('Test');
  // result.Add('Test2');
  // result.Add('Test3');
  CodeSite.Send('getMenu');
  CodeSite.Send('C', c);
  CodeSite.Assert(c < a, 'Error');
end;

function PhisicsController.getQuest: TList<string>;
begin
  try
    result := TList<string>.create;
    result := Test.getQuest;
    raise EPhisicsControllerError.create('4');
  except
    on e: EPhisicsControllerError do
      ShowMessage(e.Message);
  end;
  CodeSite.Send('getQuest');
  CodeSite.Send('D', d);
  CodeSite.Assert(c < d, 'Error');
end;

procedure PhisicsController.setTest(caption: string);
begin
  try
    Test := Test1.create;
    Test.setTest(caption);
    raise EPhisicsControllerError.create('5');
  except
    on e: EPhisicsControllerError do
      ShowMessage(e.Message);
  end;
  CodeSite.Send('setTest');
  CodeSite.Send('E', e);
  CodeSite.Assert(c < e, 'Error');
end;

end.
