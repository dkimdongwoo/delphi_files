program lentons;

uses
  Vcl.Forms,
  Main in 'Main.pas' {FMain},
  Detail in 'Detail.pas' {FDetail},
  Database in 'Database.pas' {FDatabase};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFMain, FMain);
  Application.CreateForm(TFDetail, FDetail);
  Application.CreateForm(TFDatabase, FDatabase);
  Application.Run;
end.
