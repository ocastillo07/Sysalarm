unit UProgreso;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzPrgres;

type
  Tfrmprogreso = class(TForm)
    barra: TRzProgressBar;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmprogreso: Tfrmprogreso;

implementation

{$R *.dfm}

procedure Tfrmprogreso.FormShow(Sender: TObject);
begin
   barra.Percent:=0;
end;

procedure Tfrmprogreso.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 Release;
end;

end.
