unit PatchManager.Frame.ConfigurationPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, PatchManager.Frame.BasePage,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask,PatchManagerRT.Controller.Interfaces,
  System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage, Vcl.ComCtrls, Vcl.Menus,
  PatchManager.Frame.StatusBar, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client;

type
  TConfigurationPage = class(TBaseFrame)
    Panel1: TPanel;
    Label1: TLabel;
    JsonPath: TEdit;
    Panel2: TPanel;
    Panel3: TPanel;
    Label2: TLabel;
    LogPath: TEdit;
    SelectDirectory: TFileOpenDialog;
    BtnLogDirSave: TButton;
    BtnSaveJsonDir: TButton;
    ImageList1: TImageList;
    Panel4: TPanel;
    Panel5: TPanel;
    Label3: TLabel;
    NomeDatabaseAz: TEdit;
    NomeServerAz: TEdit;
    Label4: TLabel;
    Panel6: TPanel;
    Panel7: TPanel;
    Panel8: TPanel;
    Panel9: TPanel;
    UtenteAz: TEdit;
    Label5: TLabel;
    PasswordAz: TEdit;
    Label6: TLabel;
    Panel10: TPanel;
    AzButton: TButton;
    Panel11: TPanel;
    Panel12: TPanel;
    Panel13: TPanel;
    Label7: TLabel;
    DatabaseNameConf: TEdit;
    Panel14: TPanel;
    Label8: TLabel;
    ServerNameConf: TEdit;
    Panel15: TPanel;
    Label9: TLabel;
    UtenteConf: TEdit;
    Panel16: TPanel;
    Label10: TLabel;
    PasswordConf: TEdit;
    ConfButton: TButton;
    Panel17: TPanel;
    Label11: TLabel;
    DatabaseNameStat: TEdit;
    Panel18: TPanel;
    Label12: TLabel;
    ServerNameStat: TEdit;
    Panel19: TPanel;
    Label13: TLabel;
    UtenteStat: TEdit;
    Panel20: TPanel;
    Label14: TLabel;
    PasswordStat: TEdit;
    StatButton: TButton;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    TabSheet3: TTabSheet;
    Panel21: TPanel;
    FDConnection: TFDConnection;
    procedure Close(Sender: TObject);
    procedure Save(Sender: TObject);
    procedure BtnLogDirSaveClick(Sender: TObject);
    procedure BtnSaveJsonDirClick(Sender: TObject);
    procedure PasswordAzExit(Sender: TObject);
    procedure NomeDatabaseAzExit(Sender: TObject);
    procedure NomeServerAzExit(Sender: TObject);
    procedure UtenteAzExit(Sender: TObject);
    procedure TestConnessioneClick(
      Aserver,ADatabase,AUsername,APassword : string);
    procedure ConfButtonClick(Sender: TObject);
    procedure StatButtonClick(Sender: TObject);
    procedure AzButtonClick(Sender: TObject);
    procedure DatabaseNameConfExit(Sender: TObject);
    procedure DatabaseNameStatExit(Sender: TObject);
    procedure PasswordConfExit(Sender: TObject);
    procedure PasswordStatExit(Sender: TObject);
    procedure ServerNameStatExit(Sender: TObject);
    procedure ServerNameConfExit(Sender: TObject);
    procedure UtenteStatExit(Sender: TObject);
    procedure UtenteConfExit(Sender: TObject);
  private
    FConfig : IPatchManagerRTControllerConfig;
    FStatusBar :TPatchManagerFrameStatusBar;
    procedure AssegnaControlli;
  public
    constructor Create(AOwner: TComponent); override;
  end;


implementation

uses
  PatchManagerRT.Controller.Factory,
  PatchManagerRT.Constants,
  StrUtils,
  PatchManagerRT.Messages,
  spring.Collections;

{$R *.dfm}

{ TConfigurationPage }

procedure TConfigurationPage.AssegnaControlli;
begin
  //parte file
  LogPath.Text := FConfig.Config.Path.LogDir;
  JsonPath.Text := FConfig.Config.Path.JsonDir;
  //parte database
  //AZIENDALE
  UtenteAz.Text := FConfig.Config.DatabaseAZ.NomeUtente;
  NomeDatabaseAz.text := FConfig.Config.DatabaseAZ.DataBase;
  NomeServerAz.Text := FConfig.Config.DatabaseAZ.Server;
  PasswordAz.Text := FConfig.Config.DatabaseAZ.Password;
  //CONFIGURAZIONE
  UtenteConf.Text := FConfig.Config.DatabaseConf.NomeUtente;
  DatabaseNameConf.text := FConfig.Config.DatabaseConf.DataBase;
  ServerNameConf.Text := FConfig.Config.DatabaseConf.Server;
  PasswordConf.Text := FConfig.Config.DatabaseConf.Password;
  //STATISTICHE AVANZATE
  UtenteStat.Text := FConfig.Config.DatabaseStat.NomeUtente;
  DatabaseNameStat.text := FConfig.Config.DatabaseStat.DataBase;
  ServerNameStat.Text := FConfig.Config.DatabaseStat.Server;
  PasswordStat.Text := FConfig.Config.DatabaseStat.Password;
end;

procedure TConfigurationPage.AzButtonClick(Sender: TObject);
begin
  inherited;
  TestConnessioneClick( FConfig.Config.DatabaseAZ.Server,
                        FConfig.Config.DatabaseAZ.DataBase,
                        FConfig.Config.DatabaseAZ.NomeUtente,
                        FConfig.Config.DatabaseAZ.Password);
end;

procedure TConfigurationPage.BtnLogDirSaveClick(Sender: TObject);
begin
  inherited;
  SelectDirectory.Options := SelectDirectory.Options + [fdoPickFolders];
  SelectDirectory.Title := LOGDIR_SELECTION_MESSAGE;
  if SelectDirectory.Execute then
  begin
    FConfig.Config.Path.LogDir(SelectDirectory.FileName);
  end;
  AssegnaControlli;
end;

procedure TConfigurationPage.BtnSaveJsonDirClick(Sender: TObject);
begin
  inherited;
  SelectDirectory.Options := SelectDirectory.Options + [fdoPickFolders];
  SelectDirectory.Title := JSONDIR_SELECTION_MESSAGE;
  if SelectDirectory.Execute then
  begin
    FConfig.Config.Path.JsonDir(SelectDirectory.FileName);
  end;
  AssegnaControlli;
end;

procedure TConfigurationPage.ConfButtonClick(Sender: TObject);
begin
  inherited;
  TestConnessioneClick( FConfig.Config.DatabaseConf.Server,
                        FConfig.Config.DatabaseConf.DataBase,
                        FConfig.Config.DatabaseConf.NomeUtente,
                        FConfig.Config.DatabaseConf.Password);
end;

procedure TConfigurationPage.Close(Sender: TObject);
begin
  if Assigned(OnClose) then
  OnClose;
end;

constructor TConfigurationPage.Create(AOwner: TComponent);
begin
  inherited;
  FConfig := TPatchManagerRTControllerFactory.new.Config;
  //aziendale
  UtenteAz.Text := FConfig.Config.DatabaseAZ.NomeUtente;
  NomeDatabaseAz.text := FConfig.Config.DatabaseAZ.DataBase;
  NomeServerAz.Text := FConfig.Config.DatabaseAZ.Server;
  PasswordAz.text := FConfig.Config.DatabaseAZ.Password;
  //configurazione
  UtenteConf.Text := FConfig.Config.DatabaseConf.NomeUtente;
  DatabaseNameConf.text := FConfig.Config.DatabaseConf.DataBase;
  ServerNameConf.Text := FConfig.Config.DatabaseConf.Server;
  PasswordConf.text := FConfig.Config.DatabaseConf.Password;
  //statistiche avanzate
  UtenteStat.Text := FConfig.Config.DatabaseStat.NomeUtente;
  DatabaseNameStat.text := FConfig.Config.DatabaseStat.DataBase;
  ServerNameStat.Text := FConfig.Config.DatabaseStat.Server;
  PasswordStat.text := FConfig.Config.DatabaseStat.Password;
  //paths
  LogPath.Text := FConfig.Config.Path.LogDir;
  JsonPath.Text := FConfig.Config.Path.JsonDir;

  FStatusBar := TPatchManagerFrameStatusBar.Create(self);
  FStatusBar.Align := alClient;
  FStatusBar.Parent := Panel10;

end;



procedure TConfigurationPage.DatabaseNameConfExit(Sender: TObject);
begin
  inherited;
  FConfig.Config.DatabaseConf.DataBase(DatabaseNameConf.Text);
  AssegnaControlli;
end;

procedure TConfigurationPage.DatabaseNameStatExit(Sender: TObject);
begin
  inherited;
  FConfig.Config.DatabaseStat.DataBase(DatabaseNameStat.Text);
  AssegnaControlli;
end;

procedure TConfigurationPage.NomeDatabaseAzExit(Sender: TObject);
begin
  inherited;
  FConfig.Config.DatabaseAZ.DataBase(NomeDatabaseAz.Text);
  AssegnaControlli;
end;

procedure TConfigurationPage.NomeServerAzExit(Sender: TObject);
begin
  inherited;
  FConfig.Config.DatabaseAZ.Server(NomeServerAz.Text);
  AssegnaControlli;
end;

procedure TConfigurationPage.PasswordAzExit(Sender: TObject);
begin
  inherited;
  FConfig.Config.DatabaseAZ.Password(PasswordAz.Text);
  AssegnaControlli;
end;

procedure TConfigurationPage.PasswordConfExit(Sender: TObject);
begin
  inherited;
  FConfig.Config.DatabaseConf.Password(PasswordConf.Text);
  AssegnaControlli;
end;

procedure TConfigurationPage.PasswordStatExit(Sender: TObject);
begin
  inherited;
  FConfig.Config.DatabaseStat.Password(PasswordStat.Text);
  AssegnaControlli;
end;

procedure TConfigurationPage.UtenteAzExit(Sender: TObject);
begin
  inherited;
  FConfig.Config.DatabaseAZ.NomeUtente(UtenteAz.text);
  AssegnaControlli;
end;

procedure TConfigurationPage.UtenteConfExit(Sender: TObject);
begin
  inherited;
  FConfig.Config.DatabaseConf.NomeUtente(UtenteConf.text);
  AssegnaControlli;
end;

procedure TConfigurationPage.UtenteStatExit(Sender: TObject);
begin
  inherited;
  FConfig.Config.DatabaseStat.NomeUtente(UtenteStat.text);
  AssegnaControlli;
end;

procedure TConfigurationPage.Save(Sender: TObject);
begin
  if Fconfig.WriteConfig then
    ShowMessage('Percorsi Salvati');
end;

procedure TConfigurationPage.ServerNameConfExit(Sender: TObject);
begin
  inherited;
  FConfig.Config.DatabaseConf.Server(ServerNameConf.text);
  AssegnaControlli;
end;

procedure TConfigurationPage.ServerNameStatExit(Sender: TObject);
begin
  inherited;
  FConfig.Config.DatabaseStat.Server(ServerNameStat.text);
  AssegnaControlli;
end;

procedure TConfigurationPage.StatButtonClick(Sender: TObject);
begin
  inherited;
  TestConnessioneClick( FConfig.Config.DatabaseStat.Server,
                        FConfig.Config.DatabaseStat.DataBase,
                        FConfig.Config.DatabaseStat.NomeUtente,
                        FConfig.Config.DatabaseStat.Password);
end;

procedure TConfigurationPage.TestConnessioneClick(Aserver,ADatabase,AUsername,APassword : string);
begin
  inherited;
  try
    FDConnection.Connected := false;
    FDConnection.Params.Clear;
    FDConnection.Params.DriverID := 'MSSQL';
    FDConnection.Params.Values['Server'] := Aserver;
    FDConnection.Params.Values['User_Name'] := AUsername;
    FDConnection.Params.Values['Password'] := APassword;
    FDConnection.Params.Values['Database'] := ADatabase;
    FDConnection.Connected := true;
    FStatusBar.Panel1.Color := cllime;
    FStatusBar.Label1.Caption := 'Connessione riuscita';
    FDConnection.Connected := false;
  except
    on E: Exception do
    begin
      FStatusBar.Panel1.Color := clred;
      FStatusBar.Label1.Caption := 'Connessione non riuscita';
    end;
 end;

end;

end.
