program mainProject;

uses
  Vcl.Forms,
  main in 'main.pas' {mainForm},
  binarySearch in '..\binarySearch.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TmainForm, mainForm);
  Application.Run;
end.
