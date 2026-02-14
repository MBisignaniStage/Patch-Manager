unit PatchManagerRT.TFDConnection.Factory;

interface

uses
  PatchManagerRT.TFDConnection.Interfaces;

type
  TPatchManagerRTTFDConnectionFactory = class(TInterfacedObject, IPatchManagerRTTFDConnectionFactory)
  public
    function TFDConnection(
      const ADatabase : string) : IPatchManagerRTTFDConnection;
    class function New: IPatchManagerRTTFDConnectionFactory;
  end;

implementation

uses
  PatchManagerRT.TFDConnection;

{ TPatchManagerRTTFDConnectionFactory }

class function TPatchManagerRTTFDConnectionFactory.New: IPatchManagerRTTFDConnectionFactory;
begin
  Result := Self.Create;
end;

function TPatchManagerRTTFDConnectionFactory.TFDConnection(
  const ADatabase: string) :IPatchManagerRTTFDConnection;
begin
  Result := TPatchManagerRTTFDConnection.new(ADatabase);
end;

end.
