unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList,
  Vcl.StdCtrls, System.ImageList, Vcl.ImgList, Vcl.ExtCtrls,
  Vcl.CategoryButtons, Vcl.WinXCtrls;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    SplitView1: TSplitView;
    Panel2: TPanel;
    CategoryButtons1: TCategoryButtons;
    Image1: TImage;
    Label1: TLabel;
    ImageList1: TImageList;
    Memo1: TMemo;
    ActionList1: TActionList;
    Action1: TAction;
    Action2: TAction;
    Action3: TAction;
    procedure Action1Execute(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Action1Execute(Sender: TObject);
begin
  Memo1.Lines.Add('±Ç¿µ¹Î');
end;

end.
