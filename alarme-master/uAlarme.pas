unit uAlarme;
interface
uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.MPlayer, Vcl.ExtCtrls, Vcl.StdCtrls, IniFiles,
  Vcl.WinXPickers;
type
  TfrmAlarme = class(TForm)
    Timer1: TTimer;
    MediaPlayer1: TMediaPlayer;
    edRelegio: TEdit;
    edBatida01: TEdit;
    edBatida02: TEdit;
    edBatida03: TEdit;
    edBatida04: TEdit;
    edBatida05: TEdit;
    edBatida06: TEdit;
    cbSom: TComboBox;
    edBatida07: TEdit;
    edBatida08: TEdit;
    edBatida09: TEdit;
    edBatida10: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    TimePicker1: TTimePicker;
    Timer2: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure cbSomClick(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    procedure TocarAlarme;
    { Private declarations }
    var PreBatida: TTime;
  public
    { Public declarations }
  end;
var
  frmAlarme: TfrmAlarme;
implementation
{$R *.dfm}
procedure TfrmAlarme.Button1Click(Sender: TObject);
begin
  Timer2.Enabled := True;
end;

procedure TfrmAlarme.cbSomClick(Sender: TObject);
begin
  MediaPlayer1.Close;
  MediaPlayer1.FileName := cbSom.Text;
  MediaPlayer1.Open;
end;
procedure TfrmAlarme.FormCreate(Sender: TObject);
var ArquivoIni : TIniFile;
    Arq : String;
begin
  Timer2.Enabled := True;
  Arq := ExtractFilePath(Application.ExeName) + 'alarme.ini';
  ArquivoIni := TIniFile.Create(Arq);
  if not FileExists(Arq) then
    begin
      ShowMessage('Arquivo de configuração n? encontrado! ' + ArquivoIni.FileName);
      Application.Terminate;
    end;
  edBatida01.Text := ArquivoIni.ReadString('BATIDAS', 'batida01', '00:00:00');
  edBatida02.Text := ArquivoIni.ReadString('BATIDAS', 'batida02', '00:00:00');
  edBatida03.Text := ArquivoIni.ReadString('BATIDAS', 'batida03', '00:00:00');
  edBatida04.Text := ArquivoIni.ReadString('BATIDAS', 'batida04', '00:00:00');
  edBatida05.Text := ArquivoIni.ReadString('BATIDAS', 'batida05', '00:00:00');
  edBatida06.Text := ArquivoIni.ReadString('BATIDAS', 'batida06', '00:00:00');
  edBatida07.Text := ArquivoIni.ReadString('BATIDAS', 'batida07', '00:00:00');
  edBatida08.Text := ArquivoIni.ReadString('BATIDAS', 'batida08', '00:00:00');
  edBatida09.Text := ArquivoIni.ReadString('BATIDAS', 'batida09', '00:00:00');
  edBatida10.Text := ArquivoIni.ReadString('BATIDAS', 'batida10', '00:00:00');
  arquivoIni.Free;
  MediaPlayer1.FileName := cbSom.Text; // 'navio.wav';
  MediaPlayer1.Open;
end;
procedure TfrmAlarme.TocarAlarme;
var
  I: Integer;
begin
  MediaPlayer1.Play;
  for I := 0 to 3 do
    begin
      self.Color := clRed;
      Application.ProcessMessages;
      Sleep(100);
      self.Color := clYellow;
      Application.ProcessMessages;
      Sleep(100);
      self.Color := clGreen;
      Application.ProcessMessages;
      Sleep(100);
      self.Color := clBtnFace;
      Application.ProcessMessages;
      Sleep(100);
    end;
end;
procedure TfrmAlarme.Timer1Timer(Sender: TObject);
begin
  edRelegio.Text := TimeToStr(now);
//  if (TimeToStr(now) = edBatida01.Text) then TocarAlarme;
//  if (TimeToStr(now) = edBatida02.Text) then TocarAlarme;
//  if (TimeToStr(now) = edBatida03.Text) then TocarAlarme;
//  if (TimeToStr(now) = edBatida04.Text) then TocarAlarme;
//  if (TimeToStr(now) = edBatida05.Text) then TocarAlarme;
//  if (TimeToStr(now) = edBatida06.Text) then TocarAlarme;
//  if (TimeToStr(now) = edBatida07.Text) then TocarAlarme;
//  if (TimeToStr(now) = edBatida08.Text) then TocarAlarme;
//  if (TimeToStr(now) = edBatida09.Text) then TocarAlarme;
//  if (TimeToStr(now) = edBatida10.Text) then TocarAlarme;
end;
procedure TfrmAlarme.Timer2Timer(Sender: TObject);
var
  timestart : string;
begin
  timestart := TimeToStr(TimePicker1.Time);

  if(TimeToStr(now) = timestart) then TocarAlarme;
end;

end.
