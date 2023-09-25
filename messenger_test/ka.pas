unit ka;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.ScrollBox,
  FMX.Memo, FMX.Edit, FMX.Controls.Presentation, FMX.StdCtrls,
  sgcWebSocket_Classes, sgcWebSocket_Protocol_Base_Client, sgcWebSocket_Protocol_MQTT_message,
  sgcWebSocket_Protocol_MQTT_Client, sgcWebSocket_Protocols, sgcBase_Classes,
  sgcSocket_Classes, sgcTCP_Classes, sgcWebSocket_Classes_Indy,
  sgcWebSocket_Client, sgcWebSocket, FMX.Memo.Types;

type
  TMessenger = class(TForm)
    sgcWebSocketClient1: TsgcWebSocketClient;
    sgcWSPClient_MQTT1: TsgcWSPClient_MQTT;
    connectBtn: TButton;
    roomEdt: TEdit;
    dconnectBtn: TButton;
    chatMemo: TMemo;
    messageEdt: TEdit;
    sendBtn: TButton;
    nameEdt: TEdit;
    passwordPnl: TPanel;
    passwordInputEdt: TEdit;
    usernameLb: TLabel;
    banePnl: TPanel;
    banLb: TLabel;
    exitBtn: TButton;
    Timer1: TTimer;
    Panel1: TPanel;
    procedure connectBtnClick(Sender: TObject);
    procedure dconnectBtnClick(Sender: TObject);
    procedure sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
      const Session: Boolean; const ReasonCode: Integer;
      const ReasonName: string;
      const ConnectProperties: TsgcWSMQTTCONNACKProperties);
    procedure sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
      ReasonCode: Integer; const ReasonName: string;
      DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
    procedure sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
      aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
    procedure sendBtnClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure messageEdtKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure nameEdtChange(Sender: TObject);
    procedure passwordInputEdtKeyDown(Sender: TObject; var Key: Word;
      var KeyChar: Char; Shift: TShiftState);
    procedure exitBtnClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ban : Boolean;
    count : Integer;
  end;

var
  Messenger: TMessenger;

implementation

{$R *.fmx}

procedure TMessenger.connectBtnClick(Sender: TObject);
var
  w : string;
begin
  sgcWebSocketClient1.URL := 'ws://broker.hivemq.com';
  sgcWebSocketClient1.Port := 1883;
  sgcWebSocketClient1.Specifications.RFC6455 := False;
  sgcWebSocketClient1.Active := True;
  if (roomEdt.Text = '') or (roomEdt.Text = '(���̸�)') then
  begin
    roomEdt.Text := '(���̸�)';
  end
  else
  begin
    w := 'ktlz/' + roomEdt.Text;
    sgcWSPClient_MQTT1.Subscribe(w);
  end;
end;

procedure TMessenger.dconnectBtnClick(Sender: TObject);
var
  w : string;
  z : string;
begin
  if (nameEdt.Text = '(�̸�)') and (roomEdt.Text = '(���̸�)') then
  begin
    nameEdt.Text := '(�̸�)';
  end
  else
  begin
    w := 'ktlz/' + roomEdt.Text;
    z := nameEdt.Text + '���� ������ ������ �����ϴ�';
    sgcWSPClient_MQTT1.Publish(w,z);
    sgcWebSocketClient1.Active := False;
  end;
end;

procedure TMessenger.exitBtnClick(Sender: TObject);
begin
  Close;
end;

procedure TMessenger.sendBtnClick(Sender: TObject);
var
  w : string;
  i : string;
  s : string;
begin
  count := count + 1;
  if roomEdt.Text = '(���̸�)' then
  begin
    ShowMessage('���̸��� �Է����ּ���');
  end
  else if nameEdt.Text = '(�̸�)' then
  begin
    ShowMessage('�̸��� �Է����ּ���');
  end
  else if messageEdt.Text = ''then
  begin
    messageEdt.Text := '';
  end
  else if (Copy(messageEdt.Text,0,4) = '/ban') and (nameEdt.Text = '�赿��') or (nameEdt.Text = '����Ȳ') then
    begin
      w := 'ktlz/' + roomEdt.Text;
      i := '@'+Copy(messageEdt.Text,6,messageEdt.Text.Length-5);
      s := Copy(messageEdt.Text,6,messageEdt.Text.Length-5);
      if (s = '�赿��') or (s = '����Ȳ') then
      begin
        ShowMessage('������ �� ���� ������Դϴ�.');
        messageEdt.Text := '';
      end
      else
      begin
        sgcWSPClient_MQTT1.Publish(w ,i);
        messageEdt.Text := '';
      end;
  end
  else
  begin
    w := 'ktlz/' + roomEdt.Text;
    i := nameEdt.Text + ' : ' + messageEdt.Text;
    sgcWSPClient_MQTT1.Publish(w ,i);
    messageEdt.Text := '';
  end;
end;

procedure TMessenger.messageEdtKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
var
  w : string;
  i : string;
  s : string;
begin
  if Key = 13 then
  begin
    count := count + 1;
    if roomEdt.Text = '(���̸�)' then
    begin
      ShowMessage('���̸��� �Է����ּ���');
    end
    else if nameEdt.Text = '(�̸�)' then
    begin
      ShowMessage('�̸��� �Է����ּ���');
    end
    else if messageEdt.Text = ''then
    begin
      messageEdt.Text := '';
    end
    else if (Copy(messageEdt.Text,0,4) = '/ban') and (nameEdt.Text = '�赿��') then
    begin
      w := 'ktlz/' + roomEdt.Text;
      i := '@'+Copy(messageEdt.Text,6,messageEdt.Text.Length-5);
      s := Copy(messageEdt.Text,6,messageEdt.Text.Length-5);
      if (s = '�赿��') or (s = '����Ȳ') then
      begin
        ShowMessage('������ �� ���� ������Դϴ�.');
        messageEdt.Text := '';
      end
      else
      begin
        sgcWSPClient_MQTT1.Publish(w ,i);
        messageEdt.Text := '';
      end;
    end
    else if (Copy(messageEdt.Text,0,4) = '/ban') and (nameEdt.Text = '����Ȳ') then
    begin
      w := 'ktlz/' + roomEdt.Text;
      i := '@'+Copy(messageEdt.Text,6,messageEdt.Text.Length-5);
      s := Copy(messageEdt.Text,6,messageEdt.Text.Length-5);
      if (s = '�赿��') or (s = '����Ȳ') then
      begin
        ShowMessage('������ �� ���� ������Դϴ�.');
        messageEdt.Text := '';
      end
      else
      begin
        sgcWSPClient_MQTT1.Publish(w ,i);
        messageEdt.Text := '';
      end;
    end
    else
    begin
      w := 'ktlz/' + roomEdt.Text;
      i := nameEdt.Text + ' : ' + messageEdt.Text;
      sgcWSPClient_MQTT1.Publish(w ,i);
      messageEdt.Text := '';
    end;
  end;
end;

procedure TMessenger.nameEdtChange(Sender: TObject);
const
  falseword : array[0..6]of string=('����','����','����','��','�Ƶ�','��ģ','�ƺ�');
var
  I : Integer;
begin
  if (nameEdt.Text = '�赿��') or (nameEdt.Text = '����Ȳ') then
  begin
    usernameLb.Text := nameEdt.Text;
    passwordPnl.Visible := True;
  end;
  for I := 0 to 6 do
  begin
    if (pos(nameEdt.Text,falseword[I]) > 0) then
    begin
      nameEdt.Text := '(�̸�)';
      ShowMessage('����� �� ���� �̸� �Դϴ�');
      Break;
    end;
  end;



end;

procedure TMessenger.passwordInputEdtKeyDown(Sender: TObject; var Key: Word;
  var KeyChar: Char; Shift: TShiftState);
begin
  if Key = 13 then
  begin
    if passwordInputEdt.Text = 'messenger0725' then
    begin
      passwordPnl.Visible := False;
      passwordInputEdt.Text := '';
    end
    else
    begin
      nameEdt.Text := '(�̸�)';
      passwordPnl.Visible := False;
      ShowMessage('��й�ȣ�� Ʋ�Ƚ��ϴ�.'+ #13#10 +'!���̻��� ������ �ƴ���!');
      passwordInputEdt.Text := '';
    end;
  end;
end;

procedure TMessenger.FormClose(Sender: TObject; var Action: TCloseAction);
var
  w : string;
  s : string;
begin
  if nameEdt.Text = '(�̸�)' then
  begin
    nameEdt.Text := '(�̸�)';
  end
  else
  begin
    if ban = True then
    begin
      w := 'ktlz/' + roomEdt.Text;
      s := nameEdt.Text + '���� ����Ǿ����ϴ�';
    end
    else
    begin
      w := 'ktlz/' + roomEdt.Text;
      s := nameEdt.Text + '���� ������ �����Ͽ����ϴ�';
      sgcWSPClient_MQTT1.Publish(w,s);
    end;
  end;
end;

procedure TMessenger.sgcWSPClient_MQTT1MQTTConnect(Connection: TsgcWSConnection;
  const Session: Boolean; const ReasonCode: Integer; const ReasonName: string;
  const ConnectProperties: TsgcWSMQTTCONNACKProperties);
begin
  chatMemo.Lines.Add('#������ ����');
end;

procedure TMessenger.sgcWSPClient_MQTT1MQTTDisconnect(Connection: TsgcWSConnection;
  ReasonCode: Integer; const ReasonName: string;
  DisconnectProperties: TsgcWSMQTTDISCONNECTProperties);
begin
  chatMemo.Lines.Add('#������ ������ ����');
end;

procedure TMessenger.sgcWSPClient_MQTT1MQTTPublish(Connection: TsgcWSConnection;
  aTopic, aText: string; PublishProperties: TsgcWSMQTTPublishProperties);
var
  w : string;
begin
  w := 'ktlz/' + roomEdt.Text;
  if (Pos(w, aTopic) > 0) then
  begin
    if (Copy(aText,0,1) = '@') then
    begin
      if nameEdt.Text = Copy(aText,2,aText.Length) then
      begin
        ban := True;
        banePnl.Visible := True;
      end;
    end
    else
    begin
      chatMemo.Lines.Add(aText);
    end;
  end;
  chatMemo.ScrollBy(0, chatMemo.Lines.Count);
end;

procedure TMessenger.Timer1Timer(Sender: TObject);
var
  w : string;
  s : string;
begin
  if count >= 2 then
  begin
    count := 0;
    Panel1.Visible := True;
    TThread.Sleep(1000);
    Panel1.Visible := False;
  end;
  count := 0;
  if ban = True then
  begin
    w := 'ktlz/' + roomEdt.Text;
    s := nameEdt.Text + '���� ����Ǿ����ϴ�';
    sgcWSPClient_MQTT1.Publish(w,s);
    Timer1.Enabled := False;
  end;
end;

end.
