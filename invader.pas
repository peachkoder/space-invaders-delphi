unit invader;

interface

uses Drawable
    , Frame
    , Vcl.ExtCtrls
    , System.Classes
    ;

type

  TInvader = record
    X, Y  : UInt16;
    Point : UInt16;

  end;
  PInvader= ^TInvader;

  TInvaders = class(TInterfacedObject, IDrawable<TFrame>)
  strict private
    FArmy: TList;
    FTotal_Count: Uint16;
    FMove_Timer: TTimer;
    FDirection: Cardinal;
    FTypo  : Boolean;
  public
      constructor Create;
      destructor Destroy; override;
      procedure Draw(Item: TFrame);
      function Update(delta: Cardinal): Boolean;
      function IsAllKilled : Boolean;
      function IskillInvaderAt(x, y: UInt16) : UInt16;
      function ReachedBottom(): Boolean;
      property Army: TList read FArmy;
      property TotalCount: UInt16 read FTotal_Count write FTotal_Count;
  end;

implementation

{ TInvaders }

constructor TInvaders.Create;
begin
  FArmy:= TList.Create;

  for var x:= 0 to NUM_COLS-1 do
    for var y:= 0 to NUM_ROWS-1 do
      if (x > 1) and (x < NUM_COLS - 2) and (y > 0 )
         and ( y < 9) and  (x mod 2 = 0) and (Y mod 2 = 0)  then
         begin
            var invader : TInvader;
            invader.X := X;
            invader.Y := Y;
            invader.Point := 1;
            FArmy.Add(@invader);
         end;
  FTotal_Count := FArmy.Count;
  FMove_Timer.Interval := 2000;
end;

destructor TInvaders.Destroy;
begin
  FArmy.Free;
  inherited;
end;

procedure TInvaders.Draw(Item: TFrame);
var invader: PInvader;
begin
  FTypo := not FTypo;
  for var i := 0 to FArmy.Count - 1 do
    if FTypo then
      Item.SetChar(PInvader(FArmy[i]).X, PInvader(FArmy[i]).Y, 'x')
    else
      Item.SetChar(PInvader(FArmy[i]).X, PInvader(FArmy[i]).Y, '+');
end;

function TInvaders.IsAllKilled: Boolean;
begin
  Result := FArmy.Count = 0;
end;

function TInvaders.IskillInvaderAt(x, y: UInt16): UInt16;
var invader: PInvader;
begin
  for var i := 0 to FArmy.Count - 1 do
  begin
    invader := FArmy[i];
    if (invader.X = x) and (invader.Y = y) then
      Exit(invader.Point);
  end;
end;

function TInvaders.ReachedBottom: Boolean;
begin
  for var i := 0 to FArmy.Count - 1 do
    if PInvader(FArmy[i]).Y >= NUM_ROWS -1  then
      Exit(true);

  Result := False;
end;

function TInvaders.Update(delta: Cardinal): Boolean;
begin

end;

end.
