unit UI_IngridientFrame;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes,
  Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ComCtrls,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls;

type
  TfrUI_Ingridient = class(TFrame)
    pIngridientSample: TPanel;
    ebCoctail_IngridientName: TLabel;
    sbCoctail_IngridientDelete: TSpeedButton;
    lCoctail_IngridientVolume: TLabel;
    edCoctail_IngridientNameValue: TEdit;
    edCoctail_IngridientVolumeValue: TEdit;
    udCoctail_IngridientVolume: TUpDown;
    procedure edCoctail_IngridientNameValueChange(Sender: TObject);
    procedure edCoctail_IngridientVolumeValueChange(Sender: TObject);
    procedure sbCoctail_IngridientDeleteClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }

    OnIngridientNameChanged: TNotifyEvent;
    OnIngridientVolumeChanged: TNotifyEvent;
    OnIngridientDeleteClicked: TNotifyEvent;

    IngridientNameDeleting: Boolean;
  end;

implementation

{$R *.dfm}

procedure TfrUI_Ingridient.edCoctail_IngridientNameValueChange(Sender: TObject);
begin
  if Assigned(OnIngridientNameChanged)
  then OnIngridientNameChanged(Self);
end;

procedure TfrUI_Ingridient.edCoctail_IngridientVolumeValueChange(
  Sender: TObject);
begin
  if Assigned(OnIngridientVolumeChanged)
  then OnIngridientVolumeChanged(Self);
end;

procedure TfrUI_Ingridient.sbCoctail_IngridientDeleteClick(Sender: TObject);
begin
  if Assigned(OnIngridientDeleteClicked)
  then OnIngridientDeleteClicked(Self);
end;

end.
