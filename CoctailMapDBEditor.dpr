program CoctailMapDBEditor;

uses
  Vcl.Forms,
  MainUnit in 'MainUnit.pas' {MainForm},
  CoctailClassUnit in 'CoctailClassUnit.pas',
  IngridientClassUnit in 'IngridientClassUnit.pas',
  UI_IngridientFrame in 'UI_IngridientFrame.pas' {frUI_Ingridient: TFrame};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TMainForm, MainForm);
  Application.Run;
end.
