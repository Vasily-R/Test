unit Test1LoggingUnit;

interface

uses
  TestsUnit, System.Generics.Collections,
  Test1ExceptionUnit, sysUtils, CodeSiteLogging;

type
  Test1Logging = class(TInterfacedObject, Tests)
  private
    /// <link>aggregation</link>
    Test1Except: Test1Exception;
  public
    procedure setTest(caption: string);
    function getQuest: TList<String>;
    function getAnswer: TList<String>;
    function getCorrect: TDictionary<integer, integer>;
  published
    constructor create;
  end;

implementation

{ Test1Logging }

constructor Test1Logging.create;
begin
  CodeSite.Send('Test1.create');
  Test1Except := Test1Exception.create;
  Test1Except.create;
end;

function Test1Logging.getAnswer: TList<String>;
begin
  CodeSite.Send('Test1.getAnswer');
  result := Test1Except.getAnswer;
end;

function Test1Logging.getCorrect: TDictionary<integer, integer>;
begin
  CodeSite.Send('Test1.getCorrect');
  result := Test1Except.getCorrect;
end;

function Test1Logging.getQuest: TList<String>;
begin
  CodeSite.Send('Test1.getQuest');
  result := Test1Except.getQuest;
end;

procedure Test1Logging.setTest(caption: string);
begin
  CodeSite.Send('Test1.setTest');
  Test1Except.setTest(caption);
end;

end.
