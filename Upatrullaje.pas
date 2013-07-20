{///////////////////////////////////////////////////////////////////////////////
2008/10/24 dalyla correcion de duplicados en edicion
2008/10/21 dalyla patrullaje por cualquiera de central
}///////////////////////////////////////////////////////////////////////////////
unit Upatrullaje;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, ExtCtrls, RzPanel, RzLabel, Mask, RzEdit,
  RzBtnEdt, DB, MemDS, DBAccess, MyAccess, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit, cxDBData, cxMemo,
  cxGridLevel, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxClasses, cxControls, cxGridCustomView, cxGrid, RzButton, DBCtrls,
  RzDBNav, RzSplit;

type
  Tfrmpatrulleros = class(TForm)
    sqlgeneral: TMyQuery;
    pnlencabezado: TRzPanel;
    edcve_supervisor: TRzEdit;
    cbonom_supervisor: TRzComboBox;
    RzLabel4: TRzLabel;
    cbonom_turno: TRzComboBox;
    RzLabel1: TRzLabel;
    cboestatus: TRzComboBox;
    RzLabel2: TRzLabel;
    lblclave: TRzLabel;
    edclave: TRzButtonEdit;
    sqlactivos: TMyQuery;
    dsactivos: TDataSource;
    sqldisponibles: TMyQuery;
    dsdisponibles: TDataSource;
    tblpatrullaje: TMyTable;
    DSpatrullaje: TDataSource;
    tblpatrullajeidpatrullaje: TIntegerField;
    tblpatrullajeidturno: TIntegerField;
    tblpatrullajeidsupervisor: TIntegerField;
    tblpatrullajeabierto: TSmallintField;
    tblpatrullajefecha: TStringField;
    tblpatrullajehora: TStringField;
    tblpatrullajeusuario: TStringField;
    RzLabel3: TRzLabel;
    lblhorario: TRzLabel;
    RzPanel1: TRzPanel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    RzSplitter1: TRzSplitter;
    gbactivos: TRzGroupBox;
    cxGrid1: TcxGrid;
    cxGridDBTableView2: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel2: TcxGridLevel;
    gbdisponibles: TRzGroupBox;
    cxdisponibles: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBTableView1DBColumn1: TcxGridDBColumn;
    cxGridDBTableView1DBColumn2: TcxGridDBColumn;
    cxGridDBTableView1DBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    lbufh: TRzLabel;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure cbonom_supervisorClick(Sender: TObject);
    procedure cbonom_supervisorKeyPress(Sender: TObject; var Key: Char);
    procedure cbonom_supervisorChange(Sender: TObject);
    procedure edcve_supervisorKeyPress(Sender: TObject; var Key: Char);
    procedure btnaltaClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure limpia;
    procedure habilita;
    procedure deshabilita;
    procedure buscarlocate(id:integer);
    procedure Alinea(altura:integer);
    procedure cxGridDBTableView1DblClick(Sender: TObject);
    procedure cxGridDBTableView2DblClick(Sender: TObject);
    procedure edcve_supervisorChange(Sender: TObject);
    procedure edclaveButtonClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure cbonom_turnoClick(Sender: TObject);
    procedure edclaveKeyPress(Sender: TObject; var Key: Char);
    procedure edclaveChange(Sender: TObject);
  private
     function disponibles: string;
    { Private declarations }
  public

    { Public declarations }
  end;

var
  frmpatrulleros: Tfrmpatrulleros;

const

consulta: string = 'select distinct usuarios.idusuario,usuarios.codigo,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) as Nombre,sectores.nombre as sector '+
                  'from usuarios inner join DetPatrullaje on DetPatrullaje.idpatrullero = usuarios.idusuario '+
                  'inner join sectores on sectores.idsector = usuarios.idsector where DetPatrullaje.idpatrullaje =';
                  
activos: string = 'select distinct usuarios.idusuario,usuarios.codigo,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) as Nombre,sectores.nombre as sector from usuarios inner join areas on usuarios.'+
                  'idarea=areas.idarea inner join puestos  on puestos.idpuesto=  usuarios.idpuesto inner join sectores on sectores.idsector = usuarios.idsector where areas.nombre=''CENTRAL'' and usuarios.estatus = 1 and '+
                  'usuarios.idsupervisor <> 0';                                                                                                                                                   //    puestos.nombre=''PATRULLERO'' and 
                                          //    p.nombre="PATRULLERO" 
implementation

uses Urecursos, Udm, Ubusquedas, Uprincipal, Udmrep;

{$R *.dfm}

procedure tfrmpatrulleros.Alinea(altura:integer);
begin
{ btnalta.Top:=altura;
 btnborrar.Top:=altura;
 btnmodificar.Top:=altura;
 btncancelar.Top:=altura;}
end;

procedure tfrmpatrulleros.buscarlocate(id:integer);
var eshoy:String;
begin
chtecla:=#13;
tblpatrullaje.Active:=true;
if tblpatrullaje.Locate('idpatrullaje',id,[]) then
 begin
  edcve_supervisor.Text := tblpatrullajeidsupervisor.AsString;
  edcve_supervisor.OnKeyPress(self,chtecla);
  querys('select nombre, fecha from turnos where idturno='+tblpatrullajeidturno.Asstring,0,sqlgeneral);
  cbonom_turno.Text:=sqlgeneral.fieldbyname('nombre').AsString;
  cbonom_turno.ItemIndex:= cbonom_turno.Items.IndexOf(sqlgeneral.fieldbyname('nombre').AsString);
  cboestatus.Text := cboestatus.Items.Strings[tblpatrullajeabierto.AsInteger];
  cboestatus.ItemIndex := tblpatrullajeabierto.AsInteger;
  lbufh.Caption := UFH(tblpatrullaje);
  querys('select idturno,HoraInicio,HoraFin from turnos where nombre='+quotedstr(cbonom_turno.Text),0,sqlgeneral);
  lblhorario.Caption := sqlgeneral.fieldbyname('HoraInicio').Asstring+' - '+sqlgeneral.fieldbyname('HoraFin').Asstring;
  eshoy := tblpatrullajefecha.Asstring;
  querys(consulta+edclave.text,0,sqlactivos);
  if cboestatus.ItemIndex = 0 then
      begin
      gbdisponibles.Visible := false;
      Alinea(266);
      end
   else
   begin
    gbdisponibles.Visible := true;
    querys('select idturno from turnos where nombre='+quotedstr(cbonom_turno.Text),0,sqlgeneral);
    //querys(disponibles+' and u.idturno='+sqlgeneral.fieldbyname('idturno').AsString,0,sqldisponibles);
    querys(disponibles,0,sqldisponibles);
    Alinea(459);
   end;
  // if eshoy = datetostr(now) then
   if cboestatus.text = 'ABIERTO' then
       btnmodificar.Enabled := true
   else
       btnmodificar.Enabled := false;


 end
else
 begin
  application.MessageBox('Esa clave no esta registrada','Aviso',mb_iconinformation);
  tblpatrullaje.Active:=false;
 end;
end;

procedure tfrmpatrulleros.deshabilita;
begin
     edclave.Enabled:=true;
     edcve_supervisor.Enabled := false;
     cbonom_supervisor.Enabled := false;
     cbonom_turno.Enabled := false;
     cboestatus.Enabled := false;
     gbactivos.Enabled := false;
     gbdisponibles.Enabled := false;
     edclave.Text:='';
     edclave.SetFocus;
end;

procedure tfrmpatrulleros.habilita;
begin
  edclave.Enabled:=false;
   edcve_supervisor.Enabled := true;
   cbonom_supervisor.Enabled := true;
   cbonom_turno.Enabled := true;
   cboestatus.Enabled := true;
end;

procedure tfrmpatrulleros.limpia;
begin
edclave.Clear;
edcve_supervisor.Text := '';
cbonom_supervisor.Text := '';
cbonom_turno.Text := '';
cboestatus.Text := '';
sqlactivos.Close;
sqldisponibles.Close;
lblhorario.Caption := '';
lbufh.Caption := '';
end;

procedure Tfrmpatrulleros.FormShow(Sender: TObject);
begin

Alinea(266);
//carga los gerentes de central activos
CargaCombo('select concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) as Nombre from usuarios inner join areas on usuarios.idarea=areas.idarea inner join puestos  on puestos.idpuesto= '+
           ' usuarios.idpuesto where (puestos.nombre=''SUPERVISOR DE CENTRAL'' or puestos.nombre=''GERENTE'') and areas.nombre=''CENTRAL'' and usuarios.estatus = 1','Patrullaje',cbonom_supervisor);
//carga los turnos de central
CargaCombo('select turnos.nombre from turnos inner join areas on turnos.idarea = areas.idarea where areas.nombre = '+quotedstr('CENTRAL'),'Turnos',cbonom_turno)
end;

procedure Tfrmpatrulleros.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure Tfrmpatrulleros.cbonom_supervisorClick(Sender: TObject);
begin
querys('SELECT usuarios.idusuario FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE  (usuarios.estatus = 1 and concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) ='+quotedstr(cbonom_supervisor.Text)+')',0,SqlGeneral);
edcve_supervisor.Text:=SqlGeneral.fieldbyname('idusuario').AsString;
end;

procedure Tfrmpatrulleros.cbonom_supervisorKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
begin
 key := #0;
 SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmpatrulleros.cbonom_supervisorChange(Sender: TObject);
begin
if cbonom_supervisor.Text = '' then
 edcve_supervisor.Text:='';
end;

procedure Tfrmpatrulleros.edcve_supervisorKeyPress(Sender: TObject;
  var Key: Char);
begin
if (edcve_supervisor.Text<>'')and(key=#13) then
   begin
    try
       strtoint(edcve_supervisor.Text);
     //aqui me trae la clave del vendedor y su nombre ya sea que hallan tecleado su nombre,rfc,#vendedor en el rzedcve_vend                                                                                                                        //puestos.nombre = '+quotedstr('VENDEDOR')+' AND
     querys('SELECT concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre,idusuario FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) '+
            ' WHERE  usuarios.estatus = 1 and  usuarios.idusuario='+edcve_supervisor.Text,0,SqlGeneral);
    except
     //aqui me trae la clave del vendedor y su nombre ya sea que hallan tecleado su nombre,rfc,#vendedor en el rzedcve_vend                                                                                                                       //puestos.nombre = '+quotedstr('VENDEDOR')+' AND
     querys('SELECT concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre,idusuario FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE  usuarios.estatus = 1 and usuarios.codigo='+quotedstr(edcve_supervisor.Text),0,SqlGeneral);
    end;

     key:=#0;
   if SqlGeneral.RecordCount > 0 then
    begin
     CboNom_supervisor.Text := SqlGeneral.fieldbyname('nombre').AsString;
     edcve_supervisor.Text :=SqlGeneral.fieldbyname('idusuario').AsString;
    end
   else
    begin
     if application.MessageBox('Esa Clave de supervisor no se encontro deseas buscarlo!','Error',mb_yesno+mb_iconInformation) = idyes then begin
      frmbusquedas.query:='Select u.idusuario,u.codigo,concat(if (u.nombre is null,'' '',u.nombre),'' '', if (u.apaterno is null,'' '',u.apaterno),'' '',if (u.amaterno is null,'' '',u.amaterno)) as Nombre,u.idsector as Sector, '+
                          'a.nombre as Area,p.nombre as Puesto From usuarios as u LEFT JOIN areas as a ON (a.idarea=u.idarea) LEFT JOIN puestos as p ON (p.idpuesto=u.idpuesto) WHERE u.estatus = 1 and (p.nombre=''SUPERVISOR DE CENTRAL'' or p.nombre=''GERENTE'') and a.nombre='+quotedstr('CENTRAL')+' order by u.codigo';
      frmbusquedas.campo_retorno:='codigo';
      frmbusquedas.campo_busqueda:='codigo';
      frmbusquedas.tblorigen := 'usuarios';
      frmbusquedas.ShowModal;
      if frmbusquedas.resultado <> '' then
       begin
              edcve_supervisor.Text := frmbusquedas.resultado;
              chtecla:=#13;
              edcve_supervisor.OnKeyPress(self,chtecla);
       end;
     end else begin
     edcve_supervisor.Text:='';
     end;
    end;
   end;

if key = #13 then
begin
 key := #0;
 cbonom_supervisor.SetFocus;
end;
end;

procedure Tfrmpatrulleros.btnaltaClick(Sender: TObject);
begin
if btnalta.Caption='&Alta' then
   begin
    //varifaca que no exista otro turno abierto
    querys('select idpatrullaje,abierto from patrullaje where abierto = 1',0,sqlgeneral);
    if sqlgeneral.RecordCount > 0 then
     begin
      application.MessageBox(pchar('Ya tiene el turno '+sqlgeneral.fieldbyname('idpatrullaje').asstring+' Abierto cierrelo para poder crear un turno nuevo'),'Aviso',mb_iconinformation);
      exit;
     end;
    limpia;
    habilita;
    gbdisponibles.Visible := true;
    Alinea(459);
    //trae el maximo idpatrullaje + 1
    querys('select max(idpatrullaje) as idpatrullaje from patrullaje',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
      //refreca la rejilla de patrulleros activos
       querys(activos,0,sqlactivos);
    //querys('select idturno from turnos where nombre='+quotedstr(cbonom_turno.Text),0,sqlgeneral);
    //querys(disponibles+' and idusuario='+sqlgeneral.fieldbyname('idturno').AsString,0,sqldisponibles);
   //pone la tabla de areas en modo de insercion
   tblpatrullaje.Active:=true;
   tblpatrullaje.Insert;
   btnalta.Caption:='&Guardar';
   btnalta.Hint:='Guardar los datos de la alta';
   btnalta.ImageIndex:=1;
   btncancelar.Caption:='&Cancelar';
   btncancelar.Hint:='Cancelar la Alta';
   btnborrar.Enabled:=false;
   btnmodificar.Enabled:=false;
   cboestatus.ItemIndex := 1;
   cboestatus.text := 'ABIERTO';
   cboestatus.Enabled := false;
   end
   else
   begin
 //  if ExisteNombre(ednombre,'select nombre from areas where idarea<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
  //     exit;
    if sqlactivos.recordcount > 0 then begin
     btnalta.Caption:='&Alta';
     btnalta.Hint:='Dar de Alta un Area';
     btncancelar.Caption:='&Cerrar';
     btncancelar.Hint:='Cerrar esta Ventana';
     btnalta.ImageIndex:=5;
     btnborrar.Enabled:=true;
     btnmodificar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Dio de Alta el patrullaje #'+edclave.Text,1);
      //trae el maximo idpatrullaje
    querys('select max(idpatrullaje) as idpatrullero from patrullaje',0,sqlgeneral);
    edclave.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
    //trae el indice del turno
    querys('select idturno from turnos where nombre ='+quotedstr(cbonom_turno.Text),0,sqlgeneral);
    tblpatrullajeidturno.AsString := sqlgeneral.fieldbyname('idturno').AsString;
    tblpatrullajeidpatrullaje.AsString:=edclave.Text;
    tblpatrullajeidsupervisor.AsString := edcve_supervisor.Text;
    tblpatrullajeabierto.AsInteger:=cboestatus.ItemIndex;
    tblpatrullajeusuario.AsString:=frmprincipal.ucprincipal.CurrentUser.LoginName;
    tblpatrullajefecha.AsString:=datetostr(FechaServidor);
    tblpatrullajehora.AsString:=timetostr(HoraServidor);
    //guarda los datos
    tblpatrullaje.Post;
    tblpatrullaje.Active:=false;
    //actualiza el idmaq a 0 de los registros que se acaban de guardar
    querys('update DetPatrullaje set idmaq=0,idpatrullaje='+edclave.Text+' where idmaq='+frmprincipal.idmaq,1,sqlgeneral);
    limpia;
    deshabilita;
    gbdisponibles.Visible := false;
    Alinea(266);
    btnborrar.Enabled:=false;
    //btnmodificar.Enabled:=false;
    end else
      begin
         application.MessageBox('Seleccione un patrullero para dar de alta el turno!, ó verifique si ya selecciono el turno correspondiente!','Atención',mb_iconInformation);
         cbonom_turno.setfocus;
      end;

   end;
end;

procedure Tfrmpatrulleros.btncancelarClick(Sender: TObject);
begin
if btncancelar.Caption='&Cancelar' then begin
     tblpatrullaje.Cancel;
     tblpatrullaje.Active:=false;
     btncancelar.Hint:='Cerrar esta Pantalla';
     btncancelar.Caption:='&Cerrar';
     if btnmodificar.Enabled then
        begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Area Actual';
         btnmodificar.ImageIndex:=2;
         edclave.Text:='';
        end;
     if btnalta.Enabled then
        begin
          btnalta.Caption:='&Alta';
          btnalta.Hint:='Dar de Alta un Area';
          btnalta.ImageIndex:=5;
          edclave.Text:='';
        end;
           querys('select idpatrullero from DetPatrullaje where idmaq='+frmprincipal.idmaq,0,dmaccesos.sqlgeneral);
           if dmaccesos.sqlgeneral.RecordCount > 0 then
            begin
             //actualiza los idsupervisores=0 de usuarios
              dmaccesos.sqlgeneral.First;
              while not dmaccesos.sqlgeneral.Eof do
               begin
                querys('update usuarios set idsupervisor=0 where idusuario='+dmaccesos.sqlgeneral.fieldbyname('idpatrullero').AsString,1,sqlgeneral);
                dmaccesos.sqlgeneral.Next;
               end;
              end;
          //elimina los registros a gregados a DetPatrullaje
          querys('delete from DetPatrullaje where idmaq='+frmprincipal.idmaq,1,sqlgeneral);
        //end;  alta enabled
       sqlactivos.Close;
       sqldisponibles.Close;
       edclave.Enabled:=true;
       btnalta.Enabled:=true;
       btnborrar.Enabled:=false;
       btnmodificar.Enabled:=false;
       gbdisponibles.Visible := false;
       Alinea(266);
       limpia;
       deshabilita;
 end
else
close;
end;

procedure Tfrmpatrulleros.cxGridDBTableView1DblClick(Sender: TObject);
begin
  //inserta en DetPatrullaje
if querys('Select idpatrullero from DetPatrullaje where idpatrullero ='+sqldisponibles.fieldbyname('idusuario').AsString+' and idpatrullaje = '+edclave.text, 0, sqlgeneral) = 0 then
  begin
  if btnalta.Caption = '&Guardar' then
    querys('insert into DetPatrullaje(idmaq,idpatrullero) values ('+frmprincipal.idmaq+','+sqldisponibles.fieldbyname('idusuario').AsString+')',1,sqlgeneral);
  if btnmodificar.Caption = '&Guardar' then
    querys('insert into DetPatrullaje(idpatrullaje,idpatrullero,idmaq) values ('+edclave.Text+','+sqldisponibles.fieldbyname('idusuario').AsString+', '+frmprincipal.idmaq+')',1,sqlgeneral);
   end;
  //actualiza el idsupervisor  de usuarios
  querys('update usuarios set idsupervisor='+edcve_supervisor.Text+' where idusuario='+sqldisponibles.fieldbyname('idusuario').AsString,1,sqlgeneral);

  //refresca ambas rejillas
  querys(activos,0,sqlactivos);
  //querys(consulta+edclave.text,0,sqlactivos);
  querys('select idturno from turnos where nombre='+quotedstr(cbonom_turno.Text),0,sqlgeneral);
  //querys(disponibles+' and u.idturno='+sqlgeneral.fieldbyname('idturno').AsString,0,sqldisponibles);
  querys(disponibles,0,sqldisponibles);

end;

procedure Tfrmpatrulleros.cxGridDBTableView2DblClick(Sender: TObject);
begin
if sqlactivos.RecordCount > 0 then
  begin
  if btnalta.Caption = '&Guardar' then
    //borra en DetPatrullaje
    querys('delete from DetPatrullaje where idpatrullero='+sqlactivos.fieldbyname('idusuario').AsString+' and idmaq='+frmprincipal.idmaq,1,sqlgeneral);
  if btnmodificar.Caption = '&Guardar' then
    querys('delete from DetPatrullaje where idpatrullero='+sqlactivos.fieldbyname('idusuario').AsString+' and idpatrullaje='+edclave.Text+' and idmaq='+frmprincipal.idmaq,1,sqlgeneral);

  //actualiza el idsupervisor de usuarios
  querys('update usuarios set idsupervisor=0 where idusuario='+sqlactivos.fieldbyname('idusuario').AsString,1,sqlgeneral);
  //refresca ambas rejillas
  querys(activos,0,sqlactivos);
  querys('select idturno from turnos where nombre='+quotedstr(cbonom_turno.Text),0,sqlgeneral);
  //querys(disponibles+' and u.idturno='+sqlgeneral.fieldbyname('idturno').AsString,0,sqldisponibles);
  querys(disponibles,0,sqldisponibles);
 end;
end;

procedure Tfrmpatrulleros.edcve_supervisorChange(Sender: TObject);
begin
if (edcve_supervisor.Text<>'') and (cbonom_supervisor.Text<>'') then
 begin
   gbactivos.Enabled := true;
   gbdisponibles.Enabled := true;
 end
else
 begin
  gbactivos.Enabled := false;
  gbdisponibles.Enabled := false;
 end;
end;

procedure Tfrmpatrulleros.edclaveButtonClick(Sender: TObject);
begin
     frmbusquedas.query:='SELECT patrullaje.idpatrullaje,concat(ifnull(usuarios.nombre,''''),'' '',ifnull(usuarios.apaterno,''''),'' '',ifnull(usuarios.amaterno,'''')) as Supervisor,turnos.nombre AS turno,if (patrullaje.abierto=0'+
                          ',''CERRADO'',''ABIERTO'') as Estatus,patrullaje.fecha,patrullaje.usuario,patrullaje.hora FROM patrullaje INNER JOIN turnos ON (patrullaje.idturno = turnos.idturno) INNER JOIN usuarios ON (patrullaje.idsupervisor = '+
                          ' usuarios.idusuario) order by idpatrullaje desc';
      frmbusquedas.campo_retorno:='idpatrullaje';
      frmbusquedas.campo_busqueda:='supervisor';
      frmbusquedas.tblorigen := 'patrullaje';
      frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
        begin
          edclave.Text:=frmbusquedas.resultado;
          buscarlocate(strtoint(edclave.Text));
         end;
end;

procedure Tfrmpatrulleros.btnmodificarClick(Sender: TObject);
begin
if btnmodificar.Caption = '&Editar' then
   begin
     btnmodificar.Caption:='&Guardar';
     btncancelar.Caption:='&Cancelar';
     btncancelar.Hint:='Cancelar la Edición';
     btnmodificar.hint:='Guarda los Cambios Realizados';
     btnmodificar.ImageIndex:=1;
     edclave.Enabled:=false;
     btnalta.Enabled:=false;
     btnborrar.Enabled:=false;
     gbdisponibles.Visible:=true;
     gbactivos.Enabled:=true;
     gbdisponibles.Enabled:=true;
     cboestatus.Enabled := true;
     gbdisponibles.Visible := true;
     //querys(activos,0,sqlactivos);
     sqlactivos.First;
     while not sqlactivos.Eof = true do
       begin
       querys('Update usuarios set idsupervisor='+edcve_supervisor.text+' where idusuario = '+sqlactivos.fieldbyname('idusuario').AsString, 1, sqlgeneral);
       sqlactivos.next;
       end;
     querys('select idturno from turnos where nombre='+quotedstr(cbonom_turno.Text),0,sqlgeneral);
     //querys(disponibles+' and u.idturno='+sqlgeneral.fieldbyname('idturno').AsString,0,sqldisponibles);

     querys(disponibles,0,sqldisponibles);
     Alinea(459);
    // habilita;
     tblpatrullaje.Edit;
   end
else
  begin
  //if ExisteNombre(ednombre,'select nombre from areas where idarea<>'+edclave.Text+' and nombre='+quotedstr(ednombre.Text),sqlgeneral) = 1 then
   //  exit;
     btncancelar.Caption:='&Cerrar';
     btnmodificar.Caption:='&Editar';
      btncancelar.Hint:='Cerrar esta Pantalla';
     btnmodificar.hint:='Editar los datos del Patrullaje Actual';
     btnmodificar.ImageIndex:=2;
     btnalta.Enabled:=true;
     btnborrar.Enabled:=true;
     frmprincipal.ucprincipal.Log('Edito el Patrullaje '+edclave.text,2);
     //trae el indice del turno
     querys('select idturno from turnos where nombre ='+quotedstr(cbonom_turno.Text),0,sqlgeneral);
     tblpatrullajeidturno.AsString := sqlgeneral.fieldbyname('idturno').AsString;
     tblpatrullajeidpatrullaje.AsString:=edclave.Text;
     tblpatrullajeidsupervisor.AsString := edcve_supervisor.Text;
     tblpatrullajeabierto.AsInteger:=cboestatus.ItemIndex;
     tblpatrullaje.Post;
     if cboestatus.ItemIndex = 1 then
       begin
       //Borra del patrullaje los que estan en disponibles
       sqldisponibles.First;
       while not sqldisponibles.Eof = true do
         begin
         querys('delete from DetPatrullaje where idpatrullero='+sqldisponibles.fieldbyname('idusuario').AsString+' and idpatrullaje='+edclave.Text,1,sqlgeneral);
         sqldisponibles.Next;
         end;

        //actualiza los idsupervisores de usuarios
        querys('update usuarios set idsupervisor=0 ',1,sqlgeneral);
        {querys('select idpatrullero from DetPatrullaje where idpatrullaje='+edclave.text+' and idpatrullero='+sqlactivos.fieldbyname('idusuario').AsString,0,dmaccesos.sqlgeneral);
        if dmaccesos.sqlgeneral.RecordCount > 0 then}

        sqlactivos.first;
        while not sqlactivos.eof do
          begin
          querys('update usuarios set idsupervisor='+edcve_supervisor.Text+' where idusuario='+sqlactivos.fieldbyname('idusuario').asstring,1,sqlgeneral);
          sqlactivos.next;
          {dmaccesos.sqlgeneral.First;
          while not dmaccesos.sqlgeneral.Eof do
          begin
          querys('update usuarios set idsupervisor='+edcve_supervisor.Text+' where idusuario='+dmaccesos.sqlgeneral.fieldbyname('idpatrullero').AsString,1,sqlgeneral);
          dmaccesos.sqlgeneral.Next;
          end;}
          end;
      end
    else
      begin
      querys('select idpatrullero from DetPatrullaje where idpatrullaje='+edclave.text,0,dmaccesos.sqlgeneral);
      if dmaccesos.sqlgeneral.RecordCount > 0 then
        begin
        //actualiza los idsupervisores de usuarios
        dmaccesos.sqlgeneral.First;
        while not dmaccesos.sqlgeneral.Eof do
          begin
          querys('update usuarios set idsupervisor=0 where idusuario='+dmaccesos.sqlgeneral.fieldbyname('idpatrullero').AsString,1,sqlgeneral);
          dmaccesos.sqlgeneral.Next;
          end;
         end;  
       end;

     //actualiza el idmaq a 0 de los registros que se acaban de guardar
     querys('update DetPatrullaje set idmaq=0,idpatrullaje='+edclave.Text+' where idmaq='+frmprincipal.idmaq,1,sqlgeneral);

     tblpatrullaje.Active:=false;
     limpia;
     deshabilita;
     gbdisponibles.Visible := false;
     Alinea(266);
     edclave.Text:='';
     btnborrar.Enabled:=false;
     btnmodificar.Enabled:=false;
     edclave.SetFocus;
     end;
end;

procedure Tfrmpatrulleros.cbonom_turnoClick(Sender: TObject);
var idturno :string;
begin
//varifica si no existe otro patrullaje con el mismo turno seleccionado
querys('select idturno,HoraInicio,HoraFin from turnos where nombre='+quotedstr(cbonom_turno.Text),0,sqlgeneral);
idturno := sqlgeneral.fieldbyname('idturno').Asstring;
lblhorario.Caption := sqlgeneral.fieldbyname('HoraInicio').Asstring+' - '+sqlgeneral.fieldbyname('HoraFin').Asstring;
querys('select * from patrullaje where idturno='+idturno+' and fecha='+quotedstr(datetostr(FechaServidor))+' and abierto=1',0,sqlgeneral);
if (sqlgeneral.RecordCount > 0) and (sqlgeneral.FieldByName('idpatrullaje').Asstring<>edclave.Text) then
 begin
  application.MessageBox('Ya existe ese turno es este dia','Aviso',mb_iconinformation);
  cbonom_turno.itemindex:=-1;
  exit;
 end;
 querys('select idturno from turnos where nombre='+quotedstr(cbonom_turno.Text),0,sqlgeneral);
 //querys(disponibles+' and u.idturno='+sqlgeneral.fieldbyname('idturno').AsString,0,sqldisponibles);
 querys(disponibles,0,sqldisponibles);

end;

procedure Tfrmpatrulleros.edclaveKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(edclave.Text,key);
if (key = #13) and (edclave.Text <>'') then
 begin
  buscarlocate(strtoint(edclave.Text));
  key := #0;
 end;

if (key = #13) and (edclave.Text ='') then
 begin
  edclave.OnButtonClick(self);
  key := #0;
 end;

end;

procedure Tfrmpatrulleros.edclaveChange(Sender: TObject);
begin
if edclave.Text = '' then
 begin
  limpia;
  deshabilita;
 end;
end;

function Tfrmpatrulleros.disponibles:string;
begin
result :=  'select distinct u.idusuario,u.codigo, '+UsuarioNombre('u')+' as Nombre, s.nombre as sector from usuarios u inner join areas a on '+
           'u.idarea=a.idarea inner join puestos p on p.idpuesto=  u.idpuesto inner join sectores s on s.idsector = u.idsector '+
           'where a.nombre="CENTRAL" and u.estatus = 1 and u.idsupervisor = 0  and u.idturno='+sqlgeneral.fieldbyname('idturno').AsString+'';
end;

end.
