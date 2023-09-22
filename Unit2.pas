unit Unit2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, Vcl.StdCtrls, Vcl.ComCtrls,
  IdBaseComponent, IdComponent, IdTCPConnection, IdTCPClient, IdTime,
  Vcl.ExtCtrls, Vcl.XPMan;

type
  TNotepad = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    File2: TMenuItem;
    Open1: TMenuItem;
    Open2: TMenuItem;
    N1: TMenuItem;
    N2: TMenuItem;
    Edit1: TMenuItem;
    Edit2: TMenuItem;
    Font1: TMenuItem;
    OpenDialog1: TOpenDialog;
    FontDialog1: TFontDialog;
    ColorDialog1: TColorDialog;
    SaveDialog1: TSaveDialog;
    Memo1: TMemo;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    procedure N2Click(Sender: TObject);
    procedure File2Click(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Open2Click(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Notepad: TNotepad;

implementation

{$R *.dfm}

procedure TNotepad.Edit2Click(Sender: TObject);
begin

  if ColorDialog1.Execute() then
    Memo1.Color:=ColorDialog1.Color;
end;

procedure TNotepad.File2Click(Sender: TObject);
begin
  Memo1.Clear;
end;

procedure TNotepad.Font1Click(Sender: TObject);
begin
  if FontDialog1.Execute() then
    Memo1.Font:=FontDialog1.Font;
end;

procedure TNotepad.FormCreate(Sender: TObject);
begin
  StatusBar1.Panels[0].text:='notpad';
  StatusBar1.Panels[1].text:=ExtractFilePath(Application.ExeName);
end;

procedure TNotepad.N2Click(Sender: TObject);
begin
close;
end;

procedure TNotepad.Open1Click(Sender: TObject);
begin
  openDialog1.Filter:='txtFile|*.txt';
  if OpenDialog1.Execute then
    Memo1.Lines.LoadFromFile(OpenDialog1.FileName);
end;

procedure TNotepad.Open2Click(Sender: TObject);
begin
  if SaveDialog1.Execute() then
    Memo1.Lines.SaveToFile(SaveDialog1.FileName);
end;

procedure TNotepad.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[2].Text:=timetostr(time);
end;

end.
