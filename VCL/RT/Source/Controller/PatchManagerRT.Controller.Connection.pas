unit PatchManagerRT.Controller.Connection;

interface
uses
  System.SysUtils,
  System.Generics.Collections,
  System.Classes,
  FireDAC.Comp.Client,
  FireDAC.Phys.MSSQL,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.ConsoleUI.Wait,
  FireDAC.Comp.UI,
  FireDAC.DApt, FireDAC.Stan.Async,
  PatchManagerRT.Controller.Interfaces;

type
  TPatchManagerRTControllerConnection<T> = class(TInterfacedObject , IPatchManagerRTControllerConnection<T>)
    private
      FConnectionType: TConnectionType;
      FConnection : T;
      FDGUIxWaitCursor1 : TFDGUIxWaitCursor;
    public
      function Connection : T;
      function ConnectionType : TConnectionType;
      destructor destroy; override;
      constructor Create(const AConnection : TConnectionType; const AConnectionFunc: TFunc<T>);
      class function New(const AConnection : TConnectionType; const AConnectionFunc: TFunc<T>) : IPatchManagerRTControllerConnection<T>;
  end;

implementation

{ TPatchManagerRTControllerConnection }

function TPatchManagerRTControllerConnection<T>.ConnectionType: TConnectionType;
begin
  Result := FConnectionType;
end;

constructor TPatchManagerRTControllerConnection<T>.Create(
  const AConnection: TConnectionType; const AConnectionFunc: TFunc<T>);
begin
  FConnectionType := AConnection;
    Case FConnectionType of
      TConnectionType.Json : FConnection := AConnectionFunc();
      TConnectionType.DB :
      begin
        FDGUIxWaitCursor1 := TFDGUIxWaitCursor.Create(nil);
        FDGUIxWaitCursor1.Provider := 'Console';
        FConnection := AConnectionFunc();
      end;
    else
      begin
        raise Exception.Create('Tipologia non presente');
      end;
    End;
end;

destructor TPatchManagerRTControllerConnection<T>.destroy;
begin
  if assigned(FDGUIxWaitCursor1) then
    FDGUIxWaitCursor1.free;
  inherited;
end;

function TPatchManagerRTControllerConnection<T>.Connection: T;
begin
  Result := FConnection;
end;

class function TPatchManagerRTControllerConnection<T>.New(
  const AConnection: TConnectionType; const AConnectionFunc: TFunc<T>): IPatchManagerRTControllerConnection<T>;
begin
  Result := Self.Create(AConnection, AConnectionFunc);
end;

end.
