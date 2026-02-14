unit PatchManagerRT.Controller.Patch.Entity;

interface

uses PatchManagerRT.Controller.Interfaces,
  PatchManagerRT.Controller.Attributes,
  System.JSON,
  System.Classes,
  Rest.Json,
  Spring.Collections,
  System.Rtti;

type
  TPatchManagerRTControllerPatchEntity = class(TInterfacedObject, IPatchManagerRTControllerPatchEntity)
  strict private
    [EntityField]
    FCreated: string;
    [EntityField]
    [Required]
    FDbType: string;
    [EntityField]
    FID: Integer;
    [EntityField]
    [Required]
    FDescription: string;
    [EntityField]
    [Required]
    FCommand: string;
    [EntityField]
    FExistCommand : string;
    [EntityField]
    [Required]
    FPatchId: TGUID;
  private
    function ValidateRequired(
      const AField : TRttiField ;
      const AAttributes : TCustomAttribute;
      out AErrorMessage : string) : boolean;
  public
    constructor Create;
    function Created : string; overload;
    procedure Created(const AValue : string); overload;
    function DbType : string; overload;
    procedure DbType(const AValue: string); overload;
    function ID : Integer; overload;
    procedure ID(const AValue : Integer); overload;
    function Description : string; overload;
    procedure Description(const AValue: string); overload;
    function Command : string; overload;
    procedure Command(const AValue: string); overload;
    function ExistCommand : string; overload;
    procedure ExistCommand(const AValue : string); overload;
    function PatchId : TGUID; overload;
    procedure PatchId(const Avalue : TGUID); overload;
    function ToJSON : TJsonObject;
    function Validate(out AErrorMessage : string) : Boolean;
    function CopyEntity(
    AEntity :IPatchManagerRTControllerPatchEntity
    ) : IPatchManagerRTControllerPatchEntity;
    class function New: TPatchManagerRTControllerPatchEntity;
  end;

implementation

uses
  System.SysUtils,
  PatchManagerRT.Messages,
  PatchManagerRT.Constants;


{ TPatchManagerRTControllerPatchEntity }
constructor TPatchManagerRTControllerPatchEntity.Create;
begin
  FCommand := EmptyStr;
  FCreated := EmptyStr;
  FDescription := EmptyStr;
  FDbType := EmptyStr;
  FID := 0;
end;

function TPatchManagerRTControllerPatchEntity.Command: string;
begin
  Result := FCommand;
end;

procedure TPatchManagerRTControllerPatchEntity.Command(const AValue: string);
begin
  FCommand := AValue;
end;

function TPatchManagerRTControllerPatchEntity.Created: string;
begin
  Result := FCreated;
end;

procedure TPatchManagerRTControllerPatchEntity.Created(const AValue: string);
begin
  FCreated := AValue;
end;

function TPatchManagerRTControllerPatchEntity.Description: string;
begin
  Result := FDescription;
end;

procedure TPatchManagerRTControllerPatchEntity.Description(const AValue: string);
begin
  FDescription := Avalue;
end;

procedure TPatchManagerRTControllerPatchEntity.ExistCommand(
  const AValue: string);
begin
  FExistCommand := Avalue;
end;

function TPatchManagerRTControllerPatchEntity.ExistCommand: string;
begin
  Result := FExistCommand;

end;

function TPatchManagerRTControllerPatchEntity.DbType: string;
begin
  Result := FDbType;
end;

procedure TPatchManagerRTControllerPatchEntity.DbType(const AValue: string);
begin
  FDbType:= AValue;
end;

function TPatchManagerRTControllerPatchEntity.ID: Integer;
begin
  Result := FID;
end;

procedure TPatchManagerRTControllerPatchEntity.ID(const AValue: Integer);
begin
  FID := AValue;
end;

class function TPatchManagerRTControllerPatchEntity.New: TPatchManagerRTControllerPatchEntity;
begin
  Result := Self.Create;
end;

function TPatchManagerRTControllerPatchEntity.PatchId: TGUID;
begin
  Result := FPatchId;
end;

procedure TPatchManagerRTControllerPatchEntity.PatchId(const Avalue: TGUID);
begin
  FPatchId := Avalue;
end;

function TPatchManagerRTControllerPatchEntity.CopyEntity(
  AEntity :IPatchManagerRTControllerPatchEntity) : IPatchManagerRTControllerPatchEntity;
var
  LContext : TRttiContext;
  LField : TRttiField;
begin
for LField in LContext.GetType(Self.ClassType).GetFields do
  begin
    for var LAttributes in LField.GetAttributes do
    begin
        if LAttributes is EntityField then
          LField.SetValue(Self,LField.GetValue(AEntity as TPatchManagerRTControllerPatchEntity));
    end;
  end;
end;

function TPatchManagerRTControllerPatchEntity.ToJSON: TJsonObject;
begin
//  Result := Rest.Json.TJson.ObjectToJsonString(Self);
  Result := TJSONObject.Create;
  Result.AddPair(ID_PATCH_ADT_NAME, FID);
  Result.AddPair(DESCRIPTION_PATCH_NAME, FDescription);
  Result.AddPair(COMMAND_PATCH_NAME, FExistCommand);
  Result.AddPair(ID_PATCH_NAME, FPatchId.ToString);
end;

function TPatchManagerRTControllerPatchEntity.Validate(
  out AErrorMessage : string): Boolean;
var
  LField : TRttiField;
  LContext : TRttiContext;
  LAttributes : TCustomAttribute;
  LErrorMessage : string;
begin
  Result := True;
 for LField in LContext.GetType(Self.ClassType).GetFields do
  begin
    for LAttributes in LField.GetAttributes do
    begin
      if not ValidateRequired(LField, LAttributes, LErrorMessage) then
      begin
        Result := False;
        AErrorMessage := LErrorMessage + sLineBreak + AErrorMessage;
      end;
    end;
  end;

 end;

function TPatchManagerRTControllerPatchEntity.ValidateRequired(
  const AField: TRttiField;
  const AAttributes: TCustomAttribute;
  out AErrorMessage : string) : boolean;
begin
  AErrorMessage := EmptyStr;
  Result := true;
  if AAttributes is PatchManagerRT.Controller.Attributes.Required then
    begin
      case AField.FieldType.TypeKind of
        tkInteger, tkInt64:
        begin
          Result := (AField.GetValue(Self).AsInteger > 0);
        end;
        tkString, tkLString, tkUString, tkWideString:
        begin
          Result := not (AField.GetValue(self).AsString.IsEmpty);
        end;

      end;
          if not Result then
   AErrorMessage := format(RS_PATCHMANAGER_FIELD_REQUIRED, [Afield.Name]);
  end;
end;

end.
