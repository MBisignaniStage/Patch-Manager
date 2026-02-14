unit PatchManagerRT.Controller.Factory;

interface

uses
  System.SysUtils,
  PatchManagerRT.Controller.Interfaces,
  PatchManagerRT.TFDConnection.Interfaces,
  FireDAC.Comp.Client;


type
  TPatchManagerRTControllerFactory = class(TInterfacedObject, IPatchManagerRTControllerFactory)
  public
    function Connection<T>(const AConnection: TConnectionType;
      const AConnectionFunc: TFunc<T>): IPatchManagerRTControllerConnection<T>;
    function Entity : IPatchManagerRTControllerPatchEntity;
    function EntityLog : IPatchManagerRTControllerLogEntity;
    function EntityConfig : IPatchManagerRTControllerConfigEntity;
    function EntityPardef : IPatchManagerRTControllerWizardPardefEntity;
    function Pardef(
      const DbType : string) :  IPatchManagerRTControllerWizardPardef;
    function Config : IPatchManagerRTControllerConfig;
    function Patch(
      const AConnection :TConnectionType;
      const AViewMessage : TFunc<string, TSeverity, boolean>) : IPatchManagerRTControllerPatch;
    function Log(
      const AConnection : TConnectionType) : IPatchManagerRTControllerLog;
    function DBConnection(
      const AConnectionFunc: TFunc<IPatchManagerRTTFDConnection>)
       : IPatchManagerRTControllerConnection<IPatchManagerRTTFDConnection>;
    function JSONConnection(
      const AConnectionFunc: TFunc<string>): IPatchManagerRTControllerConnection<string>;
    function Validator(
      const ADatabase : string) : IPatchManagerRTControllerValidator;
    class function New: IPatchManagerRTControllerFactory;
  end;


implementation

uses
  PatchManagerRT.Controller.Patch.Entity,
  PatchManagerRT.Controller.Patch,
  PatchManagerRT.Controller.Log,
  PatchManagerRT.Controller.Log.Entity,
  PatchManagerRT.Controller.Connection,
  PatchManagerRT.Controller.Config,
  PatchManagerRT.Controller.Config.Entity,
  PatchManagerRT.Controller.Validator,
  PatchManagerRT.Controller.Wizard.Pardef.Entity,
  PatchManagerRT.Controller.Wizard.Pardef;

function TPatchManagerRTControllerFactory.Config: IPatchManagerRTControllerConfig;
begin
  Result := TPatchManagerRTControllerConfig.new;
end;

function TPatchManagerRTControllerFactory.EntityConfig: IPatchManagerRTControllerConfigEntity;
begin
  Result := TPatchManagerRTControllerConfigEntity.new;
end;

function TPatchManagerRTControllerFactory.Connection<T>(
  const AConnection: TConnectionType; const AConnectionFunc: TFunc<T>): IPatchManagerRTControllerConnection<T>;
begin
  Result := TPatchManagerRTControllerConnection<T>.New(AConnection, AConnectionFunc);
end;

function TPatchManagerRTControllerFactory.DBConnection(
  const AConnectionFunc: TFunc<IPatchManagerRTTFDConnection>):
    IPatchManagerRTControllerConnection<IPatchManagerRTTFDConnection>;
begin
  Result := Connection<IPatchManagerRTTFDConnection>(TConnectionType.DB, AConnectionFunc);
end;

function TPatchManagerRTControllerFactory.Entity: IPatchManagerRTControllerPatchEntity;
begin
  Result := TPatchManagerRTControllerPatchEntity.New;
end;

function TPatchManagerRTControllerFactory.EntityLog: IPatchManagerRTControllerLogEntity;
begin
  Result := TPatchManagerRTControllerLogEntity.New;
end;

function TPatchManagerRTControllerFactory.EntityPardef: IPatchManagerRTControllerWizardPardefEntity;
begin
  Result := TPatchManagerControllerWizardPardefEntity.new;
end;

function TPatchManagerRTControllerFactory.JSONConnection(
  const AConnectionFunc: TFunc<string>): IPatchManagerRTControllerConnection<string>;
begin
  Result := Connection<string>(TConnectionType.JSON, AConnectionFunc);
end;

function TPatchManagerRTControllerFactory.Log(const AConnection : TConnectionType): IPatchManagerRTControllerLog;
begin
  Result := TPatchManagerRTControllerLog.New(AConnection);
end;

class function TPatchManagerRTControllerFactory.New: IPatchManagerRTControllerFactory;
begin
  Result := Self.Create;
end;

function TPatchManagerRTControllerFactory.Pardef(const DbType : string): IPatchManagerRTControllerWizardPardef;
begin
  Result := TPatchManagerRTControllerWizardPardef.New(DbType);
end;

function TPatchManagerRTControllerFactory.Patch(
  const AConnection: TConnectionType;
  const AViewMessage: TFunc<string, TSeverity, boolean>): IPatchManagerRTControllerPatch;
begin
  Result := TPatchManagerRTControllerPatch.New(AConnection, AViewMessage);
end;

function TPatchManagerRTControllerFactory.Validator(
  const ADatabase : string): IPatchManagerRTControllerValidator;
begin
  Result := TPatchManagerRTControllerValidator.New(ADatabase);
end;

end.
