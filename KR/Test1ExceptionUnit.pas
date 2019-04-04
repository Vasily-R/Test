unit Test1ExceptionUnit;

interface

uses
  TestsUnit,
  System.Generics.Collections, Test1Unit, sysUtils, dialogs;

type
  Test1Exception = class(TInterfacedObject, Tests)
  private
    TestSource: Test1;
  public
    procedure setTest(caption: string);
    function getQuest: TList<String>;
    function getAnswer: TList<String>;
    function getCorrect: TDictionary<integer, integer>;
  published
    constructor create;
  end;

implementation

{ Test1Exception }

constructor Test1Exception.create;
begin
  try
    TestSource := Test1.create;
    TestSource.create;
  except
    on E: Exception do
      showmessage('Error in Test1.create' + E.Message);
  end;
end;

function Test1Exception.getAnswer: TList<String>;
begin
  try
    result := TestSource.getAnswer;
  except
    on E: Exception do
      showmessage('Error in Test1.getAnswer' + E.Message);
  end;
end;

function Test1Exception.getCorrect: TDictionary<integer, integer>;
begin
  try
    result := TestSource.getCorrect;
  except
    on E: Exception do
      showmessage('Error in Test1.getCorrect' + E.Message);
  end;
end;

function Test1Exception.getQuest: TList<String>;
begin
  try
    result := TestSource.getQuest;
  except
    on E: Exception do
      showmessage('Error in Test1.getQuest' + E.Message);
  end;
end;

procedure Test1Exception.setTest(caption: string);
begin
  try
    TestSource.setTest(caption);
  except
    on E: Exception do
      showmessage('Error in Test1.setTest(caption: string)' + E.Message);
  end;
end;

end.
