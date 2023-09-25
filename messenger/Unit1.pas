unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, FMX.Objects, System.ImageList,
  FMX.ImgList, FMX.Memo.Types, FMX.ScrollBox, FMX.Memo, sgcWebSocket_Classes,
  sgcWebSocket_Protocol_Base_Client, sgcWebSocket_Protocol_MQTT_Client, sgcWebSocket_Protocol_MQTT_Message,
  sgcWebSocket_Protocols, sgcBase_Classes, sgcSocket_Classes, sgcTCP_Classes,
  sgcWebSocket_Classes_Indy, sgcWebSocket_Client, sgcWebSocket,EncdDecd;

type
  TFmessnger = class(TForm)
    RctBackgraound: TRectangle;
    EdtRoom: TEdit;
    EdtName: TEdit;
    RctBar: TRectangle;
    blue: TBrushObject;
    green: TBrushObject;
    CbtnMenu1: TCornerButton;
    CbtnMenu2: TCornerButton;
    CbtnMenu3: TCornerButton;
    ImageList1: TImageList;
    StyleBook1: TStyleBook;
    RctPeople: TRectangle;
    LbRoom: TLabel;
    LbName: TLabel;
    RctChat: TRectangle;
    MeChat: TMemo;
    EdtMessage: TEdit;
    CbtnSend: TCornerButton;
    sgcWebSocketClient1: TsgcWebSocketClient;
    sgcWSPClient_MQTT1: TsgcWSPClient_MQTT;
    CbtnConnect: TCornerButton;
    LbConnecting: TLabel;
    EdtPassword: TEdit;
    LbPassword: TLabel;
    RctPassword: TRectangle;
    RctBan: TRectangle;
    LbBan: TLabel;
    CbtnBan: TCornerButton;
    RctBanBackground: TRectangle;
    Timer1: TTimer;
    RctFastClick: TRectangle;
    procedure CbtnMenu1Click(Sender: TObject);
    procedure CbtnMenu3Click(Sender: TObject);
    procedure CbtnMenu2Click(Sender: TObject);
    procedure CbtnConnectClick(Sender: TObject);
    procedure sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
      const Session: Boolean; const ReasonCode: Integer;
      const ReasonName: string;
      const ConnectProperties: TsgcWSMQTTCONNACKProperties);
    procedure sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
      ReasonCode: Integer; const ReasonName: string;
      DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
    procedure FormCreate(Sender: TObject);
    procedure EdtPasswordKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure EdtMessageKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
      aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure CbtnBanClick(Sender: TObject);
    procedure CbtnSendClick(Sender: TObject);
    procedure EdtNameTyping(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    count : Integer;
    ban : Boolean;
    pass : Boolean;
    click : Boolean;
  end;

var
  Fmessnger: TFmessnger;

implementation

{$R *.fmx}

procedure TFmessnger.CbtnBanClick(Sender: TObject);
begin
  Close;
end;

procedure TFmessnger.CbtnConnectClick(Sender: TObject);
var
  w : string;
  s : string;
  i : string;
begin
  if CbtnConnect.Text = '연결' then
  begin
    if (EdtRoom.Text = '') or (EdtName.Text = '') then
    begin
      ShowMessage('방이름 또는 이름을 입력해주세요.');
    end
    else
    begin
      sgcWebSocketClient1.Active := True;
      EdtName.ReadOnly := True;
      EdtRoom.ReadOnly := True;
      CbtnConnect.Text := '해제';
      w := 'ktlz/' + EdtRoom.Text;
      i := EdtName.Text + '님이 들어왔습니다';
      sgcWSPClient_MQTT1.Subscribe(w);
      sgcWSPClient_MQTT1.Publish(w ,i);
    end;
  end
  else if CbtnConnect.Text = '해제' then
  begin
    w := 'ktlz/' + EdtRoom.Text;
    s := EdtName.Text + '님이 접속을 종료하였습니다';
    sgcWSPClient_MQTT1.Publish(w,s);
    sgcWebSocketClient1.Active := False;
    CbtnConnect.Text := '연결';
    EdtRoom.Text := '';
    EdtName.Text := '';
    MeChat.Lines.Clear;
    EdtRoom.ReadOnly := False;
    EdtName.ReadOnly := False;
  end;
end;

procedure TFmessnger.CbtnMenu1Click(Sender: TObject);
begin
  if pass = False then
  begin
    RctPeople.Visible := True;
    RctChat.Visible  := False;
  end;
end;

procedure TFmessnger.CbtnMenu2Click(Sender: TObject);
begin
  if pass = False then
  begin
    RctPeople.Visible := False;
    RctChat.Visible := True;
  end;
end;

procedure TFmessnger.CbtnMenu3Click(Sender: TObject);
begin
  if pass = True then
  begin
    EdtRoom.Text := '';
    EdtName.Text := '';
  end;
  Close;
end;

procedure TFmessnger.CbtnSendClick(Sender: TObject);
var
  w : string;
  i : string;
  s : string;
begin
  if click = False then
  begin
    count := count + 1;
    if sgcWebSocketClient1.Active = False then
    begin
      ShowMessage('서버에 연결해주세요.');
    end
    else if EdtMessage.Text = ''then
    begin
        EdtMessage.Text := '';
    end
    else if (Copy(EdtMessage.Text,0,4) = '/ban') and (EdtName.Text = '김동우') then
    begin
      w := 'ktlz/' + EdtRoom.Text;
      i := '@'+Copy(EdtMessage.Text,6,EdtMessage.Text.Length-5);
      s := Copy(EdtMessage.Text,6,EdtMessage.Text.Length-5);
      if (s = '김동우') or (s = '이재황') then
      begin
        ShowMessage('강퇴할 수 없는 사용자입니다.');
        EdtMessage.Text := '';
      end
      else
      begin
        sgcWSPClient_MQTT1.Publish(w ,i);
        EdtMessage.Text := '';
      end;
    end
    else if (Copy(EdtMessage.Text,0,4) = '/ban') and (EdtName.Text = '이재황') then
    begin
      w := 'ktlz/' + EdtRoom.Text;
      i := '@'+Copy(EdtMessage.Text,6,EdtMessage.Text.Length-5);
      s := Copy(EdtMessage.Text,6,EdtMessage.Text.Length-5);
      if (s = '김동우') or (s = '이재황') then
      begin
        ShowMessage('강퇴할 수 없는 사용자입니다.');
        EdtMessage.Text := '';
      end
      else
      begin
        sgcWSPClient_MQTT1.Publish(w ,i);
        EdtMessage.Text := '';
      end;
    end
    else
    begin
      w := 'ktlz/' + EdtRoom.Text;
      i := EdtName.Text + ' : ' + EdtMessage.Text;
      sgcWSPClient_MQTT1.Publish(w ,i);
      EdtMessage.Text := '';
    end;
  end;
end;

procedure TFmessnger.EdtMessageKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
var
  w : string;
  i : string;
  s : string;
begin
  if click = False then
  begin
    if Key = 13 then
    begin
      count := count + 1;
      if sgcWebSocketClient1.Active = False then
      begin
        ShowMessage('서버에 연결해주세요.');
      end
      else if EdtMessage.Text = ''then
      begin
        EdtMessage.Text := '';
      end
      else if (Copy(EdtMessage.Text,0,4) = '/ban') and (EdtName.Text = '김동우') then
      begin
        w := 'ktlz/' + EdtRoom.Text;
        i := '@'+Copy(EdtMessage.Text,6,EdtMessage.Text.Length-5);
        s := Copy(EdtMessage.Text,6,EdtMessage.Text.Length-5);
        if (s = '김동우') or (s = '이재황') then
        begin
          ShowMessage('강퇴할 수 없는 사용자입니다.');
          EdtMessage.Text := '';
        end
        else
        begin
          sgcWSPClient_MQTT1.Publish(w ,i);
          EdtMessage.Text := '';
        end;
      end
      else if (Copy(EdtMessage.Text,0,3) = '/ban') and (EdtName.Text = '이재황') then
      begin
        w := 'ktlz/' + EdtRoom.Text;
        i := '@'+Copy(EdtMessage.Text,6,EdtMessage.Text.Length-5);
        s := Copy(EdtMessage.Text,6,EdtMessage.Text.Length-5);
        if (s = '김동우') or (s = '이재황') then
        begin
          ShowMessage('강퇴할 수 없는 사용자입니다.');
          EdtMessage.Text := '';
        end
        else
        begin
          sgcWSPClient_MQTT1.Publish(w ,i);
          EdtMessage.Text := '';
        end;
      end
      else
      begin
        w := 'ktlz/' + EdtRoom.Text;
        i := EdtName.Text + ' : ' + EdtMessage.Text;
        sgcWSPClient_MQTT1.Publish(w ,i);
        EdtMessage.Text := '';
      end;
    end;
  end;
end;

procedure TFmessnger.EdtNameTyping(Sender: TObject);
const
  falseword : array[0..6]of string=('씨발','병신','엄마','딸','아들','여친','아빠');
var
  I : Integer;
begin
  if (EdtName.Text = '김동우') or (EdtName.Text = '이재황') then
  begin
    pass := True;
    LbPassword.Text := EdtName.Text;
    RctPassword.Visible := True;
  end;
  for I := 0 to 6 do
  begin
    if (Pos(EdtName.Text,falseword[I]) > 0) then
    begin
      EdtName.Text := '';
      ShowMessage('사용할 수 없는 이름 입니다');
      Break;
    end;
  end;
end;

procedure TFmessnger.EdtPasswordKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 13 then
  begin
    if EdtPassword.Text = 'messenger0725' then
    begin
      RctPassword.Visible := False;
      EdtPassword.Text := '';
      pass := False;
    end
    else
    begin
      EdtName.Text := '';
      RctPassword.Visible := False;
      ShowMessage('비밀번호가 틀렸습니다.'+ #13#10 +'!너이새끼 관리자 아니지!');
      EdtPassword.Text := '';
      pass := False;
    end;
  end;
end;

procedure TFmessnger.FormClose(Sender: TObject; var Action: TCloseAction);
var
  w : string;
  s : string;
begin
  if EdtName.Text = '' then
  begin
    EdtName.Text := '';
  end
  else
  begin
    if ban = False then
    begin
      w := 'ktlz/' + EdtRoom.Text;
      s := EdtName.Text + '님이 접속을 종료하였습니다';
      sgcWSPClient_MQTT1.Publish(w,s);
    end;
  end;
end;

procedure TFmessnger.FormCreate(Sender: TObject);
begin
  sgcWebSocketClient1.URL := 'ws://broker.hivemq.com';
  sgcWebSocketClient1.Port := 1883;
  sgcWebSocketClient1.Specifications.RFC6455 := False;
  ban := False;
  pass := False;
  count := 0;
end;

procedure TFmessnger.sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
  const Session: Boolean; const ReasonCode: Integer; const ReasonName: string;
  const ConnectProperties: TsgcWSMQTTCONNACKProperties);
begin
  LbConnecting.Text := '서버에 연결됨';
end;

procedure TFmessnger.sgcWSPClient_MQTT1MQTTDisconnect(
  Connection: TsgcWSConnection; ReasonCode: Integer; const ReasonName: string;
  DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
begin
  LbConnecting.Text := '서버에 연결안됨';
end;

procedure TFmessnger.sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
  aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
var
  w : string;
begin
  w := 'ktlz/' + EdtRoom.Text;
  if (Pos(w, aTopic) > 0) then
  begin
    if (Copy(aText,0,1) = '@') then
    begin
      if EdtName.Text = Copy(aText,2,aText.Length) then
      begin
        ban := True;
        RctBan.Visible := True;
      end;
    end
    else
    begin
      MeChat.Lines.Add(aText);
    end;
  end;
  MeChat.ScrollBy(0, MeChat.Lines.Count);

end;

procedure TFmessnger.Timer1Timer(Sender: TObject);
  var
  w : string;
  s : string;
begin
  if count >= 2 then
  begin
    count := 0;
    click := True;
    EdtMessage.Visible := False;
    click := False;
    EdtMessage.Visible := True;
  end;
  count := 0;
  if ban = True then
  begin
    w := 'ktlz/' + EdtRoom.Text;
    s := EdtName.Text + '님이 강퇴되었습니다';
    sgcWSPClient_MQTT1.Publish(w,s);
    Timer1.Enabled := False;
  end;
end;

end.
