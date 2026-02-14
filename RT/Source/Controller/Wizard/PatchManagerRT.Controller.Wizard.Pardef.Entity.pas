unit PatchManagerRT.Controller.Wizard.Pardef.Entity;

interface

uses
  spring.Collections,
  PatchManagerRT.Controller.Interfaces;


type
  TPatchManagerControllerWizardPardefEntity = class(TInterfacedObject, IPatchManagerRTControllerWizardPardefEntity)
  private
    FChiave : string;
    FChiavePadre : string;
    FValStr : string;
    FTipoDato : string;
    FID : string;
    FValID : string;
    FValInt : string;
    FValDP : string;
    FTabella : string;
    FDescr : string;
    FObbligatorio : string;
    FSolaLet : string;
    FNascosoto : string;
    FStropz : IDictionary<string,string>;
  public
    procedure Chiave(const AValue : string); overload;
    function Chiave : string; overload;
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
    procedure Obbligatorio(const AValue : string); overload;
    function Obbligatorio : string; overload;
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
    class function New : TPatchManagerControllerWizardPardefEntity;
  private
    constructor Create;
end;


implementation

uses
  System.SysUtils;

{ TPatchManagerControllerWizardEntity }

function TPatchManagerControllerWizardPardefEntity.ChiavePadre: string;
begin
  Result := FChiavePadre;
end;

procedure TPatchManagerControllerWizardPardefEntity.ChiavePadre(
  const Avalue: string);
begin
  FChiavePadre := AValue;
end;

function TPatchManagerControllerWizardPardefEntity.Chiave: string;
begin
  Result := FChiave;
end;

procedure TPatchManagerControllerWizardPardefEntity.Chiave(const AValue: string);
begin
  FChiave := AValue;
end;

constructor TPatchManagerControllerWizardPardefEntity.Create;
begin
  FChiave := EmptyStr;
  FDescr := EmptyStr;
  FObbligatorio := '0';
  FSolaLet := '0';
  FNascosoto  := '0';
  FID := EmptyStr;
  FValID := EmptyStr;
  FValStr := EmptyStr;
  FValDP := EmptyStr;
  FTabella := EmptyStr;
  FStropz := TCollections.CreateDictionary<string,string>;
  FTipoDato := EmptyStr;
  FValStr := EmptyStr;
end;

procedure TPatchManagerControllerWizardPardefEntity.Descr(const AValue: string);
begin
  FDescr := AValue;
end;

function TPatchManagerControllerWizardPardefEntity.Descr: string;
begin
  Result := FDescr;
end;

procedure TPatchManagerControllerWizardPardefEntity.ID(const AValue: string);
begin
  FID := AValue;
end;

function TPatchManagerControllerWizardPardefEntity.ID: string;
begin
  Result := FID;
end;

procedure TPatchManagerControllerWizardPardefEntity.Nascosto(
  const AValue: string);
begin
  FNascosoto := AValue;
end;

function TPatchManagerControllerWizardPardefEntity.Nascosto: string;
begin
  Result := FNascosoto;
end;

class function TPatchManagerControllerWizardPardefEntity.New: TPatchManagerControllerWizardPardefEntity;
begin
  Result := Self.Create;
end;

procedure TPatchManagerControllerWizardPardefEntity.Obbligatorio(
  const AValue: string);
begin
  FObbligatorio := AValue;
end;

function TPatchManagerControllerWizardPardefEntity.Obbligatorio: string;
begin
  Result := FObbligatorio;
end;

procedure TPatchManagerControllerWizardPardefEntity.SolaLet(
  const AValue: string);
begin
  FSolaLet := AValue;
end;

function TPatchManagerControllerWizardPardefEntity.SolaLet: string;
begin
  Result := FSolaLet;
end;

function TPatchManagerControllerWizardPardefEntity.Stropz: IDictionary<string, string>;
begin
  Result := FStropz;
end;
//da cambiare forse è sbagliato cosi
procedure TPatchManagerControllerWizardPardefEntity.Stropz(
  const AValue: IDictionary<string, string>);
begin
  FStropz := AValue;
end;

procedure TPatchManagerControllerWizardPardefEntity.TipoDato(const Avalue: string);
begin
  FTipoDato := Avalue;
end;

procedure TPatchManagerControllerWizardPardefEntity.Tabella(
  const AValue: string);
begin
  FTabella := AValue;
end;

function TPatchManagerControllerWizardPardefEntity.Tabella: string;
begin
  Result := FTabella;
end;

function TPatchManagerControllerWizardPardefEntity.TipoDato: string;
begin
  Result := FTipoDato;
end;

procedure TPatchManagerControllerWizardPardefEntity.ValStr(const AValue: string);
begin
  FValStr := AValue;
end;

procedure TPatchManagerControllerWizardPardefEntity.ValDP(const AValue: string);
begin
  FValDP := AValue;
end;

function TPatchManagerControllerWizardPardefEntity.ValDP: string;
begin
  Result := FValDP;
end;

procedure TPatchManagerControllerWizardPardefEntity.ValInt(const AValue: string);
begin
  FValInt := AValue;
end;

function TPatchManagerControllerWizardPardefEntity.ValID: string;
begin
  Result := FValID;
end;

procedure TPatchManagerControllerWizardPardefEntity.ValID(const AValue: string);
begin
  FValID := AValue;
end;

function TPatchManagerControllerWizardPardefEntity.ValInt: string;
begin
  Result := FValInt;
end;

function TPatchManagerControllerWizardPardefEntity.ValStr: string;
begin
  Result := FValStr;
end;

end.
