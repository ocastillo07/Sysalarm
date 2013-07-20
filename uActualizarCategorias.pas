unit uActualizarCategorias;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, RzButton, StdCtrls, RzLabel, RzEdit,
  Math, Mask, cxControls, cxContainer, cxEdit, cxTextEdit, cxMaskEdit,
  cxDropDownEdit, cxColorComboBox;

type
  TfrmActualizarCategorias = class(TForm)
    lblclave: TRzLabel;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    sqlgen: TMyQuery;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    edanual1: TRzEdit;
    edanual2: TRzEdit;
    edanual3: TRzEdit;
    edanual4: TRzEdit;
    edmensual1: TRzEdit;
    edmensual2: TRzEdit;
    edmensual3: TRzEdit;
    edmensual4: TRzEdit;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
  private
    procedure habilitar(hab:boolean);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmActualizarCategorias: TfrmActualizarCategorias;

implementation

uses Udm, Urecursos;

{$R *.dfm}

procedure TfrmActualizarCategorias.FormShow(Sender: TObject);
var i : integer;
begin
habilitar(false);
i := 1;
querys('Select t.idtipomonitoreo, t.nombre, c.CostoAnual, c.CostoMensual, c.color from TiposMonitoreo as t '+
       'left join (Select DISTINCT CostoAnual, CostoMensual, color, idtipomonitoreo from categorias c '+
       'group By idtipomonitoreo) as c on c.idtipomonitoreo=t.idtipomonitoreo', 0, sqlgen);
while not sqlgen.eof = true do
  begin
  case i of
    1: begin
       edmensual1.Text := sqlgen.fieldbyname('CostoMensual').asstring;
       edanual1.Text := sqlgen.fieldbyname('CostoAnual').asstring;
       //edcolor1.SelectedColor := RGBToColor(sqlgen.fieldbyname('color').AsString);
       end;

    2: begin
       edmensual2.Text := sqlgen.fieldbyname('CostoMensual').asstring;
       edanual2.Text := sqlgen.fieldbyname('CostoAnual').asstring;
       //edcolor2.SelectedColor := RGBToColor(sqlgen.fieldbyname('color').AsString);
       end;

    3: begin
       edmensual3.Text := sqlgen.fieldbyname('CostoMensual').asstring;
       edanual3.Text := sqlgen.fieldbyname('CostoAnual').asstring;
       //edcolor3.SelectedColor := RGBToColor(sqlgen.fieldbyname('color').AsString);
       end;

    4: begin
       edmensual4.Text := sqlgen.fieldbyname('CostoMensual').asstring;
       edanual4.Text := sqlgen.fieldbyname('CostoAnual').asstring;
       //edcolor4.SelectedColor := RGBToColor(sqlgen.fieldbyname('color').AsString);
       end;

  end;
  sqlgen.next;
  inc(i);
  end;

end;


procedure TfrmActualizarCategorias.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TfrmActualizarCategorias.btncancelarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmActualizarCategorias.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin

     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     habilitar(true);
   end
else
  begin
   //guarda al reves el color ...color = "'+vartostr(IntToHex(ColorToRGB(edcolor1.SelectedColor),6))+'"
  querys('update categorias set CostoAnual = round('+edanual1.Text+',2), '+
         'CostoMensual = round('+edmensual1.Text+',2) '+
         ' where idtipomonitoreo = 1', 1, sqlgen);

  querys('update categorias set CostoAnual = round('+edanual2.Text+',2), '+
         'CostoMensual = round('+edmensual2.Text+',2) '+
         'where idtipomonitoreo = 2', 1, sqlgen);

  querys('update categorias set CostoAnual = round('+edanual3.Text+',2), '+
         'CostoMensual = round('+edmensual3.Text+',2) '+
         'where idtipomonitoreo = 3', 1, sqlgen);

  querys('update categorias set CostoAnual = round('+edanual4.Text+',2), '+
         'CostoMensual = round('+edmensual4.Text+',2) '+
         'where idtipomonitoreo = 4', 1, sqlgen);

     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
     btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos';
     habilitar(false);
     end;
end;

procedure TfrmActualizarCategorias.habilitar(hab:boolean);
begin
       edmensual1.enabled := hab;
       edanual1.enabled := hab;
       //edcolor1.enabled := hab;

       edmensual2.enabled := hab;
       edanual2.enabled := hab;
       //edcolor2.enabled := hab;

       edmensual3.enabled := hab;
       edanual3.enabled := hab;
       //edcolor3.enabled := hab;

       edmensual4.enabled := hab;
       edanual4.enabled := hab;
       //edcolor4.enabled := hab;
end;

End.
