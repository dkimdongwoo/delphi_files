program kaka;

uses
  System.StartUpCopy,
  FMX.Forms,
  ka in 'ka.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TMessenger,Messenger);
  Application.Run;
end.
