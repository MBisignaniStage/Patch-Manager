unit PatchManagerRT.Controller.Wizard.Pardef;

interface
uses
  PatchManagerRT.Controller.Interfaces,
  PatchManagerRT.TFDConnection.Interfaces,
  PatchManagerRT.DataTypes.Interfaces,
  Spring.Collections,
  FireDAC.Comp.Client,
  System.SysUtils;

type
  TPatchManagerRTControllerWizardPardef = class(TInterfacedObject, IPatchManagerRTControllerWizardPardef)
  private
    FEntity : IPatchManagerRTControllerWizardPardefEntity;
    FConnection : IPatchManagerRTControllerConnection<IPatchManagerRTTFDConnection>;
    FDataTypes : IPatchManagerRTDataTypes;
  public
    function Entity : IPatchManagerRTControllerWizardPardefEntity; overload;
    procedure Entity(
      const Avalue : IPatchManagerRTControllerWizardPardefEntity); overload;
    function GetPatch(const Tipo : string) : string;
    procedure GetQuery(out AKeyList, AtypeList : Ilist<string>);
    function GetTables : ilist<string>;
    constructor Create(const DbType : string);
    class function New(
      const DbType : string) : IPatchManagerRTControllerWizardPardef;
  end;


implementation

uses
  PatchManagerRT.Controller.Factory,
  PatchManagerRT.DataTypes.Factory,
  PatchManagerRT.TFDConnection.Factory;

{ TPatchManagerRTControllerWizardPardef }

constructor TPatchManagerRTControllerWizardPardef.Create(
  const DbType : string);
var
  LControllerFactory : IPatchManagerRTControllerFactory;
begin
  LControllerFactory := TPatchManagerRTControllerFactory.New;
  FConnection := TPatchManagerRTControllerFactory.New.DBConnection(function: IPatchManagerRTTFDConnection
  begin
    Result := TPatchManagerRTTFDConnectionFactory.new.TFDConnection(DbType);
  end);
  FEntity := LControllerFactory.EntityPardef;
  FDataTypes := TPatchManagerRTDataTypesFactory.new.DataTypes;

end;
//todo : finire il stropz e valstr e poi aggiungere la verifica all'insert into
procedure TPatchManagerRTControllerWizardPardef.GetQuery(
  out AKeyList,ATypeList : ilist<string>);
var
  LQuery : TFDQuery;
begin
  AKeyList := TCollections.CreateList<string>;
  ATypeList := TCollections.CreateList<string>;
  LQuery := TFDQuery.Create(nil);
  LQuery.Connection := FConnection.Connection.GetConnectionDB;
  try
    LQuery.SQL.Text :=  'select Chiave ' +
                        'from pardef ' +
                        'where Chiave like ''#%''';
    LQuery.Open;

    while not LQuery.eof do
    begin
      AKeyList.Add(LQuery.FieldByName('Chiave').AsString);
      LQuery.Next;
    end;

    LQuery.Close;
    LQuery.SQL.Text :=  'select distinct Tipodato ' +
                        'from PARDEF ' +
                        'where Tipodato IS NOT NULL and Tipodato <> ''''';
    LQuery.Open;

    while not LQuery.eof do
    begin
      AtypeList.Add(LQuery.FieldByName('Tipodato').AsString);
      LQuery.Next;
    end;

  finally
    LQuery.Close;
    LQuery.Free;
  end;
end;

function TPatchManagerRTControllerWizardPardef.GetTables: ilist<string>;
var
  LQuery : TFDQuery;
  LTableList : ilist<string>;
begin
  LTableList := TCollections.CreateList<string>;
  LQuery := TFDQuery.Create(nil);
  LQuery.Connection := FConnection.Connection.GetConnectionDB;
  try
    LQuery.SQL.Text :=  'select TABLE_NAME'  +
                        ' FROM INFORMATION_SCHEMA.TABLES' +
                        ' where TABLE_TYPE = ''BASE TABLE'''  +
                        ' ORDER BY TABLE_NAME';
    LQuery.Open;
    while not LQuery.eof do
    begin
      LTableList.Add(LQuery.FieldByName('TABLE_NAME').AsString);
      LQuery.Next;
    end;

  finally
    LQuery.Close;
    LQuery.Free;
    result := LTableList;
  end;
end;

procedure TPatchManagerRTControllerWizardPardef.Entity(
  const Avalue: IPatchManagerRTControllerWizardPardefEntity);
begin
  FEntity := Avalue;
end;

function TPatchManagerRTControllerWizardPardef.Entity:
  IPatchManagerRTControllerWizardPardefEntity;
begin
  Result := FEntity;
end;

function TPatchManagerRTControllerWizardPardef.GetPatch(const Tipo : string): string;
var
  LKey,LStropz,LQuery: string;
  LCode : integer;
  LDataTypes : IPatchManagerRTDataTypes;
begin
  LQuery := '';
  if FDataTypes.GetDict.TryGetValue(Tipo, LCode) then
    case LCode of
    0 :
      begin
      for LKey in FEntity.Stropz.Keys do
      begin
        LStropz := LStropz + format('%s;%s;',[LKey,FEntity.Stropz.Items[LKey]]);
      end;
      LQuery := format('insert into' + sLineBreak + 'PARDEF' + sLineBreak +
        '(CHIAVE, VALSTR, TIPODATO, IDPADRE, DESCR, PROG, STROPZ, SOLOLET, OBBLIGATORIO, NASCOSTO)' + sLineBreak +
        'select' + sLineBreak +
        '    ''%s''' + sLineBreak +
        '   ,''%s''' + sLineBreak +
        '   ,''%s''' + sLineBreak +
        '   ,ID' + sLineBreak +
        '   ,''%s''' + sLineBreak +
        '   ,isnull((select MAX(PROG) from PARDEF where (IDPADRE=par.ID)), 0)+10' + sLineBreak +
        '   ,''%s''' + sLineBreak +
        '   ,%s' + sLineBreak +
        '   ,%s' + sLineBreak +
        '   ,%s' + sLineBreak +
        'from' + sLineBreak +
        '   PARDEF par' + sLineBreak +
        'where' + sLineBreak +
        '(CHIAVE = ''%s'')' + sLineBreak +
        'AND' + sLineBreak +
        '(NOT EXISTS (SELECT ID FROM Pardef WHERE (Chiave=''%s'')))'
                            ,[FEntity.Chiave,
                            FEntity.ValStr,
                            FEntity.TipoDato,
                            FEntity.Descr,
                            LStropz,
                            FEntity.SolaLet,
                            FEntity.Obbligatorio,
                            FEntity.Nascosto,
                            FEntity.ChiavePadre,
                            FEntity.Chiave]);
      end;
    1 :
      begin
      LQuery := format('insert into' + sLineBreak + 'PARDEF' + sLineBreak +
        '(CHIAVE, %s, TIPODATO, IDPADRE, DESCR, PROG, TABELLA, SOLOLET, OBBLIGATORIO, NASCOSTO)' + sLineBreak +
        'select' + sLineBreak +
        '    ''%s''' + sLineBreak +
        '   ,''%s''' + sLineBreak +
        '   ,''%s''' + sLineBreak +
        '   ,ID' + sLineBreak +
        '   ,''%s''' + sLineBreak +
        '   ,isnull((select MAX(PROG) from PARDEF where (IDPADRE=par.ID)), 0)+10' + sLineBreak +
        '   ,''%s''' + sLineBreak +
        '   ,%s' + sLineBreak +
        '   ,%s' + sLineBreak +
        '   ,%s' + sLineBreak +
        'from' + sLineBreak +
        '   PARDEF par' + sLineBreak +
        'where' + sLineBreak +
        '(CHIAVE = ''%s'')' + sLineBreak +
        'AND' + sLineBreak +
        '(NOT EXISTS (SELECT ID FROM Pardef WHERE (Chiave=''%s'')))'
                            ,[FEntity.TipoDato,
                            FEntity.Chiave,
                            FEntity.ValID,
                            FEntity.TipoDato,
                            FEntity.Descr,
                            FEntity.Tabella,
                            FEntity.SolaLet,
                            FEntity.Obbligatorio,
                            FEntity.Nascosto,
                            FEntity.ChiavePadre,
                            FEntity.Chiave]);
      end;
    2 :
      begin
        LQuery := format('insert into' + sLineBreak + 'PARDEF' + sLineBreak +
        '(CHIAVE, VALINT, TIPODATO, IDPADRE, DESCR, PROG, SOLOLET, OBBLIGATORIO, NASCOSTO)' + sLineBreak +
        'select' + sLineBreak +
        '    ''%s''' + sLineBreak +
        '   ,%s' + sLineBreak +
        '   ,''%s''' + sLineBreak +
        '   ,ID' + sLineBreak +
        '   ,''%s''' + sLineBreak +
        '   ,isnull((select MAX(PROG) from PARDEF where (IDPADRE=par.ID)), 0)+10' + sLineBreak +
        '   ,%s' + sLineBreak +
        '   ,%s' + sLineBreak +
        '   ,%s' + sLineBreak +
        'from' + sLineBreak +
        '   PARDEF par' + sLineBreak +
        'where' + sLineBreak +
        '(CHIAVE = ''%s'')' + sLineBreak +
        'AND' + sLineBreak +
        '(NOT EXISTS (SELECT ID FROM Pardef WHERE (Chiave=''%s'')))'
                            ,[FEntity.Chiave,
                            FEntity.ValInt,
                            FEntity.TipoDato,
                            FEntity.Descr,
                            FEntity.SolaLet,
                            FEntity.Obbligatorio,
                            FEntity.Nascosto,
                            FEntity.ChiavePadre,
                            FEntity.Chiave]);
      end;
    3 :
     begin
        LQuery := format('insert into' + sLineBreak + 'PARDEF' + sLineBreak +
        '(CHIAVE, VALDP, TIPODATO, IDPADRE, DESCR, PROG, SOLOLET, OBBLIGATORIO, NASCOSTO)' + sLineBreak +
        'select' + sLineBreak +
        '    ''%s''' + sLineBreak +
        '   ,%s' + sLineBreak +
        '   ,''%s''' + sLineBreak +
        '   ,ID' + sLineBreak +
        '   ,''%s''' + sLineBreak +
        '   ,isnull((select MAX(PROG) from PARDEF where (IDPADRE=par.ID)), 0)+10' + sLineBreak +
        '   ,%s' + sLineBreak +
        '   ,%s' + sLineBreak +
        '   ,%s' + sLineBreak +
        'from' + sLineBreak +
        '   PARDEF par' + sLineBreak +
        'where' + sLineBreak +
        '(CHIAVE = ''%s'')' + sLineBreak +
        'AND' + sLineBreak +
        '(NOT EXISTS (SELECT ID FROM Pardef WHERE (Chiave=''%s'')))'
                            ,[FEntity.Chiave,
                            FEntity.ValDP,
                            FEntity.TipoDato,
                            FEntity.Descr,
                            FEntity.SolaLet,
                            FEntity.Obbligatorio,
                            FEntity.Nascosto,
                            FEntity.ChiavePadre,
                            FEntity.Chiave]);
     end;
    end;
  Result := LQuery;
end;

class function TPatchManagerRTControllerWizardPardef.New(
  const DbType : string): IPatchManagerRTControllerWizardPardef;
begin
  Result := Self.Create(DbType);
end;

end.

