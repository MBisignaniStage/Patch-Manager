unit PatchManager.Form.WizardPage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, vcl.StdCtrls, vcl.ComCtrls, Vcl.Mask,
  Vcl.ExtCtrls, Vcl.Grids, PatchManagerRT.Controller.Interfaces,
  PatchManagerRT.DataTypes.Interfaces, AdvMemo,
  AdvmSQLS, System.StrUtils, AdvObj, BaseGrid, AdvGrid;

type
  TWizardPage = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Avanti: TButton;
    Indietro: TButton;
    Inserisci: TButton;
    RadioGroup1: TRadioGroup;
    TabSheet3: TTabSheet;
    TabSheet6: TTabSheet;
    TabSheet8: TTabSheet;
    Panel2: TPanel;
    AdvSQLMemoStyler1: TAdvSQLMemoStyler;
    Annulla: TButton;
    MemoQuery: TAdvMemo;
    ComboBoxKey: TComboBox;
    Label1: TLabel;
    Panel4: TPanel;
    Panel5: TPanel;
    Label2: TLabel;
    EditChiave: TEdit;
    Label3: TLabel;
    ComboBoxTipo: TComboBox;
    Panel6: TPanel;
    Tabsheet2: TTabSheet;
    Panel7: TPanel;
    Label4: TLabel;
    Panel8: TPanel;
    EditDescr: TEdit;
    Label5: TLabel;
    StringGridOpz: TAdvStringGrid;
    tabsheet4: TTabSheet;
    Panel9: TPanel;
    Obbligatorio: TCheckBox;
    Panel10: TPanel;
    Nascosto: TCheckBox;
    Panel11: TPanel;
    SolaLet: TCheckBox;
    TabSheet5: TTabSheet;
    TabSheet7: TTabSheet;
    Panel3: TPanel;
    ValIntEdit: TEdit;
    Label6: TLabel;
    Panel13: TPanel;
    Label7: TLabel;
    ValDpEdit: TEdit;
    Panel12: TPanel;
    Label8: TLabel;
    Panel14: TPanel;
    Label9: TLabel;
    EditValID: TEdit;
    ComboBoxTabella: TComboBox;
    procedure AvantiClick(Sender: TObject);
    procedure IndietroClick(Sender: TObject);
    constructor Create(Sender : TComponent; const DbType: string); reintroduce;
    procedure PageControl1Change(Sender: TObject);
    procedure EditChiaveExit(Sender: TObject);
    procedure ComboBoxKeyChange(Sender: TObject);
    procedure ComboBoxTipoChange(Sender: TObject);
    procedure EditDescrExit(Sender: TObject);
    procedure StringGridOpzSetEditText(Sender: TObject; ACol, ARow: LongInt;
      const Value: string);
    procedure StringGridOpzCanEditCell(Sender: TObject; ARow, ACol: Integer;
      var CanEdit: Boolean);
    procedure AssegnaControlli;
    procedure StringGridOpzGetAlignment(Sender: TObject; ARow, ACol: Integer;
      var HAlign: TAlignment; var VAlign: TAsgVAlignment);
    procedure StringGridOpzExit(Sender: TObject);
    procedure StringGridOpzCheckBoxClick(Sender: TObject; ACol, ARow: Integer;
      State: Boolean);
    procedure ObbligatorioClick(Sender: TObject);
    procedure SolaLetClick(Sender: TObject);
    procedure NascostoClick(Sender: TObject);
    procedure EditValIDExit(Sender: TObject);
    procedure ComboBoxTabellaChange(Sender: TObject);
    procedure ValDpEditExit(Sender: TObject);
    procedure ValIntEditExit(Sender: TObject);
  public
    FController : IPatchManagerRTControllerWizardPardef;
    FDataTypes : IPatchManagerRTDataTypes;
  end;


implementation

uses
  PatchManagerRT.Controller.Factory,
  PatchManagerRT.DataTypes.Factory,
  Spring.Collections;

{$R *.dfm}

procedure TWizardPage.AssegnaControlli;
begin
  MemoQuery.Clear;
  EditChiave.Text := FController.Entity.Chiave;
  EditDescr.text := FController.Entity.Descr;
  ValIntEdit.Text := FController.Entity.ValInt;
  ValDpEdit.Text := FController.Entity.ValDP;
  MemoQuery.InsertText(FController.GetPatch(ComboBoxTipo.Text));
end;

procedure TWizardPage.AvantiClick(Sender: TObject);
var
  I : integer;
begin
  I := PageControl1.ActivePageIndex + 1;
//controllo selezione chiave padre e tipologia dato
  if (PageControl1.ActivePage = Tabsheet2) and
    (FController.Entity.ChiavePadre.IsEmpty) then
  begin
    ShowMessage('Errore: E'' necessario inserire una chiave padre');
    exit;
  end
  else
    if (PageControl1.ActivePage = TabSheet3) and
    (FController.Entity.TipoDato.IsEmpty) then
    begin
      ShowMessage('Errore: E'' necessario indicare la tipologia del dato');
      exit;
    end;
//passa alla tab successiva controllando che
//non sia alla fine saltando le tab disabilitate
  while (not PageControl1.Pages[i].Enabled)
    and (I < PageControl1.PageCount - 1) do
  begin
    inc(i);
  end;
  if PageControl1.ActivePageIndex < PageControl1.PageCount then
  begin
    PageControl1.ActivePage := PageControl1.Pages[I];
  end;
  PageControl1Change(nil);
end;

procedure TWizardPage.ComboBoxKeyChange(Sender: TObject);
begin
   FController.Entity.ChiavePadre(ComboBoxKey.Items[ComboBoxKey.ItemIndex]);
   AssegnaControlli;
end;

procedure TWizardPage.ComboBoxTabellaChange(Sender: TObject);
begin
  FController.Entity.Tabella(ComboBoxTabella.Items[ComboBoxTabella.ItemIndex]);
  AssegnaControlli;
end;

procedure TWizardPage.ComboBoxTipoChange(Sender: TObject);
var
  LSelected : string;
  LCode : integer;
begin
  FController.Entity.TipoDato(ComboBoxTipo.Items[ComboBoxTipo.ItemIndex]);
  LSelected := ComboBoxTipo.Text;
  if FDataTypes.GetDict.TryGetValue(LSelected, LCode) then
    case LCode of
    0 :
      begin
      TabSheet7.Enabled := false;
      tabsheet5.Enabled := false;
      tabsheet4.Enabled := false;
      TabSheet6.Enabled := true;
      end;
    1 :
      begin
      tabsheet5.Enabled := false;
      TabSheet6.Enabled := false;
      tabsheet4.Enabled := false;
      tabsheet7.Enabled := true;
      End;
    2 :
      begin
      tabsheet5.Enabled := false;
      tabsheet7.Enabled := false;
      TabSheet6.Enabled := false;
      tabsheet4.Enabled := true;
      end;
    3 :
      begin
      TabSheet6.Enabled := false;
      tabsheet7.Enabled := false;
      tabsheet4.Enabled := false;
      TabSheet5.Enabled := true;
      end;

    end;
  AssegnaControlli;
end;

constructor TWizardPage.Create(Sender: TComponent; const DbType: string);
var
  I : integer;
  LkeyList, LTypeList, LTablelist : Ilist<string>;
begin
  inherited Create(sender);
  PageControl1.ActivePageIndex := 0;
  Indietro.Enabled := false;
  Inserisci.Enabled := false;
  FDataTypes := TPatchManagerRTDataTypesFactory.new.DataTypes;
  FController := TPatchManagerRTControllerFactory.New.Pardef(DbType);
  FController.GetQuery(LkeyList,LTypeList);
  LTablelist := FController.GetTables;
  for I := 0 to LTablelist.Count - 1 do
  begin
    ComboBoxTabella.Items.Add(LTablelist.Items[i]);
  end;
  for I := 0 to LkeyList.Count - 1 do
  begin
    ComboBoxKey.Items.Add(LkeyList.Items[i]);
  end;
  for I := 0 to LTypeList.Count - 1 do
  begin
    ComboBoxTipo.Items.Add(LTypeList.Items[i]);
  end;
  StringGridOpz.Cells[0,0] := 'Opzione';
  StringGridOpz.Cells[1,0] := 'Valore';
  StringGridOpz.Cells[2,0] := 'Default';
end;

procedure TWizardPage.EditDescrExit(Sender: TObject);
begin
  Fcontroller.Entity.Descr(EditDescr.Text);
  AssegnaControlli;
end;

procedure TWizardPage.EditValIDExit(Sender: TObject);
begin
  FController.Entity.ValID(EditValID.Text);
  AssegnaControlli;
end;

procedure TWizardPage.IndietroClick(Sender: TObject);
var
  I : integer;
begin
//passa alla tab precedente controllando che
//non sia all'inizio saltando le tab disabilitate
  I := PageControl1.ActivePageIndex - 1;
  while (i >= 0) and (not PageControl1.Pages[i].Enabled) do
  begin
    dec(i);
  end;

  if PageControl1.ActivePageIndex > 0 then
  begin
    PageControl1.ActivePage:= PageControl1.Pages[i];
  end;
  PageControl1Change(nil);
end;


procedure TWizardPage.NascostoClick(Sender: TObject);
begin
    if Nascosto.Checked then
    FController.Entity.Nascosto('-1')
  else
    FController.Entity.Nascosto('0');
  AssegnaControlli;
end;

procedure TWizardPage.ObbligatorioClick(Sender: TObject);
begin
  if Obbligatorio.Checked then
    FController.Entity.obbligatorio('-1')
  else
    FController.Entity.obbligatorio('0');
  AssegnaControlli;
end;

procedure TWizardPage.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePageIndex = PageControl1.PageCount - 1 then
  begin
    Inserisci.Enabled := true;
    Avanti.Enabled := false;
    exit;
  end;
  if PageControl1.ActivePageIndex = 0 then
  begin
    Indietro.Enabled := false;
    exit;
  end;
  Indietro.Enabled := true;
  Avanti.Enabled := true;
  Inserisci.Enabled := false;
end;

procedure TWizardPage.SolaLetClick(Sender: TObject);
begin
    if SolaLet.Checked then
    FController.Entity.SolaLet('-1')
  else
    FController.Entity.SolaLet('0');
  AssegnaControlli;
end;

procedure TWizardPage.StringGridOpzCanEditCell(Sender: TObject; ARow,
  ACol: Integer; var CanEdit: Boolean);
begin
  CanEdit := ACol in [0,1,2];
end;

procedure TWizardPage.StringGridOpzCheckBoxClick(Sender: TObject; ACol,
  ARow: Integer; State: Boolean);
var
  I: integer;
begin
  if acol = 2 then
  begin
    if State then
      for i := 1 to StringGridOpz.RowCount -1 do
        if i <> arow then
          StringGridOpz.SetCheckBoxState(2,i,false);
  end;
end;

procedure TWizardPage.StringGridOpzExit(Sender: TObject);
var
  I : integer;
  LNoCheck : boolean;
  LDict : IDictionary<string,string>;
begin
  LNoCheck := true;
  LDict := TCollections.CreateDictionary<string,string>;
  try
    for I := 1 to StringGridOpz.RowCount - 1 do
    begin
      if StringGridOpz.IsChecked(2,I) then
      begin
        LNoCheck := false;
        FController.Entity.ValStr(StringGridOpz.cells[0,I]);
      end;
      if (StringGridOpz.cells[0,I] <> '') and
          (StringGridOpz.cells[1,I] <> '') then
      begin
        LDict.Add(StringGridOpz.cells[0,I],StringGridOpz.cells[1,I]);
      end;
    end;
    if LNoCheck then
    FController.Entity.ValStr('');
  except
    on e: exception do
    begin
      ShowMessage('Attenzione:' +sLineBreak +
                  'Sono presenti due opzioni con lo stesso valore');
    end;
  end;
    FController.Entity.Stropz(LDict);
    AssegnaControlli;
end;

procedure TWizardPage.StringGridOpzGetAlignment(Sender: TObject; ARow,
  ACol: Integer; var HAlign: TAlignment; var VAlign: TAsgVAlignment);
begin
  if Acol in [0,1] then
    HAlign := taLeftJustify
    else
    HAlign := taCenter;
end;

procedure TWizardPage.StringGridOpzSetEditText(Sender: TObject; ACol,
  ARow: LongInt; const Value: string);
begin
  if Arow = StringGridopz.RowCount - 1 then
  begin
    if (Trim(StringGridopz.cells[0,arow]) <> '') or
      (Trim(StringGridopz.Cells[1,ARow]) <> '') then
      begin
        StringGridopz.RowCount := StringGridopz.RowCount + 1;
        StringGridopz.AddCheckBox(2,ARow,false,false);
      end;
  end;
end;

procedure TWizardPage.ValDpEditExit(Sender: TObject);
begin
  Fcontroller.Entity.ValDP(ValDpEdit.Text);
  AssegnaControlli;
end;

procedure TWizardPage.ValIntEditExit(Sender: TObject);
begin
  Fcontroller.Entity.ValInt(ValIntEdit.Text);
  AssegnaControlli;
end;

procedure TWizardPage.EditChiaveExit(Sender: TObject);
begin
  Fcontroller.Entity.Chiave(EditChiave.Text);
  AssegnaControlli;
end;

end.
