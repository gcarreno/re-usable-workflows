unit Tests.HelloWorld;

{$mode objfpc}{$H+}

interface

uses
  Classes
, SysUtils
, fpcunit
{, testutils}
, testregistry
;

type

  TTestHelloWorld= class(TTestCase)
  published
    procedure TestHookUp;
  end;

implementation

procedure TTestHelloWorld.TestHookUp;
begin
  AssertTrue('Assert that true is true', true);
end;



initialization

  RegisterTest(TTestHelloWorld);
end.

