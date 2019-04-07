unit MenuUnit;

interface

uses
  //AccessAdapterUnit,
  AdaptersUnit,
  System.Generics.Collections,AccessAdapterLoggingUnit,
  MainUnit;

type
  Menu = class(TInterfacedObject, Main)
    // private
  public //
    /// <link>aggregation</link>
    Adapter1: Adapters;
    function getMenu: TList<string>;
  end;

implementation

function Menu.getMenu: TList<string>;
begin
  result := TList<string>.create;
  Adapter1:=AccessAdapterLogging.Create;
  result := Adapter1.getMenu;
end;

end.
