unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  RDuAngularGauge, sgcWebSocket_Classes, sgcWebSocket_Protocol_Base_Client,
  sgcWebSocket_Protocol_MQTT_Client, sgcWebSocket_Protocols, sgcBase_Classes,
  sgcSocket_Classes, sgcTCP_Classes, sgcWebSocket_Classes_Indy,
  sgcWebSocket_Client, sgcWebSocket, FMX.Controls.Presentation, FMX.StdCtrls, sgcWebSocket_Protocol_MQTT_Message,
  FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TForm1 = class(TForm)
    sgcWebSocketClient1: TsgcWebSocketClient;
    sgcWSPClient_MQTT1: TsgcWSPClient_MQTT;
    GridPanelLayout1: TGridPanelLayout;
    RDAngularGauge1: TRDAngularGauge;
    RDAngularGauge2: TRDAngularGauge;
    RDAngularGauge3: TRDAngularGauge;
    RDAngularGauge4: TRDAngularGauge;
    btnConnect: TButton;
    btnDconnect: TButton;
    btnPubSub: TButton;
    Memo1: TMemo;
    procedure btnConnectClick(Sender: TObject);
    procedure btnDconnectClick(Sender: TObject);
    procedure sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
      const Session: Boolean; const ReasonCode: Integer;
      const ReasonName: string;
      const ConnectProperties: TsgcWSMQTTCONNACKProperties);
    procedure sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
      ReasonCode: Integer; const ReasonName: string;
      DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
    procedure btnPubSubClick(Sender: TObject);
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

procedure TForm1.btnConnectClick(Sender: TObject);
begin
  sgcWebSocketClient1.URL := 'ws://broker.hivemq.com';
  sgcWebSocketClient1.Port := 1883;
  sgcWebSocketClient1.Specifications.RFC6455 := False;
  sgcWebSocketClient1.Active := True;
end;

procedure TForm1.btnDconnectClick(Sender: TObject);
begin
  sgcWebSocketClient1.Active := False;
end;

procedure TForm1.btnPubSubClick(Sender: TObject);
begin
  sgcWSPClient_MQTT1.Subscribe('benben3/d5_st');
  sgcWSPClient_MQTT1.Subscribe('benben3/d5_sh');
  sgcWSPClient_MQTT1.Subscribe('benben3/d6_st');
  sgcWSPClient_MQTT1.Subscribe('benben3/d6_sh');
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
  const Session: Boolean; const ReasonCode: Integer; const ReasonName: string;
  const ConnectProperties: TsgcWSMQTTCONNACKProperties);
begin
  Memo1.Lines.Add('Connect');
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
  ReasonCode: Integer; const ReasonName: string;
  DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
begin
  Memo1.Lines.Add('Dconnect');
end;

procedure TForm1.sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
  aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
begin
  if (Pos('benben3/d5_st',aTopic) > 0) then
  begin
    RDAngularGauge1.Value := StrToInt(aText);
  end
  else if (Pos('benben3/d5_sh',aTopic) > 0) then
  begin
    RDAngularGauge2.Value := StrToInt(aText);
  end
  else if (Pos('benben3/d6_st',aTopic) > 0) then
  begin
    RDAngularGauge3.Value := StrToInt(aText);
  end
  else if (Pos('benben3/d6_sh',aTopic) > 0) then
  begin
    RDAngularGauge4.Value := StrToInt(aText);
  end;
  Memo1.Lines.Add(aTopic + ':' + aText);
  Memo1.ScrollBy(0, Memo1.Lines.Count);
end;

end.
