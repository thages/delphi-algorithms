unit binarySearch;

interface

uses System.SysUtils, System.Variants, System.Classes, System.Generics.Collections;

type
  TBinarySearch = class
     public
     constructor Create;
      function binarySearch(sortedArray:TArray<extended>; seekElement:extended): extended;
  end;
implementation

{ TBinarySearch }

function TBinarySearch.binarySearch(sortedArray:TArray<extended>; seekElement:extended): extended;
var
  startIndex: integer;
  endIndex: integer;
  middleIndex: integer;
begin
  startIndex := 0;
  endIndex := Length(sortedArray) - 1;


  while (startIndex <= endIndex) do
  begin
    middleIndex := startIndex + trunc((endIndex - startIndex) / 2);

    if (sortedArray[middleIndex] = seekElement) then
      exit(middleIndex);



    if (sortedArray[middleIndex] < seekElement) then
      startIndex := middleIndex + 1
     else
      endIndex := middleIndex - 1;

  end;

  result := -1;

end;

constructor TBinarySearch.Create;
begin
  inherited;
end;

end.
