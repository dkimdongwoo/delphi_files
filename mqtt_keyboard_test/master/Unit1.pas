unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, sgcWebSocket_Classes,
  sgcWebSocket_Protocol_Base_Client, sgcWebSocket_Protocol_MQTT_Client, sgcWebSocket_Protocol_MQTT_message,
  sgcWebSocket_Protocols, sgcBase_Classes, sgcSocket_Classes, sgcTCP_Classes,
  sgcWebSocket_Classes_Indy, sgcWebSocket_Client, sgcWebSocket;

type
  TForm1 = class(TForm)
    Edit1: TEdit;
    Edit2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Tbutton1: TButton;
    Tbutton2: TButton;
    sgcWebSocketClient1: TsgcWebSocketClient;
    sgcWSPClient_MQTT1: TsgcWSPClient_MQTT;
    Memo1: TMemo;
    Button1: TButton;
    Edit3: TEdit;
    Button2: TButton;
    procedure sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
      const Session: Boolean; const ReasonCode: Integer;
      const ReasonName: string;
      const ConnectProperties: TsgcWSMQTTCONNACKProperties);
    procedure sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
      ReasonCode: Integer; const ReasonName: string;
      DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Tbutton1Click(Sender: TObject);
    procedure Tbutton2Click(Sender: TObject);
    procedure sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
      aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  sgcWebSocketClient1.Active := True;
  sgcWebSocketClient1.URL := 'ws://broker.hivemq.com';
  sgcWebSocketClient1.Port := 1883;
  sgcWebSocketClient1.Specifications.RFC6455 := False;
  sgcWSPClient_MQTT1.Subscribe('kimdongwoob');
end;

procedure TForm1.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  sgcWebSocketClient1.Active := False;
end;

procedure TForm1.FormCreate(Sender: TObject; var Action: TCloseAction);
begin
  sgcWebSocketClient1.Active := False;
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
  const Session: Boolean; const ReasonCode: Integer; const ReasonName: string;
  const ConnectProperties: TsgcWSMQTTCONNACKProperties);
begin
  Memo1.Lines.Add('#connect');
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
  ReasonCode: Integer; const ReasonName: string;
  DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
begin
  Memo1.Lines.Add('#dconnect');
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
  aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
begin
  if (Pos('kimdongwoob', aTopic) > 0) then
  begin
    Memo1.Lines.Add(aText);
  end;
end;

procedure TForm1.Tbutton1Click(Sender: TObject);
begin
  sgcWSPClient_MQTT1.Publish('kimdongwoob','L');
end;

procedure TForm1.Tbutton2Click(Sender: TObject);
begin
  sgcWSPClient_MQTT1.Publish('kimdongwoob','R');
end;

end.
