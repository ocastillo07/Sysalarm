{
2010-08-30 Oscar bloqueo de fecha y validacion de motivo
///////////////////////////////////////////////////////////////////////////////
2008/04/24 dalyla cliente cambios
2008/02/28 dalyla zona horaria ok
}///////////////////////////////////////////////////////////////////////////////

unit Uclie_cancel;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Mask, RzEdit, RzBtnEdt, StdCtrls, RzLabel, RzButton, ExtCtrls,
  RzPanel, ComCtrls, ToolWin, RzDTP;

type
  Tfrmclie_cancel = class(TForm)
    RzGroupBox1: TRzGroupBox;
    btnmodificar: TRzBitBtn;
    lbconcepto: TRzLabel;
    edbuscar: TRzButtonEdit;
    RzLabel2: TRzLabel;
    btncancelar: TRzBitBtn;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    lbfecha: TRzLabel;
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    fuentes: TFontDialog;
    mmcancelacion: TRzRichEdit;
    RzLabel5: TRzLabel;
    dfecha: TRzDateTimePicker;
    procedure buscarlocate;
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edbuscarButtonClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure btnmodificarClick(Sender: TObject);
    procedure mmcancelacionEnter(Sender: TObject);
    procedure mmcancelacionExit(Sender: TObject);
    procedure btnfuentesClick(Sender: TObject);
    procedure edbuscarKeyPress(Sender: TObject; var Key: Char);
    procedure dfechaKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
  public
    { Public declarations }
    tipo,cuenta:integer;
    constructor inicializa(transaccion,id:integer);

  end;

var
  frmclie_cancel: Tfrmclie_cancel;

implementation

uses Ubusquedas, Udmrep, Urecursos, Uprincipal, DateUtils;

{$R *.dfm}
constructor Tfrmclie_cancel.inicializa(transaccion,id:integer);
begin
  shortdateformat:='yyyy/mm/dd';
  tipo:=transaccion;
  cuenta:=id;
  querys('SELECT dc.MemoCancelacion as mm,dc.FechaCancelacion as ff,mt.nombre as nn,dc.idmotivo as id FROM clientes as dc LEFT JOIN MotCancel as mt ON (mt.idmotivo=dc.idmotivo) WHERE dc.idcliente='+inttostr(cuenta),0,dmreportes.sqlgeneral3);
  edbuscar.Text:=dmreportes.sqlgeneral3.FieldByName('id').AsString;
  mmcancelacion.Text:=dmreportes.sqlgeneral3.FieldByName('mm').AsString;
  lbconcepto.Caption:=dmreportes.sqlgeneral3.FieldByName('nn').AsString;
  if tipo=1 then
  begin
    btnmodificar.Enabled:=true;
    lbfecha.Caption:=datetostr(now);
    edbuscar.Enabled:=true;
    mmcancelacion.enabled:=true;
    edbuscar.setfocus;
    shortdateformat:='yyyy/mm/dd';
    dfecha.Date := StrToDate(FormatDateTime('yyyy/mm/dd',Now));
    //dfecha.Date:=dmreportes.sqlgeneral3.FieldByName('ff').AsDateTime;
  end
  else
  begin
    dfecha.enabled := false;
    dfecha.Date := dmreportes.sqlgeneral3.FieldByName('ff').AsDateTime;
  end;
  if DerechosSys('Modificar Fecha de Cancelacion Clientes') then
    dfecha.enabled := true;

  if dfecha.Date <  strtodate('1990/01/01') then
    dfecha.Date := StrToDate(FormatDateTime('yyyy/mm/dd',Now));
end;


procedure Tfrmclie_cancel.buscarlocate;
begin
//verifica que esa clave de contrato sea valida
querys('select idmotivo,nombre from MotCancel where idmotivo='+quotedstr(edbuscar.Text),0,dmreportes.sqlgeneral3);
if dmreportes.sqlgeneral3.FieldByName('idmotivo').AsString <>  ''  then
   begin
   lbconcepto.Caption:= dmreportes.sqlgeneral3.FieldByName('nombre').AsString;

   end else begin
    application.MessageBox('Ese motivo no existe','Aviso',mb_iconinformation);
    edbuscar.Clear;
    edbuscar.SetFocus;
   end;


end;

procedure Tfrmclie_cancel.btncancelarClick(Sender: TObject);
begin
close;
end;

procedure Tfrmclie_cancel.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmclie_cancel.edbuscarButtonClick(Sender: TObject);
begin
       frmbusquedas.query:='Select idmotivo,nombre as Nombre,usuario as Usuario,fecha as Fecha,hora as Hora FROM MotCancel order by idmotivo';
       frmbusquedas.campo_retorno:='idmotivo';
       frmbusquedas.campo_busqueda:='nombre';
       frmbusquedas.tabla:='MotCancel';
       frmbusquedas.tblorigen := 'MotCancel';
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
         begin
         edbuscar.Text:=frmbusquedas.resultado;
         edbuscar.SetFocus;
         buscarlocate;
         end;
end;

procedure Tfrmclie_cancel.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if tipo=1 then begin
   application.MessageBox('No has guardado los datos, primero guarda los datos','Aviso',mb_iconinformation);
   canclose:=false;
end

end;

procedure Tfrmclie_cancel.btnmodificarClick(Sender: TObject);
var dia,ano,fecha1,fecha2,CanDia,CanYear,CanM,m,sector:string;   // FechaCancelacion,
mes,CanMes,ban,clasif:integer;
begin
  ban := 0;
  if (edbuscar.Text <> '') and (edbuscar.Text <>'0') then
  begin
    dia:=formatdatetime('d',dfecha.Date);
    mes:=strtoint(formatdatetime('m',dfecha.Date));
    ano:=formatdatetime('yyyy',dfecha.Date);

    fecha1:=datetostr(now-0);
    fecha2:=datetostr(now-9999);
    m:=UpperCase(meses[mes]);

    with  dmreportes do
    begin
      querys('SELECT FechaCancelacion from clientes where idcliente='+inttostr(cuenta),0,sqlgeneral);
      //querys('SELECT FechaCancelacion from clientes where FechaCancelacion ='+quotedstr(datetostr(dfecha.Date))+' and idcliente='+inttostr(cuenta),0,sqlgeneral);

      if sqlgeneral.FieldByName('FechaCancelacion').AsString = '0001/01/01' then
        btncancelar.Tag:=0
      else
      begin
        if sqlgeneral.FieldByName('FechaCancelacion').AsDateTime = FechaServidor() then
          btncancelar.Tag:=1
        else
        begin
          btncancelar.Tag:=0;
          ban:=1;
          CanDia:=formatdatetime('d',sqlgeneral.FieldByName('FechaCancelacion').AsDateTime);
          CanMes:=strtoint(formatdatetime('m',sqlgeneral.FieldByName('FechaCancelacion').AsDateTime));
          CanYear:=formatdatetime('yyyy',sqlgeneral.FieldByName('FechaCancelacion').AsDateTime);
          CanM:=UpperCase(meses[CanMes]);
        end;
      end;

      bpcambios('clientes', inttostr(cuenta), 'idcliente');
      querys('UPDATE clientes SET FechaCancelacion='+quotedstr(datetostr(dfecha.Date))+',MemoCancelacion='+quotedstr(mmcancelacion.text)+',idmotivo='+quotedstr(edbuscar.text)+' WHERE idcliente='+inttostr(cuenta),1,dmreportes.sqlgeneral3);
      apcambios('idcliente', inttostr(cuenta), 'clientes', 'frmclie_cancel');

      if btncancelar.Tag = 0 then
      begin //si no fue cancelada el mismo dia entonces que incremente en el reporte de cobranza.....
        querys('select sector from clientes where idcliente='+inttostr(cuenta),0,sqlgeneral);
        sector:=sqlgeneral.fieldbyname('sector').AsString;
        //insertamos en tabla cobranza esta baja.
        querys('DROP TABLE IF EXISTS temporal_sectorvence01'+frmprincipal.idmaq,1,dmreportes.sqlgeneral);
        querys('create table temporal_sectorvence01'+frmprincipal.idmaq+' SELECT pc.idpago,pc.idpedido,pc.movimiento,c.sector  FROM PagosClientes as pc left join pedidos as p ON(p.idpedido=pc.idpedido)  LEFT JOIN clientes as c ON(c.idcliente=pc.idcliente) LEFT JOIN  contratos as con ON(c.TipoCont=con.TipoCont)  ' +
        'LEFT JOIN sectores as s ON (s.idsector=c.sector) WHERE pc.idcliente ='+inttostr(cuenta)+' and pc.FechaVence  BETWEEN  '+quotedstr(fecha2)+' AND '+quotedstr(fecha1)+' and  p.estatus in(3,4) AND restante > 0 and pc.movimiento IN(0,1)   GROUP BY pc.idpago',1,sqlgeneral);;
        querys('Create Index idpago on temporal_sectorvence01'+frmprincipal.idmaq+' (idpago) ',1,sqlgeneral3);
        querys('SELECT pc.idcliente as clie,(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence)) as dias,t1.sector as sec FROM PagosClientes as pc   '+
        'INNER JOIN temporal_sectorvence01'+frmprincipal.idmaq+' as t1 ON (t1.idpago=pc.idpago)  GROUP BY pc.idcliente ',1,sqlgeneral3); // HAVING dias <= '+inttostr(dias)
        if sqlgeneral3.fieldbyname('clie').asstring  = '' then
        begin //si no debe el cliente entonces
          querys('UPDATE Cobranza SET D'+dia+' = 1 + D'+dia+' where mes = '+quotedstr(m)+' and fecha = '+quotedstr(ano)+ ' and sector = '+quotedstr(sector)+'  and  concepto =''BAJAS'' AND tipo =''DESGLOSADO'' and clasificacion=1',1,sqlgeneral2);
          querys('UPDATE Cobranza SET D'+dia+' =  1 + D'+dia+' where mes = '+quotedstr(m)+' and fecha = '+quotedstr(ano)+ '  and  concepto =''BAJAS'' AND tipo =''CONSOLIDADO'' and clasificacion=1',1,sqlgeneral2);
        end
        else
        begin // pero si debe algo
          if ((sqlgeneral3.fieldbyname('dias').asinteger <=59) and (sqlgeneral3.fieldbyname('dias').asinteger >30)) then
            clasif := 1
          else
            if ((sqlgeneral3.fieldbyname('dias').asinteger >=0) and (sqlgeneral3.fieldbyname('dias').asinteger < 31)) then
              clasif :=0
            else
              if sqlgeneral3.fieldbyname('dias').asinteger > 59 then
                clasif :=2;
          querys('UPDATE Cobranza SET D'+dia+' =D'+dia+' + 1 where mes = '+quotedstr(m)+' and fecha = '+quotedstr(ano)+ ' and sector = '+quotedstr(sector)+'  and  concepto =''BAJAS'' AND tipo =''DESGLOSADO'' and clasificacion='+inttostr(clasif),1,sqlgeneral2);
          querys('UPDATE Cobranza SET D'+dia+' =D'+dia+' + 1 where mes = '+quotedstr(m)+' and fecha = '+quotedstr(ano)+ '  and  concepto =''BAJAS'' AND tipo =''CONSOLIDADO'' and clasificacion='+inttostr(clasif),1,sqlgeneral2);

          if ban = 1 then //si ya habia sido regsitrado la baja ay que quitarla de la tabla(disminuirla)
          begin
            querys('UPDATE Cobranza SET D'+CanDia+' =D'+CanDia+' - 1 where mes = '+quotedstr(CanM)+' and fecha = '+quotedstr(CanYear)+ ' and sector = '+quotedstr(sector)+'  and  concepto =''BAJAS'' AND tipo =''DESGLOSADO'' and clasificacion='+inttostr(clasif),1,sqlgeneral2);
            querys('UPDATE Cobranza SET D'+CanDia+' =D'+CanDia+' - 1 where mes = '+quotedstr(CanM)+' and fecha = '+quotedstr(CanYear)+ '  and  concepto =''BAJAS'' AND tipo =''CONSOLIDADO'' and clasificacion='+inttostr(clasif),1,sqlgeneral2);
          end
        end; //if clie
        querys('DROP TABLE IF EXISTS temporal_sectorvence01'+frmprincipal.idmaq,1,dmreportes.sqlgeneral);
      end;//btncancelar.....
    end;//dmreportes....
    tipo:=0;
    close;
  end
  else
  begin
      application.MessageBox('Falta el motivo de cancelacion','Atencion',mb_IconInformation);
      edbuscar.SetFocus;
  end;
end;

procedure Tfrmclie_cancel.mmcancelacionEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure Tfrmclie_cancel.mmcancelacionExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;

procedure Tfrmclie_cancel.btnfuentesClick(Sender: TObject);
begin
 fuentes.Font := mmcancelacion.Font;
  if fuentes.Execute then
   begin
      mmcancelacion.SelAttributes.Size:=fuentes.Font.Size;
      mmcancelacion.SelAttributes.color:=fuentes.Font.color;
      mmcancelacion.SelAttributes.style:=fuentes.Font.style;
    end;
end;

procedure Tfrmclie_cancel.edbuscarKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) then
   begin
     key:=#0;
     if edbuscar.Text <> '' then
        buscarlocate
     else
        edbuscar.OnButtonClick(self);
   end;

  if key = #27 then
     begin
      key:=#0;
     edbuscar.Text:='';
  end;
end;

procedure Tfrmclie_cancel.dfechaKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13)then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
