unit dynamicArray;

interface

uses System.SysUtils, System.Variants, System.Classes, System.Generics.Collections;

type
  iArray<T> = interface
    procedure Add(Value : T);
  end;

  TDynamicArray<T> = class(TInterfacedObject, iArray<T>)
  private
    FArray : TArray<T>;
    function GetValue(Index: Integer): T;
    procedure SetValue(Index: Integer; const Value: T);
  public
    procedure Add(Value : T);
    property Values[Index: Integer]: T read GetValue write SetValue; Default;
  end;



implementation

{ TControllerObserver }


{ TDynamicArray<T> }

procedure TDynamicArray<T>.Add(Value: T);
begin
  SetLength(FArray, Length(FArray) + 1);
  FArray[High(FArray)] := Value;
end;

function TDynamicArray<T>.GetValue(Index: Integer): T;
begin
  if (Index < 0) or (Index > Pred(Length(FArray))) then
    raise Exception.Create('Invalid Index');

  Result := FArray[Index];

end;

procedure TDynamicArray<T>.SetValue(Index: Integer; const Value: T);
begin
  if (Index < 0) then
    raise Exception.Create('Invalid Index')
  else if (Index > Pred(Length(FArray))) then
    Self.Add(Value);

  FArray[Index] := Value;
end;

end.
