unit PatchManagerRT.Model.Log;

interface
uses
  PatchManagerRT.Model.Interfaces,
  PatchManagerRT.Controller.Interfaces,
  System.Generics.Collections,
  System.Classes,
  Spring.Collections,
  System.SysUtils;

type
  TPatchManagerRTModelLog = class(TInterfacedObject , IPatchManagerRTModelLog)
  Strict private
    FLog: IPatchManagerRTControllerLogEntity;
    FLoglist : IList<string>;
    FErrors : Ilist<string>;
    FConnection : string;
  public
    procedure Log(const AValue : IPatchManagerRTControllerLogEntity);
    procedure WriteLog(const AType : string; const AInfo : string);
    procedure Connection(const AConnection : string);
    function GetLog : String;
    function SaveLog : boolean;
    constructor Create;
    class function New: IPatchManagerRTModelLog;
  end;

implementation

uses
  PatchManagerRT.Controller.Factory,
  System.IOUtils;

{ TPatchManagerRTModelLog }

procedure TPatchManagerRTModelLog.Connection(const AConnection: string);
begin
  FConnection := AConnection;
end;

constructor TPatchManagerRTModelLog.Create;
begin
  FLogList := TCollections.CreateList<string>;
  FLog := TPatchManagerRTControllerFactory.New.EntityLog;
  FErrors := TCollections.CreateList<string>;
end;

function TPatchManagerRTModelLog.GetLog: String;
begin
  if Floglist.count <= 0 then
  begin
    Result := '';
    exit;
  end;
  Result := FLoglist[FLoglist.Count - 1];
end;

procedure TPatchManagerRTModelLog.Log(
  const AValue: IPatchManagerRTControllerLogEntity);
begin
  FLog := AValue;
end;

class function TPatchManagerRTModelLog.New: IPatchManagerRTModelLog;
begin
  Result := Self.Create;
end;

function TPatchManagerRTModelLog.SaveLog: boolean;
var
  Writer : TStreamWriter;
begin
  Result := true;
  Writer := TStreamWriter.Create(FConnection + '\Log.txt', False);
  try
    for var I := 0 to FLoglist.count - 1 do
    begin
      Writer.WriteLine(FLoglist[I]);
    end;
  except
    on e: Exception do
    begin
      Result := false;
      FErrors.Add(e.Message);
    end;
  end;
  Writer.free;
end;

procedure TPatchManagerRTModelLog.WriteLog(const AType, AInfo: string);
begin
  FLog.Created(DateTimeToStr(now));
  FLog.LogType(AType);
  FLog.LogInfo(AInfo);
  FLoglist.Add('['
   + FLog.Created +']'+ ' '
   + FLog.LogType + ': '
   + FLog.LogInfo);
end;

end.
