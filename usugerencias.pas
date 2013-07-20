unit usugerencias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, RzGrids, ExtCtrls, RzPanel, RzRadGrp;

type
  Tfrmsugerencias = class(TForm)
    RzRadioGroup1: TRzRadioGroup;
    lista: TRzStringGrid;
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmsugerencias: Tfrmsugerencias;

implementation

uses Udmrep, Urecursos;

{$R *.dfm}

procedure Tfrmsugerencias.FormShow(Sender: TObject);
begin
   with dmreportes do
   begin
      querys('select descripcion from cuestionario',0,sqlgeneral);
      lista.RowCount:=sqlgeneral.RecordCount;
      lista.RowHeights[2]:=80;
      while not sqlgeneral.Eof do
      begin
         lista.Rows[sqlgeneral.RecNo].Add(sqlgeneral.fieldbyname('descripcion').asstring);
         sqlgeneral.Next;
      end;
   end;
end;

end.
