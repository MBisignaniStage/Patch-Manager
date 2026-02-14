program PatchManager;

uses
  FastMM4,
  FastMM4Messages,
  Vcl.Forms,
  PatchManager.Main in 'Source\PatchManager.Main.pas' {FrmPatchManagerMain};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := True;
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPatchManagerMain, FrmPatchManagerMain);
  Application.Run;
end.
