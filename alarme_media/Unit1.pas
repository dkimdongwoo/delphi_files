unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.WinXPickers, Vcl.ExtCtrls,
  Vcl.StdCtrls, Vcl.WinXCtrls, Vcl.MPlayer;

type
  TForm1 = class(TForm)
    edtTime: TEdit;
    Timer1: TTimer;
    TimePicker1: TTimePicker;
    Timer2: TTimer;
    ToggleSwitch1: TToggleSwitch;
    MediaPlayer1: TMediaPlayer;
    ComboBox1: TComboBox;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure ToggleSwitch1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure ComboBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure Alarme_test;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Alarme_test;
var
  I: Integer;
begin
  for I := 0 to 10 do
  begin
    Self.Color := clRed;
    Application.ProcessMessages;
    sleep(10);
    Self.Color := clYellow;
    Application.ProcessMessages;
    sleep(10);
    Self.Color := clGreen;
    Application.ProcessMessages;
    sleep(10);
  end;
  Self.Color := clWhite;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    MediaPlayer1.FileName := OpenDialog1.FileName;
    MediaPlayer1.Open;
  end;
end;

procedure TForm1.ComboBox1Click(Sender: TObject);
begin
  MediaPlayer1.Close;
  if ComboBox1.ItemIndex = 0 then
  begin
    MediaPlayer1.FileName := '..\..\resource\a.wav';
    MediaPlayer1.Open;
  end
  else if ComboBox1.ItemIndex = 1 then
  begin
    MediaPlayer1.FileName := '..\..\resource\b.mp3';
    MediaPlayer1.Open;
  end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  Timer1.Enabled := True;
  Timer2.Enabled := False;
  ComboBox1.Text := ComboBox1.Items[0];
  MediaPlayer1.FileName := '..\..\resource\a.wav';
  MediaPlayer1.Open;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
  edtTime.Text := TimeToStr(now);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
  timepick : string;
begin
  timepick := TimeToStr(TimePicker1.Time);
  if timepick = edtTime.Text then
  begin
    MediaPlayer1.Play;
    Alarme_test;
  end;

end;

procedure TForm1.ToggleSwitch1Click(Sender: TObject);
begin
  if ToggleSwitch1.State = tssOn then
  begin
    Timer2.Enabled := True;
  end
  else
  begin
    Timer2.Enabled := False;
  end;
end;

end.
