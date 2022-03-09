unit knuthMorrisPratt;

interface

uses System.SysUtils, System.Variants, System.Classes, dynamicArray;

type
  TKnuthMorrisPratt = class
    function buildPatternTable(expression: string):  TDynamicArray<Integer>;
    function knuthMorrisPratt(text: string; expression: string) : integer;
  end;

implementation

{ TKnuthMorrisPratt }

function TKnuthMorrisPratt.buildPatternTable(expression: string):  TDynamicArray<Integer>;
var
  patternTable : TDynamicArray<Integer>;
begin
  patternTable :=  TDynamicArray<Integer>.Create;

  patternTable.Add(0);

  var prefixIndex := 0;
  var suffixIndex := 1;

  while (suffixIndex < expression.Length) do
  begin
    if (expression[prefixIndex + 1] = expression[suffixIndex + 1]) then
    begin
      patternTable[suffixIndex] := prefixIndex + 1;
      Inc(suffixIndex);
      Inc(prefixIndex);
    end
    Else if (prefixIndex = 0 ) then
    begin
      patternTable[suffixIndex] := 0;
      Inc(suffixIndex);
    end
    Else
      prefixIndex := patternTable[prefixIndex - 1];
  end;

  Result :=  patternTable;

end;

function TKnuthMorrisPratt.knuthMorrisPratt(text, expression: string): integer;
var
  patternTable : TDynamicArray<Integer>;
begin
  if expression.Length = 0 then
    exit(0);

  var textIndex := 0;
  var expressionIndex := 0;

  patternTable := buildPatternTable(expression);

  while (textIndex < text.length) do
  begin
    if (text[textIndex + 1] = expression[expressionIndex + 1]) then
    begin
       // We've found a match.
      if (expressionIndex = expression.length - 1) then
        exit( (textIndex - expression.length) + 1 );

      Inc(expressionIndex);
      Inc(textIndex);
    end
    else if (expressionIndex > 0) then
      expressionIndex := patternTable[expressionIndex - 1]
    else
      Inc(textIndex);
  end;

  Result := -1;

  patternTable.Free;
end;

end.
