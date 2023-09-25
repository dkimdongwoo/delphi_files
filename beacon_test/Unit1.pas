unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Beacon,
  System.Beacon.Fencing.Types, FMX.Controls.Presentation, FMX.StdCtrls,
  System.Beacon.Fencing;

type
  TForm1 = class(TForm)
    BeaconMapFencing1: TBeaconMapFencing;
    Panel1: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

end.
