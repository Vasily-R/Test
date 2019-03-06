unit AccessAdapterUnit;

interface

uses
  SysUtils,
  Data.DB,
  Data.Win.ADODB,
  System.Generics.Collections,
  AdaptersUnit;

type
  AccessAdapter = class(TInterfacedObject, Adapters)
  private
    caption: string;
    ADOConnection: TADOConnection;
    function getAnswer: TList<string>;
    function getAnswerTableName: string;
    function getAnswerTable(answer: string): TList<string>;
    function getMenu: TList<string>;
    //
    procedure setTest(caption: string);
    //
    function getQuest: TList<string>;
    function getQuestTableName: string;
    function getQuestTable(quest: string): TList<string>;
    //
    function getCorrect: TDictionary<integer, integer>;
    function getCorrectTableName: string;
    function getCorrectTable(correct: string): TDictionary<integer, integer>;

  published
    constructor create;
  end;

implementation

constructor AccessAdapter.create;
begin
  ADOConnection := TADOConnection.create(nil);
  with (ADOConnection) do
  begin
    Provider := 'Microsoft.ACE.OLEDB.12.0';
    mode := cmShareDenyNone;
    LoginPrompt := false;
    ConnectionString := 'Provider=Microsoft.ACE.OLEDB.12.0;' +
      'Data Source=Phisics.accdb;' + 'persist security info=false';
    connected := true;
  end;
end;

function AccessAdapter.getQuestTable(quest: string): TList<string>;
var
  ADOQuery: TADOQuery;
begin
  result := TList<string>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    close;
    sql.Clear;
    sql.Add('SELECT caption FROM ' + quest + ';');
    open;
    Active := true;
  end;
  ADOQuery.First;
  while not ADOQuery.Eof do
  begin
    result.Add(ADOQuery.FieldByName('caption').AsString);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

function AccessAdapter.getAnswer: TList<string>;

var
  // ADOQuery: TADOQuery;
  answer: string;
begin
  { result := TList<string>.create;  //
    ADOQuery := TADOQuery.create(nil);
    with (ADOQuery) do
    begin
    Connection := ADOConnection;
    close;
    sql.Clear;
    sql.Add('SELECT answer FROM Main WHERE caption="' + self.caption + '";');
    open;
    Active := true;
    end;
    ADOQuery.First; }
  answer := getAnswerTableName; { ADOQuery.FieldByName('answer').AsString; } //
  // result := TList<string>.create;
  result := getAnswerTable(answer);
  { with (ADOQuery) do
    begin
    close;
    sql.Clear;
    sql.Add('SELECT caption FROM ' + answer + ';');
    open;
    Active := true;
    end;
    while not ADOQuery.Eof do
    begin
    result.Add(ADOQuery.FieldByName('caption').AsString);
    ADOQuery.Next;
    end;
    ADOQuery.Free; }

end;

function AccessAdapter.getAnswerTable(answer: string): TList<string>;
var
  ADOQuery: TADOQuery;
  // answer: string;
begin

  result := TList<string>.create; //
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    close;
    sql.Clear;
    sql.Add('SELECT caption FROM ' + answer + ';');
    open;
    Active := true;
  end;
  while not ADOQuery.Eof do
  begin
    result.Add(ADOQuery.FieldByName('caption').AsString);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

function AccessAdapter.getAnswerTableName: string;
var
  ADOQuery: TADOQuery;
begin
  // result := TList<string>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    close;
    sql.Clear;
    sql.Add('SELECT answer FROM Main WHERE caption="' + self.caption + '";');
    open;
    Active := true;
  end;
  ADOQuery.First;
  result := ADOQuery.FieldByName('answer').AsString; //
end;

function AccessAdapter.getCorrect: TDictionary<integer, integer>; { }
var
  ADOQuery: TADOQuery;
  correct: string;
begin
  { result := TDictionary<integer, integer>.create;
    ADOQuery := TADOQuery.create(nil);
    with (ADOQuery) do
    begin
    Connection := ADOConnection;
    close;
    sql.Clear;
    sql.Add('SELECT correct FROM Main WHERE caption="' + self.caption + '";');
    open;
    Active := true;
    end;
    ADOQuery.First;
    correct := ADOQuery.FieldByName('correct').AsString; }
  //
  correct := getCorrectTableName; { ADOQuery.FieldByName('answer').AsString; }
  // result := TList<string>.create;
  result := getCorrectTable(correct);
  //
  { with (ADOQuery) do
    begin
    close;
    sql.Clear;
    sql.Add('SELECT quest_id,answer_id FROM ' + correct + ';');
    open;
    Active := true;
    end;
    ADOQuery.First;
    while not ADOQuery.Eof do
    begin
    result.Add(StrToInt(ADOQuery.FieldByName('quest_id').AsString),
    StrToInt(ADOQuery.FieldByName('answer_id').AsString));
    ADOQuery.Next;
    end;
    ADOQuery.Free; }
end;

function AccessAdapter.getCorrectTable(correct: string)
  : TDictionary<integer, integer>;
var
  ADOQuery: TADOQuery;
begin
  result := TDictionary<integer, integer>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    close;
    sql.Clear;
    sql.Add('SELECT quest_id,answer_id FROM ' + correct + ';');
    open;
    Active := true;
  end;
  ADOQuery.First;
  while not ADOQuery.Eof do
  begin
    result.Add(StrToInt(ADOQuery.FieldByName('quest_id').AsString),
      StrToInt(ADOQuery.FieldByName('answer_id').AsString));
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

function AccessAdapter.getCorrectTableName: string;
var
  ADOQuery: TADOQuery;
  // correct: string;
begin
  // result := TDictionary<integer, integer>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    close;
    sql.Clear;
    sql.Add('SELECT correct FROM Main WHERE caption="' + self.caption + '";');
    open;
    Active := true;
  end;
  ADOQuery.First;
  { correct } result := ADOQuery.FieldByName('correct').AsString;
end;

function AccessAdapter.getMenu: TList<string>; { }
var
  ADOQuery: TADOQuery;
  DataSource: TDataSource;
begin
  result := TList<string>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    close;
    sql.Clear;
    sql.Add('SELECT caption FROM Main;');
    open;
    Active := true;
  end;
  ADOQuery.First;
  while not ADOQuery.Eof do
  begin
    result.Add(ADOQuery.FieldByName('caption').AsString);
    ADOQuery.Next;
  end;
  ADOQuery.Free;
end;

function AccessAdapter.getQuest: TList<string>; { }
var
  ADOQuery: TADOQuery;
  quest: string;

begin
  { result := TList<string>.create;
    ADOQuery := TADOQuery.create(nil);
    with (ADOQuery) do
    begin
    Connection := ADOConnection;
    close;
    sql.Clear;
    sql.Add('SELECT quest FROM Main WHERE caption="' + self.caption + '";');
    open;
    Active := true;
    end;
    ADOQuery.First;
    quest := ADOQuery.FieldByName('quest').AsString; }
  quest := getQuestTableName; { ADOQuery.FieldByName('answer').AsString; } //
  // result := TList<string>.create;
  result := getQuestTable(quest);
  { with (ADOQuery) do
    begin
    close;
    sql.Clear;
    sql.Add('SELECT caption FROM ' + quest + ';');
    open;
    Active := true;
    end;
    ADOQuery.First;
    while not ADOQuery.Eof do
    begin
    result.Add(ADOQuery.FieldByName('caption').AsString);
    ADOQuery.Next;
    end;
    ADOQuery.Free; }
end;

function AccessAdapter.getQuestTableName: string;
var
  ADOQuery: TADOQuery;
  // quest: string;
begin
  // result := TList<string>.create;
  ADOQuery := TADOQuery.create(nil);
  with (ADOQuery) do
  begin
    Connection := ADOConnection;
    close;
    sql.Clear;
    sql.Add('SELECT quest FROM Main WHERE caption="' + self.caption + '";');
    open;
    Active := true;
  end;
  ADOQuery.First;
  { quest } result := ADOQuery.FieldByName('quest').AsString;

end;

procedure AccessAdapter.setTest(caption: string);
begin
  self.caption := caption;
end;

end.
