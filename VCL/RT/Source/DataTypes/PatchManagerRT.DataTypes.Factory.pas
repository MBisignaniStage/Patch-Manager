unit PatchManagerRT.DataTypes.Factory;

interface
  uses
    PatchManagerRT.DataTypes.Interfaces;

type
  TPatchManagerRTDataTypesFactory = class(TInterfacedObject, IPatchManagerRTDataTypesFactory)
    function DataTypes : IPatchManagerRTDataTypes;
    class function new : IPatchManagerRTDataTypesFactory;
  end;

implementation

uses
  PatchManagerRT.DataTypes;

{ TPatchManagerRTDataTypesFactory }

function TPatchManagerRTDataTypesFactory.DataTypes: IPatchManagerRTDataTypes;
begin
 Result :=  TPatchManagerRTDataTypes.New;
end;

class function TPatchManagerRTDataTypesFactory.new: IPatchManagerRTDataTypesFactory;
begin
  Result := self.Create;
end;

end.
