unit Database;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, sgcWebSocket_Classes,
  sgcWebSocket_Protocol_Base_Client, sgcWebSocket_Protocol_MQTT_Client, sgcWebSocket_Protocol_MQTT_Message,
  sgcWebSocket_Protocols, sgcBase_Classes, sgcSocket_Classes, sgcTCP_Classes,
  sgcWebSocket_Classes_Indy, sgcWebSocket_Client, sgcWebSocket, Vcl.ComCtrls,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart;

type
  TFDatabase = class(TForm)
    Panel2: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FDatabase: TFDatabase;

implementation

{$R *.dfm}

end.
