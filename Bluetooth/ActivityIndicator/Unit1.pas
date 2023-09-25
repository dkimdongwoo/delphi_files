unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ComCtrls,
  Vcl.ExtCtrls, Vcl.WinXCtrls;

type
  TForm1 = class(TForm)
    AI: TActivityIndicator;
    cbxVclStyles: TComboBox;
    grpIndicatorType: TRadioGroup;
    cbxFromColor: TColorBox;
    trkFrameDelay: TTrackBar;
    chkAnimate: TCheckBox;
    grpIndicatorSize: TRadioGroup;
    grpIndicatorColor: TRadioGroup;
    lblVclStyle: TLabel;
    lblFormColor: TLabel;
    lblFrameDelay: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbxFromColorChange(Sender: TObject);
    procedure cbxVclStylesChange(Sender: TObject);
    procedure grpIndicatorTypeClick(Sender: TObject);
    procedure grpIndicatorSizeClick(Sender: TObject);
    procedure grpIndicatorColorClick(Sender: TObject);
    procedure trkFrameDelayChange(Sender: TObject);
    procedure chkAnimateClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}
uses
Vcl.Themes;

procedure TForm1.cbxFromColorChange(Sender: TObject);
begin
Color := cbxFromColor.Selected;
end;

procedure TForm1.cbxVclStylesChange(Sender: TObject);
begin
TStyleManager.SetStyle(cbxVclStyles.Text);
lblFormColor.Enabled := StyleServices.IsSystemStyle;
cbxFromColor.Enabled := StyleServices.IsSystemStyle;
end;

procedure TForm1.chkAnimateClick(Sender: TObject);
begin
AI.Animate := chkAnimate.Checked;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
StyleName : string;
begin
  for StyleName in TStyleManager.StyleNames do
    cbxVclStyles.Items.Add(StyleName);

  cbxVclStyles.ItemIndex := cbxVclStyles.Items.IndexOf(TStyleManager.ActiveStyle.Name);
end;

procedure TForm1.grpIndicatorColorClick(Sender: TObject);
begin
AI.IndicatorColor := TActivityIndicatorColor(grpIndicatorColor.ItemIndex);
end;

procedure TForm1.grpIndicatorSizeClick(Sender: TObject);
begin
AI.IndicatorSize := TActivityIndicatorSize(grpIndicatorSize.ItemIndex);
end;

procedure TForm1.grpIndicatorTypeClick(Sender: TObject);
begin
AI.IndicatorType := TActivityIndicatorType(grpIndicatorType.ItemIndex);
end;


procedure TForm1.trkFrameDelayChange(Sender: TObject);
begin
AI.FrameDelay := trkFrameDelay.Position*10;
lblFrameDelay.Caption := 'Frame Delay (' + IntToStr(AI.FrameDelay) + ')';
end;

end.
