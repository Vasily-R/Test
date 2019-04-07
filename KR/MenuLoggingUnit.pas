unit MenuLoggingUnit;

interface

uses
  MainUnit, MenuExceptionUnit,
  System.Generics.Collections, dialogs, sysUtils, CodeSiteLogging;

type
  MenuLogging = class(TInterfacedObject, Main)
  private
    /// <link>aggregation</link>
    MenuExcept: MenuException;
  public
    function getMenu: TList<string>;
  end;

implementation

{ MenuLogging }

function MenuLogging.getMenu: TList<string>;
begin
  CodeSite.Send('Menu.getMenu');
  result := TList<string>.create;
  MenuExcept := MenuException.create;
  result := MenuExcept.getMenu;
end;

end.
