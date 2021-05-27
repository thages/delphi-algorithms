program main.project;

uses
  Vcl.Forms,
  main in 'main.pas' {mainform},
  interpolationSearch in '..\interpolationSearch.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(Tmainform, mainform);
  Application.Run;
end.
