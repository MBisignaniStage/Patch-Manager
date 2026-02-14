unit PatchManagerRT.Controller.Validator.Entity;

interface

uses
  PatchManagerRT.Controller.Interfaces,
  PatchManagerRT.Controller.Attributes;



type
  TPatchManagerRTControllerValidatorEntity = class(TInterfacedObject, IPatchManagerRTControllerValidatorEntity)
  private
    FCommand : string;
  public
    procedure Command (const AValue : String); overload;
    function Command : String; overload;
    class function New: TPatchManagerRTControllerValidatorEntity;
  end;

implementation

{ TPatchManagerRTControllerPatchCommand }


procedure TPatchManagerRTControllerValidatorEntity.Command(
  const AValue: String);
begin
  FCommand := AValue;
end;

function TPatchManagerRTControllerValidatorEntity.Command: String;
begin
  Result := FCommand;
end;

class function TPatchManagerRTControllerValidatorEntity.New  :
  TPatchManagerRTControllerValidatorEntity;
begin
  Result := Self.Create;
end;

end.
