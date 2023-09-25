unit Main;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.ComCtrls,
  sgcWebSocket_Classes, sgcWebSocket_Protocol_Base_Client,
  sgcWebSocket_Protocol_MQTT_Message,
  sgcWebSocket_Protocol_MQTT_Client, sgcWebSocket_Protocols, sgcBase_Classes,
  sgcSocket_Classes, sgcTCP_Classes, sgcWebSocket_Classes_Indy,
  sgcWebSocket_Client, sgcWebSocket, Vcl.Grids, Vcl.DBGrids, Vcl.Buttons,
  Vcl.ExtCtrls, VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series,
  VCLTee.TeeProcs, VCLTee.Chart;

type
  TfrmMain = class(TForm)
    DBGrid1: TDBGrid;
    sgcWebSocketClient1: TsgcWebSocketClient;
    sgcWSPClient_MQTT1: TsgcWSPClient_MQTT;
    btsStart: TButton;
    btnClose: TButton;
    Memo1: TMemo;
    edtAbc1: TEdit;
    edtAbc2: TEdit;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    lblAbc1: TLabel;
    lblAbc2: TLabel;
    SpeedButton1: TSpeedButton;
    DataSource1: TDataSource;
    Timer1: TTimer;
    btnTime: TButton;
    btnDtime: TButton;
    btnChart: TButton;
    Timer2: TTimer;
    Chart1: TChart;
    Series1: TFastLineSeries;
    procedure btsStartClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
      const Session: Boolean; const ReasonCode: Integer;
      const ReasonName: string;
      const ConnectProperties: TsgcWSMQTTCONNACKProperties);
    procedure sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
      ReasonCode: Integer; const ReasonName: string;
      DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
    procedure SpeedButton1Click(Sender: TObject);
    procedure sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
      aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
    procedure btnTimeClick(Sender: TObject);
    procedure btnDtimeClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btnChartClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    abc1, abc2,abc3: Integer;
    data_str: string;

  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses Data, chart;


 procedure TfrmMain.FormCreate(Sender: TObject);
begin
        abc1 := -999;
        abc2 := -999;
        abc3 := -999;
        data_str := 'Date erro';

        Timer1.Enabled := False;
        Timer2.Enabled := False;
end;


procedure TfrmMain.btsStartClick(Sender: TObject);
begin
  sgcWebSocketClient1.URL := 'ws://broker.hivemq.com';
  sgcWebSocketClient1.Port := 1883;
  sgcWebSocketClient1.Specifications.RFC6455 := False;
  sgcWebSocketClient1.Active := True;
end;

procedure TfrmMain.btnCloseClick(Sender: TObject);
begin
  sgcWebSocketClient1.Active := False;
end;


procedure TfrmMain.sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
  const Session: Boolean; const ReasonCode: Integer; const ReasonName: string;
  const ConnectProperties: TsgcWSMQTTCONNACKProperties);
begin
  Memo1.Lines.Add('#connection');
end;


procedure TfrmMain.sgcWSPClient_MQTT1MQTTDisconnect
  (Connection: TsgcWSConnection; ReasonCode: Integer; const ReasonName: string;
  DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
begin
  Memo1.Lines.Add('#diconnection');
end;

 procedure TfrmMain.SpeedButton1Click(Sender: TObject);
begin
  sgcWSPClient_MQTT1.Subscribe(edtAbc1.Text);
  sgcWSPClient_MQTT1.Subscribe(edtAbc2.Text);
end;

 procedure TfrmMain.sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
  aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
begin
  Memo1.Lines.Add(aTopic + ':' + aText);
  if (pos('abcd/abc1', aTopic) > 0) then
  begin
    lblAbc1.Caption := aText;
    ProgressBar1.Position := StrToInt(aText);
    abc1 := StrToInt(aText);
  end
  else if (pos('abcd/abc2', aTopic) > 0) then
  begin
    lblAbc2.Caption := aText;
    ProgressBar2.Position := StrToInt(aText);
    abc2 := StrToInt(aText);
  end;
end;


  procedure TfrmMain.btnTimeClick(Sender: TObject);
begin
  if (Timer1.Enabled = False) then
  begin
    Timer1.Enabled := True;
  end;
end;

procedure TfrmMain.btnDtimeClick(Sender: TObject);
begin
  if (Timer1.Enabled = True) then
  begin
    Timer1.Enabled := False;
  end;
end;


procedure TfrmMain.Timer1Timer(Sender: TObject);
var
Today : string;

begin

 DataModule1.FDQuery1.Edit;
 Today := FormatDateTime('YYYY-MM-DD hh:mm:ss',now);
    DataModule1.FDQuery1.FieldByName('abc1').AsInteger := abc1;
    DataModule1.FDQuery1.FieldByName('abc2').AsInteger := abc2;
    DataModule1.FDQuery1.FieldByName('data').AsString := Today;
    //TimeToStr(now)//델파이이 데이트 타임 추가
    DataModule1.FDQuery1.Append;
    DataModule1.FDQuery1.Post;
    DataModule1.FDQuery1.Refresh;

//    DataModule1.FDQuery2.ParamByName('ABC11').AsInteger := abc1;
//    DataModule1.FDQuery2.ParamByName('ABC22').AsInteger := abc2;
//    DataModule1.FDQuery2.ParamByName('DATA_STR33').AsString := data_str;
//    DataModule1.FDQuery2.Open;
end;


procedure TfrmMain.btnChartClick(Sender: TObject);
begin
// frmChart := TfrmChart.Create(Self);
// frmChart.ShowModal;
if (Timer2.Enabled = False) then
  begin
    Timer2.Enabled := True;
  end;

end;


 procedure TfrmMain.Timer2Timer(Sender: TObject);
var
 x : Integer;
begin
//     frmChart.Chart1.Series[0].Add(abc2,'',clRed);
     Chart1.Series[0].Add(abc2);

     x := Chart1.GetMaxValuesCount;
     if x > 20 then
     begin
       Series1.Clear;
     end;

end;













end.
