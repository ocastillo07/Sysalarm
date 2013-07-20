{//***************************************************************************//
2009/02/06 dalyla escoger el ano
--------------------------------------------------------------------------------
2008/09/24 dalyla borrar temporales
2008/06/05 dalyla correccion en venta en dolares
2008/06/05 dalyla agregar obras en proceso a instalaciones
2008/04/26 dalyla distinct en el de central jejeje
2008/04/25 dalyla motcanc impresion de principal
2008/04/18 dalyla act. positiva, por clasif serv
2008/03/06 dalyla CuentasXContrato
2008/02/28 dalyla zona horaria ok
2008/02/13 dalyla porcentaje y promedio total en central
}//***************************************************************************//
unit URepMultiples;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, RzBckgnd, RzCmboBx, RzButton, DateUtils,
  Mask, RzEdit, ExtCtrls, RzPanel, RzRadGrp, TeEngine, Series, TeeProcs,
  Chart, DB, MemDS, DBAccess, MyAccess;

type
  TfrmRepMultiples = class(TForm)
    btnImprimir: TRzBitBtn;
    btncerrar: TRzBitBtn;
    cbTipoImpresion: TRzComboBox;
    lreporte: TRzLabel;
    rgopcion: TRzRadioGroup;
    chGrafica: TChart;
    Series1: TBarSeries;
    sqlgraf: TMyQuery;
    cbano: TRzComboBox;
    RzLabel1: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbTipoImpresionSelect(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    TipoImpresion:string;
    //procedure InstTotAnual;
    procedure InstTotHrsAnual;
    procedure ServTotAnual;
    procedure RepActivaciones;
    procedure LlamXFuente;
    procedure VentaDlls;
    procedure CuentasVentas;
    procedure VentaEquipo;
    procedure TraeRepVentas;
    procedure CobranzaVencidos;
    procedure CuentasXContratoRM;
    { Private declarations }
  public
    Reporte:Integer;
    procedure Inicializa;
    procedure MotCancelacionAnual(imprime:boolean);
    { Public declarations }
  end;

var
  frmRepMultiples: TfrmRepMultiples;

implementation

uses Udmrep, Uprincipal, Urecursos, Umensaje, Udm, Ureportes;

{$R *.dfm}

procedure TfrmRepMultiples.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
 querys('Drop table if exists tmpMultServ'+frmprincipal.idmaq, 1, dmreportes.sqlgeneral7);
 querys('Drop table if exists tmpMultInst'+frmprincipal.idmaq, 1, dmreportes.sqlgeneral7);
 querys('Drop table if exists tmpMotCanc'+frmprincipal.idmaq, 1, dmreportes.sqlgeneral7);
 querys('Drop table if exists tmpCtasNvas'+frmprincipal.idmaq, 1, dmreportes.sqlgeneral8);
 querys('Drop table if exists tmpActAnualesCentral'+frmprincipal.idmaq, 1, dmreportes.sqlgeneral3);
 querys('DROP TABLE IF EXISTS tmpComVend'+frmprincipal.idmaq,1,dmreportes.sqlgeneral3);
 querys('DROP TABLE IF EXISTS tmpComVend1'+frmprincipal.idmaq,1,dmreportes.sqlgeneral3);

Action := caFree;
end;

procedure TfrmRepMultiples.cbTipoImpresionSelect(Sender: TObject);
begin
inicializa;
case cbTipoImpresion.itemindex of
  0: TipoImpresion :='IMP';
  1: TipoImpresion :='IMPD';
  2: TipoImpresion :='ARC';
  3: TipoImpresion :='PDF';
  4: begin
     TipoImpresion :='GRAF';
     case reporte of
         3: begin
            rgopcion.Items.Clear;
            rgopcion.Items.Add('Movimientos Cuentas');
            rgopcion.Items.Add('Motivos de Cancelacion');
            rgopcion.Items.Add('Activaciones Anuales');
            rgopcion.Items.Add('Activaciones positivas');
            rgopcion.ItemIndex := 0;
            rgopcion.Top := 5;
            rgopcion.Height := 100;
            rgopcion.left := 450;
            rgopcion.Visible := true;
            chGrafica.Visible := true;
            self.WindowState := wsMaximized;
            end;
         4: begin
            rgopcion.Items.Clear;
            rgopcion.Items.Add('Cuentas por Ventas');
            rgopcion.Items.Add('Venta en dolares');
            rgopcion.Items.Add('Ventas de Equipo');
            rgopcion.Items.Add('Llamadas por Fuente');
            rgopcion.ItemIndex := 0;
            rgopcion.Top := 5;
            rgopcion.Height := 100;
            rgopcion.left := 450;
            rgopcion.Visible := true;
            chGrafica.Visible := true;
            self.WindowState := wsMaximized;
            end;
       end;
     chGrafica.Visible := true;
     self.WindowState := wsMaximized;
     end;
  end;
end;

procedure TfrmRepMultiples.btncerrarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmRepMultiples.btnImprimirClick(Sender: TObject);
begin
frmmensaje.Show;
frmmensaje.Update;
case Reporte of


   1: ServTotAnual; //Servicios

   2: InstTotHrsAnual; //Instalaciones

   3: begin //Central
      if TipoImpresion <> 'GRAF' then
        begin
        MotCancelacionAnual(true);
        RepActivaciones;
        end
      else
         begin
         case rgopcion.ItemIndex of
           0, 1: MotCancelacionAnual(true);
           2, 3: RepActivaciones;
           end;
         end;
      end;

   4: begin  //Ventas
      if TipoImpresion <> 'GRAF' then
        begin
        case rgopcion.ItemIndex of
          0: begin
             VentaDlls;
             CuentasVentas;
             end;
          1: begin
             VentaEquipo;
             LlamXFuente;
             end;
          end;
        end
      else
        case rgopcion.ItemIndex of
          0: VentaDlls;
          1: CuentasVentas;
          2: VentaEquipo;
          3: LlamXFuente;
          end;
      TraeRepVentas;
      end;
   5: CobranzaVencidos;
   6: CuentasXContratoRM;
   end;
frmmensaje.close;
end;

procedure TfrmRepMultiples.inicializa;
begin
Tipoimpresion := 'IMP';
chgrafica.Visible:=false;
rgopcion.Visible := false;
self.Height := 150;
self.Width := 380;
self.WindowState := wsNormal;
case Reporte of
   1: begin
      lreporte.caption := 'Reporte Multiple de Servicios';
      btnimprimir.Left := 5;
      btnimprimir.Top := 64;
      btncerrar.Left := 205;
      btncerrar.Top := 64;
      end;

   2: begin
      lreporte.caption := 'Reporte Multiple de Instalaciones';
      btnimprimir.Left := 5;
      btnimprimir.Top := 64;
      btncerrar.Left := 205;
      btncerrar.Top := 64;
      end;

   3: begin
      lreporte.caption := 'Reporte Multiple de Central';
      btnimprimir.Left := 5;
      btnimprimir.Top := 64;
      btncerrar.Left := 205;
      btncerrar.Top := 64;
      end;

   4: begin
      lreporte.caption := 'Reporte Multiple de Ventas';
      self.Height := 181;
      btnimprimir.Left := 205;
      btnimprimir.Top := 40;
      btncerrar.Left := 205;
      btncerrar.Top := 96;
      rgopcion.Visible := true;
      rgopcion.left := 8;
      rgopcion.Top := 72;
      rgopcion.Items.Clear;
      rgopcion.Items.Add('Cuentas y Dolares');
      rgopcion.Items.Add('Equipo y Llamadas');
      rgopcion.ItemIndex := 0;
      end;

   5: begin
      lreporte.caption := 'Reporte Multiple de Cobranza';
      btnimprimir.Left := 5;
      btnimprimir.Top := 64;
      btncerrar.Left := 205;
      btncerrar.Top := 64;
      end;

   6: begin
      lreporte.caption := 'Reporte Multiple de Contratos';
      btnimprimir.Left := 5;
      btnimprimir.Top := 64;
      btncerrar.Left := 205;
      btncerrar.Top := 64;
      end;
   end;
end;

procedure TfrmRepMultiples.ServTotAnual;
var i, total:Integer;
begin
with dmreportes do
  begin
  {if cbano.Text = inttostr(yearof(today)) then
    begin}
    TickFinalizados;
    // INSERTA LOS TECNICOS DEL AÑO //
    querys('Delete from TotalServicios where anio = year("'+datetostr(date)+'")', 1, sqlgeneral4);
    querys('select CodTecnico from TicketsFinalizados where anio=year("'+datetostr(date)+'") and CodTecnico not '+
           'in(select CodTecnico from TotalServicios where anio=year("'+datetostr(date)+'")) group by CodTecnico order by CodTecnico', 0, sqlgeneral4);
    sqlgeneral4.First;
    while not sqlgeneral4.Eof = true do
      begin
      if sqlgeneral4.fieldbyname('CodTecnico').AsString <> '' then
        querys('Insert into TotalServicios (anio, CodTecnico) values (year("'+datetostr(date)+'"), "'+
        sqlgeneral4.fieldbyname('CodTecnico').AsString+'")', 1, sqlgeneral5);
      sqlgeneral4.Next;
      end;
  
    //Actualiza los tickets
    if querys('select CodTecnico, mes, anio, d1+d2+d3+d4+d5+d6+d7+d8+d9+d10+d11+d12+d13+d14+d15+d16+d17+d18+d19+d20+'+
              'd21+d22+d23+d24+d25+d26+d27+d28+d29+d30+d31 as Total from TicketsFinalizados where anio = year("'+datetostr(date)+'") '+
              'having CodTecnico <> "" order by mes, CodTecnico',0, sqlgeneral4) > 0 then
      begin
      sqlgeneral4.First;
      while not sqlgeneral4.Eof = true do
        begin
        for i:=1 to 12 do
          begin
          if i = sqlgeneral4.fieldbyname('mes').AsInteger then
          querys('Update TotalServicios set M'+inttostr(i)+'= '+sqlgeneral4.fieldbyname('total').AsString+
                 ' where anio = year("'+datetostr(date)+'") and CodTecnico="'+sqlgeneral4.fieldbyname('CodTecnico').AsString+'"', 1, sqlgeneral5);
          end;
        sqlgeneral4.Next;
        end;
      end;
    querys('Update TotalServicios set Total=M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12 where anio = year("'+datetostr(date)+'")', 1, sqlgeneral5);
  
    querys('Drop table if exists tmpMultServ'+frmprincipal.idmaq, 1, sqlgeneral8);
    querys('Create table tmpMultServ'+frmprincipal.idmaq+' Select "TOTAL" as CodTecnico, anio, total, M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12, "S" as tu from TotalServicios as t where '+
           'anio < year("'+datetostr(date)+'") and CodTecnico = "Z" union Select if(CodTecnico="Z", "TOTAL", concat(CodTecnico, " - ", ifnull('+UsuarioNombre('u')+', ""))) CodTecnico, anio,  total,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,'+
           'M11,M12, if(CodTecnico="Z", "S", if(u.idarea=3, "S", "O")) as tu from TotalServicios as tc left join usuarios as u on u.codigo2=tc.CodTecnico where anio = year("'+datetostr(date)+'") order by anio', 1, sqlgeneral8);
    querys('Alter table tmpMultServ'+frmprincipal.idmaq+' add (acum int(11) default 0),  add (crec int(11) default 0), add (por decimal(10,2) default 0)',1,sqlgeneral8);
    querys('Select anio, total from tmpMultServ'+frmprincipal.idmaq+' where CodTecnico = "TOTAL"', 0, sqlgeneral3);
    sqlgeneral3.first;
    total := sqlgeneral3.fieldbyname('total').AsInteger;
    sqlgeneral3.Next;
    while not sqlgeneral3.Eof = true do
      begin
      querys('Update tmpMultServ'+frmprincipal.idmaq+' set acum=total+'+inttostr(total)+', '+
             'crec=total-'+inttostr(total)+' '+
             'where anio ='+sqlgeneral3.fieldbyname('anio').AsString+' and CodTecnico="TOTAL"', 1, sqlgeneral4);
      querys('Update tmpMultServ'+frmprincipal.idmaq+' set '+
             //'por=crec/+'+inttostr(total)+' '+
             'por=if(anio= year("'+datetostr(date)+'"), round((total/12)* '+inttostr(monthof(today))+',0), total)  '+
             'where anio ='+sqlgeneral3.fieldbyname('anio').AsString+' and CodTecnico="TOTAL"', 1, sqlgeneral4);
  
      querys('Select anio, total from tmpMultServ'+frmprincipal.idmaq+' where CodTecnico = "TOTAL"', 0, sqlgeneral5);
      total := sqlgeneral5.fieldbyname('total').AsInteger;
  
      sqlgeneral3.Next;
      end;
  
    if TipoImpresion <> 'GRAF' then
      begin
      querys('Select "Reporte Multiple de Servicios" as titulo,  1 as ord, "TOTAL" as CodTecnico, M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12, total, '+
             'anio, acum, crec, por, tu from tmpMultServ'+frmprincipal.idmaq+' where CodTecnico = "TOTAL" and total <> 0 union Select "Reporte Multiple de Servicios" as '+
             'titulo, 2 as ord, CodTecnico, M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12, total, anio, acum, crec, por, tu from tmpMultServ'+
             frmprincipal.idmaq+' where tu = "S"  and CodTecnico <> "TOTAL" and total <> 0 union Select "Reporte Multiple de Servicios" as titulo, 3 as ord, '+
             'concat("OTROS", " ", CodTecnico) as CodTecnico, '+
             'M1, M2, M3,  M4 , M5 , M6, M7, M8, M9, M10, M11, M12, '+
             'total, anio, acum, crec, por, tu from tmpMultServ'+frmprincipal.idmaq+' as t  where tu = "O" and total <> 0 '+
             'order by ord asc, anio asc,tu asc, total desc', 0, sqlgeneral);
      operacionreporte('MultipleServicios', 'Reporte Multiple de Servicios', TipoImpresion, 1);
      end
    else
      begin
      querys('Select CodTecnico, total from tmpMultServ'+frmprincipal.idmaq+' where tu = "S"  and CodTecnico <> '+
             '"TOTAL" and total <> 0 union Select "OTROS" as CodTecnico, total from tmpMultServ'+frmprincipal.idmaq+' as t  where tu = "O" '+
             'and total <> 0 group by tu order by total desc', 0, sqlgraf);
      sqlgraf.first;
      series1.Clear;
      while not sqlgraf.Eof = true do
        begin
        Series1.Add(sqlgraf.fieldbyname('total').AsFloat,sqlgraf.fieldbyname('CodTecnico').AsString);
        sqlgraf.Next;
        end;
      end;
  
    end;
  end; 
  
{ESTE CODIGO ESTA CORRECTO SOLO QUE EN VEZ DE HORAS SACA EL TOTAL DE INSTALACIONES NO BORRAR, POR SI SE OCUPA OK
  procedure TfrmRepMultiples.InstTotAnual;
  var total:integer;
  begin
  with dmreportes do
    begin
    //Inserta los instaladores
    querys('insert into TotalInstalaciones (anio, CodTecnico) Select year(FechaFinal) as anio, instalador1 from instalaciones '+
           'where estatus = 1 and instalador1 is not null and year(FechaFinal) = year("'+datetostr(date)+'") and instalador1 not '+
           'in(Select CodTecnico from TotalInstalaciones where anio = year("'+datetostr(date)+'")) group by anio, month(FechaFinal), instalador1', 1, sqlgeneral3);
  
    //inserta los totales
    querys('Select count(idinstalacion) as tot, month(FechaFinal) as mes, year(FechaFinal) as anio, instalador1 from instalaciones '+
           'where estatus = 1 and instalador1 is not null and year(FechaFinal) = year("'+datetostr(date)+'") group by anio, mes, '+
           'instalador1', 0, sqlgeneral3);
    sqlgeneral3.First;
    while not sqlgeneral3.eof = true do
      begin
      querys('Update TotalInstalaciones set M'+sqlgeneral3.fieldbyname('mes').asstring+'="'+sqlgeneral3.fieldbyname('tot').asstring+'" where anio = '+
             sqlgeneral3.fieldbyname('anio').asstring+' and CodTecnico="'+sqlgeneral3.fieldbyname('instalador1').asstring+'"', 1, sqlgeneral4);
      sqlgeneral3.Next;
      end;
  
    //inserta los totales
    querys('Select count(idinstalacion) as tot, month(FechaFinal) as mes, year(FechaFinal) as anio, instalador2 from instalaciones '+
           'where estatus = 1 and instalador2 is not null and year(FechaFinal) = year("'+datetostr(date)+'") group by anio, mes, '+
           'instalador2', 0, sqlgeneral3);
    sqlgeneral3.First;
    while not sqlgeneral3.eof = true do
      begin
      querys('Update TotalInstalaciones set M'+sqlgeneral3.fieldbyname('mes').asstring+'= M'+sqlgeneral3.fieldbyname('mes').asstring+'+"'+sqlgeneral3.fieldbyname('tot').asstring+'" where anio = '+
             sqlgeneral3.fieldbyname('anio').asstring+' and CodTecnico="'+sqlgeneral3.fieldbyname('instalador2').asstring+'"', 1, sqlgeneral4);
      sqlgeneral3.Next;
      end;
  
      //Crea el codigo Z para el total por año
    querys('Select sum(M1) as M1, sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, sum(M7) as M7, '+
           'sum(M8) as M8, sum(M9) as M9, sum(M10) as M10, sum(M11) as M11, sum(M12) as M12, anio from TotalInstalaciones where CodTecnico <> "Z" group by anio', 0, sqlgeneral3);
    while not sqlgeneral3.eof = true do
      begin
     querys('update TotalInstalaciones set M1='+sqlgeneral3.fieldbyname('M1').asstring+', M2='+sqlgeneral3.fieldbyname('M2').asstring+', M3='+
            sqlgeneral3.fieldbyname('M3').asstring+', M4='+sqlgeneral3.fieldbyname('M4').asstring+', M5='+sqlgeneral3.fieldbyname('M4').asstring+
            ', M6='+sqlgeneral3.fieldbyname('M6').asstring+', M7='+sqlgeneral3.fieldbyname('M7').asstring+', M8='+
            sqlgeneral3.fieldbyname('M8').asstring+', M9='+sqlgeneral3.fieldbyname('M9').asstring+', M10='+sqlgeneral3.fieldbyname('M10').asstring+
            ', M11='+sqlgeneral3.fieldbyname('M11').asstring+', M12='+sqlgeneral3.fieldbyname('M12').asstring+' '+
            'where CodTecnico="Z" and anio='+sqlgeneral3.fieldbyname('anio').asstring+'',1,sqlgeneral4);
     sqlgeneral3.Next;
     end;
  
    querys('Update TotalInstalaciones set Total=M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12 where anio = year("'+datetostr(date)+'")', 1, sqlgeneral5);
  
    querys('Drop table if exists tmpMultInst'+frmprincipal.idmaq, 1, sqlgeneral8);
    querys('Create table tmpMultInst'+frmprincipal.idmaq+' Select "TOTAL" as CodTecnico, anio, total, '+
           'M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12, "I" as tu from TotalInstalaciones as t where '+
           'anio < year("'+datetostr(date)+'") and CodTecnico = "Z" union Select if(CodTecnico="Z", "TOTAL", concat(CodTecnico, " - ", ifnull('+UsuarioNombre('u')+', ""))) CodTecnico, anio,  total,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,'+
           'M11,M12, if(CodTecnico="Z", "I", if(u.idarea="2", "I", if(u.idarea=3,"S", "O"))) as tu from TotalInstalaciones as tc left join usuarios as u on u.codigo=tc.CodTecnico where anio = year("'+datetostr(date)+'") order by anio', 1, sqlgeneral8);
    querys('Alter table tmpMultInst'+frmprincipal.idmaq+' add (acum int(11) default 0),  add (crec int(11) default 0), add (por decimal(10,2) default 0)',1,sqlgeneral8);
    querys('Select anio, total from tmpMultInst'+frmprincipal.idmaq+' where CodTecnico = "TOTAL"', 0, sqlgeneral3);
  
    sqlgeneral3.first;
    total := sqlgeneral3.fieldbyname('total').AsInteger;
    sqlgeneral3.Next;
    while not sqlgeneral3.Eof = true do
      begin
      querys('Update tmpMultInst'+frmprincipal.idmaq+' set acum=total+'+inttostr(total)+', '+
             'crec=total-'+inttostr(total)+' '+
             'where anio ='+sqlgeneral3.fieldbyname('anio').AsString+' and CodTecnico="TOTAL"', 1, sqlgeneral4);
      querys('Update tmpMultInst'+frmprincipal.idmaq+' set por=crec/+'+inttostr(total)+' '+
             'where anio ='+sqlgeneral3.fieldbyname('anio').AsString+' and CodTecnico="TOTAL"', 1, sqlgeneral4);
  
      querys('Select anio, total from tmpMultInst'+frmprincipal.idmaq+' where CodTecnico = "TOTAL"', 0, sqlgeneral5);
      total := sqlgeneral5.fieldbyname('total').AsInteger;
      sqlgeneral3.Next;
      end;
  
      querys('Select "Reporte Multiple de Instalaciones" as titulo, "  TOTAL" as CodTecnico, '+
             'M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12, total, anio, acum, crec, por, tu from tmpMultInst'+frmprincipal.idmaq+
             ' where CodTecnico = "TOTAL" union Select "Reporte Multiple de Instalaciones" as titulo, CodTecnico, '+
             'M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12, total, anio, acum, crec, por, tu from tmpMultInst'+frmprincipal.idmaq+
             ' where tu = "I" and CodTecnico <> "TOTAL" union Select "" as titulo, "SERVICIOS" as CodTecnico, sum(M1) as M1,sum(M2) as M2, sum(M3) as M3, '+
             'sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, sum(M7) as M7, sum(M8) as M8, sum(M9) as M9, sum(M10) as M10, sum(M11) '+
             'as M11, sum(M12) as M12, total, anio, acum, crec, por, tu from tmpMultInst'+frmprincipal.idmaq+' as t  where tu = "S" '+
             'group by tu union Select "" as titulo, "OTROS" as CodTecnico,sum(M1) as M1,sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, '+
             'sum(M5) as M5, sum(M6) as M6, sum(M7) as M7, sum(M8) as M8, sum(M9) as M9, sum(M10) as M10, sum(M11) as M11, sum(M12) '+
             'as M12, total, anio, acum, crec, por, tu from tmpMultInst'+frmprincipal.idmaq+' as t  where tu = "O" group by tu '+
             'order by anio,tu, CodTecnico', 0, sqlgeneral);
      operacionreporte('MultipleServicios', 'Reporte Multiple de Instalaciones', TipoImpresion, 1);
      querys('Drop table if exists tmpMultInst'+frmprincipal.idmaq, 1, sqlgeneral8);
    end; //with
  end;}
  
procedure TfrmRepMultiples.MotCancelacionAnual(imprime:boolean);
var a, m:integer;
f1, f2:string;
begin
    a:=yearof(today);
    m:=  monthof(today); //   2;
    f1:= datetostr(EncodeDate(a, m, 1));
    f2:= datetostr(EncodeDate(a, m, DaysInMonth(a, m)));

with dmreportes do
  begin
  //Crea temporal para sacar los motivos de cancelacion
  querys('Drop table if exists tmpMotCanc'+frmprincipal.idmaq, 1, sqlgeneral5);
  querys('Create table tmpMotCanc'+frmprincipal.idmaq+' (idmotivo int(11), motivo varchar(150), M'+inttostr(m)+' int(11)default 0, '+
         'total int(11) default 0 )', 1, sqlgeneral5);

  querys('Insert into tmpMotCanc'+frmprincipal.idmaq+' (idmotivo, motivo) Select idmotivo, nombre from MotCancel order by idmotivo', 1, sqlgeneral5);

  querys('Select month(FechaCancelacion) as mes, c.idmotivo, m.nombre, count(idcliente) as total from clientes as c '+
         'left join MotCancel as m on m.idmotivo=c.idmotivo where '+
         'FechaCancelacion between "'+f1+'" and "'+f2+'" '+
         'and c.TipoCont = "CAN" and idcliente <> 10000 group by mes, c.idmotivo', 0, sqlgeneral6);
  sqlgeneral6.First;
  while not sqlgeneral6.Eof = true do
    begin
    querys('Update TotalMotCancelacion set M'+sqlgeneral6.fieldbyname('mes').asstring+'='+
           sqlgeneral6.fieldbyname('total').asstring+' where idmotivo='+sqlgeneral6.fieldbyname('idmotivo').asstring+' and anio = '+inttostr(a), 1, sqlgeneral5);
    sqlgeneral6.Next;
    end;
  querys('Update TotalMotCancelacion set total=M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12 ', 1, sqlgeneral5);

  //inserta los renglones de movimientos en cuentas
  if querys('Select movimiento from MovAnualCuentas where anio = year("'+datetostr(date)+'")', 0, sqlgeneral6) = 0 then
    begin
    querys('Insert into MovAnualCuentas (orden, movimiento, anio) values (1, "SALDO INICIAL", '+inttostr(a)+'), '+
           '(2,"ALTAS", '+inttostr(a)+'), (3, "BAJAS", year("'+datetostr(date)+'")), (4, "CREC NETO", '+inttostr(a)+'), '+
           '(5, "SALDO FINAL", '+inttostr(a)+')', 1, sqlgeneral6);
    end;

  // -- ** ALTAS ** -- //

  //Cuentas Nuevas
  CuentasVentas;
  //Altas del mes
  querys('Select count(t) as altas from ('+
         'select distinct r.idprimario as t from ( Select distinct cb.idprimario From Cambios AS cb Where cb.fecha '+
         'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" AND cb.nuevo = 1 and '+
         'idcambio in( Select min(cb.idcambio) as idcambio From Cambios AS cb Where cb.fecha '+
         'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" group by cb.idprimario)) as r '+
         'Left join Cambios as cb on (cb.idprimario=r.idprimario) where cb.idprimario in( Select distinct cb.idprimario From Cambios AS cb Where cb.fecha '+
         'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" AND cb.nuevo = 1 and idcambio in( '+
         'Select max(cb.idcambio) as idcambio From Cambios AS cb Where cb.fecha '+
         'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" group by cb.idprimario) )and cb.fecha '+
         'Between "'+f1+'" AND "'+f2+'" AND tabla = "clientes"  and campo = "estatus"'+
         ') as TAltas', 0, sqlgeneral5);
  //actualiza las ALTAS
  querys('update MovAnualCuentas set M'+inttostr(m)+'='+sqlgeneral5.fieldbyname('altas').asstring+' where movimiento = "ALTAS"  and anio ="'+inttostr(a)+'"', 1, sqlgeneral6);

  // -- ** BAJAS ** -- //
  //Bajas reales
  querys('Select count(t) as bajas from ('+
         'select distinct r.idprimario as t from ( Select distinct cb.idprimario From Cambios AS cb Where cb.fecha '+
         'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" AND cb.nuevo =0 and idcambio in( '+
         'Select min(cb.idcambio) as idcambio From Cambios AS cb Where cb.fecha '+
         'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" group by cb.idprimario)) as r '+
         'Left join Cambios as cb on (cb.idprimario=r.idprimario) where cb.idprimario in( Select distinct cb.idprimario From Cambios AS cb Where cb.fecha '+
         'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" AND cb.nuevo = 0 and idcambio in( '+
         'Select max(cb.idcambio) as idcambio From Cambios AS cb Where cb.fecha '+
         'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" group by cb.idprimario) ) and cb.fecha '+
         'Between "'+f1+'" AND "'+f2+'" AND tabla = "clientes"  and campo = "estatus"'+
         ') as TBajas', 0, sqlgeneral5);

  //actualiza las BAJAS
  querys('update MovAnualCuentas set M'+inttostr(m)+'='+sqlgeneral5.fieldbyname('bajas').asstring+' where movimiento = "BAJAS"  and anio ="'+inttostr(a)+'"', 1, sqlgeneral6);

  //Cuentas nuevas que no entraron a activas
  querys('Select count(t) as bajas from ('+
         'select distinct r.idprimario as t from ( Select distinct cb.idprimario From Cambios AS cb Where cb.fecha '+
         'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" AND cb.nuevo = 0 and idcambio in( '+
         'Select min(cb.idcambio) as idcambio From Cambios AS cb Where cb.fecha '+
         'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" group by cb.idprimario)) as r Left join '+
         'Cambios as cb on (cb.idprimario=r.idprimario) where cb.idprimario in( Select distinct cb.idprimario From Cambios AS cb Where cb.fecha '+
         'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" AND cb.anterior = 2 and idcambio in( '+
         'Select min(cb.idcambio) as idcambio From Cambios AS cb Where cb.fecha '+
         'Between "'+f1+'" AND "'+f2+'" AND cb.tabla = "clientes"  and cb.campo = "estatus" group by cb.idprimario) ) and cb.fecha '+
         'Between "'+f1+'" AND "'+f2+'" AND tabla = "clientes"  and campo = "estatus" '+
         ') as TBajas', 0, sqlgeneral5);

  //actualiza las BAJAS
  querys('update MovAnualCuentas set M'+inttostr(m)+'= M'+inttostr(m)+'-'+sqlgeneral5.fieldbyname('bajas').asstring+' where movimiento = "BAJAS"  and anio ="'+inttostr(a)+'"', 1, sqlgeneral6);


  // -- ** Actuliza el SALDO FINAL del mes actual  ** -- //

  querys('Select count(idcliente) as total, "'+inttostr(m)+'" as mes from clientes where estatus = 1',0, sqlgeneral6);
  querys('Update MovAnualCuentas set M'+inttostr(m)+'='+sqlgeneral6.fieldbyname('total').asstring+
         ' where movimiento = "SALDO FINAL"  and anio = '+inttostr(a)+'', 1, sqlgeneral5);


  //Actuliza el SALDO INICIAL del mes actual (Si no se ha creado el saldo inicial se crea)

  querys('Select M'+inttostr(m)+' from MovAnualCuentas where orden = 1 and anio = '+inttostr(a), 0, sqlgeneral6);
  if sqlgeneral6.fieldbyname('M'+inttostr(m)).asinteger = 0 then
    begin
    if dayof(today) = 1 then //Si es el dia primero calcula las activas
      begin
      querys('Select count(idcliente) as total, month("'+datetostr(date)+'") as mes from clientes where estatus = 1',0, sqlgeneral6);
      querys('Update MovAnualCuentas set M'+sqlgeneral6.fieldbyname('mes').asstring+'='+sqlgeneral6.fieldbyname('total').asstring+
             ' where movimiento =  "SALDO INICIAL"  and anio ='+inttostr(a)+'', 1, sqlgeneral5);
      end
    else
      begin  //Si no resta el crecimiento a lo actual
      querys('select sum(if(orden=2, M'+inttostr(m)+'*-1, M'+inttostr(m)+')) as M'+inttostr(m)+' from MovAnualCuentas where orden in(2,3,5) and anio ="'+inttostr(a)+'"', 0, sqlgeneral6);
      querys('Update MovAnualCuentas set M'+inttostr(m)+'='+sqlgeneral6.fieldbyname('M'+inttostr(m)).asstring+' where orden=1 and anio ="'+inttostr(a)+'"', 1, sqlgeneral5);
      end;
    end;


  //Actualiza el CRECIMIENTO NETO
  querys('select sum(if(orden=3, M'+inttostr(m)+'*-1, M'+inttostr(m)+')) as M, "h" as h from MovAnualCuentas where orden in(2,3) and anio = '+inttostr(a)+' group by h', 0, sqlgeneral5);
  querys('update MovAnualCuentas set M'+inttostr(m)+'='+sqlgeneral5.fieldbyname('M').asstring+' where orden = 4 and anio = '+inttostr(a)+'', 1, sqlgeneral6);


  //Actualiza TOTAL, PORCENTAJE Y PROMEDIO
  querys('Update MovAnualCuentas set total=M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12 where orden in(2,3,4)  and anio = '+inttostr(a)+'', 1, sqlgeneral5);
  querys('Update MovAnualCuentas set prom=round((M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12)/12,2) where orden in(2,3,4) and anio = '+inttostr(a)+'', 1, sqlgeneral5);
  //Promedio de ALTAS
  querys('Select round(sum(if(orden=2, total, 0)) /sum(if(orden=1, M1, 0)),2) as p from MovAnualCuentas where orden in(1,2) and anio = '+inttostr(a)+'',0, sqlgeneral6);
  querys('Update MovAnualCuentas set por='+sqlgeneral6.fieldbyname('p').asstring+' where orden = 2 and anio = '+inttostr(a)+'', 1,sqlgeneral5);
  //Promedio de BAJAS
  querys('Select round(sum(if(orden=3, total, 0)) /sum(if(orden=1, M1, 0)),2) as p from MovAnualCuentas where orden in(1,3) and anio = '+inttostr(a)+'',0, sqlgeneral6);
  querys('Update MovAnualCuentas set por='+sqlgeneral6.fieldbyname('p').asstring+' where orden = 3 and anio = '+inttostr(a)+'', 1, sqlgeneral5);
  //Promedio de CRECIMIENTO NETO
  querys('Select round(sum(if(orden=4, total, 0)) /sum(if(orden=1, M1, 0)),2) as p from MovAnualCuentas where orden in(1,4) and anio = '+inttostr(a)+'',0, sqlgeneral6);
  querys('Update MovAnualCuentas set por='+sqlgeneral6.fieldbyname('p').asstring+' where orden = 4 and anio = '+inttostr(a)+'', 1, sqlgeneral5);
  if imprime = false then
    exit;
  if TipoImpresion <> 'GRAF' then
    begin
    querys('Select * from MovAnualCuentas where anio = year("'+datetostr(date)+'") order by orden', 0, sqlgeneral);
    querys('Select * from TotalMotCancelacion where anio = year("'+datetostr(date)+'") order by idmotivo', 0, sqlgeneral2);
    OperacionReporte('MovimientosCuentas', 'Analisis de Movimientos en Cuentas de Central', TipoImpresion, 1);
    end
  else
    begin
    case rgopcion.ItemIndex of
      0: begin
         querys('Select total, movimiento from MovAnualCuentas where anio = year("'+datetostr(date)+'") order by total desc', 0, sqlgraf);
         sqlgraf.first;
         series1.Clear;
         while not sqlgraf.Eof = true do
           begin
           Series1.Add(sqlgraf.fieldbyname('total').AsFloat,sqlgraf.fieldbyname('movimiento').AsString);
           sqlgraf.Next;
           end;
         end;
      1: begin
         querys('Select total, motivo from tmpMotCanc'+frmprincipal.idmaq+' order by total desc', 0, sqlgraf);
         sqlgraf.first;
         series1.Clear;
         while not sqlgraf.Eof = true do
           begin
           Series1.Add(sqlgraf.fieldbyname('total').AsFloat,sqlgraf.fieldbyname('motivo').AsString);
           sqlgraf.Next;
           end;
         end;
      end;
    end;
  
  end;
end;

procedure TfrmRepMultiples.RepActivaciones;
var i:integer;
begin
with dmreportes do
  begin
  querys('Drop table if exists tmpActAnualesCentral'+frmprincipal.idmaq, 1, sqlgeneral3);
  querys('Create table tmpActAnualesCentral'+frmprincipal.idmaq+' (concepto varchar(50), M1 decimal(10,2) default 0.00, M2 decimal(10,2) default 0.00, '+
         'M3 decimal(10,2) default 0.00, M4 decimal(10,2) default 0.00, M5 decimal(10,2) default 0.00, M6 decimal(10,2) default 0.00, M7 decimal(10,2) default 0.00, M8 int(11)default '+
         '0, M9 decimal(10,2) default 0.00, M10 decimal(10,2) default 0.00, M11 decimal(10,2) default 0.00, M12 decimal(10,2) default 0.00, total int(11) default 0 )', 1, sqlgeneral3);

  //INSERTA LAS ACTIVACIONES
  querys('Insert into tmpActAnualesCentral'+frmprincipal.idmaq+' (concepto) select sufijo from alarmas_conclusion', 1, sqlgeneral3);

  querys('select count(sk.id) as total, month(fecha_pc) as mes, conclusion, sufijo from sk_alarmas as sk left join alarmas_conclusion as ac on '+
         'ac.id=sk.conclusion where year(fecha_pc) = year("'+datetostr(date)+'") group by conclusion, mes', 0, sqlgeneral3);
  sqlgeneral3.First;
  while not sqlgeneral3.Eof = true do
    begin
    querys('Update tmpActAnualesCentral'+frmprincipal.idmaq+' set M'+sqlgeneral3.fieldbyname('mes').AsString+'="'+
            sqlgeneral3.fieldbyname('total').asstring+'" where concepto="'+sqlgeneral3.fieldbyname('sufijo').asstring+'"', 1, sqlgeneral4);
    sqlgeneral3.next;
    end;

  //INSERTA EL DETALLE DE ACTIVACIONES POSITIVAS
  querys('Insert into tmpActAnualesCentral'+frmprincipal.idmaq+' (concepto) values ("PromDiario"), ("retardos"), ("tick"), ("porcento")', 1, sqlgeneral3);
  querys('Insert into tmpActAnualesCentral'+frmprincipal.idmaq+' (concepto) (Select orden from clasif_servicios where idserv = 9)', 1, sqlgeneral3);
  querys('select count(idsk) as total, month(fecha) as mes, activacion from ActivPos where year(fecha) = year("'+datetostr(date)+'") group by activacion, mes', 0, sqlgeneral3);
  sqlgeneral3.First;
  while not sqlgeneral3.Eof = true do
    begin
    querys('Update tmpActAnualesCentral'+frmprincipal.idmaq+' set M'+sqlgeneral3.fieldbyname('mes').AsString+'="'+
            sqlgeneral3.fieldbyname('total').asstring+'" where concepto="'+sqlgeneral3.fieldbyname('activacion').asstring+'"', 1, sqlgeneral4);
    sqlgeneral3.next;
    end;

  {//INSERTA LAS ASISTENCIAS Y RETARDOS
  querys('select count(aid) as total, month(fecha) as mes, "asist" as concepto from tiempo_respuesta where year(fecha) = year("'+datetostr(date)+'") '+
         'group by mes union select count(aid) as total, month(fecha) as mes, "retardos" as concepto from tiempo_respuesta where '+
         'year(fecha) = year("'+datetostr(date)+'") and tiempo > 6 group by mes ', 0, sqlgeneral3);
  sqlgeneral3.First;
  while not sqlgeneral3.Eof = true do
    begin
    querys('Update tmpActAnualesCentral'+frmprincipal.idmaq+' set M'+sqlgeneral3.fieldbyname('mes').AsString+'="'+
            sqlgeneral3.fieldbyname('total').asstring+'" where concepto="'+sqlgeneral3.fieldbyname('concepto').asstring+'"', 1, sqlgeneral4);
    sqlgeneral3.next;
    end;    }

  //Retardos, tickets asistencias, % de Retardo
  querys('Select month(fecha) as mes, '+
         'sum(asist) as asist, sum(retardos) as retardos, ifnull( round(avg(porcento),2),0) as porcento, '+
         'ifnull(round(avg(PromDiario),2),0) as PromDiario, sum(tick) as tick '+
         'From TotalAlarmas where year(fecha)=year("'+datetostr(date)+'") group by month(fecha) ', 0, sqlgeneral3);
  sqlgeneral3.First;
  while not sqlgeneral3.Eof = true do
    begin
    for i:=0 to sqlgeneral3.FieldCount-1 do
       begin
       querys('Update tmpActAnualesCentral'+frmprincipal.idmaq+' set M'+sqlgeneral3.fieldbyname('mes').AsString+'='+
       sqlgeneral3.fieldbyname(sqlgeneral3.Fields.Fields[i].FieldName).AsString+
       ' where concepto="'+sqlgeneral3.Fields.Fields[i].FieldName+'"', 1, sqlgeneral4);
       end;
    sqlgeneral3.next;
    end;

  querys('Update tmpActAnualesCentral'+frmprincipal.idmaq+' set total=M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12 ', 1, sqlgeneral4);

  querys('select sum(PromDiario)/month("'+datetostr(date)+'") as PromDiario,sum(porcento)/month("'+datetostr(date)+'") as porcento from '+
         '(select 0 as asist, if(concepto = "PromDiario", total, 0) as PromDiario, 0 as retardos,0 as porcento from '+
         'tmpActAnualesCentral'+frmprincipal.idmaq+' where concepto = "PromDiario" union select 0 as asist,0 as PromDiario, '+
         '0 as retardos,if(concepto = "porcento", total, 0)  as porcento from tmpActAnualesCentral'+frmprincipal.idmaq+' '+
         'where concepto = "porcento") as total', 0, sqlgeneral3);
  querys('Update tmpActAnualesCentral'+frmprincipal.idmaq+' set total = '+sqlgeneral3.fieldbyname('PromDiario').asstring+' where concepto = "PromDiario"', 1, sqlgeneral4);
  querys('Update tmpActAnualesCentral'+frmprincipal.idmaq+' set total = '+sqlgeneral3.fieldbyname('porcento').asstring+' where concepto = "porcento"', 1, sqlgeneral4);

  if TipoImpresion <> 'GRAF' then
    begin
    querys('Select distinct ifnull(a.status, if(concepto="retardos", "Retardos", if(concepto="porcento", "Porc. de Retardo", '+
           'if(concepto="asist", "Asistencias", if(concepto="tick", "Ordenes de Servicio", if(concepto="PromDiario", '+
           '"Prom. Diario", cs.nombre)))))) as concept, if(a.status is null, "OTROS", "ACTIVACIONES") as h, t.*, '+
           'concat("AÑO ",year("'+datetostr(date)+'")) as periodo from tmpActAnualesCentral'+frmprincipal.idmaq+
           ' as t left join alarmas_conclusion as a on t.concepto=a.sufijo left join clasif_servicios as cs on '+
           'cs.idstatus=t.concepto and idserv = 9 where total <> 0 having concept <> "CONCLUIDA SISTEMA" ', 0, sqlgeneral3);
    OperacionReporte('ActivAnualCentral', 'Activaciones de Anual de Central', TipoImpresion, 1);
    end
  else
    begin
    case rgopcion.ItemIndex of
      2: begin
         querys('Select a.status as concepto, t.total from tmpActAnualesCentral'+frmprincipal.idmaq+
           ' as t left join alarmas_conclusion as a on t.concepto=a.sufijo where total <> 0 and a.status is not null '+
           'and a.status <> "CONCLUIDA SISTEMA" order by total desc', 0, sqlgraf);
         end;
      3: begin
         querys('Select  ifnull(a.status, if(concepto="retardos", "Retardos", if(concepto="porcento", "Porc. de Retardo", '+
                'if(concepto="asist", "Asistencias", if(concepto="tick", "Ordenes de Servicio", if(concepto="PromDiario", '+
                '"Prom. Diario", cs.nombre)))))) as concepto, t.total from tmpActAnualesCentral'+frmprincipal.idmaq+' as t '+
                'left join alarmas_conclusion as a on t.concepto=a.sufijo left join clasif_servicios as cs on '+
                'cs.idstatus=t.concepto and idserv = 9 where total <> 0 and a.status is null '+
                'and concepto in("IntRobo", "robo", "asalto") order by total desc', 0, sqlgraf);
         end;
      end;
    sqlgraf.first;
         series1.Clear;
         while not sqlgraf.Eof = true do
           begin
           Series1.Add(sqlgraf.fieldbyname('total').AsFloat,sqlgraf.fieldbyname('concepto').AsString);
           sqlgraf.Next;
           end;
    
    end;
  querys('Drop table if exists tmpActAnualesCentral'+frmprincipal.idmaq, 1, sqlgeneral3);
  end;
end;

procedure TfrmRepMultiples.VentaDlls;
var f1, f2, m, v:string; a:integer;  total:double;
begin
with dmreportes do
  begin
 { for a:= 2005 to  do
    begin}
    a:= yearof(today);// 2008;
    f1:= datetostr(EncodeDate(a, 1, 1));
    f2:= datetostr(EncodeDate(a, 12, 31));
    //BUSCA LAS VENTAS  EN PEDIDOS
    querys('Select m, idusuario, sum(TotDlls) as TotDlls from ( SELECT distinct month(p.FechaRemision) as m, u.idusuario, '+
           'if(tp.comisiones =1, if (dp.tc <> 1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),0) as ToTDlls, dp.cod_cve, p.idpedido '+
           'FROM DetPedido as dp LEFT JOIN pedidos as p ON(p.idpedido=dp.idpedido) LEFT JOIN articulos as a '+
           'ON(a.cod_cve=dp.cod_cve) LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) LEFT JOIN UnidadNegocio as '+
           'tp On (tp.idUnidadNegocio=p.idUnidadNegocio) left join Comisiones as cm on cm.UnidadNegocio=tp.nombre '+
           'WHERE p.FechaRemision between "'+f1+'" and "'+f2+'" and p.estatus in(3,4) and tp.instalacion =1 and '+
           'a.idlinea = 4 and tp.comisiones = 1) as t group by m, idusuario',1,sqlgeneral3);

    sqlgeneral3.First;
    while not sqlgeneral3.eof = true do
      begin
      v:= sqlgeneral3.fieldbyname('idusuario').asstring;
      if v = '' then
        v := '0';
      if querys('Select ano from TotalVentaDlls where ano = "'+inttostr(a)+'"'+' and idvendedor='+v, 0, sqlgeneral4) = 0 then
        querys('Insert into  TotalVentaDlls (ano, idvendedor) values ("'+inttostr(a)+'", '+v+')', 1, sqlgeneral4);

      m:=sqlgeneral3.fieldbyname('TotDlls').asstring;
      if sqlgeneral3.fieldbyname('TotDlls').asstring = '' then
        m := '0';
      querys('Update TotalVentaDlls set M'+sqlgeneral3.fieldbyname('m').asstring+'='+
             m+' where ano='+inttostr(a)+' and idvendedor='+v,1, sqlgeneral5);
      sqlgeneral3.Next;
      end;

    querys(' SELECT month(p.FechaRemision) as m, u.idusuario, '+
         'round(sum(if(tp.comisiones =1, if (dp.tc <> 1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),0)),2) as ToTDlls '+
         'FROM NoDetPedido as dp LEFT JOIN NoPedidos as p ON(p.idpedido=dp.idpedido) LEFT JOIN '+
         'articulos as a ON(a.cod_cve=dp.cod_cve) LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) '+
         'LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) left join Comisiones as cm '+
         'on cm.UnidadNegocio=tp.nombre '+
         'WHERE p.FechaRemision between "'+f1+'" and "'+f2+'" and p.estatus in(3,4) and tp.instalacion =1 and a.idlinea = 4 '+
        'GROUP BY m, idusuario ',1,sqlgeneral3);

    sqlgeneral3.First;
    while not sqlgeneral3.eof = true do
      begin
      m:=sqlgeneral3.fieldbyname('TotDlls').asstring;
      if sqlgeneral3.fieldbyname('TotDlls').asstring = '' then
        m := '0';
      v:= sqlgeneral3.fieldbyname('idusuario').asstring;
      if v = '' then
        v := '0';
      querys('Update TotalVentaDlls set M'+sqlgeneral3.fieldbyname('m').asstring+'=M'+sqlgeneral3.fieldbyname('m').asstring+'+'+
             m+' where ano='+inttostr(a)+' and idvendedor='+v,1, sqlgeneral5);
      sqlgeneral3.Next;
      end;

    //BUSCA LAS NC
    querys(' select month(p.FechaRemision) as m, u.idusuario, '+
           ' round(sum(if (tp.comisiones =1, if (dnc.cant > 0,if(dnc.tc=1,(dnc.cant * dnc.costo)/nc.TipoCambio,(dnc.cant * dnc.costo)), '+
           'if(dnc.tc=1,(dnc.piezas*dnc.costo)/nc.TipoCambio, (dnc.piezas*dnc.costo))),0)),2) as ToTDlls from DetNotasCredito as dnc left join  NotasCredito as nc ON(nc.idnc=dnc.idnc) LEFT JOIN  RemiFact as rf '+
           'ON (rf.idfactura=nc.idfactura) left join pedidos as p ON(p.idpedido=rf.idpedido) LEFT JOIN articulos as a ON(a.cod_cve=dnc.cod_cve) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) '+
           'LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) WHERE p.FechaRemision between "'+f1+'" and "'+f2+'" and tp.instalacion =1  and a.idlinea = 4 and left(tp.nombre,4) <> "CCTV" GROUP BY m, idusuario',1,sqlgeneral3);
    sqlgeneral3.First;
    while not sqlgeneral3.eof = true do
      begin
      m:=sqlgeneral3.fieldbyname('TotDlls').asstring;
      if sqlgeneral3.fieldbyname('TotDlls').asstring = '' then
        m := '0';
      v:= sqlgeneral3.fieldbyname('idusuario').asstring;
      if v = '' then
        v := '0';
      querys('Update TotalVentaDlls set M'+sqlgeneral3.fieldbyname('m').asstring+'=M'+sqlgeneral3.fieldbyname('m').asstring+'-'+
             m+' where ano='+inttostr(a)+' and idvendedor='+v,1, sqlgeneral5);
      sqlgeneral3.Next;
      end;

    //BUSCA LAS NO NC
    querys(' select month(p.FechaRemision) as m, u.idusuario, '+
           ' round(sum(if (tp.comisiones =1, if (dnc.cant > 0,if(dnc.tc=1,(dnc.cant * dnc.costo)/nc.TipoCambio,(dnc.cant * dnc.costo)), '+
           'if(dnc.tc=1,(dnc.piezas*dnc.costo)/nc.TipoCambio, (dnc.piezas*dnc.costo))),0)),2) as ToTDlls from NoDetNotasCredito as dnc left join  NoNotasCredito as nc ON(nc.idnc=dnc.idnc) LEFT JOIN  NoRemiFact as rf '+
           'ON (rf.idfactura=nc.idfactura) left join NoPedidos as p ON(p.idpedido=rf.idpedido) LEFT JOIN articulos as a ON(a.cod_cve=dnc.cod_cve) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) '+
           'LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) WHERE p.FechaRemision between "'+f1+'" and "'+f2+'" and tp.instalacion =1  and a.idlinea = 4 and left(tp.nombre,4) <> "CCTV" GROUP BY m, idusuario',1,sqlgeneral3);
    sqlgeneral3.First;
    while not sqlgeneral3.eof = true do
      begin
      m:=sqlgeneral3.fieldbyname('TotDlls').asstring;
      if sqlgeneral3.fieldbyname('TotDlls').asstring = '' then
        m := '0';
      v:= sqlgeneral3.fieldbyname('idusuario').asstring;
      if v = '' then
        v := '0';
      querys('Update TotalVentaDlls set M'+sqlgeneral3.fieldbyname('m').asstring+'=M'+sqlgeneral3.fieldbyname('m').asstring+'-'+
             m+' where ano='+inttostr(a)+' and idvendedor='+v,1, sqlgeneral5);
      sqlgeneral3.Next;
      end;
    if querys('Select ano from TotalVentaDlls where ano = "'+inttostr(a)+'" and idvendedor="TOTAL"', 0, sqlgeneral4) = 0 then
        querys('Insert into  TotalVentaDlls (ano, idvendedor) values ("'+inttostr(a)+'", "TOTAL")', 1, sqlgeneral4);

    //Actualiza los TOTALES
  querys('Select sum(M1) as M1, sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, sum(M7) as M7, '+
         'sum(M8) as M8, sum(M9) as M9, sum(M10) as M10, sum(M11) as M11, sum(M12) as M12, ano from TotalVentaDlls where '+
         'idvendedor <>  "TOTAL" and ano="'+inttostr(a)+'" group by ano', 0, sqlgeneral5);
  sqlgeneral5.first;
  while not sqlgeneral5.eof = true do
    begin
    querys('update TotalVentaDlls set M1='+sqlgeneral5.fieldbyname('M1').asstring+', M2='+sqlgeneral5.fieldbyname('M2').asstring+
           ', M3='+sqlgeneral5.fieldbyname('M3').asstring+' , M4='+sqlgeneral5.fieldbyname('M4').asstring+
           ', M5='+sqlgeneral5.fieldbyname('M5').asstring+' , M6='+sqlgeneral5.fieldbyname('M6').asstring+
           ', M7='+sqlgeneral5.fieldbyname('M7').asstring+' , M8='+sqlgeneral5.fieldbyname('M8').asstring+
           ', M9='+sqlgeneral5.fieldbyname('M9').asstring+' , M10='+sqlgeneral5.fieldbyname('M10').asstring+
           ', M11='+sqlgeneral5.fieldbyname('M11').asstring+' , M12='+sqlgeneral5.fieldbyname('M12').asstring+
           ' where idvendedor = "TOTAL" and ano ='+sqlgeneral5.fieldbyname('ano').asstring, 1, sqlgeneral6);
    sqlgeneral5.Next;
    end;
   // end; //for

  querys('Update TotalVentaDlls set Total=M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12', 1, sqlgeneral5);
  querys('Update TotalVentaDlls set prom=round((M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12)/12,2)', 1, sqlgeneral5);
  querys('Delete from TotalVentaDlls where TOTAL = 0', 1, sqlgeneral5);

  querys('Select ano, total from TotalVentaDlls where idvendedor = "TOTAL" order by ano', 0, sqlgeneral3);
  sqlgeneral3.first;
  total := sqlgeneral3.fieldbyname('total').AsFloat;
  sqlgeneral3.Next;
  while not sqlgeneral3.Eof = true do
    begin
    querys('Update TotalVentaDlls set acum=total+'+floattostr(total)+', '+
           'crec=total-'+floattostr(total)+' '+
           'where ano ='+sqlgeneral3.fieldbyname('ano').AsString+' and idvendedor="TOTAL"', 1, sqlgeneral4);
    querys('Update TotalVentaDlls set por=crec/+'+floattostr(total)+' '+
           'where ano ='+sqlgeneral3.fieldbyname('ano').AsString+' and idvendedor="TOTAL"', 1, sqlgeneral4);

    querys('Select acum as total from TotalVentaDlls where idvendedor = "TOTAL" and ano='+sqlgeneral3.fieldbyname('ano').AsString, 0, sqlgeneral5);
    total := sqlgeneral5.fieldbyname('total').AsInteger;
    sqlgeneral3.Next;
    end;
  end; //with
end;


procedure TfrmRepMultiples.CuentasVentas;
var f1, f2, v:string; a, m:integer; total:double;
begin
with dmreportes do
  begin
    a:=yearof(today);
    m:=monthof(today);
    f1:= datetostr(EncodeDate(a, 1, 1));
    f2:= datetostr(EncodeDate(a, m, DaysInMonth(a, m)));
    //CUENTAS NUEVAS
    querys('Drop table if exists tmpCtasNvas'+frmprincipal.idmaq, 1, sqlgeneral8);
    querys('Create table tmpCtasNvas'+frmprincipal.idmaq+' (idusuario varchar(5), por decimal(10,2) default 0.00, crec decimal(10,2) default 0.00, acum decimal(10,2) default 0.00, '+
           'prom decimal(10,2) default 0.00, total int(11) default 0, anio int(11), M1 int(11) default 0, M2 int(11) default 0, M3 int(11) '+
           'default 0, M4 int(11) default 0, M5 int(11) default 0, M6 int(11) default 0, M7 int(11) default 0, M8 int(11) default 0, '+
           'M9 int(11) default 0, M10 int(11) default 0, M11 int(11) default 0, M12 int(11) default 0)', 1, sqlgeneral8);

    querys('SELECT  distinct count(tp.nombre) as total, u.idusuario, month(p.FechaRemision) as m '+
           'FROM pedidos as p LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) LEFT JOIN clientes as c ON (c.idcliente=p.idcliente) LEFT JOIN contratos as con ON(con.TipoCont=c.TipoCont) '+
           'LEFT JOIN UnidadNegocio as tp On(tp.idUnidadNegocio=p.idUnidadNegocio)  WHERE  p.FechaRemision between '+
           '"'+f1+'" and "'+f2+'" and p.estatus in(3,4) and tp.instalacion =1 and tp.nombre in("CONEXION","ENLACES","RECONEXION","EQUIPO","BAJAS","CONEXION2")  and con.estatus=1  '+
           'group by m, u.codigo',1,sqlgeneral3);

    sqlgeneral3.First;
    while not sqlgeneral3.Eof = true do
      begin
      v:= sqlgeneral3.fieldbyname('idusuario').asstring;
      if v = '' then
        v := '0';
      if querys('Select anio from tmpCtasNvas'+frmprincipal.idmaq+' where anio = "'+inttostr(a)+'"'+' and idusuario='+v, 0, sqlgeneral4) = 0 then
        begin
        querys('Insert into tmpCtasNvas'+frmprincipal.idmaq+' (anio, idusuario) values ("'+inttostr(a)+'", '+v+')', 1, sqlgeneral4);
        end;
      querys('Update tmpCtasNvas'+frmprincipal.idmaq+' set M'+sqlgeneral3.fieldbyname('m').asstring+'="'+
             sqlgeneral3.fieldbyname('total').asstring+'" where anio = year("'+datetostr(date)+'") and idusuario ="'+
             v+'"', 1, sqlgeneral4);
      sqlgeneral3.Next;
      end;

    if querys('Select anio from tmpCtasNvas'+frmprincipal.idmaq+' where anio = "'+inttostr(a)+'" and idusuario="TOTAL"', 0, sqlgeneral4) = 0 then
        querys('Insert into  tmpCtasNvas'+frmprincipal.idmaq+' (anio, idusuario) values ("'+inttostr(a)+'", "TOTAL")', 1, sqlgeneral4);


  //Actualiza los TOTALES
  querys('Select '+
         'sum(M1) as M1, sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, sum(M7) as M7, '+
         'sum(M8) as M8, sum(M9) as M9, sum(M10) as M10, sum(M11) as M11, sum(M12) as M12, '+
         //'sum(M'+inttostr(m)+') as M'+inttostr(m)+', '+
         'anio from tmpCtasNvas'+frmprincipal.idmaq+' where '+
         'idusuario <>  "TOTAL" and anio = "'+inttostr(a)+'" group by anio', 0, sqlgeneral5);

  while not sqlgeneral5.eof = true do
    begin
    querys('update tmpCtasNvas'+frmprincipal.idmaq+' set '+
           'M1='+sqlgeneral5.fieldbyname('M1').asstring+', M2='+sqlgeneral5.fieldbyname('M2').asstring+
           ', M3='+sqlgeneral5.fieldbyname('M3').asstring+' , M4='+sqlgeneral5.fieldbyname('M4').asstring+
           ', M5='+sqlgeneral5.fieldbyname('M5').asstring+' , M6='+sqlgeneral5.fieldbyname('M6').asstring+
           ', M7='+sqlgeneral5.fieldbyname('M7').asstring+' , M8='+sqlgeneral5.fieldbyname('M8').asstring+
           ', M9='+sqlgeneral5.fieldbyname('M9').asstring+' , M10='+sqlgeneral5.fieldbyname('M10').asstring+
           ', M11='+sqlgeneral5.fieldbyname('M11').asstring+' , M12='+sqlgeneral5.fieldbyname('M12').asstring+
           ' where idusuario = "TOTAL" and anio ='+sqlgeneral5.fieldbyname('anio').asstring, 1, sqlgeneral6);

      {querys('update MovAnualCuentas set M'+inttostr(m)+'='+sqlgeneral5.fieldbyname('M'+inttostr(m)).asstring+
           ' where orden = 2 and anio ='+sqlgeneral5.fieldbyname('anio').asstring, 1, sqlgeneral6);}

    sqlgeneral5.Next;
    end;      

  //Suma Total
  querys('Update tmpCtasNvas'+frmprincipal.idmaq+' set Total=M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12', 1, sqlgeneral5);
  //Promedio
  querys('Update tmpCtasNvas'+frmprincipal.idmaq+' set prom=round((M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12)/12,2)', 1, sqlgeneral5);
  //Borra donde el total = 0
  querys('Delete from tmpCtasNvas'+frmprincipal.idmaq+' where TOTAL = 0', 1, sqlgeneral5);

  querys('Insert into tmpCtasNvas'+frmprincipal.idmaq+' (por, prom, total, anio, M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,idusuario) '+
           'Select por, prom, total, anio, M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12,"TOTAL" AS vendedor from MovAnualCuentas '+
           'where orden = 2 and anio < year("'+datetostr(date)+'") order by anio', 1, sqlgeneral4);

  querys('Select anio, total from tmpCtasNvas'+frmprincipal.idmaq+' where idusuario = "TOTAL" order by anio', 0, sqlgeneral3);
  sqlgeneral3.first;
  total := sqlgeneral3.fieldbyname('total').AsFloat;
  sqlgeneral3.Next;
  while not sqlgeneral3.Eof = true do
    begin
    querys('Update tmpCtasNvas'+frmprincipal.idmaq+' set acum=total+'+floattostr(total)+', '+
           'crec=total-'+floattostr(total)+' '+
           'where anio ='+sqlgeneral3.fieldbyname('anio').AsString+' and idusuario="TOTAL"', 1, sqlgeneral4);
    querys('Update tmpCtasNvas'+frmprincipal.idmaq+' set por=crec/+'+floattostr(total)+' '+
           'where anio ='+sqlgeneral3.fieldbyname('anio').AsString+' and idusuario="TOTAL"', 1, sqlgeneral4);

    querys('Select acum as total from tmpCtasNvas'+frmprincipal.idmaq+' where idusuario = "TOTAL" and anio='+sqlgeneral3.fieldbyname('anio').AsString, 0, sqlgeneral5);
    total := sqlgeneral5.fieldbyname('total').AsInteger;
    sqlgeneral3.Next;
    end;
  end;   
end;

procedure TfrmRepMultiples.VentaEquipo;
var f1, f2:string; a:integer;
begin
with dmreportes do
  begin
 // for a:= 2003 to yearof(today)-1 do    begin
    a:= yearof(today);
    f1:= datetostr(EncodeDate(a, 1, 1));
    f2:= datetostr(EncodeDate(a, 12, 31));

    //BUSCA LAS VENTAS
     querys('DROP TABLE IF EXISTS tmpComVend'+frmprincipal.idmaq,1,sqlgeneral3);
     querys('create table tmpComVend'+frmprincipal.idmaq+' SELECT count(p.idpedido) as total, p.idpedido, p.idunidadnegocio, '+
           'sum(if(tp.comisiones =1, if (dp.tc <> 1,cant*dp.costo,(cant*dp.costo)/p.TipoCambio),0)) as ToTDlls, '+
           'tp.nombre as Oport, month(p.FechaRemision) as m FROM DetPedido as dp LEFT JOIN pedidos as p ON(p.idpedido=dp.idpedido) LEFT JOIN '+
           'articulos as a ON(a.cod_cve=dp.cod_cve) LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) LEFT JOIN '+
           'UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) left join Comisiones as cm '+
           'on cm.UnidadNegocio=tp.nombre '+
           'WHERE  p.FechaRemision between "'+f1+'" and "'+f2+'" and p.estatus in(3,4) and tp.instalacion =1 and a.idlinea = 4 '+
           //'and left(tp.nombre,4) <> "CCTV" '+
           'GROUP BY p.idpedido',1,sqlgeneral3);

    querys('DROP TABLE IF EXISTS tmpComVend1'+frmprincipal.idmaq,1,sqlgeneral3);
    querys('create table tmpComVend1'+frmprincipal.idmaq+' select p.idpedido, p.idunidadnegocio, '+
           'round(sum(if (tp.comisiones =1, if(dnc.cant > 0,if(dnc.tc=1,(dnc.cant * dnc.costo)/nc.TipoCambio, '+
           '(dnc.cant * dnc.costo)), if(dnc.tc=1,(dnc.piezas*dnc.costo)/nc.TipoCambio, (dnc.piezas*dnc.costo))),0)),2) '+
           'as ToTDlls, month(p.FechaRemision) as m from DetNotasCredito as dnc left join  NotasCredito as nc ON(nc.idnc=dnc.idnc) LEFT JOIN  RemiFact as rf '+
           'ON (rf.idfactura=nc.idfactura) left join pedidos as p ON(p.idpedido=rf.idpedido) LEFT JOIN articulos as a '+
           'ON(a.cod_cve=dnc.cod_cve) LEFT JOIN UnidadNegocio as tp On (tp.idUnidadNegocio=p.idUnidadNegocio) '+
           'LEFT JOIN usuarios as u ON (u.idusuario=p.idvendedor) WHERE p.FechaRemision between "'+f1+'" and "'+f2+
           '" and tp.instalacion =1 GROUP BY p.idpedido',1,sqlgeneral3);

    querys('Delete from TotalVentaEquipo where idunidadnegocio=0 and anio=year("'+datetostr(date)+'")',1, sqlgeneral3);
    querys('select t.idunidadnegocio, u.nombre as unidad, t.m, count(t.idpedido) as cantidad, '+
           'sum(t.ToTDlls- if(t1.ToTDlls is null, 0,t1.ToTDlls)) AS TotDlls FROM tmpComVend'+frmprincipal.idmaq+
           ' as t LEFT JOIN tmpComVend1'+frmprincipal.idmaq+'  as t1 ON(t.idpedido=t1.idpedido) '+
           'left join UnidadNegocio as u on u.idunidadnegocio=t.idunidadnegocio group by t.idunidadnegocio, m',1,sqlgeneral3);
    sqlgeneral3.First;
    while not sqlgeneral3.Eof = true do
      begin
        if querys('Select anio from TotalVentaEquipo where anio = "'+inttostr(a)+'"'+' and idunidadnegocio='+sqlgeneral3.fieldbyname('idunidadnegocio').asstring, 0, sqlgeneral4) = 0 then
          querys('Insert into  TotalVentaEquipo (anio, idunidadnegocio, nombre) values ("'+inttostr(a)+'", '+sqlgeneral3.fieldbyname('idunidadnegocio').asstring+', "'+sqlgeneral3.fieldbyname('unidad').asstring+'")', 1, sqlgeneral4);

        if querys('Select nombre from TotalVentaEquipo where anio = "'+inttostr(a)+'"'+' and nombre="VENTA EN DLLS"', 0, sqlgeneral4) = 0 then
          querys('Insert into  TotalVentaEquipo (anio, idunidadnegocio, nombre) values ("'+inttostr(a)+'", 0, "VENTA EN DLLS")', 1, sqlgeneral4);


      querys('Update TotalVentaEquipo set M'+sqlgeneral3.fieldbyname('m').asstring+'="'+
             sqlgeneral3.fieldbyname('cantidad').asstring+'" where anio = year("'+datetostr(date)+'") and idunidadnegocio ="'+
             sqlgeneral3.fieldbyname('idunidadnegocio').asstring+'"', 1, sqlgeneral4);
      querys('Update TotalVentaEquipo set M'+sqlgeneral3.fieldbyname('m').asstring+'=M'+sqlgeneral3.fieldbyname('m').asstring+'+'+
             sqlgeneral3.fieldbyname('TotDlls').asstring+' where anio = year("'+datetostr(date)+'") and idunidadnegocio =0', 1, sqlgeneral4);
      sqlgeneral3.Next;
      end;
   // end;

  //Actualiza los TOTALES
  querys('Delete from TotalVentaEquipo where nombre = "TOTAL" and anio=year("'+datetostr(date)+'")', 1, sqlgeneral8);
  querys('Insert into TotalVentaEquipo (nombre, anio) values ("TOTAL", year("'+datetostr(date)+'"))', 1, sqlgeneral8);
  querys('Select sum(M1) as M1, sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, sum(M7) as M7, '+
         'sum(M8) as M8, sum(M9) as M9, sum(M10) as M10, sum(M11) as M11, sum(M12) as M12, anio from TotalVentaEquipo where '+
         'nombre <>  "TOTAL" and idunidadnegocio <> 0 and anio = year("'+datetostr(date)+'") group by anio', 0, sqlgeneral5);
  sqlgeneral5.first;
  while not sqlgeneral5.eof = true do
    begin
    querys('update TotalVentaEquipo set M1='+sqlgeneral5.fieldbyname('M1').asstring+', M2='+sqlgeneral5.fieldbyname('M2').asstring+
           ', M3='+sqlgeneral5.fieldbyname('M3').asstring+' , M4='+sqlgeneral5.fieldbyname('M4').asstring+
           ', M5='+sqlgeneral5.fieldbyname('M5').asstring+' , M6='+sqlgeneral5.fieldbyname('M6').asstring+
           ', M7='+sqlgeneral5.fieldbyname('M7').asstring+' , M8='+sqlgeneral5.fieldbyname('M8').asstring+
           ', M9='+sqlgeneral5.fieldbyname('M9').asstring+' , M10='+sqlgeneral5.fieldbyname('M10').asstring+
           ', M11='+sqlgeneral5.fieldbyname('M11').asstring+' , M12='+sqlgeneral5.fieldbyname('M12').asstring+
           ' where nombre = "TOTAL" and anio ='+sqlgeneral5.fieldbyname('anio').asstring, 1, sqlgeneral6);
    sqlgeneral5.Next;
    end;

  querys('Update TotalVentaEquipo set Total=M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12', 1, sqlgeneral5);
  querys('Update TotalVentaEquipo set prom=round((M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12)/12,2)', 1, sqlgeneral5);
  end;
end;

procedure TfrmRepMultiples.LlamXFuente;
var
anio, i, fm:integer;
f1, f2:Tdate;
tmpInicio,tmpFinal,sqlTipoLlamadas:string;
begin
with dmreportes do
begin
{for anio := 2005 to  do
  begin}
  anio := yearof(today);
  sqlTipoLlamadas:= ' CASE WHEN  too.nombre  IN( "EQUIPO COMERCIAL" ,"EQUIPO RESIDENCIAL", "ENLACE" ,"CONEXION","RECONEXION") THEN "LLAMADAS X FUENTE"  END as concepto ';

  querys('Delete from TotalLlamXFuente where ano = year("'+datetostr(date)+'")', 1, sqlgeneral7);
  querys('Select sum(TOTAL) as t from  TotalLlamXFuente where ano = '+inttostr(anio)+' group by ano', 0, sqlgeneral8);
  if (sqlgeneral8.fieldbyname('t').asinteger = 0) then
    begin
    if querys('Select ano from TotalLlamXFuente where ano ='+inttostr(anio), 0, sqlgeneral) = 0 then
      begin
      tmpInicio :=  'Insert into TotalLlamXFuente (Concepto, Tipo,ano) SELECT f.nombre as f, ';
      tmpFinal := ', "'+inttostr(anio)+'" FROM fuentes as f';
      querys(tmpInicio+'"LLAMADAS X FUENTE"'+tmpFinal, 1, sqlgeneral7);
      end;

    ///llamadas por fuente
    for i:=1 to 12 do
      begin
      fm := MonthDays[IsLeapYear(anio)][i];
      f1 := EncodeDate(anio, i, 1);
      f2 := EncodeDate(anio, i, fm);
             querys('SELECT f.nombre as f,count(f.nombre) as t,'+sqlTipoLlamadas+' from agenda_vendedores as a inner join oportunidades as o on (o.idoportunidad=a.idoportunidad) '+
                    ' inner join origen as ori on (ori.idorigen=o.idorigen) inner join fuentes as f on (o.idfuente=f.idfuente) LEFT JOIN tipo_oportunidad as too ON(too.idtipo_oportunidad=a.idtipo_oportunidad) '+
                    ' where a.fecha_creacion between "'+datetostr(f1)+'" and "'+datetostr(f2)+'"  and  ori.nombre="LLAMADA"  group by f.nombre,concepto',0,sqlgeneral7);
      sqlgeneral7.first;                                                                                                             //and (av. idtipo_oportunidad=1 OR av.idtipo_oportunidad=2)
      while not sqlgeneral7.Eof = true do
        begin
        querys('Update TotalLlamXFuente set M'+inttostr(i)+'="'+sqlgeneral7.fieldbyname('t').asstring+'" where Concepto="'+sqlgeneral7.fieldbyname('f').asstring+'" and Tipo="'+sqlgeneral7.fieldbyname('concepto').asstring+'"  and ano="'+inttostr(anio)+'"', 1, sqlgeneral2);
        sqlgeneral7.Next;
        end;
      end;


    querys('Update TotalLlamXFuente set TOTAL = M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12', 1, sqlgeneral7);
    //     ',TendenciaFuentes = truncate(truncate(TOTAL/'+inttostr(fm)+',2)*12,2), CIERREP = truncate(CIERRE/'+inttostr(fm)+',2),TendenciaCierre = truncate(truncate(CIERRE/'+inttostr(fm)+',2)*12,2) '
    end;  //realizado?
 // end;//for
  querys('Select sum(TOTAL) as TOTAL, ano from TotalLlamXFuente group by ano', 0, sqlgeneral5);
  while not sqlgeneral5.Eof = true do
    begin
    querys('UPDATE TotalLlamXFuente SET TOTALP=truncate(TOTAL/'+sqlgeneral5.fieldbyname('TOTAL').asstring+',2) where ano='+sqlgeneral5.fieldbyname('ano').asstring,1,sqlgeneral2);
    sqlgeneral5.Next;
    end;

  //Actualiza los TOTALES
  querys('Delete from TotalLlamXFuente where concepto = "TOTAL" and ano=year("'+datetostr(date)+'")', 1, sqlgeneral8);
  querys('Insert into TotalLlamXFuente (concepto, ano) values ("TOTAL", year("'+datetostr(date)+'"))', 1, sqlgeneral8);
  querys('Select sum(M1) as M1, sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, sum(M7) as M7, '+
         'sum(M8) as M8, sum(M9) as M9, sum(M10) as M10, sum(M11) as M11, sum(M12) as M12, ano from TotalLlamXFuente where '+
         'concepto <>  "TOTAL" and ano = year("'+datetostr(date)+'") group by ano', 0, sqlgeneral5);
  sqlgeneral5.first;
  while not sqlgeneral5.eof = true do
    begin
    querys('update TotalLlamXFuente set M1='+sqlgeneral5.fieldbyname('M1').asstring+', M2='+sqlgeneral5.fieldbyname('M2').asstring+
           ', M3='+sqlgeneral5.fieldbyname('M3').asstring+' , M4='+sqlgeneral5.fieldbyname('M4').asstring+
           ', M5='+sqlgeneral5.fieldbyname('M5').asstring+' , M6='+sqlgeneral5.fieldbyname('M6').asstring+
           ', M7='+sqlgeneral5.fieldbyname('M7').asstring+' , M8='+sqlgeneral5.fieldbyname('M8').asstring+
           ', M9='+sqlgeneral5.fieldbyname('M9').asstring+' , M10='+sqlgeneral5.fieldbyname('M10').asstring+
           ', M11='+sqlgeneral5.fieldbyname('M11').asstring+' , M12='+sqlgeneral5.fieldbyname('M12').asstring+
           ' where concepto = "TOTAL" and ano ='+sqlgeneral5.fieldbyname('ano').asstring, 1, sqlgeneral6);
    sqlgeneral5.Next;
    end;
  querys('Update TotalLlamXFuente set TOTAL = M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12', 1, sqlgeneral7);
  end;//with
end;

procedure TfrmRepMultiples.TraeRepVentas;
begin
with dmreportes do
  begin
  if TipoImpresion <> 'GRAF' then
    begin
    case rgopcion.ItemIndex of
      0: begin
         //Ventas en Dolares
         querys('Select *, "TOTAL" as vendedor, 1 as orden from TotalVentaDlls where idvendedor = "TOTAL" union '+
                'Select t.*, '+UsuarioNombre('u')+' as vendedor, 2 as orden from TotalVentaDlls as t left join usuarios as u on '+
                't.idvendedor=u.idusuario where idvendedor <> "TOTAL" and ano = year("'+datetostr(date)+'") order by orden, ano, vendedor', 0, sqlgeneral);
         querys('Select *, anio as ano ,"TOTAL" as vendedor, 1 as orden from tmpCtasNvas'+frmprincipal.idmaq+' where idusuario = "TOTAL" union '+
                'Select t.*, anio as ano, '+UsuarioNombre('u')+' as vendedor, 2 as orden from tmpCtasNvas'+frmprincipal.idmaq+' as t left join usuarios as u on '+
                't.idusuario=u.idusuario where t.idusuario <> "TOTAL" and anio = year("'+datetostr(date)+'") order by orden, anio, vendedor', 0, sqlgeneral2);
         OperacionReporte('MultipleVentas1', '', TipoImpresion, 1);
         end;
      1: begin
         querys('Select *, 1 as orden  from TotalVentaEquipo where nombre = "TOTAL" union Select *, 2 as orden  from TotalVentaEquipo where nombre <> "TOTAL" '+
                'and idunidadnegocio=0 and anio =year("'+datetostr(date)+'") union Select *, 3 as orden  from TotalVentaEquipo where anio = year("'+datetostr(date)+'") '+
                'and idunidadnegocio <> 0 order by orden, idunidadnegocio, anio', 0, sqlgeneral);
         querys('Select *, 1 as orden, "Reporte de Control de LLamadas por Fuentes Anual" as titulo  from TotalLlamXFuente where concepto = "TOTAL" '+
                'union Select *, 2 as orden, "Reporte de Control de LLamadas por Fuentes Anual" as titulo  from TotalLlamXFuente where concepto <> "TOTAL" '+
                'and ano =year("'+datetostr(date)+'") order by orden, concepto, ano',0,sqlgeneral2);
         OperacionReporte('MultipleVentas2', '', TipoImpresion, 1);
         end;
      end;
    end
  else
    begin
    case rgopcion.ItemIndex of
      0: begin
         //Ventas en Dolares
         querys('Select t.total, '+UsuarioNombre('u')+' as vendedor from TotalVentaDlls as t left join usuarios as u on '+
                't.idvendedor=u.idusuario where idvendedor <> "TOTAL" and ano = year("'+datetostr(date)+'") order by total desc', 0, sqlgraf);
         sqlgraf.first;
         series1.Clear;
         while not sqlgraf.Eof = true do
           begin
           Series1.Add(sqlgraf.fieldbyname('total').AsFloat,sqlgraf.fieldbyname('vendedor').AsString);
           sqlgraf.Next;
           end;
         end;

      1: begin
         querys('Select t.total, '+UsuarioNombre('u')+' as vendedor from tmpCtasNvas'+frmprincipal.idmaq+' as t left join usuarios as u on '+
                't.idusuario=u.idusuario where t.idusuario <> "TOTAL" and anio = year("'+datetostr(date)+'") order by total desc', 0, sqlgraf);
         sqlgraf.first;
         series1.Clear;
         while not sqlgraf.Eof = true do
           begin
           Series1.Add(sqlgraf.fieldbyname('total').AsFloat,sqlgraf.fieldbyname('vendedor').AsString);
           sqlgraf.Next;
           end;
         end;

      2: begin
         querys('Select total, nombre from TotalVentaEquipo where anio=year("'+datetostr(date)+'") and nombre <> "VENTA EN DLLS" order by total', 0, sqlgraf);
         sqlgraf.first;
         series1.Clear;
         while not sqlgraf.Eof = true do
           begin
           Series1.Add(sqlgraf.fieldbyname('total').AsFloat,sqlgraf.fieldbyname('nombre').AsString);
           sqlgraf.Next;
           end;
         end;

      3: begin
         querys('select *,"Reporte de Control de LLamadas por Fuentes Anual" as titulo from TotalLlamXFuente where ano = year("'+datetostr(date)+'") order by total desc',0,sqlgraf);
         sqlgraf.first;
         series1.Clear;
         while not sqlgraf.Eof = true do
           begin
           Series1.Add(sqlgraf.fieldbyname('total').AsFloat,uppercase(sqlgraf.fieldbyname('concepto').AsString));
           sqlgraf.Next;
           end;
         end;
      end;
    end;
  end;
end;

procedure TfrmRepMultiples.InstTotHrsAnual;
var total:integer; f1, f2:string;
begin
f1 := datetostr(Encodedate(yearof(today), 1,1));
f2 := datetostr(today);
with dmreportes do
  begin              
  querys('Update TotalInstalaciones set M1=0, M2=0,M3=0,M4=0,M5=0,M6=0,M7=0,M8=0,M9=0,M10=0,M11=0,M12=0 where anio = year("'+datetostr(date)+'")', 1, sqlgeneral3);
  querys('insert into TotalInstalaciones (anio, CodTecnico) Select fecha as anio, codigo from  TendenciaInstaladores '+
         'where codigo not in(Select CodTecnico from TotalInstalaciones where anio = year("'+datetostr(date)+'")) and fecha = '+
         'year("'+datetostr(date)+'") group by codigo, anio', 1, sqlgeneral3);

    {querys('SELECT i.TExtra ,if(u.codigo = "", sum(p.TotHrsCom + i.TExtra)/count(u.codigo), sum(p.TotHrsCom + i.TExtra)) as total, '+
        'i.idinstalacion as Instal,u.codigo, year("'+datetostr(date)+'") as fecha, month(i.FechaFinal) as mes '+
         'FROM pedidos as p join usuarios as u INNER JOIN instalaciones as  i ON (i.idpedido=p.idpedido) WHERE year(i.FechaFinal) '+
         '= year("'+datetostr(date)+'") and (u.codigo=i.instalador1 or u.codigo=i.instalador2) and p.estatus IN(3,4) '+
         'and if(u.codigo = "",  not (instalador1 <> "" and  instalador2 = ""),  instalador1 <> "") group by codigo, mes', 1, sqlgeneral3);   }

    querys('select month(FechaFinal) as mes, year(FechaFinal ) as fecha, round(sum(TotHrs),2) as total, codigo from ( SELECT if(instalador2 <> "", '+
           '(p.TotHrsCom + i.TExtra)/2, (p.TotHrsCom + i.TExtra)) as TotHrs, 1 as cant , u.codigo, i.FechaFinal, i.idinstalacion FROM pedidos as p '+
           'INNER JOIN instalaciones as i ON (i.idpedido=p.idpedido) left join usuarios as u  on (u.codigo=i.instalador1 and length(i.instalador1) '+
           '= 3) or (u.codigo=i.instalador2 and length(i.instalador2) = 3) Left Join Estandares as e on e.idpuesto =u.idpuesto LEFT JOIN UnidadNegocio '+
           'as un On (un.idUnidadNegocio = p.idUnidadNegocio) LEFT JOIN origen as ori ON (ori.idorigen=p.idorigen) WHERE i.FechaFinal between "'+f1+
           '" and "'+f2+'" and p.estatus IN(3,4) and i.estatus = 1 and ObraEnProceso <> 1 and p.estatus in(3,4) and un.instalacion = 1 and (u.idarea = 2) '+
           'GROUP BY p.idpedido, u.codigo UNION '+
           'SELECT ((if(instalador2 <> "", (p.TotHrsCom/2), p.TotHrsCom) ) *(cs.nombre- if(cs2.nombre is null, 0, cs2.nombre)) )/100 as TotHrs, 1 as cant, '+
           'u.codigo, cs.FechaObra,  i.idinstalacion FROM pedidos as p INNER JOIN instalaciones as i ON (i.idpedido=p.idpedido) left join usuarios as u  on '+
           '(u.codigo=i.instalador1 and length(i.instalador1) = 3) or (u.codigo=i.instalador2 and length(i.instalador2) = 3) Left Join Estandares as e on '+
           'e.idpuesto =u.idpuesto Left join ObrasProceso as op on op.idinstalacion = i.idinstalacion left join ( select o.idstatus, cs.nombre, '+
           'o.idinstalacion, o.FechaObra from ObrasProceso as o  left join clasif_servicios as cs on cs.idstatus=o.idstatus and cs.idserv = 10 where '+
           'idobra in ( Select max(idobra) as idobra  from ObrasProceso as o where FechaObra between "'+f1+'" and "'+f2+'" group by idinstalacion) '+
           'group by idinstalacion) as cs on cs.idinstalacion = i.idinstalacion left join ( select o2.idstatus, cs2.nombre, o2.idinstalacion, '+
           'o2.FechaObra from ObrasProceso as o2 left join clasif_servicios as cs2 on cs2.idstatus=o2.idstatus and cs2.idserv = 10 where idobra in '+
           '( Select max(idobra) as idobra from ObrasProceso as o where FechaObra < (o.FechaObra-(day(o.FechaObra)+1)) group by idinstalacion) group by '+
           'idinstalacion ) as cs2 on i.idinstalacion=cs2.idinstalacion left join clasif_servicios as cs1 on cs1.idstatus=i.idstatus and cs1.idserv = 10 '+
           'WHERE  p.estatus IN(3,4) and ObraEnProceso = 1 and op.FechaObra between "'+f1+'" and "'+f2+'" GROUP BY p.idpedido, u.codigo )'+
           ' as tmpinst group by codigo,mes ORDER BY codigo,FechaFinal', 0, sqlgeneral3);
           


  sqlgeneral3.First;
  while not sqlgeneral3.Eof = true do
    begin
    querys('Update TotalInstalaciones set M'+sqlgeneral3.fieldbyname('mes').asstring+'=round('+sqlgeneral3.fieldbyname('total').asstring+',2) where anio = '+
           sqlgeneral3.fieldbyname('fecha').asstring+' and CodTecnico="'+sqlgeneral3.fieldbyname('codigo').asstring+'"', 1, sqlgeneral4);
    sqlgeneral3.Next;
    end;

    //Crea el codigo Z para el total por año
  querys('Delete from TotalInstalaciones where CodTecnico = "Z" and anio=year("'+datetostr(date)+'")', 1, sqlgeneral3);

  querys('insert into TotalInstalaciones (anio, CodTecnico) values(year("'+datetostr(date)+'"), "Z")', 1, sqlgeneral3);
  querys('Select sum(M1) as M1, sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, sum(M7) as M7, '+
         'sum(M8) as M8, sum(M9) as M9, sum(M10) as M10, sum(M11) as M11, sum(M12) as M12, anio from TotalInstalaciones '+
         'where CodTecnico <> "Z" and anio = year("'+datetostr(date)+'") group by anio', 0, sqlgeneral3);
  while not sqlgeneral3.eof = true do
    begin
   querys('update TotalInstalaciones set M1='+sqlgeneral3.fieldbyname('M1').asstring+', M2='+sqlgeneral3.fieldbyname('M2').asstring+', M3='+
          sqlgeneral3.fieldbyname('M3').asstring+', M4='+sqlgeneral3.fieldbyname('M4').asstring+', M5='+sqlgeneral3.fieldbyname('M4').asstring+
          ', M6='+sqlgeneral3.fieldbyname('M6').asstring+', M7='+sqlgeneral3.fieldbyname('M7').asstring+', M8='+
          sqlgeneral3.fieldbyname('M8').asstring+', M9='+sqlgeneral3.fieldbyname('M9').asstring+', M10='+sqlgeneral3.fieldbyname('M10').asstring+
          ', M11='+sqlgeneral3.fieldbyname('M11').asstring+', M12='+sqlgeneral3.fieldbyname('M12').asstring+' '+
          'where CodTecnico="Z" and anio='+sqlgeneral3.fieldbyname('anio').asstring+'',1,sqlgeneral4);
   sqlgeneral3.Next;
   end;

  querys('Update TotalInstalaciones set Total=M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12 where anio = year("'+datetostr(date)+'")', 1, sqlgeneral5);

  querys('Drop table if exists tmpMultInst'+frmprincipal.idmaq, 1, sqlgeneral8);
  querys('Create table tmpMultInst'+frmprincipal.idmaq+' Select "TOTAL" as CodTecnico, anio, total, '+
         'M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12, "I" as tu from TotalInstalaciones as t where '+
         'anio < year("'+datetostr(date)+'") and CodTecnico = "Z" union Select if(CodTecnico="Z", "TOTAL", concat(CodTecnico, " - ", ifnull('+UsuarioNombre('u')+', ""))) CodTecnico, anio,  total,M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,'+
         'M11,M12, if(CodTecnico="Z", "I", if(u.idarea="2", "I", if(u.idarea=3,"S", "O"))) as tu from TotalInstalaciones as tc left join usuarios as u on u.codigo=tc.CodTecnico '+
         'where anio = year("'+datetostr(date)+'") group by tc.CodTecnico order by anio', 1, sqlgeneral8);
  querys('Alter table tmpMultInst'+frmprincipal.idmaq+' add (acum int(11) default 0),  add (crec int(11) default 0), add (por decimal(10,2) default 0)',1,sqlgeneral8);
  querys('Select anio, total from tmpMultInst'+frmprincipal.idmaq+' where CodTecnico = "TOTAL"', 0, sqlgeneral3);

  sqlgeneral3.first;
  total := sqlgeneral3.fieldbyname('total').AsInteger;
  sqlgeneral3.Next;
  while not sqlgeneral3.Eof = true do
    begin
    querys('Update tmpMultInst'+frmprincipal.idmaq+' set acum=total+'+inttostr(total)+', '+
           'crec=total-'+inttostr(total)+' '+
           'where anio ='+sqlgeneral3.fieldbyname('anio').AsString+' and CodTecnico="TOTAL"', 1, sqlgeneral4);
    querys('Update tmpMultInst'+frmprincipal.idmaq+' set '+
           // 'por=crec/+'+inttostr(total)+' '+
           'por=if(anio= year("'+datetostr(date)+'"), round((total/12)* '+inttostr(monthof(today))+',0), total) '+
           'where anio ='+sqlgeneral3.fieldbyname('anio').AsString+' and CodTecnico="TOTAL"', 1, sqlgeneral4);

    querys('Select anio, total from tmpMultInst'+frmprincipal.idmaq+' where CodTecnico = "TOTAL"', 0, sqlgeneral5);
    total := sqlgeneral5.fieldbyname('total').AsInteger;
    sqlgeneral3.Next;
    end;
  if TipoImpresion <> 'GRAF' then
    begin
    querys('Select "Reporte Multiple de Instalaciones" as titulo, "  TOTAL" as CodTecnico, '+
           'M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12, total, anio, acum, crec, por, tu as ord from tmpMultInst'+frmprincipal.idmaq+
           ' where CodTecnico = "TOTAL" union Select "Reporte Multiple de Instalaciones" as titulo, CodTecnico, '+
           'M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12, total, anio, acum, crec, por, tu as ord from tmpMultInst'+frmprincipal.idmaq+
           ' where tu = "I" and CodTecnico <> "TOTAL" union Select "" as titulo, concat("SERVICIOS", " ", CodTecnico) as CodTecnico, '+
           //'sum(M1) as M1,sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, sum(M7) as M7, sum(M8) as M8, '+
           //'sum(M9) as M9, sum(M10) as M10, sum(M11) as M11, sum(M12) as M12, '+
           'M1, M2, M3,  M4 , M5 , M6, M7, M8, M9, M10, M11, M12, '+
           'total, anio, acum, crec, por, tu as ord from tmpMultInst'+frmprincipal.idmaq+' as t  where tu = "S" and total > 0 '+
           //'group by tu '+
           'union Select "" as titulo, concat("OTROS", " ", CodTecnico) as CodTecnico, '+
           //'sum(M1) as M1,sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, sum(M7) as M7, '+
           //'sum(M8) as M8, sum(M9) as M9, sum(M10) as M10, sum(M11) as M11, sum(M12) as M12, '+
           'M1, M2, M3,  M4 , M5 , M6, M7, M8, M9, M10, M11, M12, '+
           'total, anio, acum, crec, por, tu as ord from tmpMultInst'+frmprincipal.idmaq+' as t  where tu = "O" and total > 0 '+
           //'group by tu '+
           'order by anio,ord, CodTecnico', 0, sqlgeneral);
    operacionreporte('MultipleServicios', 'Reporte Multiple de Instalaciones', TipoImpresion, 1);
    end
  else
    begin
    querys('Select CodTecnico, total from tmpMultInst'+frmprincipal.idmaq+' where tu = "I" and CodTecnico <> "TOTAL" '+
           'union Select "SERVICIOS" as CodTecnico, total from tmpMultInst'+frmprincipal.idmaq+' as t  where tu = "S" and total <> "0" '+
           'group by tu union Select "OTROS" as CodTecnico, total from tmpMultInst'+frmprincipal.idmaq+' as t  where tu = "O" group by tu '+
           'order by total desc', 0, sqlgraf);
    sqlgraf.first;
    series1.Clear;
    while not sqlgraf.Eof = true do
      begin
      Series1.Add(sqlgraf.fieldbyname('total').AsFloat,sqlgraf.fieldbyname('CodTecnico').AsString);
      sqlgraf.Next;
      end;
    end;
  end;
end;

procedure TfrmRepMultiples.CobranzaVencidos;
var ano:integer;
begin
if monthof(today) = 1 then
  ano := yearof(today)-1
else
  ano := yearof(today);
with dmreportes do
  begin
Repeat
  querys('Delete from TotalCobVencidos where ano = "'+inttostr(ano)+'"', 1, sqlgeneral6);
  querys('Insert into TotalCobVencidos (ano, idsector, orden, concepto) Select "'+inttostr(ano)+'", "0", 1, "SALDO TOTAL" from sectores union Select "'+inttostr(ano)+'", idsector, 1, "SALDO TOTAL" from sectores', 1, sqlgeneral6);
  querys('Insert into TotalCobVencidos (ano, idsector, orden, concepto) Select "'+inttostr(ano)+'", "0", 2, "SALDO VENCIDO" from sectores union Select "'+inttostr(ano)+'", idsector, 2, "SALDO VENCIDO" from sectores', 1, sqlgeneral6);
  querys('Insert into TotalCobVencidos (ano, idsector, orden, concepto) Select "'+inttostr(ano)+'", "0", 3, "% VENC/TOTAL" from sectores union Select "'+inttostr(ano)+'", idsector, 3, "% VENC/TOTAL" from sectores', 1, sqlgeneral6);
  querys('Insert into TotalCobVencidos (ano, idsector, orden, concepto) Select "'+inttostr(ano)+'", "0", 4, "VENCIDO A MAS DE 90 DIAS" from sectores union Select "'+inttostr(ano)+'", idsector, 4, "VENCIDO A MAS DE 90 DIAS" from sectores', 1, sqlgeneral6);
  querys('Insert into TotalCobVencidos (ano, idsector, orden, concepto) Select "'+inttostr(ano)+'", "0", 5, "% VENC90/TOTAL" from sectores union Select "'+inttostr(ano)+'", idsector, 5, "% VENC90/TOTAL" from sectores', 1, sqlgeneral6);
  querys('Insert into TotalCobVencidos (ano, idsector, orden, concepto) Select "'+inttostr(ano)+'", "0", 6, "CUENTAS SALDO VENCIDO" from sectores union Select "'+inttostr(ano)+'", idsector, 6, "CUENTAS SALDO VENCIDO" from sectores', 1, sqlgeneral6);
  querys('Insert into TotalCobVencidos (ano, idsector, orden, concepto) Select "'+inttostr(ano)+'", "0", 7, "SALDO PROMEDIO X CUENTA" from sectores union Select "'+inttostr(ano)+'", idsector, 7, "SALDO PROMEDIO X CUENTA" from sectores', 1, sqlgeneral6);

  querys('Select sector, sum(restante) as restante, sum(VENCIDO) as vencido, sum(columna2) as c2, count(idcliente) as cuentas, '+
         'mes, ano From RepAntiguedadSaldos AS r where ano = "'+inttostr(ano)+'" group by mes, ano, sector order by ano, sector, mes', 0, sqlgeneral6);
  sqlgeneral6.First;
  while not sqlgeneral6.Eof = true do
    begin
    querys('Update TotalCobVencidos set M'+inttostr(idmes(sqlgeneral6.fieldbyname('mes').AsString))+'='+sqlgeneral6.fieldbyname('restante').AsString+
           ' where ano='+sqlgeneral6.fieldbyname('ano').AsString+' and orden in(1, 3, 5) and idsector='+sqlgeneral6.fieldbyname('sector').AsString+'', 1, sqlgeneral7);

    querys('Update TotalCobVencidos set M'+inttostr(idmes(sqlgeneral6.fieldbyname('mes').AsString))+'='+sqlgeneral6.fieldbyname('vencido').AsString+
           ' where ano='+sqlgeneral6.fieldbyname('ano').AsString+' and orden in(2, 7) and idsector='+sqlgeneral6.fieldbyname('sector').AsString+'', 1, sqlgeneral7);

    querys('Update TotalCobVencidos set M'+inttostr(idmes(sqlgeneral6.fieldbyname('mes').AsString))+'='+sqlgeneral6.fieldbyname('c2').AsString+
           ' where ano='+sqlgeneral6.fieldbyname('ano').AsString+' and orden = 4 and idsector='+sqlgeneral6.fieldbyname('sector').AsString+'', 1, sqlgeneral7);
    querys('Update TotalCobVencidos set M'+inttostr(idmes(sqlgeneral6.fieldbyname('mes').AsString))+'='+sqlgeneral6.fieldbyname('cuentas').AsString+
           ' where ano='+sqlgeneral6.fieldbyname('ano').AsString+' and orden = 6 and idsector='+sqlgeneral6.fieldbyname('sector').AsString+'', 1, sqlgeneral7);
    sqlgeneral6.Next;
    end;
  querys('Update TotalCobVencidos set Total=M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12 where ano = "'+inttostr(ano)+'"', 1, sqlgeneral5);

  querys('Select sum(total) as total, sum(M1) as M1, sum(M2) as M2, sum(M3) as M3, sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, sum(M7) as M7, '+
         'sum(M8) as M8, sum(M9) as M9, sum(M10) as M10, sum(M11) as M11, sum(M12) as M12, ano, orden from TotalCobVencidos group by ano, orden', 0, sqlgeneral3);
  while not sqlgeneral3.eof = true do
    begin
   querys('update TotalCobVencidos set total='+sqlgeneral3.fieldbyname('total').asstring+', M1='+sqlgeneral3.fieldbyname('M1').asstring+', M2='+sqlgeneral3.fieldbyname('M2').asstring+', M3='+
          sqlgeneral3.fieldbyname('M3').asstring+', M4='+sqlgeneral3.fieldbyname('M4').asstring+', M5='+sqlgeneral3.fieldbyname('M4').asstring+
          ', M6='+sqlgeneral3.fieldbyname('M6').asstring+', M7='+sqlgeneral3.fieldbyname('M7').asstring+', M8='+
          sqlgeneral3.fieldbyname('M8').asstring+', M9='+sqlgeneral3.fieldbyname('M9').asstring+', M10='+sqlgeneral3.fieldbyname('M10').asstring+
          ', M11='+sqlgeneral3.fieldbyname('M11').asstring+', M12='+sqlgeneral3.fieldbyname('M12').asstring+' '+
          'where orden='+sqlgeneral3.fieldbyname('orden').asstring+' and ano='+sqlgeneral3.fieldbyname('ano').asstring+' and idsector=0',1,sqlgeneral4);
   sqlgeneral3.Next;
   end;

  querys('Select idsector, ano, orden, total, M1, M2, M3, M4, M5, M6, M7, M8, M9, M10, M11, M12 from TotalCobVencidos where orden = 2', 0, sqlgeneral6);
  sqlgeneral6.First;
  while not sqlgeneral6.Eof = true do
    begin
    querys('Update TotalCobVencidos set total='+sqlgeneral6.fieldbyname('total').AsString+'/total*100, M1=if(M1=0, 0, '+sqlgeneral6.fieldbyname('M1').AsString+'/M1*100), M2=if(M2=0, 0, '+sqlgeneral6.fieldbyname('M2').AsString+'/M2*100), '+
           'M3=if(M3=0, 0, '+sqlgeneral6.fieldbyname('M3').AsString+'/M3*100),M4=if(M4=0, 0, '+sqlgeneral6.fieldbyname('M4').AsString+'/M4*100),M5=if(M5=0, 0, '+sqlgeneral6.fieldbyname('M5').AsString+'/M5*100),'+
           'M6=if(M6=0, 0, '+sqlgeneral6.fieldbyname('M6').AsString+'/M6*100),M7=if(M7=0, 0, '+sqlgeneral6.fieldbyname('M7').AsString+'/M7*100),M8=if(M8=0, 0, '+sqlgeneral6.fieldbyname('M8').AsString+'/M8*100),'+
           'M9=if(M9=0, 0, '+sqlgeneral6.fieldbyname('M9').AsString+'/M9*100),M10=if(M10=0, 0, '+sqlgeneral6.fieldbyname('M10').AsString+'/M10*100),M11=if(M11=0, 0, '+sqlgeneral6.fieldbyname('M11').AsString+'/M11*100),'+
           'M12=if(M12=0, 0, '+sqlgeneral6.fieldbyname('M12').AsString+'/M12*100) '+
           'where ano='+sqlgeneral6.fieldbyname('ano').AsString+' and orden = 3 and idsector='+sqlgeneral6.fieldbyname('idsector').AsString+'', 1, sqlgeneral7);
    sqlgeneral6.Next;
    end;

  querys('Select idsector, ano, orden, total, M1, M2, M3, M4, M5, M6, M7, M8, M9, M10, M11, M12 from TotalCobVencidos where orden = 4', 0, sqlgeneral6);
  sqlgeneral6.First;
  while not sqlgeneral6.Eof = true do
    begin
    querys('Update TotalCobVencidos set total='+sqlgeneral6.fieldbyname('total').AsString+'/total*100, M1=if(M1=0, 0, '+sqlgeneral6.fieldbyname('M1').AsString+'/M1*100), M2=if(M2=0, 0, '+sqlgeneral6.fieldbyname('M2').AsString+'/M2*100), '+
           'M3=if(M3=0, 0, '+sqlgeneral6.fieldbyname('M3').AsString+'/M3*100),M4=if(M4=0, 0, '+sqlgeneral6.fieldbyname('M4').AsString+'/M4*100),M5=if(M5=0, 0, '+sqlgeneral6.fieldbyname('M5').AsString+'/M5*100),'+
           'M6=if(M6=0, 0, '+sqlgeneral6.fieldbyname('M6').AsString+'/M6*100),M7=if(M7=0, 0, '+sqlgeneral6.fieldbyname('M7').AsString+'/M7*100),M8=if(M8=0, 0, '+sqlgeneral6.fieldbyname('M8').AsString+'/M8*100),'+
           'M9=if(M9=0, 0, '+sqlgeneral6.fieldbyname('M9').AsString+'/M9*100),M10=if(M10=0, 0, '+sqlgeneral6.fieldbyname('M10').AsString+'/M10*100),M11=if(M11=0, 0, '+sqlgeneral6.fieldbyname('M11').AsString+'/M11*100),'+
           'M12=if(M12=0, 0, '+sqlgeneral6.fieldbyname('M12').AsString+'/M12*100) '+
           'where ano='+sqlgeneral6.fieldbyname('ano').AsString+' and orden = 5 and idsector='+sqlgeneral6.fieldbyname('idsector').AsString+'', 1, sqlgeneral7);
    sqlgeneral6.Next;
    end;

  querys('Select idsector, ano, orden, total, M1, M2, M3, M4, M5, M6, M7, M8, M9, M10, M11, M12 from TotalCobVencidos where orden = 6', 0, sqlgeneral6);
  sqlgeneral6.First;
  while not sqlgeneral6.Eof = true do
    begin
    querys('Update TotalCobVencidos set total=total/'+sqlgeneral6.fieldbyname('total').AsString+', M1=if(M1=0, 0, M1/'+sqlgeneral6.fieldbyname('M1').AsString+'), M2=if(M2=0, 0, M2/'+sqlgeneral6.fieldbyname('M2').AsString+'), '+
           'M3=if(M3=0, 0, M3/'+sqlgeneral6.fieldbyname('M3').AsString+'),M4=if(M4=0, 0, M4/'+sqlgeneral6.fieldbyname('M4').AsString+'),M5=if(M5=0, 0, M5/'+sqlgeneral6.fieldbyname('M5').AsString+'),'+
           'M6=if(M6=0, 0, M6/'+sqlgeneral6.fieldbyname('M6').AsString+'),M7=if(M7=0, 0, M7/'+sqlgeneral6.fieldbyname('M7').AsString+'),M8=if(M8=0, 0, M8/'+sqlgeneral6.fieldbyname('M8').AsString+'),'+
           'M9=if(M9=0, 0, M9/'+sqlgeneral6.fieldbyname('M9').AsString+'),M10=if(M10=0, 0, M10/'+sqlgeneral6.fieldbyname('M10').AsString+'),M11=if(M11=0, 0, M11/'+sqlgeneral6.fieldbyname('M11').AsString+'),'+
           'M12=if(M12=0, 0, M12/'+sqlgeneral6.fieldbyname('M12').AsString+') '+
           'where ano='+sqlgeneral6.fieldbyname('ano').AsString+' and orden = 7 and idsector='+sqlgeneral6.fieldbyname('idsector').AsString+'', 1, sqlgeneral7);
    sqlgeneral6.Next;
    end;

inc(ano);
Until ano >= yearof(today);

  if TipoImpresion <> 'GRAF' then
    begin
    querys('select 1 as o, concat(ano, ", ", "TOTAL") as sector, t.* from TotalCobVencidos as t where idsector = 0 union select 2 as o, idsector as sector, t.*  from TotalCobVencidos as t '+
           'where idsector <> 0 order by o asc, ano desc, sector, orden asc', 0, sqlgeneral);
    OperacionReporte('MultipleCobranza', 'Reporte Multiple de Cobranza', TipoImpresion,1);
    end
  else
    begin
    querys('select concepto, t.total from TotalCobVencidos as t where idsector = 0 and orden in(1,2,4) order by total desc', 0, sqlgraf);
    sqlgraf.first;
    series1.Clear;
    while not sqlgraf.Eof = true do
      begin
      Series1.Add(sqlgraf.fieldbyname('total').AsFloat,sqlgraf.fieldbyname('concepto').AsString);
      sqlgraf.Next;
      end;
    end;
  end;
end;

procedure TfrmRepMultiples.CuentasXContratoRM;
begin
CuentasXContrato;
querys('Select if(cn.estatus = 1, "ACTIVOS", "INACTIVOS") as contrato, "" as TipoCont, t.ano, sum(M1) as M1, sum(M2) as M2, sum(M3) as M3, '+
       'sum(M4) as M4, sum(M5) as M5, sum(M6) as M6, sum(M7) as M7, sum(M8) as M8, sum(M9) as M9, sum(M10) as M10, sum(M11) as M11, sum(M12) as M12, '+
       '"R" as tip, cn.estatus, round((sum(M1) + sum(M2) + sum(M3) + sum(M4) + sum(M5) + sum(M6) + sum(M7) + sum(M8) + sum(M9) + sum(M10) '+
       '+ sum(M11) + sum(M12))/12,0)  as prom, sum(M1) + sum(M2) + sum(M3) + sum(M4) + sum(M5) + sum(M6) + sum(M7) + sum(M8) + sum(M9) '+
       '+ sum(M10) + sum(M11) + sum(M12)  as tot From TotalContratos as t Left Join contratos AS cn ON t.TipoCont = cn.TipoCont group by '+
       'ano, contrato union Select  if(t.TipoCont = "SIN", "SIN CONTRATO", cn.nombre) as contrato, t.*, "D" as tip, cn.estatus, '+
       'round((M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12)/12,0) as prom, (M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12) as total '+
       'From TotalContratos as t Left Join contratos AS cn ON t.TipoCont = cn.TipoCont where ano = year("'+datetostr(date)+'") group by cn.TipoCont '+
       'order by ano asc, tip desc, estatus desc, TipoCont asc ', 0, dmreportes.sqlgeneral);
OperacionReporte('CuentasContrato', 'CuentasContrato', TipoImpresion, 1);
end;



procedure TfrmRepMultiples.FormShow(Sender: TObject);
begin
ComboYear(cbano);
end;

End.


