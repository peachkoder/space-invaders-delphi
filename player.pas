unit player;

interface

uses System.Classes, Drawable, Frame, Shot;

type

  TPlayer = class(TInterfacedObject, IDrawable<TFrame>)
  private
    FX, FY: UInt8;
    FExploding: boolean;
    Shots: TList;
  public
    constructor Create(x, y: UInt8);
    destructor Destroy; override;
    procedure MoveLeft();
    procedure MoveRight();
    procedure Update(delta: Cardinal);
    procedure Draw(Item: TFrame);
    function Shoot(): boolean;
    function DetectHits: Uint16;

    // function DetectHits() : UInt16;
  end;

implementation

{ TPlayer }

constructor TPlayer.Create(x, y: UInt8);
begin
  FX := NUM_COLS div 2;
  FY := NUM_ROWS - 1 ;
  Shots := TList.Create;
end;

destructor TPlayer.Destroy;
begin
  Shots.free;
  inherited;
end;

function TPlayer.DetectHits: Uint16;
var
  hit_somenthing, hit_count: Uint16;
  Shot: TShot;
begin
  hit_somenthing := 0;
  for var i := 0 to Shots.Count - 1 do
  begin
    Shot := TShot(Shots[i]);
    if not Shot.Exploding then
    begin
      // var hit_count := invader.kill_invader_at(x,y);
      if hit_count > 0 then
      begin
        Inc(hit_somenthing);
        Shot.Explode;
      end;
    end;
  end;

  Result := hit_somenthing;
end;

procedure TPlayer.Draw(Item: TFrame);
begin
  Item.SetChar(Fx, FY, 'A');
  for var i := 0 to Shots.Count - 1 do
    TShot(Shots[i]).Draw(Item);
end;

procedure TPlayer.MoveLeft;
begin
  if FX > 0 then
    Dec(FX);
end;

procedure TPlayer.MoveRight;
begin
  if FX < NUM_COLS - 1 then
    Inc(FX);
end;

function TPlayer.Shoot: boolean;
begin
  if (Shots.Count < 2) then
  begin
    Shots.Add(TShot.Create(FX, FY - 1));
    Exit(true);
  end;
  Exit(false);
end;

procedure TPlayer.Update(delta: Cardinal);
begin
  for var i := 0 to Shots.Count - 1 do
    TShot(Shots[i]).Update(delta);

  for var i := Shots.Count - 1 downto 0 do
    if TShot(Shots[i]).Dead then
      Shots.Delete(i);

end;

end.
