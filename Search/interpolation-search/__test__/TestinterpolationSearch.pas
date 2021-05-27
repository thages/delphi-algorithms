unit TestinterpolationSearch;

interface

uses
  TestFramework, System.Classes, System.Generics.Collections, System.Variants,
  System.SysUtils, interpolationSearch;

type

  TestTSearch = class(TTestCase)
  strict private
    FSearch: TSearch;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestinterpolationSearch;
  end;

implementation

procedure TestTSearch.SetUp;
begin
  FSearch := TSearch.Create;
end;

procedure TestTSearch.TearDown;
begin
  FSearch.Free;
  FSearch := nil;
end;

procedure TestTSearch.TestinterpolationSearch;
begin
  Assert(FSearch.interpolationSearch([1], 1)=0);
  Assert(FSearch.interpolationSearch([1], 0)=-1);
  Assert(FSearch.interpolationSearch([1, 1], 1)=0);
  Assert(FSearch.interpolationSearch([1, 2], 1)=0);
  Assert(FSearch.interpolationSearch([1, 2], 2)=1);
  Assert(FSearch.interpolationSearch([10, 20, 30, 40, 50], 40)=3);
  Assert(FSearch.interpolationSearch([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], 14)=13);
  Assert(FSearch.interpolationSearch([1, 6, 7, 8, 12, 13, 14, 19, 21, 23, 24, 24, 24, 300], 24)=10);
  Assert(FSearch.interpolationSearch([1, 2, 3, 700, 800, 1200, 1300, 1400, 1900], 600)=-1);
  Assert(FSearch.interpolationSearch([1, 2, 3, 700, 800, 1200, 1300, 1400, 1900], 1)=0);
  Assert(FSearch.interpolationSearch([1, 2, 3, 700, 800, 1200, 1300, 1400, 1900], 2)=1);
  Assert(FSearch.interpolationSearch([1, 2, 3, 700, 800, 1200, 1300, 1400, 1900], 3)=2);
  Assert(FSearch.interpolationSearch([1, 2, 3, 700, 800, 1200, 1300, 1400, 1900], 700)=3);
  Assert(FSearch.interpolationSearch([1, 2, 3, 700, 800, 1200, 1300, 1400, 1900], 800)=4);
  Assert(FSearch.interpolationSearch([0, 2, 3, 700, 800, 1200, 1300, 1400, 1900], 1200)=5);
  Assert(FSearch.interpolationSearch([1, 2, 3, 700, 800, 1200, 1300, 1400, 19000], 800)=4);
  Assert(FSearch.interpolationSearch([0, 10, 11, 12, 13, 14, 15], 10)=1);

end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTSearch.Suite);
end.

