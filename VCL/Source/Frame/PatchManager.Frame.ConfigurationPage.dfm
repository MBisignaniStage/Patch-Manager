inherited ConfigurationPage: TConfigurationPage
  Width = 668
  Height = 587
  ExplicitWidth = 668
  ExplicitHeight = 587
  inherited PanelButton: TPanel
    Top = 546
    Width = 668
    BevelOuter = bvNone
    StyleElements = [seFont, seClient, seBorder]
    ExplicitTop = 546
    ExplicitWidth = 668
    inherited SaveNew: TButton
      Left = 452
      Top = 4
      Height = 33
      Cursor = crHandPoint
      Caption = 'Save'
      OnClick = Save
      ExplicitLeft = 452
      ExplicitTop = 4
      ExplicitHeight = 33
    end
    inherited Save: TButton
      Left = 565
      Top = 4
      Height = 33
      Cursor = crHandPoint
      Caption = 'Close'
      OnClick = Close
      ExplicitLeft = 565
      ExplicitTop = 4
      ExplicitHeight = 33
    end
    inherited Button2: TButton
      Left = 345
      Top = 4
      Height = 33
      Visible = False
      ExplicitLeft = 345
      ExplicitTop = 4
      ExplicitHeight = 33
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 668
    Height = 546
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Align = alClient
    TabOrder = 1
    object Panel4: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 658
      Height = 156
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alTop
      BevelKind = bkTile
      BevelOuter = bvNone
      Caption = 'Panel4'
      ShowCaption = False
      TabOrder = 0
      object Panel2: TPanel
        Left = 0
        Top = 0
        Width = 654
        Height = 58
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 0
        DesignSize = (
          654
          58)
        object Label1: TLabel
          Left = 10
          Top = 11
          Width = 123
          Height = 15
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Output Json Directory'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object JsonPath: TEdit
          Left = 10
          Top = 29
          Width = 345
          Height = 23
          Hint = 'Visulizza la directory di salvataggio del file json'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Ctl3D = True
          DoubleBuffered = False
          ParentCtl3D = False
          ParentDoubleBuffered = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
        end
        object BtnSaveJsonDir: TButton
          AlignWithMargins = True
          Left = 354
          Top = 29
          Width = 25
          Height = 23
          Cursor = crHandPoint
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft]
          Default = True
          DragCursor = crHandPoint
          ImageAlignment = iaCenter
          ImageIndex = 0
          Images = ImageList1
          TabOrder = 1
          OnClick = BtnSaveJsonDirClick
        end
      end
      object Panel3: TPanel
        Left = 0
        Top = 63
        Width = 654
        Height = 89
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        Align = alBottom
        BevelOuter = bvNone
        TabOrder = 1
        DesignSize = (
          654
          89)
        object Label2: TLabel
          Left = 10
          Top = 7
          Width = 136
          Height = 15
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Ouput File Log Directory'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object LogPath: TEdit
          AlignWithMargins = True
          Left = 10
          Top = 25
          Width = 345
          Height = 23
          Hint = 'Visualizza la directoty di salvataggio del file log'
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          HideSelection = False
          ParentShowHint = False
          ReadOnly = True
          ShowHint = True
          TabOrder = 0
        end
        object BtnLogDirSave: TButton
          AlignWithMargins = True
          Left = 354
          Top = 25
          Width = 25
          Height = 23
          Cursor = crHandPoint
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Anchors = [akLeft]
          BiDiMode = bdLeftToRight
          Default = True
          DoubleBuffered = True
          ImageAlignment = iaCenter
          ImageIndex = 0
          Images = ImageList1
          ParentBiDiMode = False
          ParentDoubleBuffered = False
          PressedImageIndex = 0
          SelectedImageIndex = 0
          TabOrder = 1
          OnClick = BtnLogDirSaveClick
        end
      end
    end
    object Panel10: TPanel
      AlignWithMargins = True
      Left = 5
      Top = 515
      Width = 658
      Height = 26
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alBottom
      Caption = 'Panel10'
      ShowCaption = False
      TabOrder = 1
    end
    object Panel21: TPanel
      Left = 1
      Top = 165
      Width = 666
      Height = 346
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Align = alClient
      Caption = 'Panel21'
      TabOrder = 2
      object PageControl1: TPageControl
        AlignWithMargins = True
        Left = 5
        Top = 5
        Width = 656
        Height = 336
        Cursor = crHandPoint
        Margins.Left = 4
        Margins.Top = 4
        Margins.Right = 4
        Margins.Bottom = 4
        ActivePage = TabSheet3
        Align = alClient
        DragCursor = crHandPoint
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object TabSheet1: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Database Aziendale'
          object Panel5: TPanel
            Left = 0
            Top = 0
            Width = 648
            Height = 306
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            BevelKind = bkTile
            BevelOuter = bvNone
            Caption = 'Panel5'
            ShowCaption = False
            TabOrder = 0
            object Panel6: TPanel
              Left = 0
              Top = 0
              Width = 644
              Height = 57
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Panel6'
              ShowCaption = False
              TabOrder = 0
              object Label3: TLabel
                Left = 10
                Top = 8
                Width = 88
                Height = 15
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                BiDiMode = bdLeftToRight
                Caption = 'Nome Database'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentBiDiMode = False
                ParentFont = False
              end
              object NomeDatabaseAz: TEdit
                AlignWithMargins = True
                Left = 10
                Top = 29
                Width = 345
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                OnExit = NomeDatabaseAzExit
              end
            end
            object Panel7: TPanel
              Left = 0
              Top = 57
              Width = 644
              Height = 57
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Panel7'
              ShowCaption = False
              TabOrder = 1
              object Label4: TLabel
                Left = 10
                Top = 6
                Width = 75
                Height = 15
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Nome Server'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object NomeServerAz: TEdit
                AlignWithMargins = True
                Left = 10
                Top = 27
                Width = 345
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 0
                OnExit = NomeServerAzExit
              end
            end
            object Panel8: TPanel
              Left = 0
              Top = 114
              Width = 644
              Height = 52
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Panel8'
              ShowCaption = False
              TabOrder = 2
              object Label5: TLabel
                Left = 10
                Top = -1
                Width = 40
                Height = 15
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Utente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object UtenteAz: TEdit
                AlignWithMargins = True
                Left = 10
                Top = 21
                Width = 345
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 0
                OnExit = UtenteAzExit
              end
            end
            object Panel9: TPanel
              Left = 0
              Top = 166
              Width = 644
              Height = 359
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Panel9'
              ShowCaption = False
              TabOrder = 3
              object Label6: TLabel
                Left = 10
                Top = -2
                Width = 52
                Height = 15
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Password'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object PasswordAz: TEdit
                AlignWithMargins = True
                Left = 10
                Top = 19
                Width = 345
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                PasswordChar = '*'
                TabOrder = 0
                OnExit = PasswordAzExit
              end
              object AzButton: TButton
                Left = 240
                Top = 50
                Width = 115
                Height = 25
                Cursor = crHandPoint
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Test Connessione'
                DragCursor = crHandPoint
                TabOrder = 1
                OnClick = AzButtonClick
              end
            end
          end
        end
        object TabSheet2: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Database Configurazione'
          ImageIndex = 1
          object Panel12: TPanel
            Left = 0
            Top = 0
            Width = 648
            Height = 306
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            BevelKind = bkSoft
            BevelOuter = bvNone
            Caption = 'Panel11'
            ShowCaption = False
            TabOrder = 0
            object Panel13: TPanel
              Left = 0
              Top = 0
              Width = 644
              Height = 57
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Panel6'
              ShowCaption = False
              TabOrder = 0
              object Label7: TLabel
                Left = 10
                Top = 8
                Width = 88
                Height = 15
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Nome Database'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DatabaseNameConf: TEdit
                AlignWithMargins = True
                Left = 10
                Top = 29
                Width = 345
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                OnExit = DatabaseNameConfExit
              end
            end
            object Panel14: TPanel
              Left = 0
              Top = 57
              Width = 644
              Height = 57
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Panel7'
              ShowCaption = False
              TabOrder = 1
              object Label8: TLabel
                Left = 10
                Top = 6
                Width = 75
                Height = 15
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Nome Server'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object ServerNameConf: TEdit
                AlignWithMargins = True
                Left = 10
                Top = 25
                Width = 345
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 0
                OnExit = ServerNameConfExit
              end
            end
            object Panel15: TPanel
              Left = 0
              Top = 114
              Width = 644
              Height = 52
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Panel8'
              ShowCaption = False
              TabOrder = 2
              object Label9: TLabel
                Left = 10
                Top = -1
                Width = 40
                Height = 15
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Utente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object UtenteConf: TEdit
                AlignWithMargins = True
                Left = 10
                Top = 20
                Width = 345
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 0
                OnExit = UtenteConfExit
              end
            end
            object Panel16: TPanel
              Left = 0
              Top = 166
              Width = 644
              Height = 359
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Panel9'
              ShowCaption = False
              TabOrder = 3
              object Label10: TLabel
                Left = 10
                Top = -2
                Width = 52
                Height = 15
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Password'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object PasswordConf: TEdit
                AlignWithMargins = True
                Left = 10
                Top = 19
                Width = 345
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                PasswordChar = '*'
                TabOrder = 0
                OnExit = PasswordConfExit
              end
              object ConfButton: TButton
                Left = 240
                Top = 50
                Width = 115
                Height = 25
                Cursor = crHandPoint
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Test Connessione'
                DragCursor = crHandPoint
                TabOrder = 1
                OnClick = ConfButtonClick
              end
            end
          end
        end
        object TabSheet3: TTabSheet
          Margins.Left = 4
          Margins.Top = 4
          Margins.Right = 4
          Margins.Bottom = 4
          Caption = 'Database Statistiche avanzate'
          ImageIndex = 2
          object Panel11: TPanel
            Left = 0
            Top = 0
            Width = 648
            Height = 306
            Margins.Left = 4
            Margins.Top = 4
            Margins.Right = 4
            Margins.Bottom = 4
            Align = alClient
            BevelKind = bkSoft
            BevelOuter = bvNone
            Caption = 'Panel11'
            ShowCaption = False
            TabOrder = 0
            object Panel17: TPanel
              Left = 0
              Top = 0
              Width = 644
              Height = 57
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Panel6'
              ShowCaption = False
              TabOrder = 0
              object Label11: TLabel
                Left = 10
                Top = 8
                Width = 88
                Height = 15
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Nome Database'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object DatabaseNameStat: TEdit
                AlignWithMargins = True
                Left = 10
                Top = 29
                Width = 345
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                ParentShowHint = False
                ShowHint = False
                TabOrder = 0
                OnExit = DatabaseNameStatExit
              end
            end
            object Panel18: TPanel
              Left = 0
              Top = 57
              Width = 644
              Height = 57
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Panel7'
              ShowCaption = False
              TabOrder = 1
              object Label12: TLabel
                Left = 10
                Top = 6
                Width = 75
                Height = 15
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Nome Server'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object ServerNameStat: TEdit
                AlignWithMargins = True
                Left = 10
                Top = 27
                Width = 345
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 0
                OnExit = ServerNameStatExit
              end
            end
            object Panel19: TPanel
              Left = 0
              Top = 114
              Width = 644
              Height = 52
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Panel8'
              ShowCaption = False
              TabOrder = 2
              object Label13: TLabel
                Left = 10
                Top = -1
                Width = 40
                Height = 15
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Utente'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object UtenteStat: TEdit
                AlignWithMargins = True
                Left = 10
                Top = 20
                Width = 345
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                TabOrder = 0
                OnExit = UtenteStatExit
              end
            end
            object Panel20: TPanel
              Left = 0
              Top = 166
              Width = 644
              Height = 359
              Margins.Left = 4
              Margins.Top = 4
              Margins.Right = 4
              Margins.Bottom = 4
              Align = alTop
              BevelOuter = bvNone
              Caption = 'Panel9'
              ShowCaption = False
              TabOrder = 3
              object Label14: TLabel
                Left = 10
                Top = -2
                Width = 52
                Height = 15
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Password'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'Segoe UI'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object PasswordStat: TEdit
                AlignWithMargins = True
                Left = 10
                Top = 19
                Width = 345
                Height = 23
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                PasswordChar = '*'
                TabOrder = 0
                OnExit = PasswordStatExit
              end
              object StatButton: TButton
                Left = 240
                Top = 50
                Width = 115
                Height = 25
                Cursor = crHandPoint
                Margins.Left = 4
                Margins.Top = 4
                Margins.Right = 4
                Margins.Bottom = 4
                Caption = 'Test Connessione'
                DragCursor = crHandPoint
                TabOrder = 1
                OnClick = StatButtonClick
              end
            end
          end
        end
      end
    end
  end
  object SelectDirectory: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = []
    Left = 579
    Top = 43
  end
  object ImageList1: TImageList
    Left = 499
    Top = 35
    Bitmap = {
      494C010102000800040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FEFEFE0100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000DED4BF4AF3B842FBF3B8
      42FBF3B842FBF3B842FBF3B842FBF3B842FBF3B842FBF3B842FBF3B842FBF3B8
      42FBF3B842FBF3B842FBF4F4F40B000000000000000000000000000000000000
      0000FDFDFD021C1E1EFDFEFEFE0100000000FBFBFB0400000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F5BA43FFF5BA43FFF5BA
      43FFF5BA43FFF5BA43FFF5BA43FFF5BA43FFF5BA43FFF5BA43FFF5BA43FFF5BA
      43FFF5BA43FFF5BA43FFF5BA44FD000000000000000000000000000000000000
      000000000000202222F9313333E6FBFBFB04242626F41B1D1DFEC9C9C93CFCFC
      FC03000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F6BC48FFF6BC48FFF6BC
      48FFF6BC48FFF6BC48FFF6BC48FFF6BC48FFF6BC48FFF6BC48FFF6BC48FFF6BC
      48FFF6BC48FFF6BC48FFF6BC49FD000000000000000000000000FCFCFC032426
      26F41C1E1EFDB8B8B84F1D1F1FFC00000000FCFCFC03000000001C1E1EFD1D1F
      1FFC000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F7BF4DFFF7BF4DFFF7BF
      4DFFF7BF4DFFF7BF4DFFF7BF4DFFF7BF4DFFF7BF4DFFF7BF4DFFF7BF4DFFF7BF
      4DFFF7BF4DFFF7BF4DFFF7BF4EFD0000000000000000FBFBFB041C1E1EFD4445
      45D1FAFAFA051B1D1DFF1B1D1DFF1B1D1DFF0000000000000000000000000000
      00001E2020FBA4A5A56500000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F8C151FFF8C151FFF8C1
      51FFF8C151FFF8C151FFF8C151FFF8C151FFF8C151FFF8C151FFF8C151FFF8C1
      51FFF8C151FFF8C151FFF8C152FD00000000FBFBFB041D1F1FFCB4B5B5530000
      00001B1D1DFF595B5BB9FEFEFE011B1D1DFF0000000000000000000000000000
      0000FAFAFA051B1D1DFF96979775000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000F9C456FFF9C456FFF9C4
      56FFF9C456FFF9C456FFF9C456FFF9C456FFF9C456FFF9C456FFF9C456FFF9C4
      56FFF9C456FFF9C456FFF9C457FD000000001B1D1DFF7C7D7D92000000000000
      00001B1D1DFFFDFDFD0200000000000000001B1D1DFFFEFEFE01000000000000
      000000000000FAFAFA051D1F1FFCEBEBEB160000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FAC65BFFFAC65BFFFAC6
      5BFFFAC65BFFFAC65BFFFAC65BFFFAC65BFFFAC65BFFFAC65BFFFAC65BFFFAC6
      5BFFFAC65BFFFAC65BFFFAC65CFD000000001D1F1FFC00000000000000000000
      00001B1D1DFF0000000000000000000000001B1D1DFFD0D0D034000000000000
      00000000000000000000292B2BEF292B2BEF0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FBC860FFFBC960FFFBC9
      60FFFBC960FFFBC960FFFBC960FFFBC960FFFBC960FFFBC960FFFBC960FFFBC9
      60FFFBC960FFFBC960FFFBC861FD00000000000000001E2020FB000000000000
      00001B1D1DFF000000000000000000000000000000001E2020FBFBFBFB040000
      000000000000616363B01B1D1DFFFEFEFE010000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000FCCB65FFFCCB65FFFCCB
      65FFFCCB65FFFCCB65FFFCCB65FFFCCB65FFFCCB65FFFCCB65FFFCCB65FFFCCB
      65FFFCCB65FFFCCB65FFFCCB66FD0000000000000000E9E9E9181D1F1FFC0000
      00001B1D1DFF00000000000000000000000000000000323434E57172729E0000
      0000333434E41B1D1DFFFCFCFC03000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000C5892AFFFFD06CFFFFD0
      6CFFFFD06CFFFFD06CFFFFD06CFFFFD06CFFFFD06CFFFFD06CFFFFD06CFFFFD0
      6CFFFFD06CFFFFD06CFFCD9030FD000000000000000000000000000000001E20
      20FB606262B11B1D1DFEA9A9A96000000000FEFEFE01202222F91C1E1EFD0000
      0000DFDFDF23FEFEFE0100000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000D09632FFD09632FFD096
      32FFD09632FFD09632FFD09632FFD09735FBD09735FBD09735FBD09735FBD097
      35FBD09735FBD09735FB0000000000000000000000000000000000000000FCFC
      FC03414343D41E2020FB1B1D1DFF1B1D1DFF1B1D1DFF1B1D1DFE1B1D1DFF2426
      26F4000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000E0B76FB6D49B36FFD49B
      36FFD49B36FFD49C38FC00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000FBFBFB0400000000F4F4F40C0000000000000000FCFCFC031F21
      21FAFBFBFB040000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFBFF00000000
      8001F17F000000008001F80F000000008001C14F00000000800180F300000000
      800110F10000000080013338000000008001773C000000008001B79800000000
      80019791000000008001E113000000008003E00F0000000083FFFAC700000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
  object FDConnection: TFDConnection
    Left = 525
    Top = 104
  end
end
