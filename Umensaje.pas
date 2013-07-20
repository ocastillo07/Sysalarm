unit Umensaje;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzBorder, ExtCtrls, StdCtrls, RzLabel, OleCtrls,
  ShockwaveFlashObjects_TLB, RzBckgnd;

type
  Tfrmmensaje = class(TForm)
    edt: TRzLabel;
    RzBackground1: TRzBackground;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmmensaje: Tfrmmensaje;

implementation

{$R *.dfm}

end.
