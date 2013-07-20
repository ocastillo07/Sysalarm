//****************************************\\
//**CREADO Y MODIFICADO POR IGNACIO HARO**\\
//       12 DE NOVIEMNRE DEL 2007         \\
//****************************************\\
unit UGraficas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, TeEngine, Series, GanttCh, ExtCtrls, TeeProcs, Chart,
  DB, MemDS, DBAccess, MyAccess, cxStyles, cxCustomData, cxGraphics,
  cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxGridLevel,
  cxClasses, cxControls, cxGridCustomView, cxGridCustomTableView,
  cxGridTableView, cxGridDBTableView, cxGrid, DateUtils, StdCtrls;

type
  Tfrmgraficas = class(TForm)
    btnzoomin: TRzBitBtn;
    btnzoomout: TRzBitBtn;
    sqlgeneral: TMyQuery;
    chMinuta: TChart;
    Series1: TGanttSeries;
    vista1: TcxGridDBTableView;
    nivel1: TcxGridLevel;
    grid: TcxGrid;
    id: TcxGridDBColumn;
    descripcion: TcxGridDBColumn;
    fecha_inicio: TcxGridDBColumn;
    fecha_termino: TcxGridDBColumn;
    responsable: TcxGridDBColumn;
    dsminuta: TDataSource;
    btncerrar: TRzBitBtn;
    querytmp: TMyQuery;
    estatus: TcxGridDBColumn;
    tabla: TMyTable;
    btnimprimir: TRzBitBtn;
    btn3d: TRzBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    procedure btnzoominClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnzoomoutClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure btn3dClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
   frmgraficas: Tfrmgraficas;

implementation

uses Udm, Udmrep;

{$R *.dfm}

procedure Tfrmgraficas.btnzoominClick(Sender: TObject);
begin
   chMinuta.ZoomPercent(110);
end;

procedure Tfrmgraficas.FormShow(Sender: TObject);
var
   i,m,Idia,Imes,Ianio,Tdia,Tmes,Tanio,avance,tiempo,avtiempo:integer;
   actividad,fechaInicio,fechaTermino,estatus,fecI,fecT,responsable,avtexto:string;
begin
   querytmp.SQL.Clear;
   querytmp.SQL.Add('DELETE FROM MinutaGerencial_tmp');
   querytmp.Execute;

   if sqlgeneral.RecordCount > 0 then
   begin
      i:= sqlgeneral.RecordCount;
      for m:=1 to sqlgeneral.RecordCount do
      begin
         //SE OBTIENEN LAS FECHAS DE LAS ACTIVIDADES DE LA MINUTA GERENCIAL
         //id:= sqlgeneral.fieldbyname('id').AsInteger;
         actividad:= UpperCase(sqlgeneral.fieldbyname('actividad').AsString);
         fechaInicio:= sqlgeneral.fieldbyname('inicio').AsString;
         fechaTermino:= sqlgeneral.fieldbyname('termino').AsString;
         estatus:= sqlgeneral.fieldbyname('estatus').AsString;
         responsable:= UpperCase(sqlgeneral.fieldbyname('responsable').AsString);
         avance:= sqlgeneral.fieldbyname('avance').AsInteger;
         if avance < 10 then
            avtexto:= '  '+inttostr(avance)
         else
         begin
            if avance < 100 then
               avtexto:= ' '+inttostr(avance)
            else
               avtexto:= inttostr(avance);
         end;
         Idia:= StrToInt(copy(fechainicio,9,2));
         Imes:= StrToInt(copy(fechainicio,6,2));
         Ianio:=StrToInt(copy(fechainicio,1,4));
         Tdia:= StrToInt(copy(fechaTermino,9,2));
         Tmes:= StrToInt(copy(fechaTermino,6,2));
         Tanio:=StrToInt(copy(fechaTermino,1,4));
         //SE OBTIENE EL TIEMPO EN DIAS DEL AVANCE EN BASE AL PORCENTAJE
         tiempo:= DaysBetween(EncodeDate(Ianio,Imes,Idia),EncodeDate(Tanio,Tmes,Tdia));
         avtiempo:= Round(tiempo*(avance/100));
         //PRIMERO SE DIBUJA LA BARRA DEL AVANCE Y DESPUES LA DEL TIEMPO RESTANTE
         Series1.AddGanttColor(EncodeDate(Ianio,Imes,Idia),(EncodeDate(Ianio,Imes,Idia)+avtiempo),m,inttostr(i)+': '+responsable+' - '+avtexto+'%', clGray);
         Series1.AddGanttColor((EncodeDate(Ianio,Imes,Idia)+avtiempo),EncodeDate(Tanio,Tmes,Tdia),m, inttostr(i)+': '+responsable+' - '+avtexto+'%', clRed);
         //SE AGREGAN A UNA TABLA TEMPORAL PARA QUE APAREZCAN EN EL GRID
         fecI:= copy(fechaInicio,7,4)+'/'+copy(fechaInicio,4,2)+'/'+copy(fechaInicio,1,2);
         fecT:= copy(fechaTermino,7,4)+'/'+copy(fechaTermino,4,2)+'/'+copy(fechaTermino,1,2);
         querytmp.SQL.Clear;
         querytmp.SQL.Add('INSERT INTO MinutaGerencial_tmp VALUES ('+inttostr(i)+',"'+actividad+'","'+fechaInicio+'","'+fechaTermino+'","'+estatus+'","'+responsable+'",'+inttostr(avance)+')');
         querytmp.Execute;
         sqlgeneral.Next;
         i:= i-1;
      end;
      tabla.Active:= true;
   end;
end;

procedure Tfrmgraficas.btnzoomoutClick(Sender: TObject);
begin
   chMinuta.ZoomPercent(90);
end;

procedure Tfrmgraficas.btncerrarClick(Sender: TObject);
begin
   close;
end;

procedure Tfrmgraficas.btnimprimirClick(Sender: TObject);
begin
   if application.MessageBox('Solo se imprimirá el área que se muestra en pantalla. Desea continuar?','Aviso',MB_YESNO+MB_ICONQUESTION) = IDYES then
      chMinuta.PrintLandscape;
end;

procedure Tfrmgraficas.btn3dClick(Sender: TObject);
begin
   chMinuta.View3D:= not chMinuta.View3D;
end;

end.
