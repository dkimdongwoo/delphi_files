program Alarme;

uses
  Vcl.Forms,
  uAlarme in 'uAlarme.pas' {frmAlarme};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmAlarme, frmAlarme);
  Application.Run;
end.
