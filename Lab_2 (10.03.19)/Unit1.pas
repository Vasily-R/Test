unit Unit1;

interface

uses
  // Winapi.Windows,
  // Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  // System.Types, //
  // System.UITypes, //

  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  System.Generics.Collections,
  ControllersUnit,
  PhisicsControllerUnit,
  Vcl.ExtCtrls, //
  Vcl.stdctrls; //


// FMX.Types, FMX.Controls, FMX.Forms, FMX.Dialogs;
// подключение библиотеки

type
  TForm1 = class(TForm)
    procedure FormCreate(Sender: TObject);
  private
    list: TList<string>;
    // labels: TList<Tlabel>;
    // Panels: TList<TPanel>;
    Buttons: TList<Tbutton>;
    /// <link>aggregation</link>
    Controller1: Controllers;
    // procedure destroyPanels;
    procedure destroyButtons;
    procedure createPanels(list: TList<String>);
  public
    procedure onClick1(Sender: TObject);
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.{ destroyPanels } destroyButtons;
{ var
  S: string; }
begin
  { for S in list do
    begin
    with { Panels }{ Buttons.Last do
    begin
    parent := nil;
    destroy;
    end;
    end; }
end;

procedure TForm1.createPanels(list: TList<String>);
var
  i: integer;
  S: string;
begin
  i := 0;
  // labels := TList<Tlabel>.create;
  { Panels } Buttons := TList< { TPanel } Tbutton>.create;
  self.list := TList<String>.create;
  self.list := list;
  for S in list do
  begin
    Buttons { Panels } { labels }.Add
      ( { Tlabel } { TPanel } Tbutton.create(self));
    with Buttons { Panels } { labels }.Last do
    begin
      parent := self;
      top { position.y } := i * 41;
      caption { text } := S;
      width := 300;
      onClick := onClick1;
    end;
    i := i + 1;
  end;

end;

procedure TForm1.FormCreate(Sender: TObject);
var
  list: TList<String>;
begin
  Controller1 := PhisicsController.create;
  list := TList<String>.create;
  list := Controller1.getMenu;
  // createPanels(Controller1.getMenu);
  createPanels(list);
end;

procedure TForm1.onClick1(Sender: TObject);
var
  quest: TList<string>;
  answer: TList<string>;
  correct: TDictionary<integer, integer>;
begin
  Controller1.setTest((Sender as { Tlabel TPanel } Tbutton).{ text } caption);
  // destroyPanels;
  destroyButtons;
  quest := TList<string>.create;
  answer := TList<string>.create;
  correct := TDictionary<integer, integer>.create;
  quest := Controller1.getQuest;
  answer := Controller1.getAnswer;
  correct := Controller1.getCorrect;
end;

end.
