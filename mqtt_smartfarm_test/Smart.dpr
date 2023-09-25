program Smart;

uses
  Vcl.Forms,
  Main in 'Main.pas' {frmMain},
  data in 'data.pas' {DataModule1: TDataModule},
  chart in 'chart.pas' {frmChart};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TDataModule1, DataModule1);
  Application.CreateForm(TfrmChart, frmChart);
  Application.Run;
end.
