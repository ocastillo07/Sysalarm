{///////////////////////////////////////////////////////////////////////////////
2009/01/20 dalyla que en servicios se vea el que comento
--------------------------------------------------------------------------------
2008/09/13 dalyla que se vea el historial de bloqueo cuando es de bloq y desbloq
}///////////////////////////////////////////////////////////////////////////////

unit UNotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, DBCtrls, RzDBEdit, RzEdit, RzLabel,
  RzDTP, ExtCtrls, RzPanel, RzButton, RzRadChk, DB, MemDS, DBAccess,
  MyAccess, Menus, LMDCustomComponent, LMDContainerComponent,
  LMDBaseDialog, LMDCalendarDlg, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxTimeEdit;

type
  Tfrmnotas = class(TForm)
    tbherramientas: TToolBar;
    btncopy: TToolButton;
    btncut: TToolButton;
    btnpaste: TToolButton;
    btndelete: TToolButton;
    btnundo: TToolButton;
    btnfuentes: TToolButton;
    fuentes: TFontDialog;
    RENuevo: TRzRichEdit;
    gbVigencia: TRzGroupBox;
    dtpFDesde: TRzDateTimePicker;
    RzLabel1: TRzLabel;
    dtpFHasta: TRzDateTimePicker;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    REAnterior: TRzRichEdit;
    lblanterior: TRzLabel;
    lblVNuevo: TRzLabel;
    sqlgeneral: TMyQuery;
    MainMenu1: TMainMenu;
    RzPanel1: TRzPanel;
    btnsalir: TRzBitBtn;
    btnguardar: TRzBitBtn;
    dtphdesde: TDateTimePicker;
    dtphhasta: TDateTimePicker;
    procedure btnfuentesClick(Sender: TObject);
    procedure RENuevoEnter(Sender: TObject);
    procedure RENuevoExit(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RENuevoChange(Sender: TObject);
    procedure dtphhastaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }

  public
    { Public declarations }
       idProcedencia,idNota:integer;
       tabla,campo,TipoNota,SoloLectura:string;
       Nota:TrzRichEdit;
      procedure ConcatenaNotas;
  end;

var
  frmnotas: Tfrmnotas;

implementation

uses Udm, Urecursos, Uprincipal;

{$R *.dfm}
{
todos los TipoNota que sean menores a 1 son para mostrar solo informacion
-1 notas de bloqueo y desbloqueo
-2 notas temporales
-3 historial completo,
-4 contactos telefonicos}

procedure Tfrmnotas.ConcatenaNotas;
var desde,hasta, condicion, comentario, tn:string; h,m,s,mls:word;
begin
decodetime(HoraServidor, h, m, s, mls);
desde :=inttostr(h)+':'+inttostr(m)+':'+inttostr(s);
hasta :=desde;
REAnterior.Clear;

/////////////////////////
condicion := '';
comentario := 'concat("COMENTADO POR ", '+usuarionombre('u')+'," DEL AREA ",a.nombre," CON EL PUESTO ", '+
              'p.nombre," EL DIA ",n.fecha," A LA(S) ",n.hora)';


  if TipoNota<>'-3' then
    tn := 'and TipoNota="'+TipoNota+'" '
  else
    tn := '';

if (TipoNota='BLOQUEO') or (TipoNota='DESBLOQUEO') then
  begin
  condicion := 'and (TipoNota="BLOQUEO" or TipoNota="DESBLOQUEO")';
  tn := '';
  end;

if TipoNota='-2' then
  begin
  condicion := 'and (dfecha<="'+datetostr(date)+'" and hfecha>="'+datetostr(date)+'" and dhora<="'+desde+'" and hhora>="'+hasta+'")';
  tn := 'and TipoNota="TEMPORAL" '
  end;

querys('select nota, TipoNota, '+comentario+' as comentario, dfecha, dhora, hfecha, hhora from notas n '+
       'left join usuarios as u on u.idusuario=n.idusuario left join puestos as p on u.idpuesto = p.idpuesto '+
       'left join areas as a on a.idarea = u.idarea where idnota='+inttostr(idNota)+' '+tn+' '+condicion+
       ' order by n.fecha, n.hora', 0, sqlgeneral);

/////////////////////////
                           {
if (TipoNota='BLOQUEO') or (TipoNota='DESBLOQUEO') then
  querys('select nota,TipoNota from notas where idnota='+inttostr(idNota)+' and (TipoNota="BLOQUEO" or TipoNota="DESBLOQUEO") order by fecha,hora',0,sqlgeneral)
else
  if TipoNota='-3' then
    querys('select concat(notas.nota,"  (",notas.TipoNota,")") as nota, concat("COMENTADO POR ", '+usuarionombre('u')+'," DEL AREA ",areas.nombre," CON EL PUESTO ",'+
           ' p.nombre," EL DIA ",notas.fecha," A LA(S) ",notas.hora) as comentario,notas.TipoNota from notas left join usuarios as u on u.idusuario=notas.idusuario left join puestos as p on u.idpuesto = p.idpuesto left join areas on areas.idarea '+
           ' = u.idarea where idnota='+inttostr(idNota)+' order by notas.fecha,notas.hora',0,sqlgeneral)
  else
    if TipoNota='-2' then
      querys('SELECT nota,dfecha,hfecha,dhora,hhora,desplegable,TipoNota from notas where (dfecha<='+quotedstr(datetostr(FechaServidor))+' and hfecha>='+quotedstr(datetostr(FechaServidor))+' and dhora<='+quotedstr(desde)+' and hhora>='+quotedstr(hasta)+') and idnota='+inttostr(idNota)+' and TipoNota='+quotedstr('TEMPORAL')+' order by fecha,hora',0,sqlgeneral)
    else
      if (TipoNota='TEMPORAL_MONITOREO') or (TipoNota='-4')  then
        querys('SELECT nota,dfecha,hfecha,dhora,hhora,desplegable,TipoNota from notas where (dfecha<='+quotedstr(datetostr(FechaServidor))+' and hfecha>='+quotedstr(datetostr(FechaServidor))+' and dhora<='+quotedstr(desde)+' and hhora>='+quotedstr(hasta)+') and idnota='+inttostr(idNota)+' and TipoNota='+quotedstr('TEMPORAL_MONITOREO')+'   order by fecha,hora',0,sqlgeneral)
      else
        if (TipoNota='-4') or (TipoNota='TEMPORAL') then
          querys('SELECT nota,dfecha,hfecha,dhora,hhora,desplegable,TipoNota from notas where (dfecha<='+quotedstr(datetostr(FechaServidor))+' and hfecha>='+quotedstr(datetostr(FechaServidor))+' and dhora<='+quotedstr(desde)+' and hhora>='+quotedstr(hasta)+') and idnota='+inttostr(idNota)+' and  TipoNota='+quotedstr('TEMPORAL')+'  order by fecha,hora',0,sqlgeneral)
        else
          if (TipoNota = 'INSTALACIONES') or (TipoNota = 'AGENDA') THEN
            querys('select notas.nota,notas.TipoNota,concat(''COMENTADO POR '',ifnull(u.nombre,''''),'' '',ifnull(u.apaterno,''''),'' '',ifnull(u.amaterno,''''),'' DEL AREA '',areas.nombre,'' CON EL PUESTO '',p.nombre,'' EL DIA '',notas.fecha,'' A LA(S) '',notas.hora)'+
                   ' as comentario from notas left join usuarios as u on u.idusuario=notas.idusuario left join puestos as p on u.idpuesto = p.idpuesto left join areas on areas.idarea = u.idarea where idnota='+inttostr(idNota)+' and TipoNota='+quotedstr(TipoNota)+' order by notas.fecha,notas.hora',0,sqlgeneral)
          else
            querys('select nota,TipoNota from notas where idnota='+inttostr(idNota)+' and  TipoNota='+quotedstr(TipoNota)+' order by fecha,hora',0,sqlgeneral);
                         }
while not sqlgeneral.Eof do
  begin
  if (sqlgeneral.RecNo mod 2) > 0 then
    begin
    reanterior.SelAttributes.Color := clred;
    reanterior.SelAttributes.Style :=[fsBold];
    end
  else
    begin
    reanterior.SelAttributes.Color := clblue;
    reanterior.SelAttributes.Style :=[];
    end;
  if (sqlgeneral.fieldbyname('TipoNota').AsString = 'INSTALACIONES') or (sqlgeneral.fieldbyname('TipoNota').AsString = 'AGENDA')  or (sqlgeneral.fieldbyname('TipoNota').AsString = 'SERVICIOS') then
    reanterior.Lines.Add(sqlgeneral.fieldbyname('nota').AsString+chr(13)+sqlgeneral.fieldbyname('comentario').AsString)
  else
    reanterior.Lines.Add('['+sqlgeneral.fieldbyname('TipoNota').AsString + ']   '+sqlgeneral.fieldbyname('nota').AsString);
  sqlgeneral.Next;
  end;
end;

procedure Tfrmnotas.btnfuentesClick(Sender: TObject);
begin
if fuentes.Execute then
begin
renuevo.SelAttributes.Size:=fuentes.Font.Size;
renuevo.SelAttributes.color:=fuentes.Font.color;
renuevo.SelAttributes.style:=fuentes.Font.style;
end;
end;

procedure Tfrmnotas.RENuevoEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure Tfrmnotas.RENuevoExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;


procedure Tfrmnotas.btnguardarClick(Sender: TObject);
begin
//iddoc es el numero de cliente u otro de procedencia
shortdateformat:='yyyy/mm/dd';
longtimeformat:='hh:mm:ss';
if (TipoNota <> 'INSTALACIONES') or  (TipoNota <> 'INSTALACIONES')  then
  if (TipoNota <> 'SERVICIOS') and  (TipoNota <> 'AGENDA') then
  REnuevo.Lines.Add('Comentado por '+frmprincipal.ucprincipal.CurrentUser.LoginName+' de '+frmprincipal.AreaUsuario+' con el puesto '+frmprincipal.PuestoUsuario+' el '+datetostr(FechaServidor)+' a las '+timetostr(HoraServidor));

if idNota = 0 then
  begin
  //trae el maximo idnota de la tabla de notas
  querys('select max(idnota) as id from notas',0,sqlgeneral);
  idNota:=sqlgeneral.fieldbyname('id').AsInteger+1;
  //actualiza el idnota de la tabla que invoco esta pantalla
  querys('update '+tabla+' set idnota='+inttostr(idNota)+ ' where '+campo+'='+inttostr(idProcedencia),1,sqlgeneral);
  end;

if TipoNota = 'TEMPORAL_MONITOREO' then
  begin
  //verifica si existe ya la nota temporal para este cliente
  querys('select TipoNota from notas where TipoNota='+quotedstr('TEMPORAL_MONITOREO')+' and idnota='+inttostr(idNota),0,sqlgeneral);
  if sqlgeneral.RecordCount = 0 then
    querys('insert into notas (idnota,TipoNota,nota,desplegable,dfecha,hfecha,dhora,hhora,idusuario,hora,fecha,procedencia,iddoc) values ('+inttostr(idNota)+','+quotedstr(TipoNota)+','+quotedstr(uppercase(REnuevo.Text))+',1,'+quotedstr(datetostr(dtpfdesde.Date))+','+quotedstr(datetostr(dtpfhasta.Date))+','+quotedstr(timetostr(dtphdesde.time))+','+quotedstr(timetostr(dtphhasta.time))+','+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+','+quotedstr(timetostr(HoraServidor))+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(tabla)+','+inttostr(idProcedencia)+')',1,sqlgeneral)
  else
    querys('update notas set idnota='+inttostr(idNota)+',TipoNota='+quotedstr(TipoNota)+',nota='+quotedstr(uppercase(REnuevo.Text))+',desplegable=1,idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+',dfecha='+quotedstr(datetostr(dtpfdesde.Date))+',hfecha='+quotedstr(datetostr(dtpfhasta.Date))+',dhora='+quotedstr(timetostr(dtphdesde.time))+',hhora='+quotedstr(timetostr(dtphhasta.time))+' where TipoNota='+quotedstr('TEMPORAL_MONITOREO')+' and idnota='+inttostr(idNota),1,sqlgeneral)
  end
else
  if TipoNota='TEMPORAL' then
    begin
    //verifica si existe ya la nota temporal para este cliente
    querys('select TipoNota from notas where TipoNota='+quotedstr('TEMPORAL')+' and idnota='+inttostr(idNota),0,sqlgeneral);
    if sqlgeneral.RecordCount = 0 then
      querys('insert into notas (idnota,TipoNota,nota,desplegable,dfecha,hfecha,dhora,hhora,idusuario,hora,fecha,procedencia,iddoc) values ('+inttostr(idNota)+','+quotedstr(TipoNota)+','+quotedstr(uppercase(REnuevo.Text))+',1,'+quotedstr(datetostr(dtpfdesde.Date))+','+quotedstr(datetostr(dtpfhasta.Date))+','+quotedstr(timetostr(dtphdesde.time))+','+quotedstr(timetostr(dtphhasta.time))+','+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+','+quotedstr(timetostr(HoraServidor))+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(tabla)+','+inttostr(idProcedencia)+')',1,sqlgeneral)
    else
      querys('update notas set idnota='+inttostr(idNota)+',TipoNota='+quotedstr(TipoNota)+',nota='+quotedstr(uppercase(REnuevo.Text))+',desplegable=1,idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+',dfecha='+quotedstr(datetostr(dtpfdesde.Date))+',hfecha='+quotedstr(datetostr(dtpfhasta.Date))+',dhora='+quotedstr(timetostr(dtphdesde.time))+',hhora='+quotedstr(timetostr(dtphhasta.time))+' where TipoNota='+quotedstr('TEMPORAL')+' and idnota='+inttostr(idNota),1,sqlgeneral)
    end
  else
    if TipoNota = 'BLOQUEO' then
      begin
      //actualiza el campo NotaBloqueo y bloqueado
      querys('update clientes set NotaBloqueo='+quotedstr(uppercase(REnuevo.Text))+',bloqueado=1 where '+campo+'='+inttostr(idProcedencia),1,frmprincipal.sqlgeneral);
      querys('insert into notas (idnota,TipoNota,nota,desplegable,idusuario,hora,fecha,procedencia,iddoc) values ('+inttostr(idNota)+','+quotedstr(TipoNota)+','+quotedstr(uppercase(REnuevo.Text))+',0,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+','+quotedstr(timetostr(HoraServidor))+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(tabla)+','+inttostr(idProcedencia)+')',1,sqlgeneral);
      end
    else
      if TipoNota='DESBLOQUEO' then
        begin
        //actualiza el campo NotaVloqueo y Bloqueado
        querys('update clientes set NotaBloqueo='+quotedstr(' ')+',bloqueado=0 where '+campo+'='+inttostr(idProcedencia),1,frmprincipal.sqlgeneral);
        querys('insert into notas (idnota,TipoNota,nota,desplegable,idusuario,hora,fecha,procedencia,iddoc) values ('+inttostr(idNota)+','+quotedstr(TipoNota)+','+quotedstr(uppercase(REnuevo.Text))+',0,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+','+quotedstr(timetostr(HoraServidor))+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(tabla)+','+inttostr(idProcedencia)+')',1,sqlgeneral);
        end
      else
        querys('insert into notas (idnota,TipoNota,nota,desplegable,idusuario,hora,fecha,procedencia,iddoc) values ('+inttostr(idNota)+','+quotedstr(TipoNota)+','+quotedstr(uppercase(REnuevo.Text))+',0,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+','+quotedstr(timetostr(HoraServidor))+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(tabla)+','+inttostr(idProcedencia)+')',1,sqlgeneral);
      {toluca quite este else por que era el que hacia que no guardara en la bd...}
      //else
      //if (TipoNota <> 'TEMPORAL_M.aONITOREO') or (TipoNota='TEMPORAL') then
      // querys('insert into notas (idnota,TipoNota,nota,desplegable,idusuario,hora,fecha,procedencia) values ('+inttostr(idNota)+','+quotedstr(TipoNota)+','+quotedstr(uppercase(REnuevo.Text))+',0,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+','+quotedstr(timetostr(HoraServidor))+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(tabla)+')',1,sqlgeneral);
      ConcatenaNotas;
      REnuevo.Text:='';
end;

procedure Tfrmnotas.FormShow(Sender: TObject);
begin
btnguardar.Enabled:=false;
if (idNota <> 0) and (TipoNota<>'-1') then
  begin
  ConcatenaNotas;
  if (TipoNota = 'TEMPORAL') or (TipoNota = 'TEMPORAL_MONITOREO') then
    begin
    if sqlgeneral.RecordCount > 0 then
      begin
      dtpfdesde.Date:=sqlgeneral.fieldbyname('dfecha').AsDateTime;
      dtpfhasta.Date:=sqlgeneral.fieldbyname('hfecha').AsDateTime;
      dtphdesde.Time:=sqlgeneral.fieldbyname('dhora').AsDateTime;
      dtphhasta.time:=sqlgeneral.fieldbyname('hhora').AsDateTime;
      end
    else
      begin
      dtpfdesde.Date:=FechaServidor;
      dtpfhasta.Date:=FechaServidor;
      dtphdesde.Time:=HoraServidor;
      dtphhasta.Time:=HoraServidor;
      end;
    end;
  end;

if (TipoNota='DESBLOQUEO')or(TipoNota = 'BLOQUEO')or(TipoNota='GENERALES')or
   ((TipoNota<>'-1')and(TipoNota<>'TEMPORAL')and(TipoNota<>'TEMPORAL_MONITOREO')and
   (TipoNota<>'-2')and(TipoNota<>'-3')and(TipoNota<>'-4')) then //para guardar las notas de bloqueo
  begin
  lblanterior.Caption:='Valor Anterior (Solo Lectura):';
  gbvigencia.Visible:=false;
  btnguardar.Visible:=true;
  lblVNuevo.Visible:=true;
  RENuevo.Visible:=true;
  lblVNuevo.Top:=166;
  btnguardar.left:=1;
  btnsalir.left:=77;
  end
else  //para mostrar las notas de bloqueo, notas temporales y el Historial
  if (TipoNota ='-1') or (TipoNota='-2') or (TipoNota = '-3') or (TipoNota = '-4') then
    begin
    case strtoint(TipoNota) of
     -1: begin
         lblanterior.Caption:='Motivo de Bloqueo:';
         frmnotas.Caption:='Este Cliente esta Bloqueado';
         end;
     -2: begin
         lblanterior.Caption:='Nota:';
         frmnotas.Caption:='Nota Temporal de este Cliente';
         end;
     -3: begin
         lblanterior.Caption:='Notas:';
         if tabla <> 'instalaciones' then
           begin
           if tabla = 'agenda_vendedores' then
             frmnotas.Caption:='Historial de oportunidad'
           else
            frmnotas.Caption:='Historial Completo de este Cliente';
           end
         else
           frmnotas.Caption:='Historial Completo de esta Instalacion';
         end;
     -4: begin
         lblanterior.Caption:='Nota:';
         frmnotas.Caption:='Nota Temporal de Monitoreo';
         end;
     else
       begin
       lblanterior.Caption:='Nota:';
       frmnotas.Caption:='Notas de Cliente';
       end;
     end;
  btnguardar.Visible:=false;
  lblVNuevo.Visible:=false;
  RENuevo.Visible:=false;
  gbvigencia.Visible:=false;
  btnsalir.Left:=1;
  end
else
  if (TipoNota='TEMPORAL') or (TipoNota='TEMPORAL_MONITOREO') then
    begin
    lblanterior.Caption:='Valor Anterior (Solo Lectura):';
    lblVNuevo.Visible:=true;
    RENuevo.Visible:=true;
    gbvigencia.Visible:=true;
    btnguardar.Visible:=true;
    lblVNuevo.Top:=166;
    btnguardar.left:=1;
    btnsalir.left:=77;
    gbvigencia.Top:=327;
    RENuevo.Top:=182;
    end;
end;

procedure Tfrmnotas.RENuevoChange(Sender: TObject);
begin
if (RENuevo.Text = '')and(self.Showing) then
btnguardar.Enabled:=false;
if (RENuevo.Text <> '')and(self.Showing) then
btnguardar.Enabled:=true;
end;

procedure Tfrmnotas.dtphhastaChange(Sender: TObject);
var diferencia:variant;
begin
diferencia:=dtphhasta.Date-dtphdesde.Date;
if diferencia < 0 then
dtphhasta.Date:=dtphdesde.Date;
end;

procedure Tfrmnotas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
RENuevo.Clear;
REAnterior.Clear;
end;

end.
