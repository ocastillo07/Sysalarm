unit Utcflash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, OleCtrls, ShockwaveFlashObjects_TLB;

type
  Tfrmtcflash = class(TForm)
    flash: TShockwaveFlash;
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmtcflash: Tfrmtcflash;

implementation

uses Uprincipal;

{$R *.dfm}

procedure Tfrmtcflash.FormActivate(Sender: TObject);
begin
flash.Movie := uprincipal.my_path+'tc.swf';
end;

procedure Tfrmtcflash.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action := cafree;
end;

end.
