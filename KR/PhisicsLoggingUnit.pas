unit PhisicsLoggingUnit;

interface

uses
  SysUtils, System.Generics.Collections,
  ControllersUnit, PhisicsControllerExceptionUnit, CodeSiteLogging;

type
  PhisicsControllerLogging = class(TInterfacedObject, Controllers)
  private
    /// <link>aggregation</link>
    PhisicsControllerExcept: PhisicsControllerException;
  public
    procedure setTest(caption: string);
    function getMenu: TList<String>;
    function getQuest: TList<String>;
    function getAnswer: TList<String>;
    function getCorrect: TDictionary<integer, integer>;
  end;

implementation

{ PhisicsControllerLogging }

function PhisicsControllerLogging.getAnswer: TList<String>;
begin
  result := TList<string>.create;
  result := PhisicsControllerExcept.getAnswer;
  CodeSite.Send('PhisicsControllerLogging.getAnswer');
end;

function PhisicsControllerLogging.getCorrect: TDictionary<integer, integer>;
begin
  result := TDictionary<integer, integer>.create;
  result := PhisicsControllerExcept.getCorrect;
  CodeSite.Send('PhisicsControllerLogging.getCorrect');
end;

function PhisicsControllerLogging.getMenu: TList<String>;
begin
  PhisicsControllerExcept := PhisicsControllerException.create;
  result := TList<string>.create;
  result := PhisicsControllerExcept.getMenu;
  CodeSite.Send('PhisicsControllerLogging.getMenu');
end;

function PhisicsControllerLogging.getQuest: TList<String>;
begin
  result := TList<string>.create;
  result := PhisicsControllerExcept.getQuest;
  CodeSite.Send('PhisicsControllerLogging.getQuest');
end;

procedure PhisicsControllerLogging.setTest(caption: string);
begin
  PhisicsControllerExcept.setTest(caption);
  CodeSite.Send('PhisicsControllerLogging.setTest');
end;

end.
