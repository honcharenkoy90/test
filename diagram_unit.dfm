object diagram_form: Tdiagram_form
  Left = 0
  Top = 0
  Caption = #1044#1080#1072#1075#1088#1072#1084#1084#1099' '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1088#1072#1073#1086#1090
  ClientHeight = 805
  ClientWidth = 1003
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  WindowState = wsMaximized
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1003
    Height = 805
    Align = alClient
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object chart: TDBChart
      Left = 1
      Top = 1
      Width = 1001
      Height = 803
      Title.Font.Color = 10485760
      Title.Font.Height = -19
      Title.Font.Style = [fsBold]
      Title.Text.Strings = (
        #1044#1080#1072#1075#1088#1072#1084#1084#1099' ('#1075#1088#1072#1092#1080#1082#1080') '#1074#1099#1087#1086#1083#1085#1077#1085#1080#1103' '#1088#1072#1073#1086#1090' '#1087#1086' '#1091#1095#1072#1089#1090#1082#1072#1084)
      OnClickLegend = chartClickLegend
      DepthAxis.Automatic = False
      DepthAxis.AutomaticMaximum = False
      DepthAxis.AutomaticMinimum = False
      DepthAxis.Maximum = 4.789999999999995000
      DepthAxis.Minimum = 3.789999999999994000
      DepthTopAxis.Automatic = False
      DepthTopAxis.AutomaticMaximum = False
      DepthTopAxis.AutomaticMinimum = False
      DepthTopAxis.Maximum = 4.789999999999995000
      DepthTopAxis.Minimum = 3.789999999999994000
      LeftAxis.Automatic = False
      LeftAxis.AutomaticMaximum = False
      LeftAxis.AutomaticMinimum = False
      LeftAxis.Maximum = 100.000000000000000000
      Legend.Alignment = laBottom
      Legend.CheckBoxes = True
      Legend.CheckBoxesStyle = cbsRadio
      RightAxis.Automatic = False
      RightAxis.AutomaticMaximum = False
      RightAxis.AutomaticMinimum = False
      View3DOptions.Perspective = 20
      Align = alClient
      Color = clWhite
      TabOrder = 0
      DesignSize = (
        1001
        803)
      ColorPaletteIndex = 13
      object DBLookupComboboxEh1: TDBLookupComboboxEh
        Left = 64
        Top = 744
        Width = 193
        Height = 21
        Anchors = [akLeft, akBottom]
        Enabled = False
        EditButtons = <>
        KeyField = 'ID'
        ListField = 'name'
        ListSource = tn_form.areaDs
        TabOrder = 0
        Visible = False
      end
      object Series1: TBarSeries
        ColorEachPoint = True
        Marks.Arrow.Visible = True
        Marks.Callout.Brush.Color = clBlack
        Marks.Callout.Arrow.Visible = True
        Marks.Visible = True
        DataSource = tn_form.areaTable
        Title = #1042#1099#1087#1086#1083#1085#1077#1085#1080#1077' '#1088#1072#1073#1086#1090' '#1087#1086' '#1091#1095#1072#1089#1090#1082#1072#1084
        XLabelsSource = 'name'
        XValues.Name = 'X'
        XValues.Order = loAscending
        XValues.ValueSource = 'ID'
        YValues.Name = 'Bar'
        YValues.Order = loNone
        YValues.ValueSource = 'working'
      end
    end
  end
  object MainMenu1: TMainMenu
    Left = 32
    Top = 8
    object N1: TMenuItem
      Caption = #1052#1077#1085#1102
      object N2: TMenuItem
        Caption = #1057#1086#1093#1088#1072#1085#1080#1090#1100' '#1076#1080#1072#1075#1088#1072#1084#1084#1091' ...'
        OnClick = N2Click
      end
    end
  end
  object SavePictureDialog1: TSavePictureDialog
    Filter = 'JPEG Image File (*.jpg)|*.jpg|JPEG Image File (*.jpeg)|*.jpeg'
    Left = 32
    Top = 96
  end
end
