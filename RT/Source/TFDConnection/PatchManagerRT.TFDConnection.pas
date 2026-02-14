unit PatchManagerRT.TFDConnection;

interface

uses
  PatchManagerRT.TFDConnection.Interfaces,
  FireDAC.Comp.Client;

type
  TPatchManagerRTTFDConnection = class(TInterfacedObject , IPatchManagerRTTFDConnection)
  private
    FDConnection : TFDConnection;
  public
    constructor Create(const ADatabase : string);
    destructor Destroy; override;
    class function new(const ADatabase : string) : TPatchManagerRTTFDConnection;
    function GetConnectionDB: TFDConnection;
  end;


implementation

uses
  System.Classes,
  System.SysUtils,
  PatchManagerRT.Controller.Interfaces,
  PatchManagerRT.Controller.Factory,
  StrUtils,
  PatchManagerRT.Constants;


{ TPatchManagerRTControllerTDFConnection }

constructor TPatchManagerRTTFDConnection.Create(const ADatabase : string);
begin
    var LParams := TStringList.Create;
    var LConfig := TPatchManagerRTControllerFactory.New.Config;
  try
  case AnsiIndexStr(ADatabase,DATABASES) of
  //aziendale
  0 :
  begin
    LParams.Values[SERVER_FIELD_NAME] := LConfig.Config.DatabaseAZ.Server;
    LParams.Values[USERNAME_FIELD_NAME] := LConfig.Config.DatabaseAZ.NomeUtente;
    LParams.Values[PASSWORD_FIELD_NAME] := LConfig.Config.DatabaseAZ.Password;
    LParams.Values[DATABASE_FIELD_NAME] := LConfig.Config.DatabaseAZ.DataBase;
  end;
  //configurazione
  1 :
  begin
    LParams.Values[SERVER_FIELD_NAME] := LConfig.Config.DatabaseConf.Server;
    LParams.Values[USERNAME_FIELD_NAME] := LConfig.Config.DatabaseConf.NomeUtente;
    LParams.Values[PASSWORD_FIELD_NAME] := LConfig.Config.DatabaseConf.Password;
    LParams.Values[DATABASE_FIELD_NAME] := LConfig.Config.DatabaseConf.DataBase;
  end;
  //statistiche avanzate
  2 :
  begin
    LParams.Values[SERVER_FIELD_NAME] := LConfig.Config.DatabaseStat.Server;
    LParams.Values[USERNAME_FIELD_NAME] := LConfig.Config.DatabaseStat.NomeUtente;
    LParams.Values[PASSWORD_FIELD_NAME] := LConfig.Config.DatabaseStat.Password;
    LParams.Values[DATABASE_FIELD_NAME] := LConfig.Config.DatabaseStat.DataBase;
  end;
  else
    begin
      raise Exception.Create('Database non presente : errore di connessione');
    end;
  end;
    LParams.Values['Pooled'] := 'True';
    var LManager := FDManager.ConnectionDefs.FindConnectionDef(CONNECTION_DEF_NAME);
      if LManager = nil then
        begin
          FDManager.AddConnectionDef(CONNECTION_DEF_NAME, 'MSSQL', LParams);
        end
        else
        begin
          FDManager.CloseConnectionDef(CONNECTION_DEF_NAME);
          FDManager.ModifyConnectionDef(CONNECTION_DEF_NAME, LParams);
        end;
  FDConnection := TFDConnection.Create(nil);
  try
  FDConnection.ConnectionDefName := CONNECTION_DEF_NAME;
  
  FDConnection.Connected := True;
  except
    on e : exception do
          begin
            raise Exception.Create(e.message);
          end;
  end;
  finally
    LParams.Free;
  end;
end;

destructor TPatchManagerRTTFDConnection.Destroy;
begin
  FDConnection.Free;
  inherited;
end;

function TPatchManagerRTTFDConnection.GetConnectionDB: TFDConnection;
begin
  Result := FDConnection;
end;

class function TPatchManagerRTTFDConnection.new(
  const ADatabase : string): TPatchManagerRTTFDConnection;
begin
  Result := Self.create(ADatabase);
end;

end.
