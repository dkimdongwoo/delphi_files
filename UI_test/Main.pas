unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  System.ImageList, FMX.ImgList, FMX.Controls.Presentation, FMX.StdCtrls,
  FMX.Layouts, FMX.Ani, FMX.Edit;

type
  TfrmMain = class(TForm)
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    Rectangle4: TRectangle;
    bluepit: TBrushObject;
    orange: TBrushObject;
    gird: TBrushObject;
    page1: TBrushObject;
    page2: TBrushObject;
    ImageList1: TImageList;
    CornerButton1: TCornerButton;
    CornerButton2: TCornerButton;
    CornerButton3: TCornerButton;
    CornerButton4: TCornerButton;
    CornerButton5: TCornerButton;
    StyleBook1: TStyleBook;
    Text1: TText;
    Text2: TText;
    Text3: TText;
    Text4: TText;
    Rectangle5: TRectangle;
    whitegreen: TBrushObject;
    Rectangle6: TRectangle;
    GridPanelLayout1: TGridPanelLayout;
    Text5: TText;
    Text6: TText;
    Rectangle7: TRectangle;
    Rectangle9: TRectangle;
    blue: TBrushObject;
    Text7: TText;
    GridPanelLayout2: TGridPanelLayout;
    Arc2: TArc;
    FloatAnimation2: TFloatAnimation;
    Arc3: TArc;
    FloatAnimation3: TFloatAnimation;
    Text8: TText;
    Text9: TText;
    Text10: TText;
    GridPanelLayout3: TGridPanelLayout;
    Text11: TText;
    Arc1: TArc;
    FloatAnimation1: TFloatAnimation;
    Text14: TText;
    Text15: TText;
    Text16: TText;
    Text17: TText;
    Text18: TText;
    Text19: TText;
    Text20: TText;
    Text23: TText;
    Timer1: TTimer;
    Rectangle8: TRectangle;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Circle1: TCircle;
    Rectangle12: TRectangle;
    GridPanelLayout4: TGridPanelLayout;
    Text12: TText;
    Rectangle13: TRectangle;
    Text13: TText;
    Rectangle14: TRectangle;
    GridPanelLayout5: TGridPanelLayout;
    Rectangle15: TRectangle;
    Edit1: TEdit;
    Edit6: TEdit;
    Edit9: TEdit;
    Rectangle19: TRectangle;
    Edit12: TEdit;
    Edit2: TEdit;
    Rectangle16: TRectangle;
    Rectangle17: TRectangle;
    Rectangle20: TRectangle;
    CornerButton6: TCornerButton;
    CornerButton7: TCornerButton;
    CornerButton9: TCornerButton;
    CornerButton11: TCornerButton;
    CornerButton13: TCornerButton;
    GridPanelLayout6: TGridPanelLayout;
    Text21: TText;
    Rectangle18: TRectangle;
    Text22: TText;
    GridPanelLayout7: TGridPanelLayout;
    Arc4: TArc;
    Rectangle21: TRectangle;
    Arc5: TArc;
    Rectangle22: TRectangle;
    Arc6: TArc;
    Rectangle23: TRectangle;
    Rectangle24: TRectangle;
    GridPanelLayout8: TGridPanelLayout;
    Rectangle25: TRectangle;
    Rectangle26: TRectangle;
    Rectangle27: TRectangle;
    Text24: TText;
    Text25: TText;
    Text26: TText;
    Rectangle28: TRectangle;
    Text27: TText;
    GridPanelLayout9: TGridPanelLayout;
    Arc7: TArc;
    Rectangle29: TRectangle;
    Arc8: TArc;
    Rectangle30: TRectangle;
    Arc9: TArc;
    Rectangle31: TRectangle;
    Rectangle32: TRectangle;
    GridPanelLayout10: TGridPanelLayout;
    Rectangle33: TRectangle;
    Rectangle34: TRectangle;
    Rectangle35: TRectangle;
    Text28: TText;
    Text29: TText;
    Text30: TText;
    Rectangle36: TRectangle;
    Text31: TText;
    GridPanelLayout11: TGridPanelLayout;
    Arc10: TArc;
    Rectangle37: TRectangle;
    Arc11: TArc;
    Rectangle38: TRectangle;
    Arc12: TArc;
    Rectangle39: TRectangle;
    Rectangle40: TRectangle;
    GridPanelLayout12: TGridPanelLayout;
    Rectangle41: TRectangle;
    Rectangle42: TRectangle;
    Rectangle43: TRectangle;
    Text32: TText;
    Text33: TText;
    Text34: TText;
    Rectangle44: TRectangle;
    Text35: TText;
    GridPanelLayout13: TGridPanelLayout;
    Arc13: TArc;
    Rectangle45: TRectangle;
    Arc14: TArc;
    Rectangle46: TRectangle;
    Arc15: TArc;
    Rectangle47: TRectangle;
    Rectangle48: TRectangle;
    GridPanelLayout14: TGridPanelLayout;
    Rectangle49: TRectangle;
    Rectangle50: TRectangle;
    Rectangle51: TRectangle;
    Text36: TText;
    Text37: TText;
    Text38: TText;
    procedure CornerButton5Click(Sender: TObject);
    procedure CornerButton4Click(Sender: TObject);
    procedure CornerButton3Click(Sender: TObject);
    procedure CornerButton1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CornerButton2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.fmx}
procedure TfrmMain.CornerButton1Click(Sender: TObject);
begin
  frmMain.Close;
end;

procedure TfrmMain.CornerButton2Click(Sender: TObject);
begin
  Rectangle5.Visible := False;
  Rectangle4.Visible := False;
  Rectangle6.Visible := False;
  Rectangle12.Visible := True;
end;

procedure TfrmMain.CornerButton3Click(Sender: TObject);
begin
  Rectangle5.Visible := False;
  Rectangle4.Visible := True;
  Rectangle6.Visible := False;
  Rectangle12.Visible := False;
end;

procedure TfrmMain.CornerButton4Click(Sender: TObject);
begin
  Rectangle5.Visible := False;
  Rectangle4.Visible := False;
  Rectangle6.Visible := True;
  Rectangle12.Visible := False;
end;

procedure TfrmMain.CornerButton5Click(Sender: TObject);
begin
  Rectangle5.Visible := True;
  Rectangle4.Visible := False;
  Rectangle6.Visible := False;
  Rectangle12.Visible := False;
end;

procedure TfrmMain.Timer1Timer(Sender: TObject);
var
  date : string;
  msg : string;
begin
  date := FormatDateTime('YYYY-MM-DD hh:mm',now);
  msg := Format('Time : %s',[date]);
  Text23.Text := msg;
end;

end.
