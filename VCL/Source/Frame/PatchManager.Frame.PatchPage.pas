unit PatchManager.Frame.PatchPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, PatchManager.Frame.BasePage,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, PatchManagerRT.Controller.Interfaces,
  System.Actions, Vcl.ActnList, AdvMemo, AdvmSQLS, AdvMemoStylerManager,
  advmjson, AdvCodeList, Vcl.ComCtrls;

type
  TPatchPage = class(TBaseFrame)
    Panel2: TPanel;
    AdvJSONMemoStyler1: TAdvJSONMemoStyler;
    AdvSQLMemoStyler1: TAdvSQLMemoStyler;
    JsonMemo: TAdvMemo;
    Panel3: TPanel;
    Label2: TLabel;
    InsButton: TButton;
    Panel1: TPanel;
    Label1: TLabel;
    DbType: TComboBox;
    DescritionPatch: TLabeledEdit;
    Panel4: TPanel;
    Log: TMemo;
    PatchMemo: TAdvMemo;
    Splitter1: TSplitter;
    Panel5: TPanel;
    Panel6: TPanel;
    WizardButton: TButton;
    procedure DescritionPatchExit(Sender: TObject);
    procedure PatchMemoExit(Sender: TObject);
    procedure DbTypeChange(Sender: TObject);
    procedure SaveNew(Sender: TObject);
    procedure Save(Sender: TObject);
    procedure Close(Sender: TObject);
    procedure InsertClick(Sender: TObject);
    procedure LoadClick(Sender: TObject);
    procedure WizardButtonClick(Sender: TObject);
  private
    FController : IPatchManagerRTControllerPatch;
    FViewMessage : TFunc<string, TSeverity, boolean>;
    procedure AssegnaControlli;
  public
    constructor Create(AOwner: TComponent); override;
  end;

implementation

{$R *.dfm}

uses
 PatchManagerRT.Controller.Factory,
 System.DateUtils,
 PatchManager.Form.WizardPage,
 PatchManagerRT.Constants,
 Spring.Collections;

{ TPatchPage }


procedure TPatchPage.AssegnaControlli;
begin
  DescritionPatch.Text := FController.Entity.Description;
  PatchMemo.Clear;
  PatchMemo.InsertText(FController.Entity.Command);
  DbType.Text := FController.Entity.DbType;
end;

procedure TPatchPage.InsertClick(Sender: TObject);
var
  LErrorList : Ilist<string>;
begin
  inherited;
  if not FController.Insert(LErrorList) then
  begin
    Log.Lines.AddStrings(FController.GetLog);
    exit;
  end;
  if DbType.Enabled then
    DbType.Enabled := false;
  if (not SaveButton.Enabled) and (not SaveNewButton.Enabled) then
  begin
    SaveButton.Enabled := enabled;
    SaveNewButton.Enabled := enabled;
  end;
  JsonMemo.Clear;
  JsonMemo.InsertText(FController.GetPatch);
  Log.Lines.AddStrings(FController.GetLog);
end;

//questo è da usare successivamente
procedure TPatchPage.LoadClick(Sender: TObject);
begin
  inherited;
  Log.Clear;
end;

procedure TPatchPage.WizardButtonClick(Sender: TObject);
var
  LWizardForm : TWizardPage;
begin
  inherited;
  LWizardForm := TWizardPage.create(nil,FController.Entity.DbType);
  try
    if LWizardForm.ShowModal = mrOk then
    begin
    FController.Entity.Command(LWizardForm.MemoQuery.WrappedText);
    AssegnaControlli;
    end;
  finally
    LWizardForm.free;
  end;

end;

procedure TPatchPage.Close(Sender: TObject);
begin
  if Assigned(OnClose) then
  OnClose;
end;

procedure TPatchPage.DbTypeChange(Sender: TObject);
begin
  inherited;
  FController.Entity.DbType(DbType.Items[DbType.ItemIndex]);
//verificao che se il bottone del wizard non è attivo lo abilito a seguito
//della selezione del database
  if not WizardButton.Enabled then
  begin
    WizardButton.Enabled := true;
  end;
//verifico la connessione del database sia assegnata alla variabile fvalidatror
  if FController.DatabaseAssigned then
  begin
    FController.DatabaseAssigned(false);
  end;
  AssegnaControlli;
end;

constructor TPatchPage.Create(AOwner: TComponent);
var Ldatabase : string;
begin
  inherited;
  for Ldatabase in DATABASES do
  begin
    DbType.Items.Add(Ldatabase);
  end;
  WizardButton.Enabled := false;
  SaveButton.Enabled := false;
  SaveNewButton.Enabled := false;
  var LFactory := TPatchManagerRTControllerFactory.New;
  FViewMessage := function(AMessage : string; LSeverity : TSeverity) : boolean
    begin
      Result := true;
      if LSeverity = TSeverity.Ask then
      begin
        if MessageDlg(AMessage, mtConfirmation, [mbYes, mbNo], 0) = mryes then
        begin
          Result := false;
          exit;
        end;
      end
      else
      begin
        MessageDlg(AMessage, mtCustom , [mbOK], 0);
        Result := false;
      end;
    end;
  FController := LFactory.Patch(TConnectionType.json, FViewMessage);
end;

procedure TPatchPage.DescritionPatchExit(Sender: TObject);
begin
  inherited;
  FController.Entity.Description(DescritionPatch.Text);
  AssegnaControlli;
end;

procedure TPatchPage.PatchMemoExit(Sender: TObject);
begin
  inherited;
  FController.Entity.Command(PatchMemo.WrappedText);
  AssegnaControlli;
end;

procedure TPatchPage.Save(Sender: TObject);
begin
  if not Fcontroller.Save then
    begin
//      FController.ViewMessage;
      exit;
    end
    else
    begin
      if Assigned(OnSaveAndClose) then
      OnSaveAndClose;
    end;
end;

procedure TPatchPage.SaveNew(Sender: TObject);
begin
  if not Fcontroller.Save then
    begin
//      FController.ViewMessage;
      exit;
    end;
  DescritionPatch.Clear;
  JsonMemo.clear;
  PatchMemo.Clear;
  Log.Clear;
  DbType.ClearSelection;
  DbType.Enabled := true;
  SaveButton.Enabled := false;
  SaveNewButton.Enabled := false;
  FController := TPatchManagerRTControllerFactory.New.patch(TConnectionType.json,FViewMessage);
end;
end.

