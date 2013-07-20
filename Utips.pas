unit Utips;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzEdit;

type
  Tfrmtips = class(TForm)
    memo: TRzMemo;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure parametro(manual:string);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmtips: Tfrmtips;
  tipo:string;

implementation

{$R *.dfm}

procedure Tfrmtips.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  action:=cafree;
end;

procedure Tfrmtips.FormShow(Sender: TObject);
begin
   if tipo='dsc' then
      memo.Lines.LoadFromFile(ExtractFilePath(application.ExeName)+'DSC.txt');
   if tipo='fbii' then
      memo.Lines.LoadFromFile(ExtractFilePath(application.ExeName)+'FBII.txt');
   if tipo='ademco' then
      memo.Lines.LoadFromFile(ExtractFilePath(application.ExeName)+'ademco.txt');
   if tipo='napco' then
      memo.Lines.LoadFromFile(ExtractFilePath(application.ExeName)+'NAPCO.txt');
   if tipo='espec' then
      memo.Lines.LoadFromFile(ExtractFilePath(application.ExeName)+'ESPECTRA.txt');
   if tipo='parad' then
      memo.Lines.LoadFromFile(ExtractFilePath(application.ExeName)+'PARADOX.txt');
end;

procedure Tfrmtips.parametro(manual:string);
begin
  tipo:=manual;
end;

end.
