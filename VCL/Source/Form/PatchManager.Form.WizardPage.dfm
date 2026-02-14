object WizardPage: TWizardPage
  Left = 355
  Top = 327
  Caption = 'WizardPage'
  ClientHeight = 531
  ClientWidth = 713
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poDesktopCenter
  TextHeight = 15
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 713
    Height = 490
    ActivePage = TabSheet7
    Align = alClient
    TabOrder = 0
    OnChange = PageControl1Change
    object TabSheet1: TTabSheet
      Caption = 'Opzione'
      TabVisible = False
      object RadioGroup1: TRadioGroup
        Left = 0
        Top = 0
        Width = 705
        Height = 196
        Align = alTop
        Caption = 'Opzioni'
        Items.Strings = (
          'Insert Pardef'
          'Create'
          'Add Column'
          'Foreign Key'
          'View')
        TabOrder = 0
      end
    end
    object Tabsheet2: TTabSheet
      Caption = 'Chiavi'
      ImageIndex = 1
      TabVisible = False
      object Panel8: TPanel
        Left = 0
        Top = 140
        Width = 705
        Height = 79
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Caption = 'Panel8'
        ShowCaption = False
        TabOrder = 0
        object Label5: TLabel
          Left = 11
          Top = 11
          Width = 194
          Height = 15
          Caption = 'Inserisci la descrizione della chiave:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EditDescr: TEdit
          Left = 11
          Top = 32
          Width = 590
          Height = 23
          TabOrder = 0
          OnExit = EditDescrExit
        end
      end
      object Panel9: TPanel
        Left = 0
        Top = 219
        Width = 705
        Height = 57
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Caption = 'Panel9'
        ShowCaption = False
        TabOrder = 1
        object Obbligatorio: TCheckBox
          Left = 13
          Top = 17
          Width = 166
          Height = 17
          Caption = 'Obbligatorio (Default = 0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = ObbligatorioClick
        end
      end
      object Panel10: TPanel
        Left = 0
        Top = 333
        Width = 705
        Height = 132
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Caption = 'Panel9'
        ShowCaption = False
        TabOrder = 2
        object Nascosto: TCheckBox
          Left = 13
          Top = 12
          Width = 148
          Height = 15
          Caption = 'Nascosto (Default = 0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = NascostoClick
        end
      end
      object Panel11: TPanel
        Left = 0
        Top = 276
        Width = 705
        Height = 57
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Caption = 'Panel9'
        ShowCaption = False
        TabOrder = 3
        object SolaLet: TCheckBox
          Left = 13
          Top = 14
          Width = 181
          Height = 21
          Caption = 'Sola lettura (Default = 0)'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = SolaLetClick
        end
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 705
        Height = 66
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Caption = 'Panel4'
        ShowCaption = False
        TabOrder = 4
        object Label1: TLabel
          Left = 11
          Top = 8
          Width = 101
          Height = 15
          Caption = 'Chiave da inserire:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EditChiave: TEdit
          Left = 11
          Top = 29
          Width = 326
          Height = 23
          TabOrder = 0
          OnExit = EditChiaveExit
        end
      end
      object Panel5: TPanel
        Left = 0
        Top = 66
        Width = 705
        Height = 74
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Caption = 'Panel5'
        ShowCaption = False
        TabOrder = 5
        object Label2: TLabel
          Left = 11
          Top = 14
          Width = 153
          Height = 15
          Caption = 'Seleziona una chiave padre:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ComboBoxKey: TComboBox
          Left = 11
          Top = 35
          Width = 148
          Height = 23
          AutoDropDown = True
          Style = csDropDownList
          TabOrder = 0
          OnChange = ComboBoxKeyChange
        end
      end
    end
    object TabSheet3: TTabSheet
      Caption = 'TipoDato'
      ImageIndex = 2
      TabVisible = False
      object Panel6: TPanel
        Left = 0
        Top = 0
        Width = 705
        Height = 89
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Caption = 'Panel6'
        ShowCaption = False
        TabOrder = 0
        object Label3: TLabel
          Left = 10
          Top = 16
          Width = 160
          Height = 15
          Caption = 'Seleziona la tipologia di dato:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ComboBoxTipo: TComboBox
          Left = 10
          Top = 41
          Width = 145
          Height = 23
          AutoDropDown = True
          Style = csDropDownList
          TabOrder = 0
          OnChange = ComboBoxTipoChange
        end
      end
    end
    object tabsheet4: TTabSheet
      Caption = 'Valori Int'
      ImageIndex = 5
      TabVisible = False
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 705
        Height = 81
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Caption = 'Panel3'
        ShowCaption = False
        TabOrder = 0
        object Label6: TLabel
          Left = 11
          Top = 11
          Width = 160
          Height = 15
          Caption = 'Inserisci il valore della chiave'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ValIntEdit: TEdit
          Left = 11
          Top = 40
          Width = 126
          Height = 23
          TabOrder = 0
          OnExit = ValIntEditExit
        end
      end
    end
    object TabSheet5: TTabSheet
      Caption = 'ValDp'
      ImageIndex = 6
      TabVisible = False
      object Panel13: TPanel
        Left = 0
        Top = 0
        Width = 705
        Height = 81
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Caption = 'Panel3'
        ShowCaption = False
        TabOrder = 0
        ExplicitTop = 8
        object Label7: TLabel
          Left = 11
          Top = 11
          Width = 160
          Height = 15
          Caption = 'Inserisci il valore della chiave'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ValDpEdit: TEdit
          Left = 11
          Top = 40
          Width = 102
          Height = 23
          TabOrder = 0
          OnExit = ValDpEditExit
        end
      end
    end
    object TabSheet6: TTabSheet
      Caption = 'Valori dato'
      ImageIndex = 3
      TabVisible = False
      object Panel2: TPanel
        Left = 0
        Top = 25
        Width = 705
        Height = 455
        Align = alClient
        BevelOuter = bvNone
        Caption = 'Panel2'
        ShowCaption = False
        TabOrder = 0
        object StringGridOpz: TAdvStringGrid
          Left = 0
          Top = 0
          Width = 705
          Height = 455
          Align = alClient
          ColCount = 3
          DefaultColWidth = 204
          DefaultColAlignment = taCenter
          DefaultRowHeight = 30
          DoubleBuffered = True
          DrawingStyle = gdsClassic
          FixedCols = 0
          RowCount = 2
          ParentDoubleBuffered = False
          TabOrder = 0
          OnExit = StringGridOpzExit
          OnSetEditText = StringGridOpzSetEditText
          GridLineColor = 15855083
          GridFixedLineColor = 13745060
          OnGetAlignment = StringGridOpzGetAlignment
          OnCanEditCell = StringGridOpzCanEditCell
          OnCheckBoxClick = StringGridOpzCheckBoxClick
          ActiveCellFont.Charset = DEFAULT_CHARSET
          ActiveCellFont.Color = clWindowText
          ActiveCellFont.Height = -12
          ActiveCellFont.Name = 'Segoe UI'
          ActiveCellFont.Style = [fsBold]
          ActiveCellColor = 10344697
          ActiveCellColorTo = 6210033
          ControlLook.FixedGradientFrom = 16513526
          ControlLook.FixedGradientTo = 15260626
          ControlLook.FixedGradientHoverFrom = 15000287
          ControlLook.FixedGradientHoverTo = 14406605
          ControlLook.FixedGradientHoverMirrorFrom = 14406605
          ControlLook.FixedGradientHoverMirrorTo = 13813180
          ControlLook.FixedGradientHoverBorder = 12033927
          ControlLook.FixedGradientDownFrom = 14991773
          ControlLook.FixedGradientDownTo = 14991773
          ControlLook.FixedGradientDownMirrorFrom = 14991773
          ControlLook.FixedGradientDownMirrorTo = 14991773
          ControlLook.FixedGradientDownBorder = 14991773
          ControlLook.DropDownHeader.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownHeader.Font.Color = clWindowText
          ControlLook.DropDownHeader.Font.Height = -11
          ControlLook.DropDownHeader.Font.Name = 'Segoe UI'
          ControlLook.DropDownHeader.Font.Style = []
          ControlLook.DropDownHeader.Visible = True
          ControlLook.DropDownHeader.Buttons = <>
          ControlLook.DropDownFooter.Font.Charset = DEFAULT_CHARSET
          ControlLook.DropDownFooter.Font.Color = clWindowText
          ControlLook.DropDownFooter.Font.Height = -11
          ControlLook.DropDownFooter.Font.Name = 'Segoe UI'
          ControlLook.DropDownFooter.Font.Style = []
          ControlLook.DropDownFooter.Visible = True
          ControlLook.DropDownFooter.Buttons = <>
          ControlLook.ToggleSwitch.BackgroundBorderWidth = 1.000000000000000000
          ControlLook.ToggleSwitch.ButtonBorderWidth = 1.000000000000000000
          ControlLook.ToggleSwitch.CaptionFont.Charset = DEFAULT_CHARSET
          ControlLook.ToggleSwitch.CaptionFont.Color = clWindowText
          ControlLook.ToggleSwitch.CaptionFont.Height = -12
          ControlLook.ToggleSwitch.CaptionFont.Name = 'Segoe UI'
          ControlLook.ToggleSwitch.CaptionFont.Style = []
          ControlLook.ToggleSwitch.Shadow = False
          DefaultAlignment = taCenter
          Filter = <>
          FilterDropDown.Font.Charset = DEFAULT_CHARSET
          FilterDropDown.Font.Color = clWindowText
          FilterDropDown.Font.Height = -12
          FilterDropDown.Font.Name = 'Segoe UI'
          FilterDropDown.Font.Style = []
          FilterDropDown.TextChecked = 'Checked'
          FilterDropDown.TextUnChecked = 'Unchecked'
          FilterDropDownClear = '(All)'
          FilterEdit.TypeNames.Strings = (
            'Starts with'
            'Ends with'
            'Contains'
            'Not contains'
            'Equal'
            'Not equal'
            'Larger than'
            'Smaller than'
            'Clear')
          FixedColWidth = 111
          FixedRowHeight = 30
          FixedFont.Charset = DEFAULT_CHARSET
          FixedFont.Color = clBlack
          FixedFont.Height = -11
          FixedFont.Name = 'Segoe UI'
          FixedFont.Style = [fsBold]
          FloatFormat = '%.2f'
          HoverButtons.Buttons = <>
          HTMLSettings.ImageFolder = 'images'
          HTMLSettings.ImageBaseName = 'img'
          Look = glOffice2007
          PrintSettings.DateFormat = 'dd/mm/yyyy'
          PrintSettings.Font.Charset = DEFAULT_CHARSET
          PrintSettings.Font.Color = clWindowText
          PrintSettings.Font.Height = -12
          PrintSettings.Font.Name = 'Segoe UI'
          PrintSettings.Font.Style = []
          PrintSettings.FixedFont.Charset = DEFAULT_CHARSET
          PrintSettings.FixedFont.Color = clWindowText
          PrintSettings.FixedFont.Height = -12
          PrintSettings.FixedFont.Name = 'Segoe UI'
          PrintSettings.FixedFont.Style = []
          PrintSettings.HeaderFont.Charset = DEFAULT_CHARSET
          PrintSettings.HeaderFont.Color = clWindowText
          PrintSettings.HeaderFont.Height = -12
          PrintSettings.HeaderFont.Name = 'Segoe UI'
          PrintSettings.HeaderFont.Style = []
          PrintSettings.FooterFont.Charset = DEFAULT_CHARSET
          PrintSettings.FooterFont.Color = clWindowText
          PrintSettings.FooterFont.Height = -12
          PrintSettings.FooterFont.Name = 'Segoe UI'
          PrintSettings.FooterFont.Style = []
          PrintSettings.PageNumSep = '/'
          ScrollWidth = 21
          SearchFooter.Color = 16513526
          SearchFooter.ColorTo = clNone
          SearchFooter.FindNextCaption = 'Find &next'
          SearchFooter.FindPrevCaption = 'Find &previous'
          SearchFooter.Font.Charset = DEFAULT_CHARSET
          SearchFooter.Font.Color = clWindowText
          SearchFooter.Font.Height = -12
          SearchFooter.Font.Name = 'Segoe UI'
          SearchFooter.Font.Style = []
          SearchFooter.HighLightCaption = 'Highlight'
          SearchFooter.HintClose = 'Close'
          SearchFooter.HintFindNext = 'Find next occurrence'
          SearchFooter.HintFindPrev = 'Find previous occurrence'
          SearchFooter.HintHighlight = 'Highlight occurrences'
          SearchFooter.MatchCaseCaption = 'Match case'
          SearchFooter.ResultFormat = '(%d of %d)'
          SelectionColor = 6210033
          ShowSelection = False
          ShowDesignHelper = False
          SizeWithForm = True
          UIStyle = tsOffice2007Luna
          Version = '9.1.4.1'
          ColWidths = (
            111
            441
            62)
          RowHeights = (
            30
            30)
        end
      end
      object Panel7: TPanel
        Left = 0
        Top = 0
        Width = 705
        Height = 25
        Align = alTop
        BevelOuter = bvNone
        Caption = 'Panel7'
        ShowCaption = False
        TabOrder = 1
        object Label4: TLabel
          Left = 8
          Top = 2
          Width = 101
          Height = 15
          Caption = 'Inserisci le opzioni'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    object TabSheet7: TTabSheet
      Caption = 'Valori ID'
      ImageIndex = 7
      TabVisible = False
      object Panel12: TPanel
        Left = 0
        Top = 89
        Width = 705
        Height = 89
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Caption = 'Panel12'
        ShowCaption = False
        TabOrder = 0
        ExplicitTop = 95
        object Label8: TLabel
          Left = 11
          Top = 11
          Width = 200
          Height = 15
          Caption = 'Seleziona una tabella  di riferimento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object ComboBoxTabella: TComboBox
          Left = 11
          Top = 40
          Width = 145
          Height = 23
          Style = csDropDownList
          TabOrder = 0
          OnChange = ComboBoxTabellaChange
        end
      end
      object Panel14: TPanel
        Left = 0
        Top = 0
        Width = 705
        Height = 89
        Align = alTop
        BevelKind = bkTile
        BevelOuter = bvNone
        Caption = 'Panel12'
        ShowCaption = False
        TabOrder = 1
        ExplicitWidth = 701
        object Label9: TLabel
          Left = 11
          Top = 11
          Width = 156
          Height = 15
          Caption = 'Seleziona un valore per l'#39'ID '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object EditValID: TEdit
          Left = 11
          Top = 40
          Width = 86
          Height = 23
          TabOrder = 0
          OnExit = EditValIDExit
        end
      end
    end
    object TabSheet8: TTabSheet
      Caption = 'Riepilogo'
      ImageIndex = 4
      TabVisible = False
      object MemoQuery: TAdvMemo
        Left = 0
        Top = 0
        Width = 705
        Height = 480
        Cursor = crIBeam
        ActiveLineSettings.ShowActiveLine = False
        ActiveLineSettings.ShowActiveLineIndicator = False
        Align = alClient
        AutoCompletion.Font.Charset = DEFAULT_CHARSET
        AutoCompletion.Font.Color = clWindowText
        AutoCompletion.Font.Height = -12
        AutoCompletion.Font.Name = 'Segoe UI'
        AutoCompletion.Font.Style = []
        AutoCompletion.StartToken = '(.'
        AutoCorrect.Active = True
        AutoHintParameterPosition = hpBelowCode
        BkColor = clWindow
        BookmarkGlyph.Data = {
          36050000424D3605000000000000360400002800000010000000100000000100
          0800000000000001000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FDFD25252525
          2525252525252525FDFDFD2E25FFFFFFFFFFFFFFFFFFFF25FDFDFD2525252525
          2525252525252525FDFD9A9AB7B7B7B7B7B7B7B7B7B72525FDFDFD25B7B7B7B7
          B7B7B7B7B7B72525FDFD9A9AB7B7B7B7B7B7B7B7B7B72525FDFDFD25BFB7BFBF
          B7B7B7B7B7B72525FDFD9A9ABFBFBFB7BFBFB7B7B7B72525FDFDFD25BFBFBFBF
          BFB7BFBFB7B72525FDFD9A9ABFBFBFB7BFBFBFB7BFB72525FDFDFD25BFBFBFBF
          BFBFBFBFBFB72525FDFD9A9ABFBFBFBFBFB7BFBFB7B72525FDFDFD25BFBFBFBF
          BFBFBFBFBFB72525FDFD9A9ABFBFBFBFBFBFBFBFBFB725FDFDFDFD2525252525
          25252525252525FDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFDFD}
        BorderStyle = bsSingle
        ClipboardFormats = [cfText]
        CodeFolding.Enabled = False
        CodeFolding.LineColor = clGray
        Ctl3D = False
        DelErase = True
        EnhancedHomeKey = False
        Gutter.Font.Charset = DEFAULT_CHARSET
        Gutter.Font.Color = clWindowText
        Gutter.Font.Height = -13
        Gutter.Font.Name = 'Courier New'
        Gutter.Font.Style = []
        Gutter.GutterColorTo = clBtnFace
        Gutter.LineNumberTextColor = clWindowText
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'COURIER NEW'
        Font.Style = []
        HiddenCaret = False
        Lines.Strings = (
          '')
        MarkerList.UseDefaultMarkerImageIndex = False
        MarkerList.DefaultMarkerImageIndex = -1
        MarkerList.ImageTransparentColor = 33554432
        OleDropTarget = []
        PrintOptions.MarginLeft = 0
        PrintOptions.MarginRight = 0
        PrintOptions.MarginTop = 0
        PrintOptions.MarginBottom = 0
        PrintOptions.PageNr = False
        PrintOptions.PrintLineNumbers = False
        RightMarginColor = 14869218
        ScrollHint = False
        SelColor = clHighlightText
        SelBkColor = clHighlight
        ShowRightMargin = True
        SmartTabs = False
        SyntaxStyles = AdvSQLMemoStyler1
        TabOrder = 0
        TabStop = True
        TrimTrailingSpaces = False
        UILanguage.ScrollHint = 'Row'
        UILanguage.Undo = 'Undo'
        UILanguage.Redo = 'Redo'
        UILanguage.Copy = 'Copy'
        UILanguage.Cut = 'Cut'
        UILanguage.Paste = 'Paste'
        UILanguage.Delete = 'Delete'
        UILanguage.SelectAll = 'Select All'
        UrlStyle.TextColor = clBlue
        UrlStyle.BkColor = clWhite
        UrlStyle.Style = [fsUnderline]
        UseStyler = True
        Version = '3.9.1.7'
        WordWrap = wwNone
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 490
    Width = 713
    Height = 41
    Align = alBottom
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 1
    ExplicitTop = 482
    ExplicitWidth = 711
    object Indietro: TButton
      AlignWithMargins = True
      Left = 392
      Top = 5
      Width = 100
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Cancel = True
      Caption = 'Indietro'
      TabOrder = 0
      OnClick = IndietroClick
      ExplicitLeft = 390
    end
    object Inserisci: TButton
      AlignWithMargins = True
      Left = 284
      Top = 5
      Width = 100
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Cancel = True
      Caption = 'Inserisci'
      ModalResult = 1
      TabOrder = 1
      ExplicitLeft = 282
    end
    object Avanti: TButton
      AlignWithMargins = True
      Left = 500
      Top = 5
      Width = 100
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Cancel = True
      Caption = 'Avanti'
      TabOrder = 2
      OnClick = AvantiClick
      ExplicitLeft = 498
    end
    object Annulla: TButton
      AlignWithMargins = True
      Left = 608
      Top = 5
      Width = 100
      Height = 31
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alRight
      Cancel = True
      Caption = 'Annulla'
      ModalResult = 3
      TabOrder = 3
      WordWrap = True
      ExplicitLeft = 606
    end
  end
  object AdvSQLMemoStyler1: TAdvSQLMemoStyler
    AutoCompletion.Strings = (
      'SELECT'
      'WHERE')
    HintParameter.TextColor = clBlack
    HintParameter.BkColor = clInfoBk
    HintParameter.HintCharStart = '('
    HintParameter.HintCharEnd = ')'
    HintParameter.HintCharDelimiter = ';'
    HintParameter.HintClassDelimiter = '.'
    HintParameter.HintCharWriteDelimiter = ','
    LineComment = '--'
    MultiCommentLeft = '/*'
    MultiCommentRight = '*/'
    CommentStyle.TextColor = clNavy
    CommentStyle.BkColor = clWhite
    CommentStyle.Style = [fsItalic]
    NumberStyle.TextColor = clFuchsia
    NumberStyle.BkColor = clWhite
    NumberStyle.Style = [fsBold]
    AllStyles = <
      item
        KeyWords.Strings = (
          'Proc'
          'Procedure'
          'Begin'
          'End'
          'While'
          'BEGIN'
          'END'
          'FOR'
          'TO'
          'DO'
          'NOT'
          'IF'
          'ELSE'
          'WHILE'
          'REPEAT'
          'UNTIL'
          'BREAK'
          'CONTINUE'
          'EXEC'
          'Insert'
          'Values'
          'Update'
          'From'
          'Delete'
          'Declare'
          'Set'
          'Open'
          'Fetch'
          'Close'
          'Deallocate'
          'Return'
          'Rollback'
          'Transaction'
          'Trans'
          'and'
          'or'
          'Order'
          'By'
          'Group'
          'Having'
          'Where'
          'Left'
          'Right'
          'Join'
          'Inner'
          'Outer'
          'On'
          'Create'
          'Delete'
          'Select'
          'Like'
          'Into'
          'As')
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGreen
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stKeyword
        BracketStart = #0
        BracketEnd = #0
        Info = 'SQL Standard Default'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stBracket
        BracketStart = '"'
        BracketEnd = '"'
        Info = 'Double Quote'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stBracket
        BracketStart = #39
        BracketEnd = #39
        Info = 'Single Quote'
      end
      item
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -11
        Font.Name = 'Courier New'
        Font.Style = []
        BGColor = clWhite
        StyleType = stSymbol
        BracketStart = #0
        BracketEnd = #0
        Symbols = ' ,;:.(){}[]=-+*/^%<>#'#13#10
        Info = 'Symbols Delimiters'
      end>
    Description = 'SQL'
    Filter = 'SQL Files (*.sql)|*.sql'
    DefaultExtension = '.sql'
    StylerName = 'SQL'
    Extensions = 'sql'
    Left = 540
    Top = 50
  end
end
