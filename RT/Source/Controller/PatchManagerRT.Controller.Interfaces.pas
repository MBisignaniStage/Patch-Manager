unit PatchManagerRT.Controller.Interfaces;

interface
uses
  System.Classes,
  System.JSON,
  System.Generics.Collections,
  System.SysUtils,
  Spring.Collections,
  FireDAC.Comp.Client,
  PatchManagerRT.TFDConnection.Interfaces,
  Rest.Json;


  const CONNECTION_DEF_NAME = 'PatchManager';

type

  {$SCOPEDENUMS ON}
  TSeverity = (None, Block, Ask, Warning);
  {$SCOPEDENUMS OFF}

 IPatchManagerRTControllerPatchEntity = interface
  ['{AE93606C-BB90-4DD5-B3E0-E16D6D41F27F}']
    function Created : string; overload;
    procedure Created(const AValue : string); overload;
    function DbType : string; overload;
    procedure DbType(const AValue: string); overload;
    function ID : Integer; overload;
    procedure ID(const AValue : Integer); overload;
    function Command : string; overload;
    procedure Command(const AValue: string); overload;
    function ExistCommand : string; overload;
    procedure ExistCommand(const AValue : string); overload;
    function Description : string; overload;
    procedure Description(const AValue: string); overload;
    function PatchId : TGUID; overload;
    procedure PatchId(const Avalue : TGUID); overload;
    function Validate(out AErrorMessage : string): Boolean;
    function ToJSON : TJsonObject;
    function CopyEntity(
      AEntity :IPatchManagerRTControllerPatchEntity
      ) : IPatchManagerRTControllerPatchEntity;
  end;

  IPatchManagerRTControllerLogEntity = interface
  ['{3E7A6139-E152-4676-B2D3-5C8CE25E285E}']
    function Created : String; overload;
    procedure Created(const Avalue : string); overload;
    function LogType: String; overload;
    procedure LogType(const Avalue : string); overload;
    function LogInfo: string; overload;
    procedure LogInfo(const Avalue : string); overload;
  end;
//Database Config
  IPatchManagerRTControllerConfigDb = interface
  ['{91B84657-F4FF-4388-B916-C3F985BC4AF6}']
    function Server : string; overload;
    procedure Server(const AValue : string); overload;
    function DataBase : string; overload;
    procedure DataBase(const AValue : string); overload;
    function NomeUtente : string; overload;
    procedure NomeUtente(const AValue : string); overload;
    function Password : string; overload;
    procedure Password(const AValue : string) ; overload;
  end;
//Path Config
  IPatchManagerRTControllerConfigPath = interface
  ['{6A25FB82-6A11-4BFA-9FE9-139EBD68DA8C}']
    function JsonDir : string; overload;
    procedure JsonDir(const AValue : string); overload;
    function LogDir : string; overload;
    procedure LogDir(const Avalue : string); overload;
//    function Validate(out AErrorList : IList<string>) : Boolean;
  end;
//Main config
  IPatchManagerRTControllerConfigEntity = interface
  ['{6763C976-8CB3-4AB5-8767-EDD1CAECA14F}']
    function Path : IPatchManagerRTControllerConfigPath;
    function DatabaseAz : IPatchManagerRTControllerConfigDb;
    function DatabaseConf : IPatchManagerRTControllerConfigDb;
    function DatabaseStat : IPatchManagerRTControllerConfigDb;
  end;

  IPatchManagerRTControllerConfig = interface
  ['{02C67CB0-8D2E-460F-85D2-EA6A2A7D07B1}']
    function Config : IPatchManagerRTControllerConfigEntity; overload;
    procedure Config(
      const Avalue : IPatchManagerRTControllerConfigEntity); overload;
    procedure load;
    function WriteConfig : boolean;
  end;

  IPatchManagerRTControllerLog = interface
  ['{0DF1D2F4-434C-4449-8E4E-86B2B3364D20}']
    procedure Log(const Avalue : IPatchManagerRTControllerLogEntity); overload;
    function Log : IPatchManagerRTControllerLogEntity; overload;
    function GetLog : string;
    procedure SaveLog;
    procedure WriteLog(const ALogType : string ; const ALogInfo: string);
  end;

  IPatchManagerRTControllerWizardPardefEntity = interface
    ['{7BEEA271-0038-4336-BE88-0C77A9EE5637}']
    procedure Chiave(const AValue : string); overload;
    function Chiave : string; overload;
    procedure Obbligatorio(const AValue : string); overload;
    function Obbligatorio : string; overload;
    procedure ID(const AValue : string); overload;
    function ID : string; overload;
    procedure ValID(const AValue : string); overload;
    function ValID : string; overload;
    procedure ValInt(const AValue : string); overload;
    function ValInt : string; overload;
    procedure ValDP(const AValue : string); overload;
    function ValDP : string; overload;
    procedure Tabella(const AValue : string); overload;
    function Tabella : string; overload;
    procedure Nascosto(const AValue : string); overload;
    function Nascosto : string; overload;
    procedure SolaLet(const AValue : string); overload;
    function SolaLet : string; overload;
    procedure ChiavePadre(const Avalue :string); overload;
    function ChiavePadre : string; overload;
    procedure ValStr(const AValue : string); overload;
    function ValStr : string; overload;
    procedure TipoDato(const Avalue : string); overload;
    function TipoDato : string; overload;
    procedure Descr(const AValue : string); overload;
    function Descr : string; overload;
    procedure Stropz(const AValue : IDictionary<string, string>); overload;
    function Stropz : IDictionary<string,string>; overload;
  end;

  IPatchManagerRTControllerWizardPardef = interface
    ['{FB782BAE-3258-4571-BDFC-491EE7655EB1}']
  function GetPatch(const Tipo : string) : string;
   procedure GetQuery(out AKeyList, AtypeList : Ilist<string>);
   function GetTables : ilist<string>;
   function Entity : IPatchManagerRTControllerWizardPardefEntity; overload;
   procedure Entity(
    const Avalue : IPatchManagerRTControllerWizardPardefEntity); overload;
  end;


  IPatchManagerRTControllerPatch = interface
  ['{9CDFE52F-1683-4F39-A583-FBE775F3D420}']
    function Entity : IPatchManagerRTControllerPatchEntity; overload;
    procedure Entity(const Avalue : IPatchManagerRTControllerPatchEntity); overload;
    function DatabaseAssigned(ADeassign : boolean = true) : boolean;
    function Insert(out AErrorList : Ilist<string>) : boolean;
    function Save : boolean;
    function GetLog : string;
    function Errors: Ilist<string>;
    function GetPatch : string;
//    function load : TList<String>;
  end;

  {$SCOPEDENUMS ON}
  TConnectionType = (None, Json, DB);
  {$SCOPEDENUMS OFF}

  IPatchManagerRTControllerConnection<T> = interface
  ['{4FA8E4ED-B3BE-4394-920A-F244F82741CC}']
    function Connection : T;
    function ConnectionType : TConnectionType;
  end;

  IPatchManagerRTControllerValidator = interface
  ['{19C55644-4372-4F49-9324-AE817C6494E2}']
    function GlobalValidate(out ADict : IDictionary<string,TSeverity>):  boolean;
    function Validate(out ADict : IDictionary<string,TSeverity>): boolean;
    procedure Entity (const Avalue : IPatchManagerRTControllerPatchEntity);
    procedure Log(const Avalue : IPatchManagerRTControllerLog);
    procedure RemoveCommand;
  end;

  IPatchManagerRTControllerFactory = interface
  ['{30339745-60AC-44A8-B91A-041AC02759D4}']
    function Entity : IPatchManagerRTControllerPatchEntity;
    function EntityLog : IPatchManagerRTControllerLogEntity;
    function EntityConfig : IPatchManagerRTControllerConfigEntity;
    function EntityPardef : IPatchManagerRTControllerWizardPardefEntity;
    function Pardef(
      const DbType : string) :  IPatchManagerRTControllerWizardPardef;
    function Config: IPatchManagerRTControllerConfig;
    function Patch(const AConnection :TConnectionType; const AViewMessage : TFunc<string, TSeverity, boolean>) : IPatchManagerRTControllerPatch;
    function Log(const AConnection : TConnectionType) : IPatchManagerRTControllerLog;
    function JSONConnection(const AConnectionFunc: TFunc<string>): IPatchManagerRTControllerConnection<string>;
    function DBConnection(const AConnectionFunc: TFunc<IPatchManagerRTTFDConnection>) :
      IPatchManagerRTControllerConnection<IPatchManagerRTTFDConnection>;
    function Validator(const ADatabase : string) : IPatchManagerRTControllerValidator;
  end;

implementation

end.
