{///////////////////////////////////////////////////////////////////////////////

2008/02/27 dalyla zona horaria de configuraciones
}///////////////////////////////////////////////////////////////////////////////
unit Ullegada_patrulleros;

interface

uses
  Windows,DateUtils, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Forms, Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid,  StdCtrls, Buttons, ExtCtrls, DBCtrls, cxMaskEdit, MemDS, DBAccess,
  MyAccess, RzEdit, RzButton, RzCmboBx;
                                               {  ZAbstractRODataset, ZDataset,}
type
  Tfrmllegada_patrulleros = class(TForm)
    dspatrulleros: TDataSource;
    Panel_retardo: TPanel;
    Bevel1: TBevel;
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    Label3: TLabel;
    Label4: TLabel;
    sqlpatrulleros: TMyQuery;
    btnllegada: TRzBitBtn;
    btncancelar: TRzBitBtn;
    btncerrar: TRzBitBtn;
    btnguardar: TRzBitBtn;
    mmdescripcion: TRzMemo;
    cxGrid2: TcxGrid;
    DBViewPatrulleros: TcxGridDBTableView;
    DBViewPatrullerosDBColumn1: TcxGridDBColumn;
    DBViewPatrullerosDBColumn2: TcxGridDBColumn;
    DBViewPatrullerosDBColumn3: TcxGridDBColumn;
    DBViewPatrullerosDBColumn4: TcxGridDBColumn;
    cxGridLevel3: TcxGridLevel;
    DBViewPatrullerosDBColumn5: TcxGridDBColumn;
    DBViewPatrullerosDBColumn6: TcxGridDBColumn;
    DBViewPatrullerosDBColumn7: TcxGridDBColumn;
    DBViewPatrullerosDBColumn8: TcxGridDBColumn;
    DBViewPatrullerosDBColumn9: TcxGridDBColumn;
    DBViewPatrullerosDBColumn10: TcxGridDBColumn;
    DBViewPatrullerosDBColumn11: TcxGridDBColumn;
    cbomotivo: TRzComboBox;
    procedure FormShow(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBComboBox1KeyPress(Sender: TObject; var Key: Char);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure mmdescripcionExit(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure cbmotivoKeyPress(Sender: TObject; var Key: Char);
    procedure mmdescripcionKeyPress(Sender: TObject; var Key: Char);
    procedure btnguardarClick(Sender: TObject);
    procedure cbomotivoKeyPress(Sender: TObject; var Key: Char);
    procedure btncerrarClick(Sender: TObject);
    procedure btnllegadaClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
  private
    { Private declarations }
     procedure nomover(var m: TWMWINDOWPOSCHANGED); message
   WM_WINDOWPOSCHANGING ;

  public
    { Public declarations }
    {ban:integer;}
    motivo:boolean;
    valor,movil:string;
   constructor inicializa(retardo:boolean;alarma,sector:string);
   procedure ReporteAlarmas;
  end;

var
  frmllegada_patrulleros: Tfrmllegada_patrulleros;

implementation

uses Udm, Udmrep, Urecursos, Uprincipal;



{$R *.dfm}

constructor tfrmllegada_patrulleros.inicializa(retardo:boolean;alarma,sector:string);
begin
movil := sector;
motivo := retardo;
if retardo then
   begin
   cxgrid2.Enabled := false;
   Panel_retardo.Enabled := true;
   btnllegada.Enabled := FALSE;
   btncancelar.Enabled := FALSE;
   cbomotivo.ItemIndex := 0;
   valor := alarma;
   end
else
   begin
   cxgrid2.Enabled := true;
   btnllegada.Enabled := true;
   btncancelar.Enabled := true;
   panel_retardo.Enabled := false;
   end;
end;

procedure Tfrmllegada_patrulleros.ReporteAlarmas;
var temp:string;
begin
    TotalAlarmas('retardos','+',1,dmaccesos.sqlgeneral);
    TotalAlarmas('M'+movil+'R','+',1,dmaccesos.sqlgeneral);
      if cbomotivo.text = 'FUERA DEL PERIMETRO' then
        temp := 'FueraPerim'
      else
        if cbomotivo.text = 'OTRA ZONA' then
          temp := 'OtraZona'
        else
          if cbomotivo.text = 'OTRA ACTIVACION' then
            temp := 'OtraAct'
             else
             if cbomotivo.text = 'FALLA MECANICA' then
                temp := 'FallasMec'
             else
               if cbomotivo.text = 'VIENE DE OTRO SECTOR' then
                 temp := 'OtroSector'
               else
                 temp := cbomotivo.text;

    TotalAlarmas(temp,'+',1,dmaccesos.sqlgeneral);
    TotalAlarmas('total_m','+',1,dmaccesos.sqlgeneral);

end;



procedure Tfrmllegada_patrulleros.nomover(var m : TWMWINDOWPOSCHANGED);
begin

        m.windowpos.x :=round((screen.Width - self.Width) div 2);;  {Left/Posicion X}
        m.windowpos.y :=round((screen.Height - self.Height) div 2);;  {Left/Posicion X}


end;

procedure Tfrmllegada_patrulleros.FormShow(Sender: TObject);
begin
//actualiza los datos de la rejilla
try
sqlpatrulleros.Close;
//sqlpatrulleros.ParamByName('fecha').AsDate:=FechaServidor;
sqlpatrulleros.Open;
if motivo then
cbomotivo.setfocus;
except
showmessage('Fallo el OnShow');
end;

end;

procedure Tfrmllegada_patrulleros.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure Tfrmllegada_patrulleros.DBComboBox1KeyPress(Sender: TObject;
  var Key: Char);
begin
     if key=#13 then
        begin
        key:=#0;
        sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
        end;
end;

procedure Tfrmllegada_patrulleros.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
if panel_retardo.Enabled = true then begin // estan en la captura de motivos

   application.MessageBox('No puedes cerrar la pantalla hasta que guardes los datos','Atención',mb_IconInformation);
   canclose:=false;

end else begin
      close;
end;
end;

procedure Tfrmllegada_patrulleros.mmdescripcionExit(Sender: TObject);
begin
btnguardar.SetFocus;
end;

procedure Tfrmllegada_patrulleros.FormActivate(Sender: TObject);
begin

//llenar el combo de motivos con el nombre
with dmreportes do begin
try
//llenar el combo de motivos con el nombre
CargaCombo('select cs.nombre as nombre from TipoServicios as ts left join clasif_servicios as cs ON(cs.idserv=ts.idserv) where ts.nombre= "MOTIVO RETARDO"  order by cs.orden','Motivos de Retardo',cbomotivo);
{querys('select cs.nombre as nombre from TipoServicios as ts left join clasif_servicios as cs ON(cs.idserv=ts.idserv) where ts.nombre=''MOTIVO RETARDO''  order by cs.idstatus',0,sqlgeneral);
//cbomotivo.Clear;
while sqlgeneral.Eof = false do begin
   cbomotivo.Items.Add(sqlgeneral.fieldbyname('nombre').AsString);
   sqlgeneral.Next;
end; }
//sqlgeneral.close;
cbomotivo.ItemIndex:=-1;
except
showmessage('Fallo en el motivo del retardo');
end;

end;//dmreportes.....
end;

procedure Tfrmllegada_patrulleros.cbmotivoKeyPress(Sender: TObject;
  var Key: Char);
begin
mmdescripcion.SetFocus;
end;

procedure Tfrmllegada_patrulleros.mmdescripcionKeyPress(Sender: TObject;
  var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmllegada_patrulleros.btnguardarClick(Sender: TObject);
begin
if cbomotivo.itemindex >=0 then
  begin
  if cbomotivo.text = 'OTROS' then
    begin
    if mmdescripcion.Text  = '' then
      begin
      application.MessageBox('Debes dar una descripción del asunto, no podras guardar hasta que expliques la razon del retraso','Atención',mb_IconInformation);
      mmdescripcion.SetFocus;
      exit;
      end;
    end;
  if (valor = '') or (valor = NULL) then
    begin
      application.MessageBox('Debes seleccionar un patrullero', 'Atención',mb_IconInformation);
      exit;
      end;


  querys('UPDATE tiempo_respuesta set idmotivo='+inttostr(cbomotivo.itemindex + 1)+',mmdesc='+quotedstr(mmdescripcion.text)+'  where aid ='+quotedstr(valor),1,dmreportes.sqlgeneral);
  ReporteAlarmas;
  panel_retardo.Enabled := false;
  close;
  end
else
  begin
  showmessage('Debes seleccionar un motivo');
  cbomotivo.setfocus;
  end;
end;

procedure Tfrmllegada_patrulleros.cbomotivoKeyPress(Sender: TObject;
  var Key: Char);
begin
mmdescripcion.SetFocus
end;

procedure Tfrmllegada_patrulleros.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure Tfrmllegada_patrulleros.btnllegadaClick(Sender: TObject);
  var resta : variant; TIEMPO, zh:string;
//,movil:STRING;
begin
querys('select valor from configuraciones where concepto ="ZonaHoraria"', 0, dmreportes.sqlgeneral8);
zh := dmreportes.sqlgeneral8.fieldbyname('valor').AsString;
querys('Select did from alarmas_detalle where aid ='+quotedstr(DSpatrulleros.DataSet.FieldValues['evento'])+' and tipo =4 ',0,dmaccesos.sqlgeneral);
if dmaccesos.sqlgeneral.Recordcount > 0 then
  application.MessageBox('Llegada de patrullero ya esta registrada','Atención',mb_IconInformation)
else
  begin
  querys('Select * from tiempo_respuesta where aid='+quotedstr(DSpatrulleros.DataSet.FieldValues['evento']),0,dmreportes.sqlgeneral);
  if dmreportes.sqlgeneral.FieldByName('id').AsString <> '' then
    begin
    querys('Insert Into alarmas_detalle (aid,fecha,hora,action,detalle,user,tipo) values '+
           '('+quotedstr(DSpatrulleros.DataSet.FieldValues['evento'])+','+quotedstr(datetostr(FechaServidor))+',adddate(now(), interval '+zh+' hour),''COMENTARIO'','+quotedstr('LLEGADA DE PATRULLERO : '+dmreportes.sqlgeneral.fieldbyname('nombre').asstring)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',4)',1,dmaccesos.sqlgeneral);                                                                                                                       //'+quotedstr(timetostr(HoraServidor))+'
    with dmreportes do
      begin
      sqlgeneral.edit;
      sqlgeneral.FieldByName('hora_llegada').AsString:=timetostr(HoraServidor);
      resta := 0;
      if (ispm(sqlgeneral.FieldByName('hora_llegada').AsDateTime) = false ) and (ispm(sqlgeneral.FieldByName('hora').AsDateTime)) then
        begin
        sqlgeneral.FieldByName('hora_llegada').AsDateTime := sqlgeneral.FieldByName('hora_llegada').AsDateTime + strtotime('12:00:00');
        sqlgeneral.FieldByName('hora').AsDateTime := sqlgeneral.FieldByName('hora').AsDateTime + strtotime('12:00:00');
        resta := MinutesBetween(sqlgeneral.FieldByName('hora_llegada').AsDateTime,sqlgeneral.FieldByName('hora').AsDateTime);
        sqlgeneral.FieldByName('hora_llegada').AsDateTime := sqlgeneral.FieldByName('hora_llegada').AsDateTime - strtotime('12:00:00');
        sqlgeneral.FieldByName('hora').AsDateTime := sqlgeneral.FieldByName('hora').AsDateTime - strtotime('12:00:00');
        end
      else
        begin
        resta := MinutesBetween(sqlgeneral.FieldByName('hora').AsDateTime,sqlgeneral.FieldByName('hora_llegada').AsDateTime);
        sqlgeneral.FieldByName('tiempo').AsString:=resta;
        end;

      sqlgeneral.Post;
      tiempo := resta;

      querys('Insert Into alarmas_detalle (aid,fecha,hora,action,detalle,user,tipo) values '+
      '('+quotedstr(DSpatrulleros.DataSet.FieldValues['evento'])+','+quotedstr(datetostr(FechaServidor))+',adddate(now(), interval '+zh+' hour),''COMENTARIO'','+quotedstr('HORA DE LLEGADA: '+sqlgeneral.fieldbyname('hora_llegada').AsString+' TIEMPO DE RESPUESTA: '+tiempo+' MINUTOS')+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+',6)',1,dmaccesos.sqlgeneral);

      TotalAlarmas('asist','+',1,sqlgeneral);
      TotalAlarmas('MinResp','+',tiempo,sqlgeneral);

      querys('Select idsector,rp.nombre from tiempo_respuesta as rp left join usuarios as u ON(u.codigo=rp.CodPatrullero) left join areas as a ON(a.idarea=u.idarea) left join puestos as p ON(p.idpuesto=u.idpuesto) '+
             ' where a.nombre = ''CENTRAL'' and p.nombre =''PATRULLERO'' and u.estatus=1 and aid='+quotedstr(sqlpatrulleros.fieldbyname('evento').asstring)+' having rp.nombre='+quotedstr(sqlpatrulleros.fieldbyname('patrullero').AsString),0,sqlgeneral);
      movil := sqlgeneral.fieldbyname('idsector').AsString;
      TotalAlarmas('M'+movil+'A','+',1,sqlgeneral);


      end;//with                                                                                                             //'+quotedstr(timetostr(HoraServidor))+'

   if (resta > 5.0)  then
     begin  //si el tiempo de llegada es mayor que 5 minutos que capture el motivo del retardo
     {cxgrid2.Enabled := false;
     Panel_retardo.Enabled := true;
     btnllegada.Enabled := FALSE;
     btncancelar.Enabled := FALSE;
     cbomotivo.ItemIndex := 0;
     valor :=  DSpatrulleros.DataSet.FieldValues['evento'];}
     application.MessageBox('Se retraso el patrullero!, es necesario saber el motivo','Atención',mb_IconInformation);
     cxgrid2.Enabled := false;
     Panel_retardo.Enabled := true;
     btnllegada.Enabled := FALSE;
     btncancelar.Enabled := FALSE;
     cbomotivo.ItemIndex := 0;
     valor :=  DSpatrulleros.DataSet.FieldValues['evento'];
     end;
  end
else
  application.MessageBox('No se ha enviadado patrullero','Atención',mb_IconInformation);

  end;


end;

procedure Tfrmllegada_patrulleros.btncancelarClick(Sender: TObject);
begin

with dmaccesos do begin
querys('Select * from alarmas_detalle where aid='+quotedstr(DSpatrulleros.DataSet.FieldValues['evento'])+' and tipo in(3,4,6) order by did desc ',0,sqlgeneral);

if sqlgeneral.FieldByName('did').AsString <> '' then begin

if application.MessageBox('Desea cancelar envio de patrullero?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
 begin
   querys('Select * from tiempo_respuesta where aid='+quotedstr(DSpatrulleros.DataSet.FieldValues['evento']),0,sqlgeneral);

   if sqlgeneral.FieldByName('id').AsString = '' then
     begin
        application.MessageBox('Tiempo respuesta no encontrado','Atención',mb_IconInformation);
        exit;
     end else begin

        querys('Delete From alarmas_detalle where aid='+quotedstr(DSpatrulleros.DataSet.FieldValues['evento'])+' and tipo in(3,4,6) ',1,sqlgeneral);
        querys('Delete From tiempo_respuesta where aid='+quotedstr(DSpatrulleros.DataSet.FieldValues['evento']),1,sqlgeneral);

    end;
end;
end else
       application.MessageBox('No encontro patrullero enviado','Atención',mb_Iconinformation);

end;       
end;

end.



