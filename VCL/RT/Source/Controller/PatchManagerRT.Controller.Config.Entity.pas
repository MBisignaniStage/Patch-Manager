unit PatchManagerRT.Controller.Config.Entity;

interface

uses
  PatchManagerRT.Controller.Interfaces,
  PatchManagerRT.controller.Attributes,
  Spring.Collections,
  System.Rtti;

type
{$SCOPEDENUMS ON}
  TState = (None, Selected, Deleted, Modified);
{$SCOPEDENUMS OFF}


type
  TPatchManagerRTControllerConfigPath = class(TInterfacedObject, IPatchManagerRTControllerConfigPath)
  strict private
    [Required]
    FJsonDir : string;
    [Required]
    FLogDir : string;
  private
    constructor Create;
////    function ValidateRequired (const AField: TRttiField;
//      const AAttributes: TCustomAttribute;
//      out AErrorMessage : string) : boolean;
  public
    function JsonDir : string; overload;
    procedure JsonDir(const AValue : string); overload;
    function LogDir : string; overload;
    procedure LogDir(const Avalue : string); overload;
//    function Validate (out AErrorlist :IList<String> ) : boolean;
  end;



type
  TPatchManagerRTControllerConfigDB = class(TInterfacedObject , IPatchManagerRTControllerConfigDb)
   strict private
    FServer : string;
    FDataBase : string;
    FNomeUtente : string;
    FPassword : string;
  private
    constructor Create;
  public
    function Server : string; overload;
    procedure Server(const AValue : string); overload;
    function Database : string; overload;
    procedure Database(const AValue : string); overload;
    function NomeUtente : string; overload;
    procedure NomeUtente(const AValue : string); overload;
    function Password : string; overload;
    procedure Password(const AValue : string) ; overload;
  end;



type
  TPatchManagerRTControllerConfigEntity = class(TInterfacedObject, IPatchManagerRTControllerConfigEntity)
  strict private
    FPath : IPatchManagerRTControllerConfigPath;
    FDataBaseAz : IPatchManagerRTControllerConfigDb;
    FDataBaseConf : IPatchManagerRTControllerConfigDb;
    FDataBaseStat : IPatchManagerRTControllerConfigDb;
  private
    constructor Create;
  public
    function Path : IPatchManagerRTControllerConfigPath;
    function DatabaseAZ : IPatchManagerRTControllerConfigDb;
    function DatabaseConf : IPatchManagerRTControllerConfigDb;
    function DatabaseStat : IPatchManagerRTControllerConfigDb;
    class function  New : TPatchManagerRTControllerConfigEntity;
  end;

  resourcestring
  RS_PATCHMANAGER_FIELD_REQUIRED = 'Directory %s mancante';

implementation

uses
  System.SysUtils;


{ TPatchManagerRTControllerConfigPath }

constructor TPatchManagerRTControllerConfigPath.Create;
begin
  FJsonDir := EmptyStr;
  FLogDir := EmptyStr;
end;

function TPatchManagerRTControllerConfigPath.JsonDir: string;
begin
  Result := FJsonDir;
end;

procedure TPatchManagerRTControllerConfigPath.JsonDir(const AValue: string);
begin
  FJsonDir := AValue;
end;

function TPatchManagerRTControllerConfigPath.LogDir: string;
begin
  Result := FLogDir;
end;

procedure TPatchManagerRTControllerConfigPath.LogDir(const Avalue: string);
begin
   FLogDir := AValue;
end;

{ TPatchManagerRTControllerConfigDB }

constructor TPatchManagerRTControllerConfigDB.Create;
begin
  FServer := EmptyStr;
  FDataBase := EmptyStr;
  FNomeUtente := EmptyStr;
  FPassword := EmptyStr;
end;

function TPatchManagerRTControllerConfigDB.Database: string;
begin
  Result := FDataBase;
end;

procedure TPatchManagerRTControllerConfigDB.Database(const AValue: string);
begin
  FDataBase := AValue;
end;

procedure TPatchManagerRTControllerConfigDB.NomeUtente(const AValue: string);
begin
  FNomeUtente := AValue;
end;

function TPatchManagerRTControllerConfigDB.NomeUtente: string;
begin
  Result := FNomeUtente;
end;

function TPatchManagerRTControllerConfigDB.Password: string;
begin
  Result := FPassword;
end;

procedure TPatchManagerRTControllerConfigDB.Password(const AValue: string);
begin
  FPassword := AValue;
end;

function TPatchManagerRTControllerConfigDB.Server: string;
begin
  Result := FServer;
end;

procedure TPatchManagerRTControllerConfigDB.Server(const AValue: string);
begin
  FServer := AValue;
end;

{ TPatchManagerRTControllerConfigEntity }

constructor TPatchManagerRTControllerConfigEntity.Create;
begin
  FDataBaseAz := TPatchManagerRTControllerConfigDb.Create;
  FDataBaseConf := TPatchManagerRTControllerConfigDb.Create;
  FDataBaseStat := TPatchManagerRTControllerConfigDb.Create;
  FPath := TPatchManagerRTControllerConfigPath.create;
end;

function TPatchManagerRTControllerConfigEntity.DatabaseAZ: IPatchManagerRTControllerConfigDb;
begin
  Result := FDataBaseAz;
end;

function TPatchManagerRTControllerConfigEntity.DatabaseConf: IPatchManagerRTControllerConfigDb;
begin
  Result := FDataBaseConf;
end;

function TPatchManagerRTControllerConfigEntity.DatabaseStat: IPatchManagerRTControllerConfigDb;
begin
  Result := FDataBaseStat;
end;

function TPatchManagerRTControllerConfigEntity.Path: IPatchManagerRTControllerConfigPath;
begin
  Result := FPath;
end;
//potrebbe servire successivamente
//function TPatchManagerRTControllerConfigPath.Validate(
//  out AErrorlist: IList<String>): boolean;
//var
//  LField : TRttiField;
//  LContext : TRttiContext;
//  LAttributes : TCustomAttribute;
//begin
//   Result := True;
//  AErrorlist := TCollections.CreateList<string>;
// for LField in LContext.GetType(Self.ClassType).GetFields do
//  begin
//    for LAttributes in LField.GetAttributes do
//    begin
//      var LErrorMessage := EmptyStr;
//      if not ValidateRequired(LField, LAttributes, LErrorMessage) then
//      begin
//        Result := False;
//        AErrorList.add(LErrorMessage);
//      end;
//    end;
//  end;
//end;
//
//function TPatchManagerRTControllerConfigPath.ValidateRequired(
//  const AField: TRttiField; const AAttributes: TCustomAttribute;
//  out AErrorMessage: string): boolean;
//begin
//  AErrorMessage := EmptyStr;
//  Result := true;
//  if AAttributes is PatchManagerRT.Controller.Attributes.Required then
//    begin
//      case AField.FieldType.TypeKind of
//        tkInteger, tkInt64:
//        begin
//          Result := (AField.GetValue(Self).AsInteger > 0);
//        end;
//        tkString, tkLString, tkUString, tkWideString:
//        begin
//          Result := not (AField.GetValue(self).AsString.IsEmpty);
//        end;
//
//      end;
//          if not Result then
//   AErrorMessage := format(RS_PATCHMANAGER_FIELD_REQUIRED, [Afield.Name]);
//  end;
//end;
class function TPatchManagerRTControllerConfigEntity.New: TPatchManagerRTControllerConfigEntity;
begin
  Result := Self.Create;
end;

end.
