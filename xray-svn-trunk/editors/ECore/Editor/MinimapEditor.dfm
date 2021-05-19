object TMinimapEditor: TTMinimapEditor
  Left = 740
  Top = 731
  Width = 601
  Height = 449
  Caption = 'TMinimapEditor'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 330
    Width = 585
    Height = 81
    Align = alBottom
    BevelOuter = bvNone
    Color = 5131854
    TabOrder = 0
    object btnLoad: TExtBtn
      Left = 0
      Top = 2
      Width = 57
      Height = 17
      Align = alNone
      BevelShow = False
      Caption = 'Load'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Kind = knNone
      ParentFont = False
      FlatAlwaysEdge = True
      OnClick = btnLoadClick
    end
    object MxLabel1: TMxLabel
      Left = 0
      Top = 29
      Width = 56
      Height = 13
      Caption = 'BoundRect'
    end
    object MxLabel2: TMxLabel
      Left = 72
      Top = 5
      Width = 39
      Height = 13
      Caption = 'LeftTop'
    end
    object MxLabel3: TMxLabel
      Left = 184
      Top = 5
      Width = 60
      Height = 13
      Caption = 'RightBottom'
    end
    object ElFloatSpinEditX1: TElFloatSpinEdit
      Left = 64
      Top = 24
      Width = 100
      Height = 20
      Cursor = crIBeam
      VertScrollBarStyles.ShowTrackHint = False
      VertScrollBarStyles.Width = 17
      VertScrollBarStyles.ButtonSize = 17
      HorzScrollBarStyles.ShowTrackHint = False
      HorzScrollBarStyles.Width = 17
      HorzScrollBarStyles.ButtonSize = 17
      UseCustomScrollBars = True
      NotifyUserChangeOnly = True
      Increment = 1
      LargeIncrement = 10
      MaxValue = 10000
      MinValue = -10000
      Alignment = taLeftJustify
      TopMargin = 3
      RightMargin = 5
      BorderSides = [ebsLeft, ebsRight, ebsTop, ebsBottom]
      Transparent = False
      OnChange = ElFloatSpinEditX1Change
      Constraints.MaxHeight = 20
      Constraints.MinHeight = 20
      BorderStyle = bsNone
      Color = 8158332
      Ctl3D = True
      LineBorderActiveColor = clBlack
      LineBorderInactiveColor = clBlack
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 0
    end
    object ElFloatSpinEditZ1: TElFloatSpinEdit
      Left = 64
      Top = 48
      Width = 100
      Height = 20
      Cursor = crIBeam
      VertScrollBarStyles.ShowTrackHint = False
      VertScrollBarStyles.Width = 17
      VertScrollBarStyles.ButtonSize = 17
      HorzScrollBarStyles.ShowTrackHint = False
      HorzScrollBarStyles.Width = 17
      HorzScrollBarStyles.ButtonSize = 17
      UseCustomScrollBars = True
      NotifyUserChangeOnly = True
      Increment = 1
      LargeIncrement = 10
      MaxValue = 10000
      MinValue = -10000
      Alignment = taLeftJustify
      TopMargin = 3
      RightMargin = 5
      BorderSides = [ebsLeft, ebsRight, ebsTop, ebsBottom]
      Transparent = False
      OnChange = ElFloatSpinEditX1Change
      Constraints.MaxHeight = 20
      Constraints.MinHeight = 20
      BorderStyle = bsNone
      Color = 8158332
      Ctl3D = True
      LineBorderActiveColor = clBlack
      LineBorderInactiveColor = clBlack
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 1
    end
    object ElFloatSpinEditX2: TElFloatSpinEdit
      Left = 184
      Top = 24
      Width = 100
      Height = 20
      Cursor = crIBeam
      VertScrollBarStyles.ShowTrackHint = False
      VertScrollBarStyles.Width = 17
      VertScrollBarStyles.ButtonSize = 17
      HorzScrollBarStyles.ShowTrackHint = False
      HorzScrollBarStyles.Width = 17
      HorzScrollBarStyles.ButtonSize = 17
      UseCustomScrollBars = True
      NotifyUserChangeOnly = True
      Increment = 1
      LargeIncrement = 10
      MaxValue = 10000
      MinValue = -10000
      Alignment = taLeftJustify
      TopMargin = 3
      RightMargin = 5
      BorderSides = [ebsLeft, ebsRight, ebsTop, ebsBottom]
      Transparent = False
      OnChange = ElFloatSpinEditX1Change
      Constraints.MaxHeight = 20
      Constraints.MinHeight = 20
      BorderStyle = bsNone
      Color = 8158332
      Ctl3D = True
      LineBorderActiveColor = clBlack
      LineBorderInactiveColor = clBlack
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 2
    end
    object ElFloatSpinEditZ2: TElFloatSpinEdit
      Left = 184
      Top = 48
      Width = 100
      Height = 20
      Cursor = crIBeam
      VertScrollBarStyles.ShowTrackHint = False
      VertScrollBarStyles.Width = 17
      VertScrollBarStyles.ButtonSize = 17
      HorzScrollBarStyles.ShowTrackHint = False
      HorzScrollBarStyles.Width = 17
      HorzScrollBarStyles.ButtonSize = 17
      UseCustomScrollBars = True
      NotifyUserChangeOnly = True
      Increment = 1
      LargeIncrement = 10
      MaxValue = 10000
      MinValue = -10000
      Alignment = taLeftJustify
      TopMargin = 3
      RightMargin = 5
      BorderSides = [ebsLeft, ebsRight, ebsTop, ebsBottom]
      Transparent = False
      OnChange = ElFloatSpinEditX1Change
      Constraints.MaxHeight = 20
      Constraints.MinHeight = 20
      BorderStyle = bsNone
      Color = 8158332
      Ctl3D = True
      LineBorderActiveColor = clBlack
      LineBorderInactiveColor = clBlack
      ParentColor = False
      ParentCtl3D = False
      TabOrder = 3
    end
    object result_edit: TElAdvancedEdit
      Left = 296
      Top = 48
      Width = 265
      Height = 21
      BorderSides = [ebsLeft, ebsRight, ebsTop, ebsBottom]
      BorderStyle = bsNone
      Color = 8158332
      LineBorderActiveColor = clBlack
      LineBorderInactiveColor = clBlack
      ReadOnly = True
      TabOrder = 4
      Text = 'bound_rect='
    end
  end
  object imgPanel: TMxPanel
    Left = 0
    Top = 0
    Width = 585
    Height = 330
    Align = alClient
    Color = 3355443
    TabOrder = 1
    OnMouseDown = imgPanelMouseDown
    OnResize = imgPanelResize
    OnPaint = imgPanelPaint
  end
end