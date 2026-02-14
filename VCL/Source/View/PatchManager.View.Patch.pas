unit PatchManager.View.Patch;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls,
  System.Actions, Vcl.ActnList;

type
  TPatch = class(TForm)
    TestoPatch: TLabeledEdit;
    PanelButton: TPanel;
    BtnOk: TButton;
    BtnCancel: TButton;
    DescrizionePatch: TLabeledEdit;
    ActionListPatch: TActionList;
    ActOk: TAction;
    ActCancel: TAction;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}



end.
