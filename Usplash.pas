unit Usplash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RxGIF, jpeg, OleCtrls, ShockwaveFlashObjects_TLB;

type
  Tfrmsplash = class(TForm)
    SWFlogo: TShockwaveFlash;
    Timer1: TTimer;
    procedure FormShow(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsplash: Tfrmsplash;

implementation

uses Uprincipal;

{$R *.dfm}

procedure Tfrmsplash.FormShow(Sender: TObject);
begin
scaleby(screen.Width,1024);
SWFlogo.Play;
end;

procedure Tfrmsplash.FormActivate(Sender: TObject);
begin
SWFlogo.Movie := ExtractFilePath(Application.ExeName)+'Alarmexlog.swf';
end;

procedure Tfrmsplash.Timer1Timer(Sender: TObject);
begin
  close;
end;

end.
