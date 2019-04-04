unit PhisicsControllerExceptionUnit;

interface

uses
  {Test1Unit,
    TestsUnit,
    MenuUnit,
    MainUnit,}
  PhisicsControllerUnit,
  ControllersUnit,
  System.Generics.Collections,
  Dialogs,
  SysUtils;

type
  PhisicsControllerException = class(TInterfacedObject, Controllers)
  private
    PhisicsControllerSource: PhisicsController;
  public
    procedure setTest(caption: string);
    function getMenu: TList<string>;
    function getQuest: TList<string>;
    function getAnswer: TList<string>;
    function getCorrect: TDictionary<integer, integer>;
  end;

implementation

{ PhisicsControllerException }

function PhisicsControllerException.getAnswer: TList<string>;
begin
  try
    result := TList<string>.create;
    result := PhisicsControllerSource.getAnswer;
  except
    on E: Exception do
      ShowMessage('Error in PhisicsController.getAnswer' + E.Message);
  end;
end;

function PhisicsControllerException.getCorrect: TDictionary<integer, integer>;
begin
  try
    result := TDictionary<integer, integer>.create;
    result := PhisicsControllerSource.getCorrect;
  except
    on E: Exception do
      ShowMessage('Error in PhisicsController.getCorrect' + E.Message);
  end;
end;

function PhisicsControllerException.getMenu: TList<string>; { }
begin
  // PhisicsControllerSource := PhisicsController.create;
  try
    result := TList<string>.create;
    PhisicsControllerSource := PhisicsController.create;
    result := PhisicsControllerSource.getMenu;
  except
    on E: Exception do
      ShowMessage('Error in PhisicsController.getMenu' + E.Message);
  end;

end;

function PhisicsControllerException.getQuest: TList<string>;
begin
  try
    result := TList<string>.create;
    result := PhisicsControllerSource.getQuest;
  except
    on E: Exception do
      ShowMessage('Error in PhisicsController.getQuest' + E.Message);
  end;
end;

procedure PhisicsControllerException.setTest(caption: string); { }
begin
   try
   //Test := Test1.create;
    PhisicsControllerSource.setTest(caption);
  except
    on E:Exception do
      showmessage('Error in PhisicsController.setTest'+E.Message);
  end;
end;

end.
