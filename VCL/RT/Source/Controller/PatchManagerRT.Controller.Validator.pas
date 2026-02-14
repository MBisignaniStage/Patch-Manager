unit PatchManagerRT.Controller.Validator;

interface

uses
  PatchManagerRT.Controller.Interfaces,
  PatchManagerRT.Model.Interfaces,
  PatchManagerRT.TFDConnection.Interfaces,
  FireDAC.Comp.Client,
  System.Classes,
  Spring.Collections;

type
  TPatchManagerRTControllerValidator = class(TInterfacedObject , IPatchManagerRTControllerValidator)
    private
      FConnection : IPatchManagerRTControllerConnection<IPatchManagerRTTFDConnection>;
      FLog : IPatchManagerRTControllerLog;
      FModel : IPatchManagerRTModelValidator;
      FCommandList : IList<string>;
      FEntity : IPatchManagerRTControllerPatchEntity;
      constructor Create(const ADatabase : string);
      procedure RemoveCommand;
    public
      function GlobalValidate(out ADict : IDictionary<string,TSeverity>):  boolean;
      function Validate(out ADict : IDictionary<string,TSeverity>): boolean;
      procedure WrapQuery;
      procedure Entity (const Avalue : IPatchManagerRTControllerPatchEntity);
      procedure Log(const Avalue : IPatchManagerRTControllerLog);
      procedure VerifyExist;
      class function New(
        const ADatabase : string)
          : IPatchManagerRTControllerValidator;
  end;


implementation

uses
  PatchManagerRT.Model.Factory,
  PatchManagerRT.Controller.Factory,
  PatchManagerRT.TFDConnection.Factory,
  System.RegularExpressions,
  PatchManagerRT.Constants,
  StrUtils,
  System.SysUtils;


{ TPatchManagerRTControllerValidator }

constructor TPatchManagerRTControllerValidator.Create(const ADatabase : string);
begin
  FModel := TPatchManagerRTModelFactory.New.Validator;
  FEntity := TPatchManagerRTControllerFactory.New.Entity;
  Flog := TPatchManagerRTControllerFactory.new.log(TConnectionType.Json);
  FConnection := TPatchManagerRTControllerFactory.New.DBConnection(function: IPatchManagerRTTFDConnection
  begin
    Result := TPatchManagerRTTFDConnectionFactory.new.TFDConnection(ADatabase);
  end);
  FModel.Connection(FConnection.Connection.GetConnectionDB);
  FCommandList := TCollections.CreateList<string>;
  FModel.CommandList(FCommandList);
end;

//procedura per la verifica dell'esistenza dei controlli nelle query
procedure TPatchManagerRTControllerValidator.VerifyExist;
var
  LMatch : TMatch;
begin
  //Create
  LMatch := TRegEx.Match(FEntity.Command, VALIDATED_CREATE_REGEX,
                        [roIgnoreCase,roSingleLine]);
  if LMatch.success then
  begin
    FEntity.ExistCommand(FEntity.Command);
    FEntity.Command(LMatch.Groups[1].Value);
    exit;
  end;
  //Add Column
  LMatch := TRegEx.Match(FEntity.Command, VALIDATED_ADDCOLUMN_REGEX,
                        [roIgnoreCase,roSingleLine]);
  if LMatch.success then
  begin
    FEntity.ExistCommand(FEntity.Command);
    FEntity.Command(LMatch.Groups[1].Value);
    exit;
  end;
  //Create view
  LMatch := TRegEx.Match(FEntity.Command, VALIDATED_CREATEVIEW_REGEX,
                           [roIgnoreCase,roSingleLine]);
  if LMatch.Success then
  begin
    FEntity.ExistCommand(FEntity.Command);
    FEntity.Command(LMatch.Groups[1].Value);
    exit;
  end;
  //Foreign Key
  LMatch := TRegEx.Match(FEntity.Command, VALIDATED_ADDFOREIGNKEY_REGEX,
                        [roIgnoreCase,roSingleLine]);
  if LMatch.Success then
  begin
    FEntity.ExistCommand(FEntity.Command);
    FEntity.Command(LMatch.Groups[1].Value);
    exit;
  end;
  //Insert into pardef
  LMatch := TRegEx.Match(FEntity.Command, VALIDATED_INSERTINTO_PARDEF_REGEX,
                        [roIgnoreCase,roSingleLine]);
  if LMatch.Success then
  begin
    FEntity.ExistCommand(FEntity.Command);
    FEntity.Command(LMatch.Groups[1].Value);
    exit;
  end;
  WrapQuery;
end;
//nel caso non sia presente il controllo chiama wrapquery che lo aggiunge
procedure TPatchManagerRTControllerValidator.WrapQuery;
var
  LMatch : TMatch;
  LTableName : string;
begin
  FEntity.ExistCommand.Empty;
  //Create table
  LMatch := TRegEx.Match(FEntity.Command, CREATE_REGEX , [roIgnoreCase]);
  if LMatch.Success then
  begin

    if  LMatch.Groups[1].Value.IsEmpty  then
    begin
      LTableName := LMatch.Groups[2].Value;
      FEntity.ExistCommand(format(NOVALIDATED_CREATE_DB, [LTableName,FEntity.Command]));
      exit;
    end
    else
    begin
      var LDbName := LMatch.Groups[1].Value;
      LTableName := LMatch.Groups[2].Value;
      FEntity.ExistCommand(format(NOVALIDATED_CREATE_NODB , [LDbName,LTableName,FEntity.Command]));
      exit;
    end;
  end;
  //Foreign Key
  LMatch := TRegEx.Match(FEntity.Command, FOREIGNKEY_REGEX ,[roIgnoreCase]);
  if LMatch.Success then
  begin
    var LFKKey := LMatch.Groups[2].Value;
    FEntity.ExistCommand(format(NOVALIDATED_FOREIGNKEY, [LFKKey,FEntity.Command]));
    exit;
  end
  else
  begin
  //Add column
    LMatch := TRegEx.Match(FEntity.Command, ADDCOLUMN_REGEX
          , [roIgnoreCase]);
    if LMatch.Success then
    begin
      var LDbName := LMatch.Groups[1].Value;
      LTableName := LMatch.Groups[2].Value;
      var LFKKey := LMatch.Groups[3].Value;
      if LDbName.IsEmpty then
      begin
        FEntity.ExistCommand(format(NOVALIDATED_ADDCOLUMN_DB,
                                    [LTableName,LFKKey,FEntity.Command]));
        exit;
      end
      else
      begin
        FEntity.ExistCommand(format(NOVALIDATED_ADDCOLUMN_NODB,
                                    [LDbName,LTableName,LFKKey,FEntity.Command]));
        exit;
      end;
    end;
  end;
  //Create view
  LMatch := TRegEx.Match(FEntity.Command, CREATEVIEW_REGEX, [roIgnoreCase]);
  if LMatch.Success then
  begin
    LTableName := LMatch.Groups[1].Value;
    FEntity.ExistCommand(format(NOVALIDATED_CREATEVIEW ,
                                [LTableName,FEntity.Command]));
    exit;
  end;
  //inserti into pardef
  LMatch := TRegEx.Match(FEntity.Command,INSERT_PARDEF_REGEX, [roIgnoreCase,roSingleLine]);
  if LMatch.Success then
  begin
    var LKey := LMatch.Groups[1].Value;
    FEntity.ExistCommand(format(NOVALIDATED_INSERT_PARDEF ,
                                [Fentity.command, LKey]));
    exit;
  end;


  FEntity.ExistCommand(FEntity.Command);
end;

procedure TPatchManagerRTControllerValidator.Entity(
  const AValue: IPatchManagerRTControllerPatchEntity);
begin
  FEntity := Avalue;
end;
//effettua una verifica sulla lista di tutti i comandi e poi salva il json
function TPatchManagerRTControllerValidator.GlobalValidate(
  out ADict : IDictionary<string,TSeverity>): boolean;
begin
  try
  Result := True;
    if not FModel.GlobalValidate(ADict) then
    begin
      Result := false;
      exit;
    end;
      except
        on e : exception do
          begin
            Result := False;
            raise Exception.Create(e.message);
          end;
  end;
end;

procedure TPatchManagerRTControllerValidator.log(
  const Avalue: IPatchManagerRTControllerLog);
begin
  Flog := Avalue;
  FModel.Log(FLog);
end;
//effettua una verifica ogni volta che viene aggiunta una nuova query
function TPatchManagerRTControllerValidator.Validate(
  out ADict : IDictionary<string,TSeverity>) : boolean;
begin
  try
    Result := True;
    VerifyExist;
    FCommandList.add(FEntity.Command);
    if not GlobalValidate(ADict) then
    begin
      Result := false;
      exit;
    end;
    except
      on e : exception do
      begin
        Result := False;
        raise Exception.Create(e.message);
      end;
  end;
end;

class function TPatchManagerRTControllerValidator.New(
  const ADatabase : string): IPatchManagerRTControllerValidator;
begin
  Result := self.create(ADatabase);
end;
//rimuove il comando nel caso in cui l'aggiunta della query non vada a buon fine
procedure TPatchManagerRTControllerValidator.RemoveCommand;
begin
   FCommandList.Remove(FEntity.Command);
end;

end.
