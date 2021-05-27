unit TestbinarySearch;

interface

uses
  TestFramework, System.Generics.Collections, System.SysUtils, System.Variants,
  binarySearch, System.Classes;

type

  TestTBinarySearch = class(TTestCase)
  strict private
    FBinarySearch: TBinarySearch;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestbinarySearch;
  end;

implementation

procedure TestTBinarySearch.SetUp;
begin
  FBinarySearch := TBinarySearch.Create;
end;

procedure TestTBinarySearch.TearDown;
begin
  FBinarySearch.Free;
  FBinarySearch := nil;
end;

procedure TestTBinarySearch.TestbinarySearch;
begin
  Assert(FBinarySearch.binarySearch([], 1) = -1);
  Assert(FBinarySearch.binarySearch([1], 1) = 0);
  Assert(FBinarySearch.binarySearch([1, 2], 1) = 0);
  Assert(FBinarySearch.binarySearch([1, 2], 2) = 1);
  Assert(FBinarySearch.binarySearch([1, 5, 10, 12], 1) = 0);
  Assert(FBinarySearch.binarySearch([1, 5, 10, 12, 14, 17, 22, 100], 17) = 5);
  Assert(FBinarySearch.binarySearch([1, 5, 10, 12, 14, 17, 22, 100], 1) = 0);
  Assert(FBinarySearch.binarySearch([1, 5, 10, 12, 14, 17, 22, 100], 100) = 7);
  Assert(FBinarySearch.binarySearch([1, 5, 10, 12, 14, 17, 22, 100], 0) = -1);
end;

initialization
  // Register any test cases with the test runner
  RegisterTest(TestTBinarySearch.Suite);
end.

