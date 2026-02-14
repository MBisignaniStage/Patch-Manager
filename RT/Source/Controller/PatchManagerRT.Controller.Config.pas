unit PatchManagerRT.Controller.Config;

interface

uses
  PatchManagerRT.Controller.Interfaces,
  PatchManagerRT.Model.Interfaces,
  System.SysUtils,
  Spring.Collections,
  System.Classes;

type
  TPatchManagerRTControllerConfig = class(TInterfacedObject , IPatchManagerRTControllerConfig)
  private
    FConfig : IPatchManagerRTControllerConfigEntity;
    FModel : IPatchManagerRTModelConfig;
    FErrors : IList<string>;
  public
    constructor Create;
    function Config : IPatchManagerRTControllerConfigEntity; overload;
    procedure Config(
      const Avalue : IPatchManagerRTControllerConfigEntity); overload;
    procedure load;
    function WriteConfig : boolean;
    class function new : IPatchManagerRTControllerConfig;
  end;

implementation
  uses
    PatchManagerRT.Controller.Factory,
    PatchManagerRT.Model.Factory;

{ TPatchManagerRTControllerConfig }

function TPatchManagerRTControllerConfig.Config: IPatchManagerRTControllerConfigEntity;
begin
  Result := FConfig;
end;

procedure TPatchManagerRTControllerConfig.Config(
  const Avalue: IPatchManagerRTControllerConfigEntity);
begin
  FConfig := Avalue;
end;

constructor TPatchManagerRTControllerConfig.Create;
var
  LControllerFactory : IPatchManagerRTControllerFactory;
  LModelFactory : IPatchManagerRTModelFactory;
begin
  LControllerFactory :=  TPatchManagerRTControllerFactory.New;
  LModelFactory :=  TPatchManagerRTModelFactory.New;
  FConfig := LControllerFactory.EntityConfig;
  FModel := LModelFactory.Config;
  FModel.Config(FConfig);
  FModel.Connection(ExtractFilePath(ParamStr(0)));
  FErrors := TCollections.CreateList<string>;
  load;
end;

procedure TPatchManagerRTControllerConfig.load;
begin
  try
    if not Fmodel.load then
    begin

    end;
    except
      on E : exception do
      begin
        FErrors.add(E.Message);
      end;
  end;

end;
class function TPatchManagerRTControllerConfig.new: IPatchManagerRTControllerConfig;
begin
  Result := Self.Create;
end;

function TPatchManagerRTControllerConfig.WriteConfig: boolean;
begin
  try
    Result := Fmodel.WriteConfig
    except
      on E : exception do
      begin
        Result := False;
        FErrors.add(E.Message);
      end;
  end;
end;

end.
