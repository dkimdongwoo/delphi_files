unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  sgcWebSocket_Classes, sgcWebSocket_Protocol_Base_Client, sgcWebSocket_Protocol_MQTT_message,
  sgcWebSocket_Protocol_MQTT_Client, sgcWebSocket_Protocols, FMX.ScrollBox,
  FMX.Memo, FMX.Controls.Presentation, FMX.Edit, sgcBase_Classes,
  sgcSocket_Classes, sgcTCP_Classes, sgcWebSocket_Classes_Indy,
  sgcWebSocket_Client, sgcWebSocket, FMX.Memo.Types;

type
  TForm1 = class(TForm)
    sgcWebSocketClient1: TsgcWebSocketClient;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    StyleBook1: TStyleBook;
    Label1: TLabel;
    Label2: TLabel;
    sgcWSPClient_MQTT1: TsgcWSPClient_MQTT;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
      const Session: Boolean; const ReasonCode: Integer;
      const ReasonName: string;
      const ConnectProperties: TsgcWSMQTTCONNACKProperties);
    procedure sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
      ReasonCode: Integer; const ReasonName: string;
      DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
    procedure sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
      aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}
{$R *.SmXhdpiPh.fmx ANDROID}

procedure TForm1.Button1Click(Sender: TObject);
begin
  sgcWebSocketClient1.URL := 'ws://broker.hivemq.com';
  sgcWebSocketClient1.Port := 1883;
  sgcWebSocketClient1.Specifications.RFC6455 := False;
  sgcWebSocketClient1.Active := True;
  sgcWSPClient_MQTT1.Subscribe(Edit1.Text);
  sgcWSPClient_MQTT1.Subscribe(Edit2.Text);
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  sgcWebSocketClient1.Active := False;
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
  const Session: Boolean; const ReasonCode: Integer; const ReasonName: string;
  const ConnectProperties: TsgcWSMQTTCONNACKProperties);
begin
  Memo1.Lines.Add('#Connect');
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
  ReasonCode: Integer; const ReasonName: string;
  DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
begin
  Memo1.Lines.Add('#Dconnect');
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
  aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
begin
  Memo1.Lines.Add(aTopic + ':' + aText);

  if (Pos(Edit1.Text, aTopic) > 0) then
  begin
    Label1.Text := aText;
    ProgressBar1.Position := StrToInt(aText);
  end
  else if (Pos(Edit2.Text, aTopic) > 0) then
  begin
    Label2.Text := aText;
    ProgressBar2.Position := StrToInt(aText);
  end;
end;

end.
