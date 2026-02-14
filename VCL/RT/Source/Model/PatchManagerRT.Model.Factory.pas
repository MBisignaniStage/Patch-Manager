unit PatchManagerRT.Model.Factory;

interface

uses
  PatchManagerRT.Model.Interfaces;

type
  TPatchManagerRTModelFactory = class(TInterfacedObject, IPatchManagerRTModelFactory)
    function ToJson: IPatchManagerRTModelPatchToJson;
    function Log : IPatchManagerRTModelLog;
    function Config : IPatchManagerRTModelConfig;
    function Validator : IPatchManagerRTModelValidator;
    class function New : IPatchManagerRTModelFactory;
  end;

implementation

uses
  PatchManagerRT.Model.Patch.ToJson,
  PatchManagerRT.Model.Log,
  PatchManagerRT.Model.Config,
  PatchManagerRT.Model.Validator;


{ TPatchManagerRTModelFactory }

function TPatchManagerRTModelFactory.Config: IPatchManagerRTModelConfig;
begin
  Result := TPatchManagerRTModelConfig.New;
end;

function TPatchManagerRTModelFactory.Log: IPatchManagerRTModelLog;
begin
  Result := TPatchManagerRTModelLog.new;
end;

class function TPatchManagerRTModelFactory.New: IPatchManagerRTModelFactory;
begin
  Result := Self.Create;
end;

function TPatchManagerRTModelFactory.Validator: IPatchManagerRTModelValidator;
begin
  Result := TPatchManagerRTModelValidator.new;
end;

function TPatchManagerRTModelFactory.ToJson: IPatchManagerRTModelPatchToJson;
begin
  Result := TPatchManagerRTModelPatchToJson.new;
end;

end.
