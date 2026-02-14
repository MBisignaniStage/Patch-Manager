unit PatchManagerRT.Model.Config;

interface

uses
  PatchManagerRT.Model.Interfaces,
  PatchManagerRT.Controller.Interfaces,
  System.SysUtils,
  Spring.Collections,
  System.Classes;

type
  TPatchManagerRTModelConfig = class(TInterfacedObject , IPatchManagerRTModelConfig)
  strict private
    FConfig : IPatchManagerRTControllerConfigEntity;
    FErrors : IList<String>;
    FConnection :  string;
  public
    constructor Create;
    procedure Connection(const AConnection : string);
    procedure Config(const Avalue : IPatchManagerRTControllerConfigEntity);
    function Load: boolean;
    function WriteConfig : boolean;
    class function New: IPatchManagerRTModelConfig;
  end;

implementation

uses
  System.JSON,
  Rest.Json,
  System.IOUtils,
  PatchManagerRT.Crypt,
  PatchManagerRT.Constants,
  StrUtils,
  System.Generics.Collections;



{ TPatchManagerRTModelConfig }

procedure TPatchManagerRTModelConfig.Config(
  const Avalue: IPatchManagerRTControllerConfigEntity);
begin
  FConfig := Avalue;
end;

procedure TPatchManagerRTModelConfig.Connection(const AConnection: string);
begin
  FConnection := AConnection;
end;

constructor TPatchManagerRTModelConfig.Create;
begin
  Ferrors := TCollections.CreateList<string>;
end;

function TPatchManagerRTModelConfig.Load : boolean;
var
  LFileStream : TFileStream;
  LJsonStream : TStringStream;
  LJsonValue, LJsonDB, LJsonPath : TJSONValue;
  LDatabase : string;
begin
  Result := true;
  if not FileExists(FConnection + CONFIG_FILE_NAME) then
  begin
    Result := False;
    Exit;
  end;
  LJsonStream := TStringStream.Create;
  try
    LFileStream := TFileStream.create(FConnection + CONFIG_FILE_NAME, 0);
    try
      LJsonStream.LoadFromStream(LFileStream);
    finally
      LFileStream.Free;
    end;
    try
      LJsonValue := TJSONObject.ParseJSONValue(LJsonStream.DataString);
      LJsonPath := LJsonValue.GetValue<TJSONValue>('Paths');
      //Paths
      FConfig.Path.JsonDir(LJsonPath.GetValue<string>(JSONFILEDIR_FIELD_NAME));
      FConfig.Path.LogDir(LJsonPath.GetValue<string>(LOGFILEDIR_FIELD_NAME));
      //Database
      LJsonDB := LJsonValue.GetValue<TJSONValue>(DATABASES[0]);
            FConfig.DatabaseAZ.Server(LJsonDB.GetValue<string>(SERVER_FIELD_NAME));
            FConfig.DatabaseAZ.DataBase(LJsonDB.GetValue<string>(DATABASE_FIELD_NAME));
            FConfig.DatabaseAZ.NomeUtente(LJsonDB.GetValue<string>(USERNAME_FIELD_NAME));
            FConfig.DatabaseAZ.Password(
              CS_Crypt(LJsonDB.GetValue<string>(PASSWORD_FIELD_NAME),false));
      LJsonDB := LJsonValue.GetValue<TJSONValue>(DATABASES[1]);
            FConfig.DatabaseConf.Server(LJsonDB.GetValue<string>(SERVER_FIELD_NAME));
            FConfig.DatabaseConf.DataBase(LJsonDB.GetValue<string>(DATABASE_FIELD_NAME));
            FConfig.DatabaseConf.NomeUtente(LJsonDB.GetValue<string>(USERNAME_FIELD_NAME));
            FConfig.DatabaseConf.Password(
              CS_Crypt(LJsonDB.GetValue<string>(PASSWORD_FIELD_NAME),false));
      LJsonDB := LJsonValue.GetValue<TJSONValue>(DATABASES[2]);
            FConfig.DatabaseStat.Server(LJsonDB.GetValue<string>(SERVER_FIELD_NAME));
            FConfig.DatabaseStat.DataBase(LJsonDB.GetValue<string>(DATABASE_FIELD_NAME));
            FConfig.DatabaseStat.NomeUtente(LJsonDB.GetValue<string>(USERNAME_FIELD_NAME));
            FConfig.DatabaseStat.Password(
              CS_Crypt(LJsonDB.GetValue<string>(PASSWORD_FIELD_NAME),false));
    finally
      LjsonValue.free;
    end;
  finally
    LJsonStream.free;
  end;
end;

class function TPatchManagerRTModelConfig.New: IPatchManagerRTModelConfig;
begin
  Result := self.Create;
end;
//da compleatare il load e il write in modo che scrivano tutti i campi e poi finire il la connessione fire dac in modo che in base al database scelto
//vada a prendere i campi giusti poi completare oltre al tipo stringa anche tipo id nel wizard come
//idea per il write config ho pensato di passare come parametri direttamente i valori delle credenziali
//es . writeconfig(adatabase,aserver,aname,apassword : string); cosi la funzione rimane sempre quella
function TPatchManagerRTModelConfig.WriteConfig: boolean;
var
  LJsonPath, LJsonDB, LRoot : TJSONObject;
  LTmpJson : TJSONValue;
begin
  LJsonPath := TJSONObject.create;
  LJsonDB := TJSONObject.create;
  LRoot := TJSONObject.Create;
  try
    //Paths
    LJsonPath.AddPair('JsonDir', FConfig.Path.JsonDir);
    LJsonPath.AddPair('LogDir', FConfig.Path.LogDir);
    //DataBase
    LjsonDB.AddPair('Server', FConfig.DatabaseAZ.Server);
    LjsonDB.AddPair('DataBase', FConfig.DatabaseAZ.DataBase);
    LjsonDB.AddPair('Nome', FConfig.DatabaseAZ.NomeUtente);
    LjsonDB.AddPair('Password', CS_Crypt(FConfig.DatabaseAZ.Password,True));
    //Radici
    LRoot.AddPair('Paths', LJsonPath);
    LRoot.AddPair('Connection', LJsonDB);
    LTmpJson := TJSONObject.ParseJSONValue(LRoot.ToJSON);
    try
      Tfile.WriteAllText(FConnection + 'Config.json', TJson.format(LTmpJson));
    finally
      LTmpJson.free;
    end;
  except
    on e: Exception do
    begin
        Result := False;
        FErrors.add(e.Message);
    end;
  end;
  LRoot.free;
  Result := true;
end;

end.
