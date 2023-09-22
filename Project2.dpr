program Project2;

uses
  Vcl.Forms,
  Unit2 in 'Unit2.pas' {Notepad};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TNotepad, Notepad);
  Application.Run;
end.
