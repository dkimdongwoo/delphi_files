unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList,
  Vcl.ImgList, Vcl.ComCtrls, Vcl.ToolWin, sgcWebSocket_Classes,
  sgcWebSocket_Protocol_Base_Client, sgcWebSocket_Protocol_MQTT_Client, sgcWebSocket_Protocol_MQTT_Message,
  sgcWebSocket_Protocols, sgcBase_Classes, sgcSocket_Classes, sgcTCP_Classes,
  sgcWebSocket_Classes_Indy, sgcWebSocket_Client, sgcWebSocket, Vcl.StdCtrls;

type
  TFMain = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    ToolBar1: TToolBar;
    btnConnect: TToolButton;
    btnGraph: TToolButton;
    ImageList1: TImageList;
    btnDconnect: TToolButton;
    edconnector: TEdit;
    procedure btnConnectClick(Sender: TObject);
    procedure btnDconnectClick(Sender: TObject);
    procedure btnGraphClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FMain: TFMain;

implementation

{$R *.dfm}
uses Detail, Database;

procedure TFMain.btnConnectClick(Sender: TObject);
begin
  FDetail.abc1 := -999;
  FDetail.abc2 := -999;
  FDetail.abc3 := -999;
  FDetail.data_str := 'Date erro';

  FDetail.Timer1.Enabled := False;
  FDetail.Timer2.Enabled := False;
  FDetail.sgcWebSocketClient1.URL := 'ws://broker.hivemq.com';
  FDetail.sgcWebSocketClient1.Port := 1883;
  FDetail.sgcWebSocketClient1.Specifications.RFC6455 := False;
  FDetail.sgcWebSocketClient1.Active := True;

  if (FDetail.sgcWebSocketClient1.Active = True) then
  begin
    edconnector.Text := '#Connect';
  end
  else if (FDetail.sgcWebSocketClient1.Active = False) then
  begin
    edconnector.Text := '#Dconnect';
  end;

  if not Assigned(FDetail) then
  begin
    FDetail := TFDetail.Create(Self);
  end;
  FDetail.Parent := Panel2;
  FDetail.BorderStyle := bsNone;
  FDetail.Align := alClient;
  FDetail.Show;
end;

procedure TFMain.btnDconnectClick(Sender: TObject);
begin
  FDetail.sgcWebSocketClient1.Active := False;

  if (FDetail.sgcWebSocketClient1.Active = True) then
  begin
    edconnector.Text := '#Connect';
  end
  else if (FDetail.sgcWebSocketClient1.Active = False) then
  begin
    edconnector.Text := '#Dconnect';
  end;
end;
procedure TFMain.btnGraphClick(Sender: TObject);
begin
  if not Assigned(FDatabase) then
  begin
    FDatabase := TFDatabase.Create(Self);
  end;
  FDatabase.Parent := Panel2;
  FDatabase.BorderStyle := bsNone;
  FDatabase.Align := alClient;
  FDatabase.Show;
end;

end.
