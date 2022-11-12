unit frame;

interface

uses System.SysUtils, drawable;

const NUM_COLS  = 80;
const NUM_ROWS  = 40;

type

TFrame = class(TInterfacedObject, IInterface)
strict private
  FGrid: Array[1..NUM_COLS, 1..NUM_ROWS] of char;
  class var FInstance: TFrame;
  constructor Create;
public
  function New: TFrame;
  procedure SetChar(col, row : UInt8; c: char);
  function GetChar(col, row  : UInt8) : char;
end;

implementation

{ TFrame }

constructor TFrame.Create;
var
  I: Integer;
  II: Integer;
begin
  for I := 1 to NUM_COLS do
    for II := 1 to NUM_ROWS do
      FGrid[i,ii] := char(' ');
end;

function TFrame.GetChar(col, row : UInt8): char;
begin
  result := FGrid[col, row]

end;

function TFrame.New: TFrame;
begin
  if Assigned(FInstance) then
    Exit(FInstance);

  FInstance := TFrame.Create;
  Result := FInstance;
end;

procedure TFrame.SetChar(col, row : UInt8; c: char);
begin
  FGrid[col, row ] := c;
end;

end.
