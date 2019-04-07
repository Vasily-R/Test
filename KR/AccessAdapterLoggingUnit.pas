unit AccessAdapterLoggingUnit;

interface

uses
  SysUtils, System.Generics.Collections,
  AdaptersUnit, AccessAdapterExceptionUnit,
  CodeSiteLogging;

type
  AccessAdapterLogging = class(TInterfacedObject, Adapters)
  private
    /// <link>aggregation</link>
    AccessAdapterExcept: AccessAdapterException;
  public
    function getAnswerTableName: string;
    function getAnswerTable(answer: string): TList<string>;
    function getCorrectTableName: string;
    function getCorrectTable(correct: string): TDictionary<integer, integer>;
    function getQuestTableName: string;
    function getQuestTable(quest: string): TList<string>;
    function getMenu: TList<string>;
    procedure setTest(caption: string);
    function getQuest: TList<String>;
    function getAnswer: TList<String>;
    function getCorrect: TDictionary<integer, integer>;
  published
    constructor create;
  end;

implementation

{ AccessAdapterLogging }

constructor AccessAdapterLogging.create;
begin
  CodeSite.Send('AccessAdapter.create;');
  AccessAdapterExcept := AccessAdapterException.create;
  AccessAdapterExcept.create;
end;

function AccessAdapterLogging.getAnswer: TList<String>;
begin
  CodeSite.Send('AccessAdapter.getAnswer');
  result := AccessAdapterExcept.getAnswer;
end;

function AccessAdapterLogging.getAnswerTable(answer: string): TList<string>;
begin
  CodeSite.Send('AccessAdapter.getAnswerTable');
  result := AccessAdapterExcept.getAnswerTable(answer);
end;

function AccessAdapterLogging.getAnswerTableName: string;
begin
  CodeSite.Send('AccessAdapter.getAnswerTableName');
  result := AccessAdapterExcept.getAnswerTableName;
end;

function AccessAdapterLogging.getCorrect: TDictionary<integer, integer>;
begin
  CodeSite.Send('AccessAdapter.getCorrect');
  result := AccessAdapterExcept.getCorrect;
end;

function AccessAdapterLogging.getCorrectTable(correct: string)
  : TDictionary<integer, integer>;
begin
  CodeSite.Send('AccessAdapter.getCorrectTable');
  result := AccessAdapterExcept.getCorrectTable(correct);
end;

function AccessAdapterLogging.getCorrectTableName: string;
begin
  CodeSite.Send('AccessAdapter.getCorrectTableName');
  result := AccessAdapterExcept.getCorrectTableName;
end;

function AccessAdapterLogging.getMenu: TList<string>;
begin
  CodeSite.Send('AccessAdapter.getMenu');
  result := AccessAdapterExcept.getMenu;
end;

function AccessAdapterLogging.getQuest: TList<String>;
begin
  CodeSite.Send('AccessAdapterExcept.getQuest');
  result := AccessAdapterExcept.getQuest;
end;

function AccessAdapterLogging.getQuestTable(quest: string): TList<string>;
begin
  CodeSite.Send('AccessAdapter.getQuestTable');
  result := AccessAdapterExcept.getQuestTable(quest);
end;

function AccessAdapterLogging.getQuestTableName: string;
begin
  CodeSite.Send('AccessAdapter.getQuestTableName');
  result := AccessAdapterExcept.getQuestTableName;
end;

procedure AccessAdapterLogging.setTest(caption: string);
begin
  CodeSite.Send('AccessAdapter.getAnswer');
  AccessAdapterExcept.setTest(caption);
end;

end.
