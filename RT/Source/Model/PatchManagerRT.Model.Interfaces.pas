unit PatchManagerRT.Model.Interfaces;



interface
uses
  PatchManagerRT.Controller.Interfaces,
  System.JSON,
  Spring.Collections,
  FireDAC.Comp.Client,
  System.RegularExpressions,
  System.Generics.Collections;

type

  IPatchManagerRTModelPatchToJson = interface
  ['{D6105EB5-8E4B-4D33-B717-3141AF9C7DE0}']
    procedure Entity(const AValue : IPatchManagerRTControllerPatchEntity);
    function Save: boolean;
    function Insert: boolean;
    function GetJsonPatch: string;
    function Load : IList<String>;
    procedure Connection(const AConnection : string);
    end;

  IPatchManagerRTModelLog = interface
  ['{24FBE5B7-0D98-4ECC-AF5F-09A746B4405A}']
    procedure Log(const AValue : IPatchManagerRTControllerLogEntity);
    procedure WriteLog(const AType : string; const AInfo : string);
    procedure Connection(const AConnection : string);
    function GetLog : String;
    function SaveLog : boolean;
  end;

  IPatchManagerRTModelConfig = interface
  ['{5731C336-5908-4FDD-A377-FD6B510E0910}']
    procedure Config(const Avalue : IPatchManagerRTControllerConfigEntity);
    procedure Connection(const AConnection : string);
    function Load : boolean;
    function WriteConfig : boolean;
  end;

  IPatchManagerRTModelValidator = interface
  ['{69982B51-89C6-453B-B9F6-1C7936F1ED6A}']
    procedure Connection(const Avalue : TFDConnection);
    procedure Log(const Avalue : IPatchManagerRTControllerLog);
    function ValidateFK_Key(
        out ADict : IDictionary<string,TSeverity>; ACommand : string)  : boolean;
    function GlobalValidate(
         out ADict : IDictionary<string,TSeverity>): boolean;
    function IsUpperCase(const AValue : string): boolean;
    procedure CommandList(const Avalue : IList<string>);
  end;

  IPatchManagerRTModelFactory = interface
  ['{711A3993-C8AB-4F86-B506-68271A608719}']
    function ToJson: IPatchManagerRTModelPatchToJson;
    function Log : IPatchManagerRTModelLog;
    function Config : IPatchManagerRTModelConfig;
    function Validator : IPatchManagerRTModelValidator;
  end;

implementation

end.
