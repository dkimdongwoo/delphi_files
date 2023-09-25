program TH_Device;

uses
  System.StartUpCopy,
  FMX.Forms,
  Main in 'Main.pas' {Tem_Hum_Deivce};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TTem_Hum_Deivce, Tem_Hum_Deivce);
  Application.Run;
end.
