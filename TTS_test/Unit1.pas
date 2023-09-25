unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.ScrollBox, FMX.Memo, FMX.Controls.Presentation, FMX.StdCtrls, FMX.Layouts,Grijjy.TextToSpeech,
  Grijjy.TextToSpeech.Android,Grijjy.TextToSpeech.Base;

type
  TForm1 = class(TForm)
    GridPanelLayout2: TGridPanelLayout;
    ButtonSpeak: TButton;
    ButtonStop: TButton;
    MemoLog: TMemo;
    Memo: TMemo;
    procedure ButtonSpeakClick(Sender: TObject);
    procedure ButtonStopClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FTextToSpeech: IgoTextToSpeech;
    procedure Log(const AMsg: String);
    procedure TextToSpeechAvailable(Sender: TObject);
    procedure TextToSpeechStarted(Sender: TObject);
    procedure TextToSpeechFinished(Sender: TObject);
    procedure UpdateControls;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.ButtonSpeakClick(Sender: TObject);
var
  date : string;
  msg : string;
begin
  date := FormatDateTime('YYYY-MM-DD hh:mm:ss',now);
  msg := Format('현재시간은 %s입니다',[date]);
  if Memo.Text = '현재시간'then
  begin
    if (not FTextToSpeech.Speak(msg)) then
    Log('Unable to speak text');
  end
  else
  begin
  if (not FTextToSpeech.Speak(Memo.Text)) then
    Log('Unable to speak text');
  end;
end;

procedure TForm1.ButtonStopClick(Sender: TObject);
begin
  FTextToSpeech.Stop;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  FTextToSpeech := TgoTextToSpeech.Create;
  FTextToSpeech.OnAvailable := TextToSpeechAvailable;
  FTextToSpeech.OnSpeechStarted := TextToSpeechStarted;
  FTextToSpeech.OnSpeechFinished := TextToSpeechFinished;
end;

procedure TForm1.Log(const AMsg: String);
begin
  MemoLog.Lines.Add(AMsg);
end;

procedure TForm1.TextToSpeechAvailable(Sender: TObject);
begin
  Log('Text-to-Speech engine is available');
  UpdateControls;
end;

procedure TForm1.TextToSpeechFinished(Sender: TObject);
begin
  Log('Speech finished');
  UpdateControls;
end;

procedure TForm1.TextToSpeechStarted(Sender: TObject);
begin
  Log('Speech started');
  UpdateControls;
end;

procedure TForm1.UpdateControls;
begin
  ButtonSpeak.Enabled := (not FTextToSpeech.IsSpeaking);
  ButtonStop.Enabled := (not ButtonSpeak.Enabled);
end;
end.
