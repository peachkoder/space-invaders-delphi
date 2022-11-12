unit shot;

interface

uses Vcl.ExtCtrls
    , Drawable
    , Frame
    ;

type
TShot = class(TInterfacedObject, IDrawable<TFrame>)
  private
    FX, FY : UInt8;
    FExploding: boolean;
    FTimer: TTimer;
  public
    constructor Create(x,y: UInt8);
    procedure Update(delta: Cardinal);
    procedure Explode();
    function Dead(): Boolean;
    procedure Draw(Item: TFrame);
    property Exploding: Boolean read FExploding;

  end;

implementation

{ TShot }

constructor TShot.Create(x, y: UInt8);
begin
  FX := x;
  FY := y;
  FExploding:= false;
  FTimer.Interval := 50;
end;


function TShot.Dead: Boolean;
begin
  Result := FExploding and FTimer.Enabled;
end;

procedure TShot.Draw(Item: TFrame);
begin
  if FExploding then
    item.SetChar(FX, FY,'*')
  else
    item.SetChar(FX, FY,'|');

end;

procedure TShot.Explode;
begin
  FExploding := true;
  FTimer.Interval := 250;
end;

procedure TShot.Update(delta: Cardinal);
begin

end;

end.
