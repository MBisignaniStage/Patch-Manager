unit PatchManager.Frame.BasePage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Mask;

type
  TBaseFrame = class abstract(TFrame)
    PanelButton: TPanel;
    Button2: TButton;
    SaveNew: TButton;
    Save: TButton;
  private
    FOnSaveAndClose: TProc;
    FClose: TProc;
    procedure SetOnSaveAndClose(const Value: TProc);
    procedure SetClose(const Value: TProc);
  public
    constructor Create(AOwner: TComponent); override;
    property OnSaveAndClose:TProc read FOnSaveAndClose write SetOnSaveAndClose;
    property OnClose:TProc read FClose write SetClose;
    function SaveButton : tbutton;
    function SaveNewButton : tbutton;
  end;

TPageClass = class of TBaseFrame;

implementation

uses
  PatchManagerRT.Controller.Interfaces,
  PatchManagerRT.Controller.Patch.Entity;

{$R *.dfm}

{ TBaseFrame }

constructor TBaseFrame.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
end;

function TBaseFrame.SaveButton: tbutton;
begin
  Result := Save;
end;

function TBaseFrame.SaveNewButton: tbutton;
begin
  Result := SaveNew;
end;

procedure TBaseFrame.SetClose(const Value: TProc);
begin
  FClose := value;
end;

procedure TBaseFrame.SetOnSaveAndClose(const Value: TProc);
begin
  FOnSaveAndClose := Value;
end;

end.
