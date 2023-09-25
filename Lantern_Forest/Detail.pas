unit Detail;

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
  TFDetail = class(TForm)
    Panel2: TPanel;
    btnRegistration: TButton;
    Edit1: TEdit;
    sgcWebSocketClient1: TsgcWebSocketClient;
    sgcWSPClient_MQTT1: TsgcWSPClient_MQTT;
    Memo1: TMemo;
    ProgressBar1: TProgressBar;
    ProgressBar2: TProgressBar;
    ProgressBar3: TProgressBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtABC1: TEdit;
    edtABC2: TEdit;
    edtABC3: TEdit;
    Timer1: TTimer;
    Timer2: TTimer;
    Chart1: TChart;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    procedure btnRegistrationClick(Sender: TObject);
    procedure sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
      aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
    procedure Timer2Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    abc1,abc2,abc3: Integer;
    data_str: string;
  end;

var
  FDetail: TFDetail;

implementation

{$R *.dfm}

procedure TFDetail.btnRegistrationClick(Sender: TObject);
begin
  if Edit1.Text = '' then
  begin
    Edit1.Text := '';
  end
  else
  begin
    edtABC1.Text := Edit1.Text+'/tem';
    edtABC2.Text := Edit1.Text+'/hum';
    edtABC3.Text := Edit1.Text+'/co';
    sgcWSPClient_MQTT1.Subscribe(edtABC1.Text);
    sgcWSPClient_MQTT1.Subscribe(edtABC2.Text);
    sgcWSPClient_MQTT1.Subscribe(edtABC3.Text);
    if (Timer2.Enabled = False) then
    begin
      Timer2.Enabled := True;
    end;
  end;
end;

procedure TFDetail.sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
  aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
begin
  Memo1.Lines.Add(aTopic + ':' + aText);
  if (pos(edtABC1.Text, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 50) then
    begin
      Label1.Font.Color := clRed;
      ProgressBar1.Brush.Color := clRed;
    end
    else
    begin
      Label1.Font.Color := clBlack;
      ProgressBar1.Brush.Color := clDefault;
    end;
    Label1.Caption := aText;
    ProgressBar1.Position := StrToInt(aText);
    abc1 := StrToInt(aText);
  end
  else if (pos(edtABC2.Text, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 80) then
    begin
      Label2.Font.Color := clRed;
      ProgressBar2.Brush.Color := clRed;
    end
    else
    begin
      Label2.Font.Color := clBlack;
      ProgressBar2.Brush.Color := clDefault;
    end;
    Label2.Caption := aText;
    ProgressBar2.Position := StrToInt(aText);
    abc2 := StrToInt(aText);
  end
  else if (pos(edtABC3.Text, aTopic) > 0) then
  begin
    if (StrToInt(aText) >= 400) then
    begin
      Label3.Font.Color := clRed;
      ProgressBar3.Brush.Color := clRed;
    end
    else
    begin
      Label3.Font.Color := clBlack;
      ProgressBar3.Brush.Color := clDefault;
    end;
    Label3.Caption := aText;
    ProgressBar3.Position := StrToInt(aText);
    abc3 := StrToInt(aText);
  end;
end;

procedure TFDetail.Timer2Timer(Sender: TObject);
var
 x : Integer;
begin
  Chart1.Series[0].Add(abc1);
  Chart1.Series[1].Add(abc2);

  x := Chart1.GetMaxValuesCount;
     if x > 20 then
     begin
       Series1.Clear;
       Series2.Clear;
     end;
end;

end.
