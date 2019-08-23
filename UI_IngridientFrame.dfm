object frUI_Ingridient: TfrUI_Ingridient
  Left = 0
  Top = 0
  Width = 451
  Height = 41
  Align = alTop
  AutoSize = True
  TabOrder = 0
  object pIngridientSample: TPanel
    Left = 0
    Top = 0
    Width = 451
    Height = 41
    Align = alTop
    TabOrder = 0
    DesignSize = (
      451
      41)
    object ebCoctail_IngridientName: TLabel
      Left = 8
      Top = 11
      Width = 28
      Height = 13
      Caption = #1053#1072#1079#1074'.'
    end
    object sbCoctail_IngridientDelete: TSpeedButton
      Left = 410
      Top = 8
      Width = 23
      Height = 22
      Anchors = []
      Caption = 'X'
      OnClick = sbCoctail_IngridientDeleteClick
      ExplicitLeft = 303
    end
    object lCoctail_IngridientVolume: TLabel
      Left = 261
      Top = 11
      Width = 36
      Height = 13
      Anchors = [akTop]
      Caption = #1054#1073#1100#1077#1084':'
      ExplicitLeft = 195
    end
    object edCoctail_IngridientNameValue: TEdit
      Left = 40
      Top = 8
      Width = 145
      Height = 21
      TabOrder = 0
      Text = 'edCoctail_IngridientNameValue'
      OnChange = edCoctail_IngridientNameValueChange
    end
    object edCoctail_IngridientVolumeValue: TEdit
      Left = 311
      Top = 8
      Width = 49
      Height = 21
      Anchors = [akTop]
      TabOrder = 1
      Text = '1'
      OnChange = edCoctail_IngridientVolumeValueChange
    end
    object udCoctail_IngridientVolume: TUpDown
      Left = 360
      Top = 8
      Width = 16
      Height = 21
      Anchors = [akTop]
      Associate = edCoctail_IngridientVolumeValue
      Min = 1
      Max = 10000
      Increment = 5
      Position = 1
      TabOrder = 2
    end
  end
end
