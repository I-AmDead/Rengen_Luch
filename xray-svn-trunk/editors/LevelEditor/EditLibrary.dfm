object frmEditLibrary: TfrmEditLibrary
  Left = -950
  Top = 285
  Width = 332
  Height = 468
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Object Library'
  Color = 2368548
  Constraints.MinHeight = 405
  Constraints.MinWidth = 332
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  FormStyle = fsStayOnTop
  KeyPreview = True
  OldCreateOrder = False
  Scaled = False
  OnActivate = FormActivate
  OnClose = FormClose
  OnCloseQuery = FormCloseQuery
  OnDestroy = FormDestroy
  OnKeyDown = FormKeyDown
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object paCommands: TPanel
    Left = 184
    Top = 0
    Width = 132
    Height = 430
    Align = alRight
    BevelOuter = bvNone
    Color = 5131854
    TabOrder = 0
    object ebMakeThm: TExtBtn
      Left = 2
      Top = 188
      Width = 129
      Height = 17
      Align = alNone
      BevelShow = False
      BtnColor = 10528425
      Caption = 'Make Thumbnail'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FlatAlwaysEdge = True
      OnClick = ebMakeThmClick
    end
    object ebProperties: TExtBtn
      Left = 2
      Top = 170
      Width = 129
      Height = 18
      Align = alNone
      BevelShow = False
      BtnColor = 10528425
      Caption = 'Properties'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FlatAlwaysEdge = True
      OnClick = ebPropertiesClick
    end
    object ebMakeLOD_high: TExtBtn
      Left = 2
      Top = 205
      Width = 129
      Height = 17
      Align = alNone
      BevelShow = False
      BtnColor = 10528425
      Caption = 'Make LOD (High Quality)'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FlatAlwaysEdge = True
      OnClick = ebMakeLOD_highClick
    end
    object Bevel4: TBevel
      Left = 0
      Top = 132
      Width = 132
      Height = 2
      Align = alTop
      Shape = bsBottomLine
    end
    object ebMakeLOD_low: TExtBtn
      Left = 2
      Top = 222
      Width = 129
      Height = 17
      Align = alNone
      BevelShow = False
      BtnColor = 10528425
      Caption = 'Make LOD (Low Quality)'
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Transparent = False
      FlatAlwaysEdge = True
      OnClick = ebMakeLOD_lowClick
    end
    object cbPreview: TCheckBox
      Left = 2
      Top = 247
      Width = 128
      Height = 17
      Caption = 'Preview'
      TabOrder = 0
      OnClick = cbPreviewClick
    end
    object Panel3: TPanel
      Left = 0
      Top = 134
      Width = 132
      Height = 34
      Align = alTop
      BevelOuter = bvNone
      Color = 5131854
      TabOrder = 1
      object lbFaces: TLabel
        Left = 81
        Top = 2
        Width = 9
        Height = 13
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object RxLabel2: TLabel
        Left = 4
        Top = 2
        Width = 69
        Height = 13
        Caption = 'Face count:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object RxLabel3: TLabel
        Left = 4
        Top = 18
        Width = 77
        Height = 13
        Caption = 'Vertex count:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbVertices: TLabel
        Left = 81
        Top = 18
        Width = 9
        Height = 13
        Caption = '...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
    end
    object paControl: TPanel
      Left = 0
      Top = 315
      Width = 132
      Height = 115
      Align = alBottom
      BevelOuter = bvNone
      Color = 5131854
      TabOrder = 2
      object ebImport: TExtBtn
        Left = 2
        Top = 40
        Width = 129
        Height = 17
        Align = alNone
        BevelShow = False
        BtnColor = 10528425
        Caption = 'Import Object'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FlatAlwaysEdge = True
        OnClick = ebImportClick
      end
      object ebExportLWO: TExtBtn
        Left = 2
        Top = 57
        Width = 129
        Height = 17
        Align = alNone
        BevelShow = False
        BtnColor = 10528425
        Caption = 'Export LWO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FlatAlwaysEdge = True
        OnClick = ebExportLWOClick
      end
      object ebSave: TExtBtn
        Left = 2
        Top = 80
        Width = 129
        Height = 17
        Align = alNone
        BevelShow = False
        BtnColor = 10528425
        Caption = 'Save'
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FlatAlwaysEdge = True
        OnClick = ebSaveClick
      end
      object ebCancel: TExtBtn
        Left = 2
        Top = 97
        Width = 129
        Height = 17
        Align = alNone
        BevelShow = False
        BtnColor = 10528425
        Caption = 'Close'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FlatAlwaysEdge = True
        OnClick = ebCancelClick
      end
      object ebRenameObject: TExtBtn
        Left = 3
        Top = 0
        Width = 129
        Height = 17
        Align = alNone
        BevelShow = False
        BtnColor = 10528425
        Caption = 'Rename Object'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FlatAlwaysEdge = True
        OnClick = ebRenameObjectClick
      end
      object ebRemoveObject: TExtBtn
        Left = 3
        Top = 17
        Width = 129
        Height = 17
        Align = alNone
        BevelShow = False
        BtnColor = 10528425
        Caption = 'Remove Object'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        Transparent = False
        FlatAlwaysEdge = True
        OnClick = ebRemoveObjectClick
      end
    end
    object paImage: TMxPanel
      Left = 0
      Top = 0
      Width = 132
      Height = 132
      Align = alTop
      BevelOuter = bvLowered
      Caption = '<no image>'
      Color = 3618615
      TabOrder = 3
      OnPaint = paImagePaint
    end
  end
  object paItems: TPanel
    Left = 0
    Top = 0
    Width = 184
    Height = 430
    Align = alClient
    BevelOuter = bvNone
    Color = 5131854
    TabOrder = 1
  end
  object fsStorage: TFormStorage
    OnSavePlacement = fsStorageSavePlacement
    OnRestorePlacement = fsStorageRestorePlacement
    StoredValues = <
      item
        Name = 'EmitterDirX'
        Value = 0
      end
      item
        Name = 'EmitterDirY'
        Value = 0
      end
      item
        Name = 'EmitterDirZ'
        Value = 0
      end>
  end
end
