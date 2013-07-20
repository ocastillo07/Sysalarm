unit uRepLlamadasTel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzCmboBx, Mask, RzEdit, RzLabel, ExtCtrls,
  RzPanel, DateUtils;

type
  TfrmRepLlamadasTel = class(TForm)
    rgperiodo: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    dtdesde: TRzDateTimeEdit;
    dthasta: TRzDateTimeEdit;
    rgarea: TRzGroupBox;
    cbarea: TRzComboBox;
    btnimprimir: TRzBitBtn;
    btncerrar: TRzBitBtn;
    rgtipoimpresion: TRzGroupBox;
    cbtipoimpresion: TRzComboBox;
    rgtipollamada: TRzGroupBox;
    cbtipo: TRzComboBox;
    procedure btnimprimirClick(Sender: TObject);
    procedure cbtipoimpresionSelect(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    TipoImpresion:String;

    procedure Llamadas;
    procedure LlamadasResumen;
    procedure LlamadasExtension;
    procedure LlamExtDir;
    { Private declarations }
  public
    Reporte:Integer;
    procedure inicializa;
    { Public declarations }
  end;

var
  frmRepLlamadasTel: TfrmRepLlamadasTel;

implementation

uses Umensaje, Urecursos, Udmrep, StrUtils;

{$R *.dfm}

procedure TfrmRepLlamadasTel.btnimprimirClick(Sender: TObject);
begin
frmmensaje.Show;
   frmmensaje.Update;
case Reporte of
   1: Llamadas;
   2: LlamadasResumen;
   3: LlamadasExtension;
   4: LlamExtDir;
   end;
frmmensaje.close;
end;

procedure TfrmRepLlamadasTel.inicializa;
begin
Tipoimpresion := 'IMP';
dtdesde.Date := PrimeroMesActual;
dthasta.Date := today;

case Reporte of
   1: begin
      Self.Caption := 'Llamadas';
      self.Height := 235;
      self.Width := 430;
      CargaComboConItem('Select idarea, nombre from areas order by nombre asc',
                        'nombre', 'idarea', 'TODAS LAS AREAS', cbarea);
      cbarea.ItemIndex := 0;
      CargaComboConItem('Select idstatus, nombre from clasif_servicios where idserv = 13 '+
                        'order by orden asc',
                        'nombre', 'idstatus', 'TODAS', cbtipo);
      cbtipo.Items.Insert(1, 'ENTRANTES, COMUN. Y TRANS. ENT.');
      cbtipo.Items.Insert(2, 'ENTRANTES Y TRANS. ENT');
      cbtipo.Items.Insert(3, 'SALIENTES Y TRANS. SAL.');
      cbtipo.Items.Insert(4, 'ENTRANTES Y SALIENTES');
      cbtipo.ItemIndex := 0;
      end;

   2: begin
      Self.Caption := 'Resumen de Llamadas por areas';
      self.Height := 180;
      self.Width := 430;
      rgarea.visible :=false;
      rgtipollamada.visible := false;
      end;

   3: begin
      Self.Caption := 'Resumen de Llamadas por Extension';
      self.Height := 180;
      self.Width := 430;
      rgarea.Caption := 'Extensiones';
      CargaCombo2('Select extension, concat(extension, "  ", descripcion) as nombre '+
                  'from extensiones order by extension asc',
                  'nombre', 'extension', cbarea);
      cbarea.ItemIndex := 0;
      rgtipollamada.visible := false;
      end;

   4: begin
      Self.Caption := 'Directorio de Extensiones';
      self.Height := 235;
      self.Width := 430;
      CargaComboConItem('Select idarea, nombre from areas order by nombre asc',
                        'nombre', 'idarea', 'TODAS LAS AREAS', cbarea);
      cbarea.ItemIndex := 0;
      CargaComboConItem('Select distinct tipo, 0 as id from extensiones',
                        'tipo', 'id', 'TODOS', cbtipo);
      cbtipo.ItemIndex := 0;
      rgperiodo.Visible := false;
      rgarea.Top := 5;
      rgtipollamada.Top := 60;
      rgtipollamada.Caption := ' Tipo Extension ';

      end;
   end;
end;

procedure TfrmRepLlamadasTel.cbtipoimpresionSelect(Sender: TObject);
begin
case cbTipoImpresion.itemindex of
  0: TipoImpresion :='IMP';
  1: TipoImpresion :='IMPD';
  2: TipoImpresion :='ARC';
  3: TipoImpresion :='PDF';
  end;
end;

procedure TfrmRepLlamadasTel.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmRepLlamadasTel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmRepLlamadasTel.Llamadas;
var tipo, area, titulo:string;
begin
case cbtipo.ItemIndex of
  0: begin tipo := ' '; titulo := 'LLamadas del periodo'; end;
  1: begin tipo := 'and tipoES = "E" '; titulo := 'LLamadas Entrantes'; end;
  2: begin tipo := 'and (tipoES = "E" and l.tipo <> 9) '; titulo := 'LLamadas Entrantes Respondidas'; end;
  3: begin tipo := 'and tipoES = "S" '; titulo := 'LLamadas Salientes'; end;
  4: begin tipo := 'and l.tipo in(1,2) '; titulo := 'LLamadas Entrantes y Salientes'; end

  else
    begin tipo := 'and cs.nombre = "'+cbtipo.text+'" '; titulo := 'LLamadas '+cbtipo.text; end;
  end;

if cbarea.ItemIndex = 0 then
  area := ''
else
  area := 'and a.nombre = "'+cbarea.text+'"';


if querys('Select "'+titulo+'" as titulo, "De '+dtdesde.text+' a '+dthasta.text+'" as periodo, l.fecha, cs.nombre as tipo,'+
       'l.hora, telefono,  a.nombre as area, l.extension, e.descripcion, l.duracion, tarifa '+
       'from LlamadasRT l left join clasif_servicios cs on cs.idstatus=l.tipo and idserv = 13 '+
       'left join extensiones e on e.extension=l.extension left join areas a on a.idarea=e.idarea '+
       'where l.fecha between "'+dtdesde.text+'" and "'+dthasta.text+'" '+tipo+area+
       'order by area, tipo, l.idllamada asc', 0, dmreportes.sqlgeneral) > 0 then
  OperacionReporte('LlamTotal', titulo, TipoImpresion, 1)
else
  application.MessageBox('No se encontraron datos', 'Atencion', MB_ICONINFORMATION);
end;

procedure TfrmRepLlamadasTel.LlamadasResumen;
begin
if querys('Select  "a" as t, cs.nombre as tipo, count(l.idllamada) as total, if(l.tipo = 2, '+
          'sum(tarifa),0) as totalmn, "Resumen de Llamadas por areas" as titulo, "De '+dtdesde.text+' a '+dthasta.text+'" as periodo,a.nombre as area '+
          'from LlamadasRT l left join clasif_servicios cs on cs.idstatus=l.tipo and idserv = 13 '+
          'left join extensiones e on e.extension=l.extension left join areas a on a.idarea=e.idarea '+
          'where l.fecha between "'+dtdesde.text+'" and "'+dthasta.text+'" group by l.tipo, e.idarea union '+
          'Select  "t" as t, cs.nombre as tipo, count(l.idllamada) as total, if(l.tipo = 2, '+
          'sum(tarifa),0) as totalmn, "titulo" as titulo, "De '+dtdesde.text+' a '+dthasta.text+'" as periodo,"TODAS" as area '+
          'from LlamadasRT l left join clasif_servicios cs on cs.idstatus=l.tipo and idserv = 13 '+
          'left join extensiones e on e.extension=l.extension left join areas a on a.idarea=e.idarea '+
          'where l.fecha between "'+dtdesde.text+'" and "'+dthasta.text+'" group by l.tipo order by t, area, tipo asc', 0, dmreportes.sqlgeneral) > 0 then
  OperacionReporte('LlamResumen', 'Resumen de Llamadas por areas', TipoImpresion, 1)
else
  application.MessageBox('No se encontraron datos', 'Atencion', MB_ICONINFORMATION);
end;

procedure TfrmRepLlamadasTel.LlamadasExtension;
var extension:string;
begin
extension := LeftStr(cbarea.text, 4);
if querys('Select "Llamadas por Extension" as titulo, "De '+dtdesde.text+' a '+dthasta.text+'" as periodo, '+
          'l.extension, e.descripcion, a.nombre as area, cs.nombre as tipo, min(t.procedencia) as procedencia, '+
          'l.fecha, l.hora, duracion, if(l.tipo=2, tarifa, 0) as tarifa, if(l.telefono = "", "DESCONOCIDO", '+
          'l.telefono) as telefono from LlamadasRT l left join clasif_servicios cs on cs.idstatus=l.tipo and '+
          'idserv = 13 left join extensiones e on e.extension=l.extension left join areas a on a.idarea=e.idarea '+
          'left join telefonos t on l.telefono like concat("%",replace(t.telefono, "-", ""), "%") '+
          'where l.fecha between "'+dtdesde.text+'" and "'+dthasta.text+'" and l.extension = '+extension+' '+
          'group by idllamada order by tipo, l.idllamada', 0, dmreportes.sqlgeneral) > 0 then
  OperacionReporte('LlamExtension', 'Resumen de Llamadas por Extension', TipoImpresion, 1)
else
  application.MessageBox('No se encontraron datos', 'Atencion', MB_ICONINFORMATION);
end;

procedure TfrmRepLlamadasTel.LlamExtDir;
var area, tipo:string;
begin
if cbarea.Text <> 'TODAS LAS AREAS' then
  begin
  area := 'where a.nombre = "'+cbarea.Text+'" ';
  if cbtipo.Text <> 'TODOS' then
    tipo := 'and tipo = "'+cbtipo.Text+'"'
  else
    tipo := '';
  end
else
  begin
  area := '';
  if cbtipo.Text <> 'TODOS' then
    tipo := 'where tipo = "'+cbtipo.Text+'"'
  else
    tipo := '';
  end;

if querys('Select extension, e.descripcion, a.nombre as area, tipo from extensiones e left join '+
          'areas a on a.idarea=e.idarea '+area+tipo, 0, dmreportes.sqlgeneral) > 0 then
  OperacionReporte('LlamExtDir', 'Directorio de Extensiones', TipoImpresion, 1)
else
  application.MessageBox('No se encontraron datos', 'Atencion', MB_ICONINFORMATION);       

end;

End.
