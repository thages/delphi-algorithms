unit hammingDistance;

interface

uses System.SysUtils, System.Variants, System.Classes;

type
  THammingDistance = class
   public
     function hammingDistance(a, b: string): integer;
   end;

implementation

{ THammingDistance }

function THammingDistance.hammingDistance(a, b: string): integer;
var
  I: Integer;
begin
  if a.Length <> b.Length then
    raise Exception.Create('Strings must be of the same length');

  var distance: integer := 0;

  for I := 0 to Pred(a.Length) do
  begin
    if (a[I] <> b[I]) then
      Inc(distance);
  end;

end;

end.
