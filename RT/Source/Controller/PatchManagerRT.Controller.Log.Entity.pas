unit PatchManagerRT.Controller.Log.Entity;

interface

uses
  PatchManagerRT.Controller.Interfaces,
  PatchManagerRT.Controller.Attributes;

type
  TPatchManagerRTControllerLogEntity = class(TInterfacedObject, IPatchManagerRTControllerLogEntity)
  strict private
    [EntityField]
    FCreated: string;
    [EntityField]
    FLogType: string;
    [EntityField]
    FLogInfo: string;
  public
    constructor Create;
    function Created : String; overload;
    procedure Created(const Avalue : string); overload;
    function LogType: String; overload;
    procedure LogType(const Avalue : string); overload;
    function LogInfo: string; overload;
    procedure LogInfo(const Avalue : string); overload;
    class function New : TPatchManagerRTControllerLogEntity;
  end;

implementation

uses
  System.SysUtils;



{ TPatchManagerRTControllerLogEntity }

constructor TPatchManagerRTControllerLogEntity.Create;
begin
  FCreated := EmptyStr;
  FLogType := EmptyStr;
  FLogInfo := EmptyStr;
end;

procedure TPatchManagerRTControllerLogEntity.Created(const Avalue: string);
begin
  FCreated := Avalue;
end;

function TPatchManagerRTControllerLogEntity.Created: String;
begin
  Result := Fcreated;
end;

procedure TPatchManagerRTControllerLogEntity.LogInfo(const Avalue: string);
begin
  FLogInfo := Avalue;
end;

function TPatchManagerRTControllerLogEntity.LogInfo: string;
begin
  Result := FLogInfo;
end;

procedure TPatchManagerRTControllerLogEntity.LogType(const Avalue: string);
begin
  FLogType := Avalue;
end;

function TPatchManagerRTControllerLogEntity.LogType: String;
begin
  Result := FLogType;
end;

class function TPatchManagerRTControllerLogEntity.New: TPatchManagerRTControllerLogEntity;
begin
  Result := Self.Create;
end;

end.
