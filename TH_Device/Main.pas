unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts, RDuToastMessage,
  RDuAngularGauge, RDuCircularProgress, RDuVertProgress, sgcWebSocket_Classes,
  sgcWebSocket_Protocol_Base_Client, sgcWebSocket_Protocol_MQTT_Client,
  sgcWebSocket_Protocols, sgcBase_Classes, sgcSocket_Classes, sgcTCP_Classes,
  sgcWebSocket_Classes_Indy, sgcWebSocket_Client, sgcWebSocket, sgcWebSocket_Protocol_MQTT_Message,
  System.ImageList, FMX.ImgList, RDuPopupDialog, RDuInputQueryBox, FMX.Edit,
  FMX.WebBrowser, Web.HTTPApp, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, IdWebDAV, FMXTee.Engine, FMXTee.Series, FMXTee.Procs,
  FMXTee.Chart, FMX.Ani, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo;

type
  TTem_Hum_Deivce = class(TForm)
    rctHome: TRectangle;
    rctLBar: TRectangle;
    sgcWebSocketClient1: TsgcWebSocketClient;
    sgcWSPClient_MQTT1: TsgcWSPClient_MQTT;
    rctSources: TRectangle;
    gray: TBrushObject;
    darkblue: TBrushObject;
    rctTBar: TRectangle;
    whitegreen: TBrushObject;
    btnHome: TCornerButton;
    btnGraph: TCornerButton;
    btnExplanation: TCornerButton;
    btnPower: TCornerButton;
    ImageList1: TImageList;
    StyleBook1: TStyleBook;
    lbTBar: TLabel;
    rctGraph: TRectangle;
    rctExplaination: TRectangle;
    Gr: TGridPanelLayout;
    GridPanelLayout11: TGridPanelLayout;
    lbGraph: TLabel;
    GridPanelLayout12: TGridPanelLayout;
    lbExplaination: TLabel;
    lbHome: TLabel;
    Rectangle2: TRectangle;
    GridPanelLayout2: TGridPanelLayout;
    GridPanelLayout3: TGridPanelLayout;
    Rectangle1: TRectangle;
    GridPanelLayout5: TGridPanelLayout;
    Rectangle4: TRectangle;
    GridPanelLayout7: TGridPanelLayout;
    Rectangle6: TRectangle;
    GridPanelLayout9: TGridPanelLayout;
    Rectangle8: TRectangle;
    GridPanelLayout13: TGridPanelLayout;
    Rectangle3: TRectangle;
    GridPanelLayout14: TGridPanelLayout;
    lbEx: TLabel;
    lbEx2: TLabel;
    GridPanelLayout15: TGridPanelLayout;
    Rectangle5: TRectangle;
    Rectangle7: TRectangle;
    GridPanelLayout16: TGridPanelLayout;
    GridPanelLayout17: TGridPanelLayout;
    GridPanelLayout18: TGridPanelLayout;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    rctEIcon1: TRectangle;
    rctEIcon2: TRectangle;
    lbEIcon1: TLabel;
    lbEIcon2: TLabel;
    CornerButton1: TCornerButton;
    rctChart: TRectangle;
    Z: TGridPanelLayout;
    lbChart: TLabel;
    Rectangle9: TRectangle;
    Rectangle10: TRectangle;
    Chart1: TChart;
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    Timer1: TTimer;
    GridPanelLayout20: TGridPanelLayout;
    lbCName: TLabel;
    GridPanelLayout22: TGridPanelLayout;
    Label10: TLabel;
    lbTime: TLabel;
    GridPanelLayout19: TGridPanelLayout;
    GridPanelLayout23: TGridPanelLayout;
    GridPanelLayout21: TGridPanelLayout;
    arcCT: TArc;
    Rectangle37: TRectangle;
    arcCH: TArc;
    Rectangle22: TRectangle;
    GridPanelLayout24: TGridPanelLayout;
    Label11: TLabel;
    Label12: TLabel;
    GridPanelLayout25: TGridPanelLayout;
    Label13: TLabel;
    Label14: TLabel;
    GridPanelLayout26: TGridPanelLayout;
    Rectangle11: TRectangle;
    GridPanelLayout27: TGridPanelLayout;
    Rectangle14: TRectangle;
    GridPanelLayout30: TGridPanelLayout;
    GridPanelLayout33: TGridPanelLayout;
    Rectangle19: TRectangle;
    GridPanelLayout34: TGridPanelLayout;
    Rectangle27: TRectangle;
    GridPanelLayout37: TGridPanelLayout;
    lbGName1: TLabel;
    GridPanelLayout28: TGridPanelLayout;
    arcG1T: TArc;
    Rectangle21: TRectangle;
    arcG1H: TArc;
    Rectangle12: TRectangle;
    GridPanelLayout29: TGridPanelLayout;
    Rectangle25: TRectangle;
    Rectangle13: TRectangle;
    TxG1T: TText;
    TxG1H: TText;
    GridPanelLayout31: TGridPanelLayout;
    arcG2T: TArc;
    Rectangle15: TRectangle;
    arcG2H: TArc;
    Rectangle16: TRectangle;
    GridPanelLayout32: TGridPanelLayout;
    Rectangle17: TRectangle;
    Rectangle18: TRectangle;
    TxG2T: TText;
    TxG2H: TText;
    lbGName2: TLabel;
    GridPanelLayout35: TGridPanelLayout;
    arcG3T: TArc;
    Rectangle20: TRectangle;
    arcG3H: TArc;
    Rectangle23: TRectangle;
    GridPanelLayout36: TGridPanelLayout;
    Rectangle24: TRectangle;
    Rectangle26: TRectangle;
    TxG3T: TText;
    TxG3H: TText;
    lbGName3: TLabel;
    GridPanelLayout38: TGridPanelLayout;
    arcG4T: TArc;
    Rectangle28: TRectangle;
    arcG4H: TArc;
    Rectangle29: TRectangle;
    GridPanelLayout39: TGridPanelLayout;
    Rectangle30: TRectangle;
    Rectangle31: TRectangle;
    TxG4T: TText;
    TxG4H: TText;
    lbGName4: TLabel;
    whiteBlue: TBrushObject;
    Rectangle32: TRectangle;
    Rectangle33: TRectangle;
    rctHChoose1: TRectangle;
    GridPanelLayout1: TGridPanelLayout;
    rctHIcon1: TRectangle;
    rctHIcon1True: TRectangle;
    lbTH1: TLabel;
    Rectangle34: TRectangle;
    Rectangle35: TRectangle;
    rctHChoose2: TRectangle;
    GridPanelLayout6: TGridPanelLayout;
    rctHIcon2: TRectangle;
    rctHIcon2True: TRectangle;
    lbTH2: TLabel;
    Rectangle36: TRectangle;
    Rectangle38: TRectangle;
    rctHChoose3: TRectangle;
    GridPanelLayout8: TGridPanelLayout;
    rctHIcon3: TRectangle;
    rctHIcon3True: TRectangle;
    lbTH3: TLabel;
    Rectangle39: TRectangle;
    Rectangle40: TRectangle;
    rctHChoose4: TRectangle;
    GridPanelLayout10: TGridPanelLayout;
    rctHIcon4: TRectangle;
    rctHIcon4True: TRectangle;
    lbTH4: TLabel;
    GridPanelLayout4: TGridPanelLayout;
    GridPanelLayout41: TGridPanelLayout;
    edtThSetting: TEdit;
    GridPanelLayout40: TGridPanelLayout;
    Rectangle41: TRectangle;
    Rectangle42: TRectangle;
    Rectangle43: TRectangle;
    rctHChoose5: TRectangle;
    GridPanelLayout42: TGridPanelLayout;
    rctHIcon5: TRectangle;
    rctHIcon5True: TRectangle;
    lbTh5: TLabel;
    btnSet: TCornerButton;
    procedure btnHomeClick(Sender: TObject);
    procedure btnGraphClick(Sender: TObject);
    procedure btnExplanationClick(Sender: TObject);
    procedure btnPowerClick(Sender: TObject);
    procedure Rectangle5Click(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure GridPanelLayout6Click(Sender: TObject);
    procedure GridPanelLayout8Click(Sender: TObject);
    procedure GridPanelLayout10Click(Sender: TObject);
    procedure GridPanelLayout1Click(Sender: TObject);
    procedure GridPanelLayout42Click(Sender: TObject);
    procedure btnSetClick(Sender: TObject);
    procedure edtThSettingKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
      const Session: Boolean; const ReasonCode: Integer;
      const ReasonName: string;
      const ConnectProperties: TsgcWSMQTTCONNACKProperties);
    procedure sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
      ReasonCode: Integer; const ReasonName: string;
      DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
    procedure FormCreate(Sender: TObject);
    procedure sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
      aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
  private
    { Private declarations }
  public
    { Public declarations }
    Temperature,Humidity : Integer;
    TH1,TH2,TH3,TH4,TH5 : string;
    TH_set : Integer;
  end;

var
  Tem_Hum_Deivce: TTem_Hum_Deivce;

implementation

{$R *.fmx}



procedure TTem_Hum_Deivce.btnExplanationClick(Sender: TObject);
begin
  rctHome.Visible := False;
  rctExplaination.Visible := True;
  rctGraph.Visible := False;
  rctChart.Visible := False;
end;

procedure TTem_Hum_Deivce.btnGraphClick(Sender: TObject);
begin
  rctHome.Visible := False;
  rctExplaination.Visible := False;
  rctGraph.Visible := True;
  rctChart.Visible := False;
end;

procedure TTem_Hum_Deivce.btnHomeClick(Sender: TObject);
begin
  rctHome.Visible := True;
  rctExplaination.Visible := False;
  rctGraph.Visible := False;
  rctChart.Visible := False;
end;

procedure TTem_Hum_Deivce.btnPowerClick(Sender: TObject);
begin
  Close;
end;

procedure TTem_Hum_Deivce.btnSetClick(Sender: TObject);
begin
  if Th_set = 1 then
  Begin
    lbTH1.Text := edtThSetting.Text;
    edtThSetting.Text := '';
    TH1 := 'TH_Deivce/'+lbTH1.Text;
    lbGName1.Text := lbTH1.Text;
    sgcWSPClient_MQTT1.Subscribe(TH1);
  End
  else if TH_set = 2 then
  Begin
    lbTH2.Text := edtThSetting.Text;
    edtThSetting.Text := '';
    TH2 := 'TH_Deivce/'+lbTH2.Text;
    lbGName2.Text := lbTH2.Text;
    sgcWSPClient_MQTT1.Subscribe(TH2);
  End
  else if TH_set = 3 then
  Begin
    lbTH3.Text := edtThSetting.Text;
    edtThSetting.Text := '';
    TH3 := 'TH_Deivce/'+lbTH3.Text;
    lbGName3.Text := lbTH3.Text;
    sgcWSPClient_MQTT1.Subscribe(TH3);
  End
  else if TH_set = 4 then
  Begin
    lbTH4.Text := edtThSetting.Text;
    edtThSetting.Text := '';
    TH4 := 'TH_Deivce/'+lbTH4.Text;
    lbGName4.Text := lbTH4.Text;
    sgcWSPClient_MQTT1.Subscribe(TH4);
  End
  else if TH_set = 5 then
  Begin
    lbTH5.Text := edtThSetting.Text;
    edtThSetting.Text := '';
    TH5 := 'TH_Deivce/'+lbTH5.Text;
    lbCName.Text := lbTh5.Text;
    sgcWSPClient_MQTT1.Subscribe(TH5);
  End
  else
  Begin
    ShowMessage('Please select a device');
  End;
end;

procedure TTem_Hum_Deivce.CornerButton1Click(Sender: TObject);
begin
  rctHome.Visible := False;
  rctExplaination.Visible := False;
  rctGraph.Visible := False;
  rctChart.Visible := True;
end;

procedure TTem_Hum_Deivce.edtThSettingKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 13 then
  begin
      if Th_set = 1 then
    Begin
      lbTH1.Text := edtThSetting.Text;
      edtThSetting.Text := '';
      TH1 := 'TH_Deivce/'+lbTH1.Text;
      lbGName1.Text := lbTH1.Text;
      sgcWSPClient_MQTT1.Subscribe(TH1+'/Tem');
      sgcWSPClient_MQTT1.Subscribe(TH1+'/Hum');
    End
    else if TH_set = 2 then
    Begin
      lbTH2.Text := edtThSetting.Text;
      edtThSetting.Text := '';
      TH2 := 'TH_Deivce/'+lbTH2.Text;
      lbGName2.Text := lbTH2.Text;
      sgcWSPClient_MQTT1.Subscribe(TH2+'/Tem');
      sgcWSPClient_MQTT1.Subscribe(TH2+'/Hum');
    End
    else if TH_set = 3 then
    Begin
      lbTH3.Text := edtThSetting.Text;
      edtThSetting.Text := '';
      TH3 := 'TH_Deivce/'+lbTH3.Text;
      lbGName3.Text := lbTH3.Text;
      sgcWSPClient_MQTT1.Subscribe(TH3+'/Tem');
      sgcWSPClient_MQTT1.Subscribe(TH3+'/Hum');
    End
    else if TH_set = 4 then
    Begin
      lbTH4.Text := edtThSetting.Text;
      edtThSetting.Text := '';
      TH4 := 'TH_Deivce/'+lbTH4.Text;
      lbGName4.Text := lbTH4.Text;
      sgcWSPClient_MQTT1.Subscribe(TH4+'/Tem');
      sgcWSPClient_MQTT1.Subscribe(TH4+'/Hum');
    End
    else if TH_set = 5 then
    Begin
      lbTH5.Text := edtThSetting.Text;
      edtThSetting.Text := '';
      TH5 := 'TH_Deivce/'+lbTH5.Text;
      lbCName.Text := lbTH5.Text;
      sgcWSPClient_MQTT1.Subscribe(TH5+'/Tem');
      sgcWSPClient_MQTT1.Subscribe(TH5+'/Hum');
    End
    else
    Begin
      ShowMessage('Please select a device');
    End;
  end;
end;

procedure TTem_Hum_Deivce.FormCreate(Sender: TObject);
begin
  sgcWebSocketClient1.URL := 'ws://broker.hivemq.com';
  sgcWebSocketClient1.Port := 1883;
  sgcWebSocketClient1.Specifications.RFC6455 := False;
  sgcWebSocketClient1.Active := True;
  TH1 := ''; TH2 := ''; TH3 := ''; TH4 := ''; TH5 := '';
end;

procedure TTem_Hum_Deivce.GridPanelLayout10Click(Sender: TObject);
begin
  rctHChoose1.Visible := True;
  rctHChoose2.Visible := True;
  rctHChoose3.Visible := True;
  rctHChoose4.Visible := False;
  rctHChoose5.Visible := True;
  TH_set := 4;
end;

procedure TTem_Hum_Deivce.GridPanelLayout1Click(Sender: TObject);
begin
  rctHChoose1.Visible := False;
  rctHChoose2.Visible := True;
  rctHChoose3.Visible := True;
  rctHChoose4.Visible := True;
  rctHChoose5.Visible := True;
  TH_set := 1;
end;

procedure TTem_Hum_Deivce.GridPanelLayout42Click(Sender: TObject);
begin
  rctHChoose1.Visible := True;
  rctHChoose2.Visible := True;
  rctHChoose3.Visible := True;
  rctHChoose4.Visible := True;
  rctHChoose5.Visible := False;
  TH_set := 5;
end;

procedure TTem_Hum_Deivce.GridPanelLayout6Click(Sender: TObject);
begin
  rctHChoose1.Visible := True;
  rctHChoose2.Visible := False;
  rctHChoose3.Visible := True;
  rctHChoose4.Visible := True;
  rctHChoose5.Visible := True;
  TH_set := 2;
end;

procedure TTem_Hum_Deivce.GridPanelLayout8Click(Sender: TObject);
begin
  rctHChoose1.Visible := True;
  rctHChoose2.Visible := True;
  rctHChoose3.Visible := False;
  rctHChoose4.Visible := True;
  rctHChoose5.Visible := True;
  TH_set := 3;
end;

procedure TTem_Hum_Deivce.Rectangle5Click(Sender: TObject);
var
URL : string;
begin
  URL := 'https://github.com/dkimdongwoo';
end;

procedure TTem_Hum_Deivce.sgcWSPClient_MQTT1MQTTConnect(
  Connection: TsgcWSConnection; const Session: Boolean;
  const ReasonCode: Integer; const ReasonName: string;
  const ConnectProperties: TsgcWSMQTTCONNACKProperties);
begin
  //#c;
end;

procedure TTem_Hum_Deivce.sgcWSPClient_MQTT1MQTTDisconnect(
  Connection: TsgcWSConnection; ReasonCode: Integer; const ReasonName: string;
  DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
begin
  //#d;
end;

procedure TTem_Hum_Deivce.sgcWSPClient_MQTT1MQTTPublish(
  Connection: TsgcWSConnection; aTopic, aText: string;
  PublishProperties: TsgcWSMQTTPublishProperties);
begin
  if TH5+'/Tem' = aTopic then
  begin
    Label12.Text := aText;
    arcCT.EndAngle := StrToInt(aText) * 3.6;
    Temperature := StrToInt(aText);
  end
  else if TH5+'/Hum' = aTopic then
  begin
    Label14.Text := aText;
    arcCH.EndAngle := StrToInt(aText) * 3.6;
    Humidity := StrToInt(aText);
  end
  else if TH1+'/Tem' = aTopic then
  begin
    TxG1T.Text := 'Temperature : '+aText;
    arcG1T.EndAngle := StrToInt(aText) * 3.6;
  end
  else if TH1+'/Hum' = aTopic then
  begin
    TxG1H.Text := 'Humidity : '+aText;
    arcG1H.EndAngle := StrToInt(aText) * 3.6;
  end
  else if TH2+'/Tem' = aTopic then
  begin
    TxG2T.Text := 'Temperature : '+aText;
    arcG2T.EndAngle := StrToInt(aText) * 3.6;
  end
  else if TH2+'/Hum' = aTopic then
  begin
    TxG2H.Text := 'Humidity : '+aText;
    arcG2H.EndAngle := StrToInt(aText) * 3.6;
  end
  else if TH3+'/Tem' = aTopic then
  begin
    TxG3T.Text := 'Temperature : '+aText;
    arcG3T.EndAngle := StrToInt(aText) * 3.6;
  end
  else if TH3+'/Hum' = aTopic then
  begin
    TxG3H.Text := 'Humidity : '+aText;
    arcG3H.EndAngle := StrToInt(aText) * 3.6;
  end
  else if TH4+'/Tem' = aTopic then
  begin
    TxG4T.Text := 'Temperature : '+aText;
    arcG4T.EndAngle := StrToInt(aText) * 3.6;
  end
  else if TH4+'/Hum' = aTopic then
  begin
    TxG4H.Text := 'Humidity : '+aText;
    arcG4H.EndAngle := StrToInt(aText) * 3.6;
  end;
end;

procedure TTem_Hum_Deivce.Timer1Timer(Sender: TObject);
var
  date : string;
  msg : string;
  x : Integer;
begin
  date := FormatDateTime('YYYY-MM-DD hh:mm',now);
  msg := Format('Time : %s',[date]);
  lbTime.Text := msg;
  Chart1.Series[0].Add(Temperature);
  Chart1.Series[1].Add(Humidity);

  x := Chart1.GetMaxValuesCount;
     if x > 20 then
     begin
       Series1.Clear;
       Series2.Clear;
     end;
end;

end.
