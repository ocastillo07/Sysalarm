unit UExNotas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ToolWin, StdCtrls, DBCtrls, RzDBEdit, RzEdit, RzLabel,
  RzDTP, ExtCtrls, RzPanel, RzButton, RzRadChk, DB, MemDS, DBAccess,
  MyAccess, Menus, LMDCustomComponent, LMDContainerComponent,
  LMDBaseDialog, LMDCalendarDlg, cxControls, cxContainer, cxEdit,
  cxTextEdit, cxMaskEdit, cxSpinEdit, cxTimeEdit;

type
  TfrmExNotas = class(TForm)
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
    RzLabel7: TRzLabel;
    procedure btnfuentesClick(Sender: TObject);
    procedure RENuevoEnter(Sender: TObject);
    procedure RENuevoExit(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure RENuevoChange(Sender: TObject);
    procedure dtphhastaChange(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnsalirClick(Sender: TObject);
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
  frmExNotas: TfrmExNotas;

implementation

uses Udm, Urecursos, Uprincipal;

{$R *.dfm}

// todos los TipoNota que sean menores a 1 son para mostrar solo informacion
// -1 notas de bloqueo y desbloqueo -2 notas temporales -3 historial completo, -4 contactos telefonicos
procedure TfrmExNotas.ConcatenaNotas;
var desde,hasta:string;
 h,m,s,mls:word;
begin
 querys('select concat(n.nota,"  (",n.TipoNota,")") as nota, concat("COMENTADO POR ", '+usuarionombre('u')+'," '+
        'DEL AREA ",areas.nombre," CON EL PUESTO ", p.nombre," EL DIA ",n.fecha," A LA(S) ",n.hora) as '+
        'comentario,n.TipoNota from NoNotas n left join usuarios as u on u.idusuario=n.idusuario '+
        'left join puestos as p on u.idpuesto = p.idpuesto left join areas on areas.idarea '+
        ' = u.idarea where idnota='+inttostr(idNota)+' order by n.fecha,n.hora',0,sqlgeneral);

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

  reanterior.Lines.Add(sqlgeneral.fieldbyname('nota').AsString);
  sqlgeneral.Next;
  end;
end;

procedure TfrmExNotas.btnfuentesClick(Sender: TObject);
begin
if fuentes.Execute then
begin
renuevo.SelAttributes.Size:=fuentes.Font.Size;
renuevo.SelAttributes.color:=fuentes.Font.color;
renuevo.SelAttributes.style:=fuentes.Font.style;
end;
end;

procedure TfrmExNotas.RENuevoEnter(Sender: TObject);
begin
btnfuentes.Enabled:=true;
end;

procedure TfrmExNotas.RENuevoExit(Sender: TObject);
begin
btnfuentes.Enabled:=false;
end;


procedure TfrmExNotas.btnguardarClick(Sender: TObject);
begin     {
//iddoc es el numero de cliente u otro de procedencia
shortdateformat:='yyyy/mm/dd';
longtimeformat:='hh:mm:ss';
if (TipoNota <> 'INSTALACIONES') or  (TipoNota <> 'INSTALACIONES') then
  if (TipoNota <> 'SERVICIOS') then
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
//      {toluca quite este else por que era el que hacia que no guardara en la bd...
      //else
      //if (TipoNota <> 'TEMPORAL_M.aONITOREO') or (TipoNota='TEMPORAL') then
      // querys('insert into notas (idnota,TipoNota,nota,desplegable,idusuario,hora,fecha,procedencia) values ('+inttostr(idNota)+','+quotedstr(TipoNota)+','+quotedstr(uppercase(REnuevo.Text))+',0,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+','+quotedstr(timetostr(HoraServidor))+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(tabla)+')',1,sqlgeneral);
      ConcatenaNotas;
      REnuevo.Text:='';}
end;

procedure TfrmExNotas.FormShow(Sender: TObject);
begin
//reanterior.Height := 145;
{btnguardar.Enabled:=false;
if (idNota <> 0)and(TipoNota<>'-1') then
  begin}
   ConcatenaNotas;  {
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

if (TipoNota='DESBLOQUEO')or(TipoNota = 'BLOQUEO')or(TipoNota='GENERALES')or((TipoNota<>'-1')and(TipoNota<>'TEMPORAL')and(TipoNota<>'TEMPORAL_MONITOREO')and(TipoNota<>'-2')and(TipoNota<>'-3')and(TipoNota<>'-4')) then //para guardar las notas de bloqueo
 begin lblanterior.Caption:='Valor Anterior (Solo Lectura):';
       gbvigencia.Visible:=false; btnguardar.Visible:=true;
       lblVNuevo.Visible:=true; lblVNuevo.Top:=166; RENuevo.Visible:=true;
         btnguardar.left:=1; btnsalir.left:=77;
 end
else
if (TipoNota ='-1') or (TipoNota='-2') or (TipoNota = '-3') or (TipoNota = '-4') then //para mostrar las notas de bloqueo, notas temporales y el Historial
  begin
 case strtoint(TipoNota) of
 -1:begin
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
         frmnotas.Caption:='Historial Completo de este Cliente'
     else
         frmnotas.Caption:='Historial Completo de esta Instalacion';

//     reanterior.Height := 600;
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
 begin lblanterior.Caption:='Valor Anterior (Solo Lectura):';
        lblVNuevo.Visible:=true; RENuevo.Visible:=true;
        gbvigencia.Visible:=true; btnguardar.Visible:=true; lblVNuevo.Top:=166;
       btnguardar.left:=1; btnsalir.left:=77; gbvigencia.Top:=327; RENuevo.Top:=182;
 end;     }
end;

procedure TfrmExNotas.RENuevoChange(Sender: TObject);
begin
if (RENuevo.Text = '')and(self.Showing) then
btnguardar.Enabled:=false;
if (RENuevo.Text <> '')and(self.Showing) then
btnguardar.Enabled:=true;
end;

procedure TfrmExNotas.dtphhastaChange(Sender: TObject);
var diferencia:variant;
begin
diferencia:=dtphhasta.Date-dtphdesde.Date;
if diferencia < 0 then
dtphhasta.Date:=dtphdesde.Date;
end;

procedure TfrmExNotas.FormClose(Sender: TObject; var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmExNotas.btnsalirClick(Sender: TObject);
begin
close
end;

end.
