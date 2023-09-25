program messenger;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Fmessnger};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TFmessnger, Fmessnger);
  Application.Run;
end.
