{///////////////////////////////////////////////////////////////////////////////
2009/02/26 dalyla agregar la insecion de solo anexo
--------------------------------------------------------------------------------
2008/09/02 dalyla log para reclasificacion del detalle
2008/02/28 dalyla zona horaria ok
Ultima modificacion Dalila 24/abr/07
}///////////////////////////////////////////////////////////////////////////////

unit UReClasificacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzEdit, RzBtnEdt, ExtCtrls, RzPanel, StdCtrls, Mask, RzDBEdit,
  RzLabel, DB, MemDS, DBAccess, MyAccess, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  ComCtrls, DBCtrls, cxMemo, RzButton, RzCmboBx;

type
  TfrmReClasificacion = class(TForm)
    gbcliente: TGroupBox;
    RzLabel9: TRzLabel;
    lblmovil: TRzLabel;
    lblciudad: TRzLabel;
    lblestado: TRzLabel;
    lblcolonia: TRzLabel;
    lblentre: TRzLabel;
    lblalta: TRzLabel;
    lblfuente: TRzLabel;
    lblorigen: TRzLabel;
    lblnombre: TRzLabel;
    RzLabel12: TRzLabel;
    RzLabel13: TRzLabel;
    RzLabel14: TRzLabel;
    RzLabel47: TRzLabel;
    RzLabel8: TRzLabel;
    lblcategoria: TRzLabel;
    RzLabel45: TRzLabel;
    ednombre: TRzDBEdit;
    RzDBEdit1: TRzDBEdit;
    c: TRzDBEdit;
    RzDBEdit6: TRzDBEdit;
    RzDBEdit7: TRzDBEdit;
    RzDBEdit8: TRzDBEdit;
    RzDBEdit9: TRzDBEdit;
    RzDBEdit10: TRzDBEdit;
    RzDBEdit11: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    RzDBEdit3: TRzDBEdit;
    edrsocial: TRzDBEdit;
    edcontrol: TRzDBEdit;
    edcategoria: TRzDBEdit;
    edGiro: TRzDBEdit;
    sqlclientes: TMyQuery;
    dsclientes: TDataSource;
    edcvecte: TRzButtonEdit;
    SqlGeneral: TMyQuery;
    gbtrafico: TRzGroupBox;
    cxtrafico: TcxGrid;
    vista1: TcxGridDBTableView;
    nivel1: TcxGridLevel;
    sqltrafico: TMyQuery;
    dstrafico: TDataSource;
    RzGroupBox2: TRzGroupBox;
    cxcomentarios: TcxGrid;
    cxcvista1: TcxGridDBTableView;
    cxcnivel1: TcxGridLevel;
    dscomentarios: TDataSource;
    sqlcomentarios: TMyQuery;
    vista1DBColumn1: TcxGridDBColumn;
    vista1DBColumn2: TcxGridDBColumn;
    vista1DBColumn3: TcxGridDBColumn;
    vista1DBColumn4: TcxGridDBColumn;
    vista1DBColumn5: TcxGridDBColumn;
    vista1DBColumn6: TcxGridDBColumn;
    RzDBRichEdit1: TRzDBRichEdit;
    cxcvista1DBColumn1: TcxGridDBColumn;
    cxcvista1DBColumn2: TcxGridDBColumn;
    cxcvista1DBColumn3: TcxGridDBColumn;
    cxcvista1DBColumn4: TcxGridDBColumn;
    cxcvista1DBColumn5: TcxGridDBColumn;
    cboclasificacion: TRzComboBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    btnactualizar: TRzBitBtn;
    btncerrar: TRzBitBtn;
    vista1DBColumn7: TcxGridDBColumn;
    gbhistoRecla: TRzGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridDBColumn4: TcxGridDBColumn;
    cxGridDBColumn5: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    sqlhistorial: TMyQuery;
    dshistorial: TDataSource;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    btnemail: TRzBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edcvecteButtonClick(Sender: TObject);
    procedure edcvecteKeyPress(Sender: TObject; var Key: Char);
    procedure vista1CellClick(Sender: TcxCustomGridTableView;
      ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
      AShift: TShiftState; var AHandled: Boolean);
    procedure FormShow(Sender: TObject);
    procedure btnactualizarClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure cargarrejillas;
    procedure sqltraficoAfterScroll(DataSet: TDataSet);
    procedure btnemailClick(Sender: TObject);
    procedure sqlcomentariosAfterPost(DataSet: TDataSet);
    procedure cxcvista1EditValueChanged(Sender: TcxCustomGridTableView;
      AItem: TcxCustomGridTableItem);
    procedure sqlcomentariosBeforePost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure CrearReporte(idcliente,idalarma:string;consulta:tmyquery);
  end;

var
  frmReClasificacion: TfrmReClasificacion;

implementation

uses Urecursos, UDevCompras, Udm, Ubusquedas, Uprincipal, Udmrep,
  Uactivacion_positiva;

{$R *.dfm}

procedure TfrmReClasificacion.cargarrejillas;
begin
if sqltrafico.RecordCount > 0 then
 begin
  querys('Select * From alarmas_detalle WHERE aid = '+sqltrafico.fieldbyname('id').AsString+' and tipo<>6',0,sqlcomentarios);
  gbtrafico.Caption :='Evento '+sqltrafico.fieldbyname('id').AsString;
  //trae el historial de cambios
  sqlhistorial.Close;
  sqlhistorial.ParamByName('evento').Value := sqltrafico.fieldbyname('id').AsInteger;
  sqlhistorial.Open;
  if sqlcomentarios.RecordCount > 0 then
   cboclasificacion.Text := sqltrafico.fieldbyname('status').AsString
  else
   cboclasificacion.Text:= '';
 end
else
 application.MessageBox('Este cliente no tiene eventos','Aviso',mb_iconinformation);

end;

procedure TfrmReClasificacion.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmReClasificacion.edcvecteButtonClick(Sender: TObject);
var r : integer;
begin
r :=BuscaCliente(sqlclientes);
if r <> 0 then
begin
 edcvecte.Text := inttostr(r);
 querys('SELECT sk_alarmas.id,sk_alarmas.fecha_pc,sk_alarmas.hora_pc,sk_alarmas.descripcion,sk_alarmas.zona,alarmas_status.nombre,alarmas_conclusion.status,sk_alarmas.conclusion as conclu,sk_alarmas.user FROM sk_alarmas INNER JOIN alarmas_status ON  '+
        '(alarmas_status.clave = sk_alarmas.status) INNER JOIN alarmas_conclusion ON (alarmas_conclusion.id = sk_alarmas.conclusion) WHERE sk_alarmas.idcliente ='+edcvecte.Text+' order by sk_alarmas.fecha_pc desc',0,sqltrafico);
end;
end;

procedure TfrmReClasificacion.edcvecteKeyPress(Sender: TObject;
  var Key: Char);
// var sqltemp1 : tmyquery;
begin
key:=validanumeros(key,false);
key:=validapunto(edcvecte.Text+'.',key);
  if key=#13 then
   begin
     key:=#0;

      if edcvecte.Text <> '' then
        begin
         sqlclientes.Close;
         sqlclientes.Params.Items[0].Value:=strtoint(edcvecte.Text);
         sqlclientes.Open;
         if sqlclientes.RecordCount=0 then
           begin
             application.MessageBox('No existe ningun cliente con ese numero de cuenta!','Aviso',mb_iconinformation);
             edcvecte.Text:='';
             edcvecte.SetFocus;
           end
         else
          querys('SELECT sk_alarmas.id,sk_alarmas.fecha_pc,sk_alarmas.hora_pc,sk_alarmas.descripcion,sk_alarmas.zona,alarmas_status.nombre,alarmas_conclusion.status,sk_alarmas.conclusion as conclu,sk_alarmas.user FROM sk_alarmas INNER JOIN alarmas_status ON  '+
                 ' (alarmas_status.clave = sk_alarmas.status) INNER JOIN alarmas_conclusion ON (alarmas_conclusion.id = sk_alarmas.conclusion) WHERE sk_alarmas.idcliente ='+edcvecte.Text+' order by sk_alarmas.fecha_pc desc',0,sqltrafico);
         end
       else
        edcvecte.OnButtonClick(self);
  end;

  if key = #27 then
   begin
    key:=#0;
    edcvecte.Text:='';
   end;
end;

procedure TfrmReClasificacion.vista1CellClick(
  Sender: TcxCustomGridTableView;
  ACellViewInfo: TcxGridTableDataCellViewInfo; AButton: TMouseButton;
  AShift: TShiftState; var AHandled: Boolean);
begin
//cargarrejillas;
end;

procedure TfrmReClasificacion.FormShow(Sender: TObject);
begin
cboclasificacion.Clear;
querys('select status from alarmas_conclusion order by status',0,sqlgeneral);
sqlgeneral.First;
while not sqlgeneral.Eof do
 begin
  cboclasificacion.Items.add(sqlgeneral.fieldbyname('status').AsString);
  sqlgeneral.Next;
 end;
end;

procedure TfrmReClasificacion.btnactualizarClick(Sender: TObject);
var turno,Tnombre,tiponuevo,tipoviejo:string;
forma:tfrmdetalles_pos;
begin
if cboclasificacion.Text <> sqltrafico.fieldbyname('status').AsString then
  if application.MessageBox(pchar('Esta seguro que desea cambiarle la clasificacion a este evento a '+cboclasificacion.text+'?'),'Confirmacion',mb_iconquestion+mb_yesno)=idyes then
    begin
    chtecla := #13;
    //inserta en la tabla reclaeventos los datos del combio valor anterior y despues
    querys('insert into ReclaEventos (idevento,ClasifAnt,ClasifAct,usuario,fecha,hora) values ('+sqltrafico.fieldbyname('id').AsString+','+quotedstr(sqltrafico.fieldbyname('status').AsString)+','+quotedstr(cboclasificacion.Text)+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.LoginName)+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(timetostr(HoraServidor))+')',1,sqlgeneral);
    //trae el id del estatus de la conclucion en base al nombre
    querys('select id,sufijo from alarmas_conclusion where id='+quotedstr(sqltrafico.fieldbyname('conclu').AsString),0,sqlgeneral);
          tipoviejo := sqlgeneral.fieldbyname('sufijo').AsString;

     querys('select id,sufijo from alarmas_conclusion where status='+quotedstr(cboclasificacion.Text),0,sqlgeneral);
         tiponuevo := sqlgeneral.fieldbyname('sufijo').AsString;
    //actualiza en sk_alarmas el tipo de conclucion
    querys('update sk_alarmas set conclusion ='+sqlgeneral.fieldbyname('id').AsString+' where id='+sqltrafico.fieldbyname('id').AsString,1,sqlgeneral);
    //actualiza en alarmas_detalla el campo detalle donde la action = clasificacion
    querys('update alarmas_detalle set detalle='+quotedstr(cboclasificacion.Text)+' where aid='+sqltrafico.fieldbyname('id').AsString+' and action=''CLASIFICACION''',1,sqlgeneral);

    if (tipoviejo <> tiponuevo) and (tiponuevo = 'AP') then
      begin


  forma:=tfrmdetalles_pos.Create(self);
  forma.inicializa(sqltrafico.fieldbyname('id').AsString);
  forma.showmodal;
      end;


   //trae el historial de cambios
   sqlhistorial.Close;
   sqlhistorial.ParamByName('evento').Value := sqltrafico.fieldbyname('id').AsInteger;
   sqlhistorial.Open;
   edcvecte.OnKeyPress(edcvecte,chtecla);
   sqlcomentarios.Close;

   /////////actualizar la tabla de concentrado de alarmas


  { querys('Select if ('+quotedstr(sqltrafico.fieldbyname('hora_pc').AsString)+' between  ''06:00:00 am'' AND ''14:00:00 pm'',1,if ('+quotedstr(sqltrafico.fieldbyname('hora_pc').AsString)+' between  ''14:00:01 pm'' AND ''22:00:00 pm'',2,if ('+quotedstr(sqltrafico.fieldbyname('hora_pc').AsString)+' < ''06:00:00 am'',3,0))) as turno ',0,sqlgeneral);
        turno := sqlgeneral.fieldbyname('turno').asstring;
      //buscamos si existe ese registro......
          if turno = '1' then
             Tnombre := 'DIU'
          else
             if turno = '2' then
                Tnombre := 'VES'
             else
                if turno = '3' then
                    Tnombre := 'NOC';}

  querys('Select if ("'+timetostr(time)+'" between  ''06:00:00 am'' AND ''14:00:00 pm'',1,if ("'+timetostr(time)+'" between  ''14:00:01 pm'' AND ''22:00:00 pm'',2,if ("'+timetostr(time)+'"  between ''22:00:01 pm'' and  ''24:00:00'',4,3))) as turno ',0,sqlgeneral);
  turno := sqlgeneral.fieldbyname('turno').asstring;
  //buscamos si existe ese registro......
  if  turno = '1' then
    Tnombre := 'DIU'
  else
    if turno = '2' then
      Tnombre := 'VES'
    else
      if ((turno = '3') or (turno ='4')) then
        Tnombre := 'NOC';

  //Modificado para no duplicar el nocturno
if (turno = '1') or (turno = '2') then
    querys('Select dia from TotalAlarmas where fecha ="'+datetostr(date)+'" and turno ='+quotedstr(turno),0,sqlgeneral)
else
  querys('Select dia from TotalAlarmas where fecha ="'+datetostr(date)+'" and turno in(3,4)',0,sqlgeneral);
//   querys('Select dia from TotalAlarmas where fecha ='+quotedstr(sqltrafico.fieldbyname('fecha_pc').AsString)+' and turno ='+quotedstr(turno),0,sqlgeneral);
        if sqlgeneral.FieldByName('dia').AsString = '' then
           begin
        //insertar dia
            querys('Insert into TotalAlarmas (fecha,turno,dia,NombreTurno) values ("'+datetostr(date)+'",'+quotedstr(turno)+',dayofmonth("'+datetostr(date)+'"),'+quotedstr(Tnombre)+' ) ',1,dmaccesos.sqlgeneral);
             end;
            querys('Update TotalAlarmas set '+tipoviejo+' = '+tipoviejo+' - 1 where fecha = '+quotedstr(sqltrafico.fieldbyname('fecha_pc').AsString)+' and turno='+quotedstr(turno)+' and dia= dayofmonth('+quotedstr(sqltrafico.fieldbyname('fecha_pc').AsString)+') ',1,dmaccesos.sqlgeneral);
            querys('Update TotalAlarmas set '+tiponuevo+' = '+tiponuevo+' + 1 where fecha = '+quotedstr(sqltrafico.fieldbyname('fecha_pc').AsString)+' and turno='+quotedstr(turno)+' and dia= dayofmonth('+quotedstr(sqltrafico.fieldbyname('fecha_pc').AsString)+') ',1,dmaccesos.sqlgeneral);

            querys('Update TotalAlarmas set PromDiario=truncate((MinResp/asist),2), porcento=truncate((retardos/asist)*100,2) where fecha = '+quotedstr(sqltrafico.fieldbyname('fecha_pc').AsString)+' and turno='+quotedstr(turno)+' and dia= dayofmonth('+quotedstr(sqltrafico.fieldbyname('fecha_pc').AsString)+') ',1,dmaccesos.sqlgeneral);
    end;
    ///////////////////////////////////////////////////
    cargarrejillas;
end;

procedure TfrmReClasificacion.btncerrarClick(Sender: TObject);
begin
if FileExists(uprincipal.my_path+'RepEventosCliente'+frmprincipal.idmaq+'.pdf') then
        DeleteFile(uprincipal.my_path+'RepEventosCliente'+frmprincipal.idmaq+'.pdf');
close;
end;

procedure TfrmReClasificacion.sqltraficoAfterScroll(DataSet: TDataSet);
begin
cargarrejillas;
end;

procedure TfrmReClasificacion.CrearReporte(idcliente,idalarma:string;consulta:tmyquery);
begin
querys('Select idcliente, telefono, dir, numero, clientes.nombre, clientes.idcategoria,if(rsocial is NULL or rsocial='''',if(clientes.apaterno is NULL or clientes.apaterno='''',clientes.nombre,if(clientes.amaterno is NULL or clientes.amaterno='''', '+
       'concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))),clientes.rsocial) as nombres, colonias.cp, colonias.idmnp,colonias.nombre as colonia,categorias.nombre as categoria, '+
       'municipios.nombre as municipio From clientes left join colonias on (clientes.idcol=colonias.idcol) left join categorias on (clientes.idcategoria=categorias.idcategoria ) left join  municipios on (colonias.idmnp = municipios.idmnp) WHERE idcliente='+
       quotedstr(idcliente), 0, dmreportes.sqlgeneral2);

//querys('Select id, hora_pc, fecha_pc, descripcion, c_zona, zona, tipo from sk_alarmas where id ='+quotedstr(idalarma), 0, consulta);
querys('Select sk.id,sk.hora_pc,sk.fecha_pc,sk.descripcion,sk.c_zona,sk.zona,sk.tipo,if(tr.idmotivo=0,'''',concat(''Motivo del Retardo: '',cs.nombre)) as motivo from sk_alarmas as sk inner join tiempo_respuesta as tr on sk.id = tr.aid left join'+
       ' clasif_servicios as cs on cs.orden = tr.idmotivo left join TipoServicios as ts on ts.idserv = cs.idserv where sk.id ='+quotedstr(idalarma)+' and ts.nombre=''MOTIVO RETARDO''', 0,consulta);
   with dmreportes do
   begin
  //buscar a que hora contesto el cliente......
  querys('select IF ((left(detalle,14)= ''SI CONTESTARON''),date_format(alarmas_detalle.hora,''%h:%i:%s %p''),0) as detalle from alarmas_detalle where aid='+quotedstr(idalarma)+' having detalle > 0',0,sqlgeneral);
  RVP.SetParam('cuenta',sqlgeneral.FieldByName('detalle').AsString);

  querys('select tiempo_respuesta.hora, hora_llegada,  clasif_servicios.nombre as mr, clasif_servicios.descripcion as nombrem, tiempo, mmdesc '+
  'from tiempo_respuesta left join clasif_servicios on (tiempo_respuesta.idmotivo = clasif_servicios.idstatus and  clasif_servicios.idserv = 3)'+
  ' where tiempo_respuesta.aid='+quotedstr(idalarma),0,dmreportes.sqlgeneral);
  RVP.SetParam('fecha',dmreportes.sqlgeneral.FieldByName('hora').AsString);
  RVP.SetParam('protocolo',dmreportes.sqlgeneral.FieldByName('hora_llegada').AsString);
  RVP.SetParam('Tax',dmreportes.sqlgeneral.FieldByName('tiempo').AsString);

//vamos a mostrar el motivo del retraso.
  if dmreportes.sqlgeneral.FieldByName('nombrem').AsString <> '' then
    begin
    if dmreportes.sqlgeneral.FieldByName('mr').AsString = 'OTROS' then
      begin
        if dmreportes.sqlgeneral.FieldByName('mmdesc').AsString  <> '' then
           RVP.SetParam('TotalPrice','Motivo del Retardo: '+dmreportes.sqlgeneral.FieldByName('mmdesc').AsString)
        else
           RVP.SetParam('TotalPrice','Motivo del Retardo: '+dmreportes.sqlgeneral.FieldByName('nombrem').AsString);
      end
    else
     RVP.SetParam('TotalPrice','Motivo del Retardo: '+dmreportes.sqlgeneral.FieldByName('nombrem').AsString);
    end
  else
   RVP.SetParam('TotalPrice','');
   RVP.SetParam('user',sqltrafico.fieldbyname('user').AsString);
   RVP.SetParam('titulo','Reporte de Atención de al Cliente');
  end;
dmreportes.sqlgeneral2.Execute;
querys('Select idcliente, email from clientes where idcliente ='+quotedstr(idcliente), 0, dmreportes.sqlgeneral8);
ObtenerCorreo('TfrmReClasificacion', dmreportes.sqlgeneral8.fieldbyname('email').asstring);
OperacionReporte('RepEventosCliente','Reporte de Atencion al Cliente','PDF', 0);
end;


procedure TfrmReClasificacion.btnemailClick(Sender: TObject);
var temp:tmyquery;
begin
temp := tmyquery.Create(self);
temp.Connection := dmaccesos.conexion;
dmreportes.RVDSDetalle.DataSet := sqlcomentarios;
dmreportes.RVDSskalarmas.DataSet := temp;
querys('Select idcliente, email from clientes where idcliente ='+edcvecte.Text, 0, dmreportes.sqlgeneral8);
CrearReporte(edcvecte.Text,sqltrafico.fieldbyname('id').AsString,temp);
end;

procedure TfrmReClasificacion.sqlcomentariosAfterPost(DataSet: TDataSet);
begin
frmprincipal.ucprincipal.Log('Reclasifico la señal '+sqlcomentarios.fieldbyname('aid').AsString+' de la cuenta '+edcvecte.text, 2);
end;

procedure TfrmReClasificacion.cxcvista1EditValueChanged(
  Sender: TcxCustomGridTableView; AItem: TcxCustomGridTableItem);
begin
{if  dscomentarios.DataSet.FieldByName('action').AsString = '' then
  begin
  dscomentarios.DataSet.FieldByName('action').AsString := 'ANEXO';
  dscomentarios.DataSet.FieldByName('fecha').AsString := datetostr(date);
  dscomentarios.DataSet.FieldByName('hora').AsString := FormatDateTime('HH:mm:ss', time);
  dscomentarios.DataSet.FieldByName('action').AsString := 'ANEXO';

  querys('Select max(did)+1 as did from alarmas_detalle where action = ""', 0, sqlgeneral);
   querys('UPdate alarmas_detalle set fecha="'+datetostr(date)+'", hora="'+FormatDateTime('HH:mm:ss', time)+'", '+
          'action="ANEXO", aid =  '+sqltrafico.FieldByName('id').AsString+' '+
       'where did="'+sqlgeneral.fieldbyname('did').asstring+'" and action="" and fecha = "0000-00-00"', 1, sqlgeneral);
   end;     }
end;

procedure TfrmReClasificacion.sqlcomentariosBeforePost(DataSet: TDataSet);
begin
if  dscomentarios.DataSet.FieldByName('action').AsString = '' then
  begin
dscomentarios.DataSet.FieldByName('action').AsString := 'ANEXO';
  dscomentarios.DataSet.FieldByName('fecha').AsString := datetostr(date);
  dscomentarios.DataSet.FieldByName('hora').AsString := FormatDateTime('HH:mm:ss', time);
  dscomentarios.DataSet.FieldByName('aid').AsString := sqltrafico.FieldByName('id').AsString;
  dscomentarios.DataSet.FieldByName('tipo').AsString := '7';
  dscomentarios.DataSet.FieldByName('user').AsString := frmprincipal.ucprincipal.CurrentUser.LoginName;
  end;
end;

end.
