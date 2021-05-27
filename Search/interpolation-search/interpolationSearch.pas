unit interpolationSearch;

interface

uses
  System.SysUtils, System.Variants, System.Classes, System.Generics.Collections;

type
  TSearch = class
  private

  public
    constructor Create;
    function interpolationSearch(sortedArray: TArray<Double>; seekElement: Double): Double;
end;

implementation

{ TSearch }

constructor TSearch.Create;
begin
 inherited;
end;

function TSearch.interpolationSearch(sortedArray: TArray<Double>;
  seekElement: Double): Double;
var
  rangeDelta: Double;
  indexDelta: integer;
  valueDelta: Double;
  leftIndex: integer;
  rightIndex: integer;
  middleIndex: integer;
begin
   leftIndex := 0;
   rightIndex := Length(sortedArray) - 1;

  while (leftIndex <= rightIndex)  do
  begin
     rangeDelta := sortedArray[rightIndex] - sortedArray[leftIndex];
     indexDelta := rightIndex - leftIndex;
     valueDelta := seekElement - sortedArray[leftIndex];


    if (valueDelta < 0) then
      exit(-1);


    // If range delta is zero then subarray contains all the same numbers
    // and thus there is nothing to search for unless this range is all
    // consists of seek number.
    if (rangeDelta = 0) then
      // By doing this we're also avoiding division by zero while
      // calculating the middleIndex later.
      if sortedArray[leftIndex] = seekElement then
         exit(leftIndex) else
         exit(-1);


    // Do interpolation of the middle index.
    middleIndex := leftIndex + Trunc((valueDelta * indexDelta) / rangeDelta);

    // If we've found the element just return its position.
    if (sortedArray[middleIndex] = seekElement)  then
      exit(middleIndex);


    // Decide which half to choose for seeking next: left or right one.
    if (sortedArray[middleIndex] < seekElement) then
      // Go to the right half of the array.
      leftIndex := middleIndex + 1
     else
      // Go to the left half of the array.
      rightIndex := middleIndex - 1;


  end;

  Result := -1;
end;

end.
