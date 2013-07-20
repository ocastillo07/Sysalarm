unit Upreguntapatrullero;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, RzPanel;

type
  TfrmPreguntaPatrullero = class(TForm)
    RzGroupBox1: TRzGroupBox;
    btnllegada: TRzBitBtn;
    btncancelar: TRzBitBtn;
    btncerrar: TRzBitBtn;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPreguntaPatrullero: TfrmPreguntaPatrullero;

implementation

{$R *.dfm}

end.
