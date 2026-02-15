unit PatchManagerRT.Model.Patch.ToJson;

interface
uses
  PatchManagerRT.Controller.Interfaces,
  System.JSON,
  System.Classes,
  System.SysUtils,
  Spring.Collections,
  System.Generics.Collections,
  PatchManagerRT.Model.Interfaces;


type
  TPatchManagerRTModelPatchToJson = class(TInterfacedObject , IPatchManagerRTModelPatchToJson)
  strict private
    FEntity : IPatchManagerRTControllerPatchEntity;
    FListEntity : IList<IPatchManagerRTControllerPatchEntity>;
    FErrors : IList<string>;
    FConnection :  string;
  public
    procedure Entity(const AValue : IPatchManagerRTControllerPatchEntity);
    procedure Connection(const AConnection : string);
    function Save: boolean;
    function Insert: boolean;
    function GetJsonPatch: string;
    function Load : IList<String>;
    constructor Create;
    class function New: IPatchManagerRTModelPatchToJson;
  end;

implementation

uses
  Rest.Json,
  System.IOUtils,
  PatchManagerRT.Controller.Factory,
  PatchManagerRT.Controller.Patch.Entity,
  PatchManagerRT.Model.Factory,
  PatchManagerRT.model.Log,
  PatchManagerRT.Constants,
  System.Rtti;


{ TPatchManagerRTModelPatchToJson }

procedure TPatchManagerRTModelPatchToJson.Connection(const AConnection: string);
begin
  FConnection := AConnection;
end;

constructor TPatchManagerRTModelPatchToJson.Create;
begin
  FErrors := TCollections.CreateList<string>;
  FEntity := TPatchManagerRTControllerFactory.New.Entity;
  FListEntity := TCollections.CreateList<IPatchManagerRTControllerPatchEntity>;
end;

procedure TPatchManagerRTModelPatchToJson.Entity(
  const AValue: IPatchManagerRTControllerPatchEntity);
begin
  FEntity :=  AValue;
end;
//prova importazione dati da file json da utilizzare successivamente
function TPatchManagerRTModelPatchToJson.Load: IList<String>;
var
  LFileStream : TFileStream;
  LJsonStream : TStringStream;
  LList : IList<String>;
  LJsonValue : TJSONValue;
  LValori : TJSONArray;
  I : integer;
begin
  LJsonStream := TStringStream.Create;
  try
    LFileStream := TFileStream.create(FConnection + '\' + JSON_FILE_NAME, 0);
      try
        LJsonStream.LoadFromStream(LFileStream);
      finally
        LFileStream.Free;
      end;
    LJsonValue := TJSONObject.ParseJSONValue(LJsonStream.DataString);
    LList := TCollections.CreateList<string>;
    try
      LValori := LJsonValue.GetValue<TJSONArray>(PATCHES_ROOT_NAME);
      for I := 0 to LValori.count - 1 do
      LList.add(LValori.Items[I].GetValue<string>(COMMAND_PATCH_NAME));
      Result := LList;
    finally
    LjsonValue.free;
    end;
  finally
  LJsonStream.free;
  end;
end;
//restitutisce la patch json formattata
function TPatchManagerRTModelPatchToJson.GetJsonPatch: string;
var
  RootObject : TJSONObject;
  LJSONArray : TJSONArray;
  LTmpJson : TJSONValue;
  LEntity : IPatchManagerRTControllerPatchEntity;
begin
  Result := '';
  if FListEntity.IsEmpty then
    exit;
  RootObject := TJSONObject.Create;
  try
    RootObject.AddPair(DATA_CREAZIONE_NAME, FListEntity[0].Created);
    RootObject.AddPair(DATABASE_TYPE_NAME, FEntity.DbType);
    LJSONArray := TJSONArray.Create;
    for LEntity in FListEntity  do
      LJSONArray.add(LEntity.ToJSON);
      RootObject.addpair(PATCHES_ROOT_NAME,LJSONArray);
      LTmpJson := TJSONObject.ParseJSONValue(RootObject.ToJSON);
      try
        Result := TJson.format(LTmpJson);
      finally
        LTmpJson.free;
      end;
  finally
  RootObject.free;
  end;
end;

//Inserisce la entity(patch) all'interno della lista
function TPatchManagerRTModelPatchToJson.Insert: boolean;
var
  LEntity : IPatchManagerRTControllerPatchEntity;
  LGUID : TGUID;
begin
  try
  CreateGUID(LGUID);
  FEntity.PatchId(LGUID);
  FEntity.Created(FormatDateTime(FORMAT_DATE_JSON,now));
  LEntity := TPatchManagerRTControllerFactory.New.Entity;
  LEntity.CopyEntity(FEntity);
  FListEntity.add(LEntity);
  except
      on e : Exception do
      begin
        Result := False;
        FErrors.add(e.message);
      end;
  end;
  Result := True;
end;

//Salva il file json contentente le varie patch
function TPatchManagerRTModelPatchToJson.Save: boolean;
var
  LPatchJson : string;
begin
  try
    LPatchJson := GetJsonPatch;
    Tfile.WriteAllText(FConnection + '\' + FormatDateTime(FORMAT_DATE_JSON,now), LPatchJson);
  except
    on e: Exception do
    begin
        Result := False;
        FErrors.add(e.Message);
    end;
  end;
  Result := true;
end;

class function TPatchManagerRTModelPatchToJson.New: IPatchManagerRTModelPatchToJson;
begin
  Result := Self.Create;
end;

end.
