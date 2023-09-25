unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Memo.Types, FMX.ScrollBox,
  FMX.Memo, FMX.Objects, FMX.Layouts, sgcWebSocket_Classes,
  sgcWebSocket_Protocol_Base_Client, sgcWebSocket_Protocol_MQTT_Client, sgcWebSocket_Protocol_MQTT_Message,
  sgcWebSocket_Protocols, sgcBase_Classes, sgcSocket_Classes, sgcTCP_Classes,
  sgcWebSocket_Classes_Indy, sgcWebSocket_Client, sgcWebSocket;

type
  TForm1 = class(TForm)
    btnA1: TButton;
    btnB1: TButton;
    btnC1: TButton;
    btnD1: TButton;
    btnA0: TButton;
    btnB0: TButton;
    btnC0: TButton;
    btnD0: TButton;
    Memo1: TMemo;
    btnstart: TButton;
    btnend: TButton;
    rectA: TRectangle;
    rectB: TRectangle;
    rectC: TRectangle;
    rectD: TRectangle;
    rectborad: TRectangle;
    red: TBrushObject;
    blue: TBrushObject;
    Rectangle1: TRectangle;
    blue2: TBrushObject;
    GridPanelLayout1: TGridPanelLayout;
    Text1: TText;
    Rectangle2: TRectangle;
    whitel: TBrushObject;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    Rectangle5: TRectangle;
    Rectangle6: TRectangle;
    Rectangle7: TRectangle;
    Rectangle8: TRectangle;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Rectangle12: TRectangle;
    Rectangle13: TRectangle;
    Rectangle14: TRectangle;
    Rectangle15: TRectangle;
    Rectangle16: TRectangle;
    Text2: TText;
    sgcWebSocketClient1: TsgcWebSocketClient;
    sgcWSPClient_MQTT1: TsgcWSPClient_MQTT;
    rectAA: TRectangle;
    rectBB: TRectangle;
    rectCC: TRectangle;
    rectDD: TRectangle;
    procedure btnstartClick(Sender: TObject);
    procedure btnendClick(Sender: TObject);
    procedure sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
      const Session: Boolean; const ReasonCode: Integer;
      const ReasonName: string;
      const ConnectProperties: TsgcWSMQTTCONNACKProperties);
    procedure sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
      ReasonCode: Integer; const ReasonName: string;
      DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
    procedure sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
      aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
    procedure btnA0Click(Sender: TObject);
    procedure btnA1Click(Sender: TObject);
    procedure btnB0Click(Sender: TObject);
    procedure btnB1Click(Sender: TObject);
    procedure btnC0Click(Sender: TObject);
    procedure btnC1Click(Sender: TObject);
    procedure btnD0Click(Sender: TObject);
    procedure btnD1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    A : string;
    B : string;
    C : string;
    D : string;
    AA : string;
    BB : string;
    CC : string;
    DD : string;
    date : string;

  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.btnA0Click(Sender: TObject);
begin
  A := '0';
  date := 'A'+A+'B'+B+'C'+C+'D'+D+'E';
  sgcWSPClient_MQTT1.Publish('test/K',date);
  Memo1.Lines.Add(date);
end;

procedure TForm1.btnA1Click(Sender: TObject);
begin
  A := '1';
  date := 'A'+A+'B'+B+'C'+C+'D'+D+'E';
  sgcWSPClient_MQTT1.Publish('test/K',date);
  Memo1.Lines.Add(date);
end;

procedure TForm1.btnB0Click(Sender: TObject);
begin
  B := '0';
  date := 'A'+A+'B'+B+'C'+C+'D'+D+'E';
  sgcWSPClient_MQTT1.Publish('test/K',date);
  Memo1.Lines.Add(date);
end;

procedure TForm1.btnB1Click(Sender: TObject);
begin
  B := '1';
  date := 'A'+A+'B'+B+'C'+C+'D'+D+'E';
  sgcWSPClient_MQTT1.Publish('test/K',date);
  Memo1.Lines.Add(date);
end;

procedure TForm1.btnC0Click(Sender: TObject);
begin
  C := '0';
  date := 'A'+A+'B'+B+'C'+C+'D'+D+'E';
  sgcWSPClient_MQTT1.Publish('test/K',date);
  Memo1.Lines.Add(date);
end;

procedure TForm1.btnC1Click(Sender: TObject);
begin
  C := '1';
  date := 'A'+A+'B'+B+'C'+C+'D'+D+'E';
  sgcWSPClient_MQTT1.Publish('test/K',date);
  Memo1.Lines.Add(date);
end;

procedure TForm1.btnD0Click(Sender: TObject);
begin
  D := '0';
  date := 'A'+A+'B'+B+'C'+C+'D'+D+'E';
  sgcWSPClient_MQTT1.Publish('test/K',date);
  Memo1.Lines.Add(date);
end;

procedure TForm1.btnD1Click(Sender: TObject);
begin
  D := '1';
  date := 'A'+A+'B'+B+'C'+C+'D'+D+'E';
  sgcWSPClient_MQTT1.Publish('test/K',date);
  Memo1.Lines.Add(date);
end;

procedure TForm1.btnendClick(Sender: TObject);
begin
  sgcWebSocketClient1.Active := False;
end;

procedure TForm1.btnstartClick(Sender: TObject);
begin
  sgcWebSocketClient1.URL := 'ws://broker.hivemq.com';
  sgcWebSocketClient1.Port := 1883;
  sgcWebSocketClient1.Specifications.RFC6455 := False;
  sgcWebSocketClient1.Active := True;
  sgcWSPClient_MQTT1.Subscribe('test/KK');
  A := AA;
  B := BB;
  C := CC;
  D := DD;
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
var
a : Integer;
b : Integer;
c : Integer;
a1 : string;
a2 : string;
a3 : string;
begin
  if (Pos('test/KK',aTopic) > 0) then
  begin
    AA := Copy(aText,Pos('A',aText)+1,Pos('B',aText)-2);
    if (AA = '1') then
    begin
      rectAA.Visible := False;
    end
    else if(AA = '0') then
    begin
      rectAA.Visible := True;
    end;
    a := Length(aText)-Pos('B',aText);
    a1 := Copy(aText,Pos('B',aText),a);
    BB := Copy(a1,Pos('B',a1)+1,Pos('C',a1)-2);
    if (BB = '1') then
    begin
      rectBB.Visible := False;
    end
    else if(BB = '0') then
    begin
      rectBB.Visible := True;
    end;
    b := Length(aText)-Pos('C',aText);
    a2 := Copy(a1,Pos('C',a1),b);
    CC := Copy(a2,Pos('C',a2)+1,Pos('D',a2)-2);
    if (CC = '1') then
    begin
      rectCC.Visible := False;
    end
    else if(CC = '0') then
    begin
      rectCC.Visible := True;
    end;
    c := Length(aText)-Pos('D',aText); //2
    a3 := Copy(a2,Pos('D',a2),c)+'E';
    DD := Copy(a3,Pos('D',a3)+1,Pos('E',a3)-2);
    if (DD = '1') then
    begin
      rectDD.Visible := False;
    end
    else if(DD = '0') then
    begin
      rectDD.Visible := True;
    end;
    Memo1.Lines.Add('A :'+AA);
    Memo1.Lines.Add('B :'+BB);
    Memo1.Lines.Add('C :'+CC);
    Memo1.Lines.Add('D :'+Dd);
  end;
end;

end.
