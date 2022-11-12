unit invader;

interface

uses Drawable
    , Frame
    , Vcl.ExtCtrls
    , System.Classes
    ;

type

  TInvader = record
    X, Y  : UInt32;
    Point : UInt16;
  end;

  TInvaders = class(TInterfacedObject, IDrawable<TFrame>)
  strict private
    FArmy: TList;
    FTotal_Count: Uint16;
    FMove_Timer: TTimer;
    FDirection: Cardinal;
  public
      constructor Create;
      procedure Draw(Item: TFrame);
      function Update(delta: Cardinal): Boolean;
      function IsAllKilled() : Boolean;
      function IskillInvaderAt() : UInt16;
      function ReachedBottom(): Boolean;
      property Army: TList read FArmy;
      property TotalCount: UInt16 read FTotal_Count write FTotal_Count;
  end;

implementation

{ TInvaders }

constructor TInvaders.Create;
begin

end;

procedure TInvaders.Draw(Item: TFrame);
begin

end;

function TInvaders.IsAllKilled: Boolean;
begin

end;

function TInvaders.IskillInvaderAt: UInt16;
begin

end;

function TInvaders.ReachedBottom: Boolean;
begin

end;

function TInvaders.Update(delta: Cardinal): Boolean;
begin

end;

end.
