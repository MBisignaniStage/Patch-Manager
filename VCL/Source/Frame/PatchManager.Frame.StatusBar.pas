unit PatchManager.Frame.StatusBar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TPatchManagerFrameStatusBar = class(TFrame)
    Label1: TLabel;
    Panel1: TPanel;
  private

    { Public declarations }
  end;

implementation


{$R *.dfm}


end.
