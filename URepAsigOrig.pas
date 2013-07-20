{///////////////////////////////////////////////////////////////////////////////
2008/05/05 dalyla fechas en mensual
}///////////////////////////////////////////////////////////////////////////////
unit URepAsigOrig;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, DateUtils,
  cxGridDBTableView, cxGrid, MemDS, DBAccess, MyAccess, StdCtrls, Mask,
  RzEdit, RzButton, RzCmboBx, ComCtrls, RzDTP, ExtCtrls, RzPanel, RzRadGrp,
  RzLabel;

type
  TfrmRepAsigOrig = class(TForm)
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RGConsulta: TRzRadioGroup;
    edsemana: TRzDateTimePicker;
    edmes: TRzComboBox;
    btnGenerar: TRzBitBtn;
    btnCerrar: TRzBitBtn;
    edano: TRzEdit;
    sqlgeneral: TMyQuery;
    sqlgeneral2: TMyQuery;
    procedure btnGenerarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
   procedure year;
   procedure mes;
   procedure semana;
  public
    { Public declarations }
  end;

var
  frmRepAsigOrig: TfrmRepAsigOrig;

implementation

uses Udm, Urecursos, Uprincipal, Udmrep;

{$R *.dfm}

procedure TfrmRepAsigOrig.btnGenerarClick(Sender: TObject);
begin
Case RGConsulta.ItemIndex of
  0: begin // Año
     if edano.text = '' then
       begin
       application.MessageBox('No Escribio el Año', 'Aviso', MB_ICONINFORMATION);
       exit;
       end;
     year;
     if dmreportes.sqlgeneral.recordcount > 0 then
       OperacionReporte('AsigOrigAnual', '', 'IMP', 1);
     end;
  1: begin // Mes
      if (edano.text = '') or (edano.text = '') then
       begin
       application.MessageBox('No Escribio el Año o el Mes', 'Aviso', MB_ICONINFORMATION);
       exit;
       end;
     mes;
     if dmreportes.sqlgeneral.recordcount > 0 then
       OperacionReporte('AsigOrigMensual', '', 'IMP', 1);
     end;
  2: begin // Semana
     semana;
     if dmreportes.sqlgeneral.recordcount > 0 then
       OperacionReporte('AsigOrigSemanal', '', 'IMP', 1);
     end;

  end;
end;

procedure TfrmRepAsigOrig.year;
var
i, fm:integer;
f1, f2:Tdate;
begin
// CREA LA TABLA //
     querys('Drop table if exists tmpAsigOrigAnual'+frmprincipal.idmaq, 1, sqlgeneral);
     querys('Create Table tmpAsigOrigAnual'+frmprincipal.idmaq+' (Concepto varchar(30), Tipo varchar(30), '+
            'ano int(11), M1 int(11) default 0, M2 int(11) default 0, M3 int(11) default 0, M4 int(11) default 0, '+
            'M5 int(11) default 0, M6 int(11) default 0, M7 int(11) default 0, M8 int(11) default 0, M9 int(11) '+
            'default 0, M10 int(11) default 0, M11 int(11) default 0, M12 int(11) default 0, TOTAL int(11) default 0, '+
            'TOTALP float default 0.00, CIERRE int(11) default 0, CIERREP float default 0.00)', 1, sqlgeneral);

     // INSERTA LOS TIPOS DE FUENTES //
     f1 := EncodeDate(strtoint(edano.text), 1, 1);
     f2 := EncodeDate(strtoint(edano.text), 12, 31);
     querys('Insert into tmpAsigOrigAnual'+frmprincipal.idmaq+' (Concepto, ano, Tipo) SELECT ori.nombre as o, "'+
            edano.text+'", top.nombre as top '+
            'FROM origen as ori left join oportunidades as o on ori.idorigen=o.idorigen left join agenda_vendedores as '+
            'av on av.idoportunidad=o.idoportunidad left join tipo_oportunidad as top on(top.idtipo_oportunidad = '+
            'av.idtipo_oportunidad) where o.alta between "'+datetostr(f1)+'" and "'+datetostr(f2)+'" group by top.nombre, '+
            'ori.nombre', 1, sqlgeneral);
                        
     // INSERTA TOTAL POR DIAS //
     for i:=1 to 12 do
        begin
        fm := MonthDays[IsLeapYear(strtoint(edano.text))][i];
        f1 := EncodeDate(strtoint(edano.text), i, 1);
        f2 := EncodeDate(strtoint(edano.text), i, fm);

        querys('SELECT o.fecha,ori.nombre as o,count(ori.nombre) as t, top.nombre as top FROM origen as ori left join oportunidades as o on '+
               'ori.idorigen=o.idorigen left join agenda_vendedores as av on av.idoportunidad=o.idoportunidad left join '+
               'tipo_oportunidad as top on top.idtipo_oportunidad=av.idtipo_oportunidad where o.alta between "'+
               datetostr(f1)+'" and "'+datetostr(f2)+'" group by top.nombre, ori.nombre', 0, sqlgeneral);
        sqlgeneral.first;
        while not sqlgeneral.Eof = true do
          begin
          querys('Update tmpAsigOrigAnual'+frmprincipal.idmaq+' set M'+inttostr(i)+' = "'+sqlgeneral.fieldbyname('t').asstring+'" '+
                 'where Concepto= "'+sqlgeneral.fieldbyname('o').asstring+'" and Tipo = "'+sqlgeneral.fieldbyname('top').asstring+'"', 1, sqlgeneral2);
          sqlgeneral.Next;
          end;
        end;

     f1 := EncodeDate(strtoint(edano.text), 1, 1);
     f2 := EncodeDate(strtoint(edano.text), 12, 31);
     //  INSERTA LOS QUE SE HICIERON CLIENTES //
     querys('SELECT count(o.idoportunidad) as clientes, o.fecha,ori.nombre as o,count(ori.nombre) as t, top.nombre as top '+
            'FROM origen as ori left join oportunidades as o on ori.idorigen=o.idorigen left join agenda_vendedores as av '+
            'on av.idoportunidad=o.idoportunidad left join tipo_oportunidad as top on top.idtipo_oportunidad = '+
            'av.idtipo_oportunidad where o.alta between "'+datetostr(f1)+'" and "'+datetostr(f2)+'" and o.estatus = "CLIENTE" '+
            'group by top.nombre, ori.nombre', 0, sqlgeneral);
     sqlgeneral.first;
        while not sqlgeneral.Eof = true do
          begin
          querys('Update tmpAsigOrigAnual'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('clientes').asstring)+' '+
                 'where Concepto="'+sqlgeneral.fieldbyname('o').asstring+'" and Tipo = "'+sqlgeneral.fieldbyname('top').asstring+'"', 1, sqlgeneral2);
          sqlgeneral.Next;
          end;

     // saca el Total por Concepto
     querys('Update tmpAsigOrigAnual'+frmprincipal.idmaq+' set TOTAL = M1+M2+M3+M4+M5+M6+M7+M8+M9+M10+M11+M12', 1, sqlgeneral);
      //  saca el Total por Dia
     querys('Insert into tmpAsigOrigAnual'+frmprincipal.idmaq+' (Concepto, ano, M1,M2,M3,M4,M5,M6,M7,M8,M9,M10,M11,M12, TOTAL, CIERRE)'+
            'Select "TOTAL", ano, sum(M1),sum(M2),sum(M3),sum(M4),sum(M5),sum(M6),sum(M7),sum(M8),sum(M9),sum(M10),sum(M11),sum(M12),sum(TOTAL),sum(CIERRE) from tmpAsigOrigAnual'+frmprincipal.idmaq+' group by ano', 1, sqlgeneral);
     //Saca el  porcentaje
    querys('Select TOTAL, CIERRE from tmpAsigOrigAnual'+frmprincipal.idmaq+' where Concepto = ''TOTAL''', 0, dmreportes.sqlgeneral8);
    if dmreportes.sqlgeneral8.RecordCount > 0 then
       begin
     querys('Update tmpAsigOrigAnual'+frmprincipal.idmaq+' set TOTALP = Format((TOTAL*100)/'+dmreportes.sqlgeneral8.fieldbyname('TOTAL').asstring+', 2)', 1, sqlgeneral);
     querys('Update tmpAsigOrigAnual'+frmprincipal.idmaq+' set CIERREP = Format((CIERRE*100)/'+dmreportes.sqlgeneral8.fieldbyname('CIERRE').asstring+', 2)', 1, sqlgeneral);
        end
     else
       begin
       application.MessageBox('No se encontraron registros', 'Aviso', MB_ICONINFORMATION);
       exit;
       end;

     querys('select * from tmpAsigOrigAnual'+frmprincipal.idmaq+' where ano = '+quotedstr(edano.text),0,dmreportes.sqlgeneral);
     querys('Drop table if exists tmpAsigOrigAnual'+frmprincipal.idmaq, 1, sqlgeneral);
end;

procedure TfrmRepAsigOrig.mes;
var
i, fm:integer;
f1, f2:Tdate;
begin
// CREA LA TABLA //
     querys('Drop table if exists tmpAsigOrigMes'+frmprincipal.idmaq, 1, sqlgeneral);
     querys('Create Table tmpAsigOrigMes'+frmprincipal.idmaq+' (Concepto varchar(30), Tipo varchar(30), ano int(11), MES varchar(30), D1 int(11) default 0 , D2 int(11) default 0, D3 int(11) default 0, D4 int(11) default 0, '+
            'D5 int(11) default 0, D6 int(11) default 0, D7 int(11) default 0, D8 int(11) default 0, D9 int(11) default 0, D10 int(11) default 0, D11 int(11) default 0, D12 int(11) default 0, D13 int(11) default 0, '+
            'D14 int(11) default 0, D15 int(11) default 0, D16 int(11) default 0, D17 int(11) default 0, D18 int(11) default 0, D19 int(11) default 0, D20 int(11) default 0, D21 int(11) default 0, D22 int(11) default 0, '+
            'D23 int(11) default 0, D24 int(11) default 0, D25 int(11) default 0, D26 int(11) default 0, D27 int(11) default 0, D28 int(11) default 0, D29 int(11) default 0, D30 int(11) default 0, '+
            'D31 int(11) default 0, TOTAL int(11) default 0, TOTALP float default 0.00, CIERRE int(11) default 0, CIERREP float default 0.00)', 1, sqlgeneral);

     // INSERTA LOS TIPOS DE FUENTES //
     f1 := EncodeDate(strtoint(edano.text), edmes.ItemIndex+1, 1);
     fm := MonthDays[IsLeapYear(strtoint(edano.text))][edmes.ItemIndex+1];
     f2 := EncodeDate(strtoint(edano.text), edmes.ItemIndex+1, fm);
     querys('Insert into tmpAsigOrigMes'+frmprincipal.idmaq+' (Concepto, Tipo, ano, MES) SELECT ori.nombre as o, top.nombre, '+quotedstr(edano.text)+', '+quotedstr(edmes.text)+' as mes FROM origen as ori left join oportunidades as o on (ori.idorigen=o.idorigen) left join agenda_vendedores as av on (av.idoportunidad=o.idoportunidad) '+
            'left join tipo_oportunidad as top on(top.idtipo_oportunidad=av.idtipo_oportunidad) where o.alta between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+
            'group by top.nombre, ori.nombre', 1, sqlgeneral);

     // INSERTA TOTAL POR DIAS //
     for i:=1 to fm do
        begin
        f1 := EncodeDate(strtoint(edano.text), edmes.ItemIndex+1, i);
        querys('SELECT o.fecha,ori.nombre as o,count(ori.nombre) as t, top.nombre as top FROM origen as ori left join oportunidades as o on (ori.idorigen=o.idorigen) left join agenda_vendedores as av on (av.idoportunidad=o.idoportunidad) '+
               'left join tipo_oportunidad as top on(top.idtipo_oportunidad=av.idtipo_oportunidad) where o.alta = '+quotedstr(datetostr(f1))+
               'group by top.nombre,  ori.nombre', 0, sqlgeneral);
        sqlgeneral.first;
        while not sqlgeneral.Eof = true do
          begin
          querys('Update tmpAsigOrigMes'+frmprincipal.idmaq+' set D'+inttostr(i)+'='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto='+quotedstr(sqlgeneral.fieldbyname('o').asstring)+ ' and Tipo = '+quotedstr(sqlgeneral.fieldbyname('top').asstring)+ '', 1, sqlgeneral2);
          sqlgeneral.Next;
          end;
        end;

     //  INSERTA LOS QUE SE HICIERON CLIENTES //
     f1 := EncodeDate(strtoint(edano.text), edmes.ItemIndex+1, 1);
     fm := MonthDays[IsLeapYear(strtoint(edano.text))][edmes.ItemIndex+1];
     f2 := EncodeDate(strtoint(edano.text), edmes.ItemIndex+1, fm);
     querys('SELECT count(o.idoportunidad) as clientes, o.fecha,ori.nombre as o,count(ori.nombre) as t, top.nombre as top FROM origen as ori left join oportunidades as o on (ori.idorigen=o.idorigen)  '+
            ' left join agenda_vendedores as av on (av.idoportunidad=o.idoportunidad) left join tipo_oportunidad as top on(top.idtipo_oportunidad=av.idtipo_oportunidad) where o.alta between '+
            quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+' and (o.estatus = "CLIENTE") group by top.nombre,   ori.nombre', 0, sqlgeneral);
     sqlgeneral.first;
        while not sqlgeneral.Eof = true do
          begin
          querys('Update tmpAsigOrigMes'+frmprincipal.idmaq+' set CIERRE ='+quotedstr(sqlgeneral.fieldbyname('clientes').asstring)+
                 ' where Concepto='+quotedstr(sqlgeneral.fieldbyname('o').asstring)+' and Tipo = '+quotedstr(sqlgeneral.fieldbyname('top').asstring)+'' , 1, sqlgeneral2);
          sqlgeneral.Next;
          end;
     // saca el Total por Concepto
     querys('Update tmpAsigOrigMes'+frmprincipal.idmaq+' set TOTAL = D1+D2+D3+D4+D5+D6+D7+D8+D9+D10+D11+D12+D13+D14+D15+D16+D17+D18+D19+D20+D21+D22+D23+D24+D25+D26+D27+D28+D29+D30+D31', 1, sqlgeneral);
      //  saca el Total por Dia
     querys('Insert into tmpAsigOrigMes'+frmprincipal.idmaq+' (Concepto, ano, MES, D1,D2,D3,D4,D5,D6,D7,D8,D9,D10,D11,D12,D13,D14,D15,D16,D17,D18,D19,D20,D21,D22,D23,D24,D25,D26,D27,D28,D29,D30,D31, TOTAL, CIERRE)'+
            'Select ''TOTAL'', ano, MES, sum(D1),sum(D2),sum(D3),sum(D4),sum(D5),sum(D6),sum(D7),sum(D8),sum(D9),sum(D10),sum(D11),sum(D12),sum(D13),sum(D14),sum(D15),sum(D16),sum(D17),sum(D18),sum(D19),sum(D20),'+
            'sum(D21),sum(D22),sum(D23),sum(D24),sum(D25),sum(D26),sum(D27),sum(D28),sum(D29),sum(D30),sum(D31),sum(TOTAL),sum(CIERRE) from tmpAsigOrigMes'+frmprincipal.idmaq+' group by MES', 1, sqlgeneral);
     //Saca el  porcentaje
     querys('Select TOTAL, CIERRE from tmpAsigOrigMes'+frmprincipal.idmaq+' where Concepto = ''TOTAL''', 0, dmreportes.sqlgeneral8);
     if dmreportes.sqlgeneral8.RecordCount > 0 then
       begin
       querys('Update tmpAsigOrigMes'+frmprincipal.idmaq+' set TOTALP = Format((TOTAL*100)/'+dmreportes.sqlgeneral8.fieldbyname('TOTAL').asstring+', 2)', 1, sqlgeneral);
       querys('Update tmpAsigOrigMes'+frmprincipal.idmaq+' set CIERREP = Format((CIERRE*100)/'+dmreportes.sqlgeneral8.fieldbyname('CIERRE').asstring+', 2)', 1, sqlgeneral);
        end
     else
       begin
       application.MessageBox('No se encontraron registros', 'Aviso', MB_ICONINFORMATION);
       exit;
       end;
     querys('select * from tmpAsigOrigMes'+frmprincipal.idmaq+' where ano = '+quotedstr(edano.text)+ 'and MES ='+quotedstr(edmes.text),0,dmreportes.sqlgeneral);
     querys('Drop table if exists tmpAsigOrigMes'+frmprincipal.idmaq, 1, sqlgeneral);
end;

procedure TfrmRepAsigOrig.semana;
var
i, d:integer;
f1, f2:Tdate;
dia, mes, ano:word;
begin
// CREA LA TABLA //
     querys('Drop table if exists tmpAsigOrigSemana'+frmprincipal.idmaq, 1, sqlgeneral);
     querys('Create Table tmpAsigOrigSemana'+frmprincipal.idmaq+' (Concepto varchar(30), Tipo varchar(30), fecha date, LUNES int(11) default 0, MARTES int(11) default 0, MIERCOLES int(11) default 0, '+
     'JUEVES int(11) default 0, VIERNES int(11) default 0,  SABADO int(11) default 0, TOTAL int(11) default 0, TOTALP float default 0.00, CIERRE int(11) default 0, CIERREP float default 0.00)', 1, sqlgeneral);

     // INSERTA LOS TIPOS DE FUENTES //
     d := dayofweek(edsemana.date);
     DecodeDate(edsemana.date-d+1, ano, mes, dia);
     f1 := EncodeDate(ano, mes, dia);
     f2 := f1 + 6;
     querys('Insert into tmpAsigOrigSemana'+frmprincipal.idmaq+' (Concepto, Tipo, fecha) SELECT ori.nombre as o, top.nombre, '+quotedstr(datetostr(edsemana.date))+'as fecha FROM origen as ori left join oportunidades as o on (ori.idorigen=o.idorigen)'+
            ' left join agenda_vendedores as av on (av.idoportunidad=o.idoportunidad) left join tipo_oportunidad as top on(top.idtipo_oportunidad=av.idtipo_oportunidad) where o.alta between '+quotedstr(datetostr(f1))+' and '+quotedstr(datetostr(f2))+
            ' group by top.nombre,  ori.nombre', 1, sqlgeneral);

     // INSERTA TOTAL POR DIAS //
     for i:=1 to 7 do
        begin
        querys('SELECT o.fecha,ori.nombre as o,count(ori.nombre) as t, top.nombre as top FROM origen as ori left join oportunidades as o on (ori.idorigen=o.idorigen) left join agenda_vendedores as av on (av.idoportunidad=o.idoportunidad) '+
               'left join tipo_oportunidad as top on(top.idtipo_oportunidad=av.idtipo_oportunidad) where o.alta = '+quotedstr(datetostr(f1))+' group by top.nombre,  ori.nombre', 0, sqlgeneral);
        sqlgeneral.first;
        while not sqlgeneral.Eof = true do
          begin
          case i of
            2 : querys('Update tmpAsigOrigSemana'+frmprincipal.idmaq+' set LUNES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto= "'+sqlgeneral.fieldbyname('o').asstring+'" and Tipo = "'+sqlgeneral.fieldbyname('top').asstring+'" ', 1, sqlgeneral2);
            3 : querys('Update tmpAsigOrigSemana'+frmprincipal.idmaq+' set MARTES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto= "'+sqlgeneral.fieldbyname('o').asstring+'" and Tipo = "'+sqlgeneral.fieldbyname('top').asstring+'" ', 1, sqlgeneral2);
            4 : querys('Update tmpAsigOrigSemana'+frmprincipal.idmaq+' set MIERCOLES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto= "'+sqlgeneral.fieldbyname('o').asstring+'" and Tipo = "'+sqlgeneral.fieldbyname('top').asstring+'" ', 1, sqlgeneral2);
            5 : querys('Update tmpAsigOrigSemana'+frmprincipal.idmaq+' set JUEVES = '+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto= "'+sqlgeneral.fieldbyname('o').asstring+'" and Tipo = "'+sqlgeneral.fieldbyname('top').asstring+'" ', 1, sqlgeneral2);
            6 : querys('Update tmpAsigOrigSemana'+frmprincipal.idmaq+' set VIERNES ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto= "'+sqlgeneral.fieldbyname('o').asstring+'" and Tipo = "'+sqlgeneral.fieldbyname('top').asstring+'" ', 1, sqlgeneral2);
            7 : querys('Update tmpAsigOrigSemana'+frmprincipal.idmaq+' set SABADO ='+quotedstr(sqlgeneral.fieldbyname('t').asstring)+' where Concepto= "'+sqlgeneral.fieldbyname('o').asstring+'" and Tipo = "'+sqlgeneral.fieldbyname('top').asstring+'" ', 1, sqlgeneral2);
            end;
          sqlgeneral.Next;
          end;
        f1 := f1 +1;
        end;

     //  INSERTA LOS QUE SE HICIERON CLIENTES //
     d := dayofweek(edsemana.date);
     DecodeDate(edsemana.date-d, ano, mes, dia);
     f1 := EncodeDate(ano, mes, dia);
     f2 := f1 + 6;
     querys('SELECT count(o.idoportunidad) as clientes, o.fecha,ori.nombre as o,count(ori.nombre) as t, top.nombre as top '+
            'FROM origen as ori left join oportunidades as o on ori.idorigen=o.idorigen left join agenda_vendedores as av on '+
            'av.idoportunidad=o.idoportunidad left join tipo_oportunidad as top on top.idtipo_oportunidad=av.idtipo_oportunidad '+
            'where o.alta between "'+datetostr(f1)+'" and "'+datetostr(f2)+'" and o.estatus = "CLIENTE" '+
            'group by top.nombre, ori.nombre', 0, sqlgeneral);
     sqlgeneral.first;
        while not sqlgeneral.Eof = true do
          begin
          querys('Update tmpAsigOrigSemana'+frmprincipal.idmaq+' set CIERRE = "'+sqlgeneral.fieldbyname('clientes').asstring+'" '+
                 'where Concepto="'+sqlgeneral.fieldbyname('o').asstring+'" and Tipo = "'+sqlgeneral.fieldbyname('top').asstring+'"', 1, sqlgeneral2);
          sqlgeneral.Next;
          end;

     // saca el Total por Concepto
     querys('Update tmpAsigOrigSemana'+frmprincipal.idmaq+' set TOTAL = LUNES+MARTES+MIERCOLES+JUEVES+VIERNES+SABADO', 1, sqlgeneral);
      //  saca el Total por Dia
     querys('Insert into tmpAsigOrigSemana'+frmprincipal.idmaq+' (Concepto,  LUNES,MARTES,MIERCOLES,JUEVES,VIERNES,SABADO, TOTAL, CIERRE)'+
            'Select ''TOTAL'', sum(LUNES),sum(MARTES),sum(MIERCOLES),sum(JUEVES),sum(VIERNES),sum(SABADO), sum(TOTAL),sum(CIERRE) from tmpAsigOrigSemana'+frmprincipal.idmaq+' group by fecha', 1, sqlgeneral);
     //Saca el  porcentaje
     querys('Select TOTAL, CIERRE from tmpAsigOrigSemana'+frmprincipal.idmaq+' where Concepto = ''TOTAL''', 0, dmreportes.sqlgeneral8);
     if dmreportes.sqlgeneral8.RecordCount > 0 then
       begin
       querys('Update tmpAsigOrigSemana'+frmprincipal.idmaq+' set TOTALP = Format((TOTAL*100)/'+dmreportes.sqlgeneral8.fieldbyname('TOTAL').asstring+', 2)', 1, sqlgeneral);
       querys('Update tmpAsigOrigSemana'+frmprincipal.idmaq+' set CIERREP = Format((CIERRE*100)/'+dmreportes.sqlgeneral8.fieldbyname('CIERRE').asstring+', 2)', 1, sqlgeneral);
       end
     else
       begin
       application.MessageBox('No se encontraron registros', 'Aviso', MB_ICONINFORMATION);
       exit;
       end;



     querys('select * from tmpAsigOrigSemana'+frmprincipal.idmaq,0,dmreportes.sqlgeneral);
     querys('Drop table if exists tmpAsigOrigSemana'+frmprincipal.idmaq, 1, sqlgeneral);
end;

procedure TfrmRepAsigOrig.btnCerrarClick(Sender: TObject);
begin
  release;
end;

procedure TfrmRepAsigOrig.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmRepAsigOrig.FormShow(Sender: TObject);
begin
edmes.text := meses[Monthof(today)];
edano.text := inttostr(yearof(today));
edsemana.date := today;
end;

end.
