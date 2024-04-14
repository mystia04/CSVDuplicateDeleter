object Form1: TForm1
  Left = 0
  Top = 0
  Caption = #37325#35079#34892#21066#38500#65281
  ClientHeight = 138
  ClientWidth = 822
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Label2: TLabel
    Left = 8
    Top = 11
    Width = 89
    Height = 15
    Caption = #35501#36796#20803#12501#12449#12452#12523#65306
  end
  object Label3: TLabel
    Left = 8
    Top = 40
    Width = 90
    Height = 15
    Caption = #20445#23384#20808#12501#12457#12523#12480#65306
  end
  object readFileNameEdit: TEdit
    Left = 101
    Top = 8
    Width = 713
    Height = 23
    TabOrder = 0
    TextHint = '('#12480#12502#12523#12463#12522#12483#12463#12391#36984#25246#31379#12434#38283#12365#12414#12377#8230')'
    OnDblClick = readFileNameEditDblClick
  end
  object Button1: TButton
    Left = 704
    Top = 80
    Width = 110
    Height = 25
    Caption = #37325#35079#21066#38500#23455#34892
    TabOrder = 1
    OnClick = Button1Click
  end
  object writeFolderNameEdit: TEdit
    Left = 101
    Top = 37
    Width = 713
    Height = 23
    TabOrder = 2
    TextHint = '('#12480#12502#12523#12463#12522#12483#12463#12391#36984#25246#31379#12434#38283#12365#12414#12377#8230')'
    OnDblClick = writeFolderNameEditDblClick
  end
  object Panel1: TPanel
    Left = 0
    Top = 117
    Width = 822
    Height = 21
    Align = alBottom
    TabOrder = 3
    ExplicitTop = 192
    ExplicitWidth = 818
    object StatusBar1: TStatusBar
      Left = 239
      Top = 1
      Width = 582
      Height = 19
      Align = alRight
      Panels = <>
      ExplicitLeft = 235
    end
    object ProgressBar1: TProgressBar
      Left = 1
      Top = 1
      Width = 232
      Height = 19
      Align = alLeft
      TabOrder = 1
    end
  end
  object FileOpenDialog1: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <
      item
        DisplayName = 'CSV'#12501#12449#12452#12523
        FileMask = '*.CSV'
      end>
    Options = []
    Left = 752
    Top = 16
  end
  object FileOpenDialog2: TFileOpenDialog
    FavoriteLinks = <>
    FileTypes = <>
    Options = [fdoPickFolders]
    Left = 672
    Top = 16
  end
end
