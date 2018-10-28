program TorreDeHanoi;

uses
  Vcl.Forms,
  uTorreHanoi in 'uTorreHanoi.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
