unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sgcWebSocket_Classes,
  sgcWebSocket_Protocol_Base_Client, sgcWebSocket_Protocol_MQTT_Client, sgcWebSocket_Protocol_MQTT_message,
  sgcWebSocket_Protocols, sgcBase_Classes, sgcSocket_Classes, sgcTCP_Classes,
  sgcWebSocket_Classes_Indy, sgcWebSocket_Client, sgcWebSocket, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    sgcWebSocketClient1: TsgcWebSocketClient;
    sgcWSPClient_MQTT1: TsgcWSPClient_MQTT;
    Memo1: TMemo;
    Button1: TButton;
    Panel1: TPanel;
    procedure sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
      const Session: Boolean; const ReasonCode: Integer;
      const ReasonName: string;
      const ConnectProperties: TsgcWSMQTTCONNACKProperties);
    procedure sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
      ReasonCode: Integer; const ReasonName: string;
      DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
    procedure sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
      aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    abc: Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  sgcWebSocketClient1.URL := 'ws://broker.hivemq.com';
  sgcWebSocketClient1.Port := 1883;
  sgcWebSocketClient1.Specifications.RFC6455 := False;
  sgcWebSocketClient1.Active := True;
  sgcWSPClient_MQTT1.Subscribe('kimdongwoob');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caNone;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Button1.Click;
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
  const Session: Boolean; const ReasonCode: Integer; const ReasonName: string;
  const ConnectProperties: TsgcWSMQTTCONNACKProperties);
begin
  Memo1.Lines.SetText('c');
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
  ReasonCode: Integer; const ReasonName: string;
  DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
begin
 Memo1.Lines.SetText('d');
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
  aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
begin
  if (pos('kimdongwoob', aTopic) > 0) then
  begin
    Memo1.Lines.Add(aText);
    if aText = 'R' then
    begin
       mouse_event(MOUSEEVENTF_LEFTDOWN, 0,0,0,0);
       mouse_event(MOUSEEVENTF_LEFTUP, 0,0,0,0);
       SetCursorPos(screen.Width div 2,screen.Height div 2);
    end
    else if aText = 'L' then
    begin
       mouse_event(MOUSEEVENTF_LEFTDOWN, 0,0,0,0);
       mouse_event(MOUSEEVENTF_LEFTUP, 0,0,0,0);
       SetCursorPos(screen.Width div 2,screen.Height div 2);
    end
  end;
end;

end.
