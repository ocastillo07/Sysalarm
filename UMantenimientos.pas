{///////////////////////////////////////////////////////////////////////////////
2009/02/25 dalyla correccion de rejilla, oxxo, realizada ponga fecha actual
2008/02/23 dalyla busqueda por tecnicos y no por instaladores
}///////////////////////////////////////////////////////////////////////////////
unit UMantenimientos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzRadGrp, StdCtrls, RzCmboBx, RzLabel, Mask,
  RzEdit, RzBtnEdt, RzLstBox, DB, MemDS, DBAccess, MyAccess, cxLabel,
  cxControls, cxContainer, cxEdit, cxGroupBox, cxStyles, cxCustomData,
  cxGraphics, cxFilter, cxData, cxDataStorage, cxDBData, RzButton,
  cxGridLevel, cxClasses,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, cxDropDownEdit, cxCalendar,
  cxDBExtLookupComboBox, cxImageComboBox;
          {ZAbstractRODataset, ZAbstractDataset, ZDataset,}
type
  Tfrmmantenimientos = class(TForm)
    rgTipoAsig: TRzRadioGroup;
    edCveMant: TRzButtonEdit;
    lblclave: TRzLabel;
    RzLabel1: TRzLabel;
    edNomMant: TRzEdit;
    RzLabel2: TRzLabel;
    cboTipoMant: TRzComboBox;
    RzLabel3: TRzLabel;
    lbfechas: TRzListBox;
    sqlgeneral: TMyQuery;
    gbcliente: TGroupBox;
    lblnombre: TRzLabel;
    RzLabel12: TRzLabel;
    edcuenta: TRzButtonEdit;
    ednomcte: TRzEdit;
    RzLabel4: TRzLabel;
    edcolonia: TRzEdit;
    gbcolonias: TGroupBox;
    cxLabel18: TcxLabel;
    cxLabel19: TcxLabel;
    cbonom_colonia: TRzComboBox;
    gbrcuentas: TGroupBox;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    eddesde: TRzButtonEdit;
    edhasta: TRzButtonEdit;
    rejilla: TcxGrid;
    rejillaDBTableView1: TcxGridDBTableView;
    rejillaLevel1: TcxGridLevel;
    dsrejilla: TDataSource;
    btnaplicar: TRzBitBtn;
    gbTecnico: TGroupBox;
    cxLabel4: TcxLabel;
    edCveTecnico: TRzButtonEdit;
    cxLabel3: TcxLabel;
    cboNomTecnico: TRzComboBox;
    sqlrejilla: TMyQuery;
    cxidcliente: TcxGridDBColumn;
    cxFechaMant: TcxGridDBColumn;
    cxcliente: TcxGridDBColumn;
    cxRealizada: TcxGridDBColumn;
    btnsalir: TRzBitBtn;
    cxFechaRealizacion: TcxGridDBColumn;
    cxtecnico: TcxGridDBColumn;
    edcvecol: TRzButtonEdit;
    RzLabel5: TRzLabel;
    lblestatus: TRzLabel;
    cxcolonia: TcxGridDBColumn;
    rgoxxo: TRzRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edCveMantKeyPress(Sender: TObject; var Key: Char);
    procedure edCveMantButtonClick(Sender: TObject);
    procedure edcuentaButtonClick(Sender: TObject);
    procedure rgTipoAsigChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure cbonom_coloniaSelect(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbonom_coloniaNotInList(Sender: TObject);
    procedure btnaplicarClick(Sender: TObject);
    procedure cboNomTecnicoSelect(Sender: TObject);
    procedure edCveTecnicoKeyPress(Sender: TObject; var Key: Char);
    procedure edcuentaKeyPress(Sender: TObject; var Key: Char);
    procedure btnsalirClick(Sender: TObject);
    procedure edcuentaChange(Sender: TObject);
    procedure rejillaDBTableView1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edCveTecnicoButtonClick(Sender: TObject);
    procedure edCveTecnicoChange(Sender: TObject);
    procedure edcvecolButtonClick(Sender: TObject);
    procedure sqlrejillaAfterOpen(DataSet: TDataSet);
    procedure eddesdeButtonClick(Sender: TObject);
    procedure eddesdeChange(Sender: TObject);
    procedure eddesdeKeyPress(Sender: TObject; var Key: Char);
    procedure sqlrejillaAfterPost(DataSet: TDataSet);
  private
    { Private declarations }
  public
    { Public declarations }
    procedure TraeMantenimiento(idmant:string);
    procedure Limpia;
  end;

var
  frmmantenimientos: Tfrmmantenimientos;

implementation

uses Udm, Urecursos, Ubusquedas, Uprincipal;

{$R *.dfm}

procedure tfrmmantenimientos.Limpia;
begin
// edCveMant.clear;
 edNomMant.Clear;
 cboTipoMant.Text := '';
 lbfechas.Clear;
 edcuenta.Clear;
 ednomcte.Clear;
 edcolonia.Clear;
 rgTipoAsig.Enabled := false;
 gbcliente.Enabled := false;
end;

procedure tfrmmantenimientos.TraeMantenimiento(idmant:string);
begin
  limpia;
  edCveMant.Text := idmant;
  querys('select * from mantenimientos where idmantenimiento='+idmant,0,sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
   begin                                                                                                                //=1,''Si'',''No'') as realizada
    querys('SELECT DetMantenimientos.idmantenimiento,DetMantenimientos.idcliente,if(clientes.rsocial='''' or clientes.rsocial is null,concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')),'+
          'clientes.rsocial) as nombre,colonias.nombre as Colonia,DetMantenimientos.fecha,DetMantenimientos.realizada,DetMantenimientos.FechaRealizada,DetMantenimientos.iddif,'+
          'usuarios.codigo FROM DetMantenimientos INNER JOIN usuarios ON (DetMantenimientos.idtecnico = usuarios.idusuario) INNER JOIN clientes ON (DetMantenimientos.idcliente = clientes.idcliente) inner join colonias on colonias.idcol '+
          ' = clientes.idcol where idmantenimiento='+sqlgeneral.fieldbyname('idmantenimiento').Asstring+' order by  DetMantenimientos.idcliente,DetMantenimientos.fecha',0,sqlrejilla);
    edNomMant.Text := sqlgeneral.fieldbyname('nombre').AsString;
    cboTipoMant.itemindex := sqlgeneral.fieldbyname('tipo').AsInteger;
    cboTipoMant.text := cboTipoMant.Items.Strings[cboTipoMant.itemindex];
    lbfechas.Items.Add(sqlgeneral.fieldbyname('f1').Asstring);
    if sqlgeneral.fieldbyname('f2').Asstring <> '' then
     lbfechas.Items.Add(sqlgeneral.fieldbyname('f2').Asstring);
    if sqlgeneral.fieldbyname('f3').Asstring <> '' then
     lbfechas.Items.Add(sqlgeneral.fieldbyname('f3').Asstring);
    if sqlgeneral.fieldbyname('f4').Asstring <> '' then
     lbfechas.Items.Add(sqlgeneral.fieldbyname('f4').Asstring);
     rgTipoasig.Enabled := true;
   end
  else
   begin
    application.MessageBox('Ese numero de mantenimiento no existe','Aviso',mb_iconinformation);
    rgTipoasig.Enabled := false;
    sqlrejilla.Close;
   end;
end;

procedure Tfrmmantenimientos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure Tfrmmantenimientos.edCveMantKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #8 then
 Limpia;

key := ValidaNumeros(key,false);
if (key = #13) and (edCveMant.Text <> '') then
 begin
  key := #0;
  TraeMantenimiento(edCveMant.Text);
  gbcliente.Enabled := false;
  gbcolonias.Enabled := true;
  gbrcuentas.Enabled := false;
  edcvecol.SetFocus;
 end;
end;

procedure Tfrmmantenimientos.edCveMantButtonClick(Sender: TObject);
begin
 frmbusquedas.query:='select idmantenimiento,nombre,if(tipo=0,''Anual'',if(tipo=1,''Semestral'',''Trimestral'')) as Tipo,f1,f2,f3,f4,usuario,fecha,hora from mantenimientos order by idmantenimiento';
 frmbusquedas.campo_busqueda:='nombre';
 frmbusquedas.campo_retorno:='idmantenimiento';
 frmbusquedas.tabla:='';
 frmbusquedas.tblorigen := 'mantenimientos';
 frmbusquedas.ShowModal;
 if frmbusquedas.resultado <> '' then
  TraeMantenimiento(frmbusquedas.resultado);
end;

procedure Tfrmmantenimientos.edcuentaButtonClick(Sender: TObject);
//var i : integer;
begin
     frmbusquedas.query:='Select clientes.idcliente,concat(ifnull(clientes.nombre,'' ''),'' '',ifnull(clientes.apaterno,'' ''),'' '',ifnull(clientes.amaterno,'' '')) as Nombre,ClientesFact.rsocial AS Razon_Social,concat(clientes.dir,'','',clientes.numero '+
                         ','','',clientes.ciudad,'','',clientes.estado) as Direccion,clientes.usuario as Usuario,clientes.fecha as Fecha,clientes.hora as Hora From clientes left join ClientesFact on clientes.idfact = ClientesFact.idfact where '+
                         ' clientes.estatus = 1 order by idcliente';
       frmbusquedas.campo_retorno:='idcliente';
       frmbusquedas.campo_busqueda:='Nombre';
       frmbusquedas.tabla:='clientes';
       frmbusquedas.tblorigen := 'clientes';
       frmbusquedas.cbofiltro.ItemIndex:=1;
       frmbusquedas.cbofiltro.OnClick(nil);
       frmbusquedas.ShowModal;
       if frmbusquedas.resultado <> '' then
        begin
         edcuenta.Text := frmbusquedas.resultado;
         querys('select clientes.idcliente,if(clientes.rsocial='''' or clientes.rsocial is null,concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')),clientes.rsocial) as nombre,colonias.nombre '+
                ' as colonia from clientes inner join colonias on clientes.idcol = colonias.idcol where clientes.idcliente='+frmbusquedas.resultado,0,sqlgeneral);
         ednomcte.Text := sqlgeneral.fieldbyname('nombre').AsString;
         edcolonia.Text := sqlgeneral.fieldbyname('colonia').AsString;
         edcvetecnico.SetFocus;
        { for i := 0 to lbfechas.Items.Count-1 do
         //inserta el mantenimiento
         querys('insert into DetMantenimientos (idmantenimiento,idcliente,fecha,realizada,idtecnico,idmaq) values ('+edCveMant.Text+','+edcuenta.Text+','+quotedstr(lbfechas.Items.Strings[i])+',0,0,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+')',1,sqlgeneral);
         querys('select * from DetMantenimientos where idmantenimiento = '+edCveMant.Text+' and idmaq='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlrejilla);}
        end;
end;

procedure Tfrmmantenimientos.rgTipoAsigChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
gbtecnico.Enabled := true;
edcuenta.Clear;
ednomcte.Clear;
edcolonia.Clear;
edcvecol.Clear;
cbonom_colonia.Text := '';
eddesde.Clear;
edhasta.Clear;

if NewIndex = 0 then
 begin
  gbcliente.Enabled := true;
  gbcolonias.Enabled := false;
  gbrcuentas.Enabled := false;
  edcuenta.SetFocus;
 end;
if NewIndex = 1 then
 begin
  gbcliente.Enabled := false;
  gbcolonias.Enabled := true;
  gbrcuentas.Enabled := false;
  edcvecol.SetFocus;
 end;
 
if NewIndex = 2 then
 begin
  gbcliente.Enabled := false;
  gbcolonias.Enabled := false;
  gbrcuentas.Enabled := true;
  eddesde.SetFocus;
 end;

end;

procedure Tfrmmantenimientos.cbonom_coloniaSelect(Sender: TObject);
begin
 //aqui busca el colid de la colonia por el nombre
   querys('select idcol from colonias where nombre='+quotedstr(cbonom_colonia.Text),0,sqlgeneral);
  if sqlgeneral.RecordCount = 0 then
   begin
    application.MessageBox('Ese nombre de colonia no existe, verifique y vuelva a intentarlo','Error',mb_ok+mb_iconinformation);
    cbonom_colonia.Text:='';
    cbonom_colonia.SetFocus;
    lblestatus.Caption := '';
   end
  else
   begin
    edcvecol.Text:=sqlgeneral.fieldbyname('idcol').AsString;
    //trae la cantida de clientes en esa colonia
    querys('select count(idcliente) as c from clientes where idcol='+edcvecol.Text+' and estatus=1',0,sqlgeneral);
    lblestatus.Caption :='Se encontraron '+sqlgeneral.fieldbyname('c').AsString+' clientes en la colonia '+cbonom_colonia.Text;
  end;
end;

procedure Tfrmmantenimientos.FormShow(Sender: TObject);
begin
CargaCombo('select nombre from colonias order by nombre','Colonias',cbonom_colonia);
CargaCombo('Select concat(if (u.nombre is null,'' '',u.nombre),'' '', if (apaterno is null,'' '',apaterno),'' '',if (amaterno is null,'' '',amaterno)) as nombre From usuarios as u left join areas as a ON(a.idarea=u.idarea) '+
           'left join puestos as p ON(p.idpuesto=u.idpuesto) where a.nombre=''INSTALACIONES'' and p.nombre IN(''INSTALADOR'',''TECNICO'') order by nombre','PUESTOS',cboNomTecnico);
//CargaCombo('select concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) as nombre from usuarios inner join puestos on usuarios.idpuesto = puestos.idpuesto where puestos.nombre ='+quotedstr('TECNICO'),'PUESTOS',cboNomTecnico);
querys('delete from DetMantenimientos where idmaq='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),1,sqlgeneral);
end;

procedure Tfrmmantenimientos.cbonom_coloniaNotInList(Sender: TObject);
begin
edcvecol.Clear;
cbonom_colonia.Text := '';
lblestatus.Caption := '';
end;

procedure Tfrmmantenimientos.btnaplicarClick(Sender: TObject);
var i : integer;  oxxo:string;
sqlgral : tmyquery;
begin
sqlgral := tmyquery.Create(self);
sqlgral.Connection := dmaccesos.conexion;
if rgoxxo.ItemIndex = 0 then
  oxxo := ' and cat.nombre not like "%oxxo%" '
else
  oxxo := '';
//para cuando es asignacion por cuenta
if (rgTipoAsig.ItemIndex = 0) and (ednomcte.Text <> '') then
  querys('select idcliente from clientes where idcliente = '+edcvemant.Text,0,sqlgral);

 //para cuando es asignacion por colonia
if (rgTipoAsig.ItemIndex = 1) and (edcvecol.Text <> '') and (cbonom_colonia.Text <> '') then
//  querys('SELECT clientes.idcliente,DetMantenimientos.idcliente as idc FROM clientes left JOIN DetMantenimientos ON (clientes.idcliente = DetMantenimientos.idcliente) WHERE idcol = '+edcvecol.Text+' AND  (estatus = 1) and DetMantenimientos.idcliente is null',0,sqlgral);
querys('SELECT c.idcliente,DetMantenimientos.idcliente as idc FROM clientes c left JOIN DetMantenimientos ON '+
       'c.idcliente = DetMantenimientos.idcliente Left join categorias cat on cat.idcategoria=c.idcategoria '+
       'WHERE idcol = '+edcvecol.Text+'  AND  (estatus = 1) and c.idcliente not in( '+
       'Select idcliente from  DetMantenimientos where fecha between '+
       '"'+lbfechas.Items.Strings[0]+'" and "'+lbfechas.Items.Strings[lbfechas.Items.Count-1]+'")'+ oxxo,0,sqlgral);

if (rgTipoAsig.ItemIndex = 2) and (eddesde.Text <> '') and (edhasta.Text <> '') then
 //querys('select idcliente from clientes where idcliente>='+eddesde.Text+' and idcliente <='+edhasta.Text+' and estatus=1',0,sqlgral);
 querys('select idcliente from clientes c Left join categorias cat on cat.idcategoria=c.idcategoria where idcliente '+
        'between '+eddesde.Text+' and '+edhasta.Text+' and estatus = 1 and cat.nombre ' + oxxo,0,sqlgral);

  sqlgral.First;
  while not sqlgral.Eof do
   begin
    lblestatus.Caption := 'Asignango mantenimientos a la cuenta '+sqlgral.fieldbyname('idcliente').AsString;
    for i := 0 to lbfechas.Items.Count-1 do
    //inserta el mantenimiento
    querys('insert into DetMantenimientos (idmantenimiento,idcliente,fecha,realizada,idtecnico) values ('+edCveMant.Text+','+sqlgral.fieldbyname('idcliente').AsString+','+quotedstr(lbfechas.Items.Strings[i])+',0,'+edcvetecnico.text+')',1,sqlgeneral);
    sqlgral.Next;
   end;
eddesde.Clear;
edhasta.clear;
edcvecol.Clear;
cbonom_colonia.Text := '';
lblestatus.Caption := '';
edcvetecnico.Clear;
cbonomtecnico.Text := '';
TraeMantenimiento(edcvemant.Text);
end;

procedure Tfrmmantenimientos.cboNomTecnicoSelect(Sender: TObject);
begin
querys('select idusuario from usuarios where concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' ''))='+quotedstr(cboNomTecnico.text),0,sqlgeneral);
edCveTecnico.text := sqlgeneral.fieldbyname('idusuario').asstring;
if ((ednomcte.Text <> '') and (cbonomtecnico.Text <> '')) or ((edcvecol.Text <> '') and (cbonom_colonia.Text <> '')) or ((eddesde.Text <> '') and (edhasta.Text <> '')) and (edcvetecnico.Text <> '') then
 btnaplicar.Enabled := true
else
 btnaplicar.Enabled := false;
end;

procedure Tfrmmantenimientos.edCveTecnicoKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (edCveTecnico.Text <> '') then
 begin
 try
     //aqui me trae la clave del vendedor y su nombre ya sea que hallan tecleado su nombre,rfc,#vendedor en el rzedcve_vend                                                                                                                        //puestos.nombre = '+quotedstr('VENDEDOR')+' AND
     querys('SELECT '+UsuarioNombre('usuarios')+' AS Nombre,idusuario FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) '+
            ' WHERE  usuarios.estatus = 1 and  usuarios.idusuario='+EdCvetecnico.Text,0,SqlGeneral);
    except
     //aqui me trae la clave del vendedor y su nombre ya sea que hallan tecleado su nombre,rfc,#vendedor en el rzedcve_vend                                                                                                                       //puestos.nombre = '+quotedstr('VENDEDOR')+' AND
     querys('SELECT '+UsuarioNombre('usuarios')+' AS Nombre,idusuario FROM usuarios INNER JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE  usuarios.estatus = 1 and usuarios.codigo='+quotedstr(EdCvetecnico.Text),0,SqlGeneral);
    end;
  if sqlgeneral.RecordCount = 0 then
   begin
    application.MessageBox('Ese clave de tecnico no existe, intente con otra','Aviso',mb_iconinformation);
    edcvetecnico.Text := '';
    cbonomtecnico.Text := '';
    edcvetecnico.setfocus;
   end
  else
   begin
    cbonomtecnico.Text := sqlgeneral.fieldbyname('nombre').AsString;
    edcvetecnico.Text := sqlgeneral.fieldbyname('idusuario').AsString;
//    if (ednomcte.Text <> '') and (cbonomtecnico.Text <> '') and (edcvetecnico.Text <> '') then
    if ((ednomcte.Text <> '') and (cbonomtecnico.Text <> '')) or ((edcvecol.Text <> '') and (cbonom_colonia.Text <> '')) and (edcvetecnico.Text <> '') then
     btnaplicar.Enabled := true
    else
     btnaplicar.Enabled := false;
   end;
 end;
end;

procedure Tfrmmantenimientos.edcuentaKeyPress(Sender: TObject;
  var Key: Char);
var //i : integer;
sqlgral : tmyquery;
begin
sqlgral := tmyquery.Create(self);
sqlgral.Connection := dmaccesos.conexion;
key:=validanumeros(key,false);
key:=validapunto(edcuenta.Text+'.',key);
if key=#13 then
 begin
  key:=#0;
  if edcuenta.Text <> '' then
   begin
       querys('select clientes.idcliente,if(clientes.rsocial='''' or clientes.rsocial is null,concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')),clientes.rsocial) as nombre,colonias.nombre '+
              ' as colonia from clientes inner join colonias on clientes.idcol = colonias.idcol where clientes.idcliente='+edcuenta.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount=0 then
   begin
    application.MessageBox('No existe ningun cliente con ese numero de cuenta!','Aviso',mb_iconinformation);
    edcuenta.Text:='';
    edcuenta.SetFocus;
   end
  else
   begin
    //verifica que si ya se le asigno mantenimeinto para este año
    querys('select idcliente from DetMantenimientos where idcliente = '+edcuenta.Text+' and idmantenimiento = '+edcvemant.Text,0,sqlgral);
    if sqlgral.RecordCount > 0 then
     begin
      application.MessageBox('A este cliente ya se le ha asignado ese tipo de mantenimiento y no podra asignarselo de nuevo','Aviso',mb_iconinformation);
      edcuenta.clear;
     end
    else
     begin
      ednomcte.Text := sqlgeneral.fieldbyname('nombre').AsString;
      edcolonia.Text := sqlgeneral.fieldbyname('colonia').AsString;
      edcvetecnico.SetFocus;
     end;
   end;
  end;
 end;
sqlgral.Free;
end;

procedure Tfrmmantenimientos.btnsalirClick(Sender: TObject);
begin
close
end;

procedure Tfrmmantenimientos.edcuentaChange(Sender: TObject);
begin
if (ednomcte.Text <> '') and (cbonomtecnico.Text <> '') and (edcvetecnico.Text <> '') then
 btnaplicar.Enabled := true
else
 btnaplicar.Enabled := false;
end;

procedure Tfrmmantenimientos.rejillaDBTableView1KeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (key = 46) and (sqlrejilla.RecordCount > 0) then
 begin
  //elimina los mantenimeintos de la cuenta seleccionada
  querys('delete from DetMantenimientos where idmantenimiento = '+edcvemant.Text+' and idcliente='+sqlrejilla.fieldbyname('idcliente').AsString,1,sqlgeneral);
  querys('SELECT DetMantenimientos.idmantenimiento,DetMantenimientos.idcliente,if(clientes.rsocial='''' or clientes.rsocial is null,concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')),'+
          'clientes.rsocial) as nombre,DetMantenimientos.fecha,if(DetMantenimientos.realizada=1,''Si'',''No'') as realizada,if(DetMantenimientos.FechaRealizada is null,''No Realizada'',DetMantenimientos.FechaRealizada) as FechaRealizacion,usuarios.codigo '+
          'FROM DetMantenimientos INNER JOIN usuarios ON (DetMantenimientos.idtecnico = usuarios.idusuario) INNER JOIN clientes ON (DetMantenimientos.idcliente = clientes.idcliente) where idmantenimiento='+edcvemant.Text+' order by  DetMantenimientos.idcliente,DetMantenimientos.fecha',0,sqlrejilla);
 end;
end;

procedure Tfrmmantenimientos.edCveTecnicoButtonClick(Sender: TObject);
begin
frmbusquedas.query:='Select codigo,'+UsuarioNombre('u')+' as Instalador,u.idusuario From usuarios as u left join areas as a ON(a.idarea=u.idarea) '+
                    'left join puestos as p ON(p.idpuesto=u.idpuesto) where a.nombre=''SERVICIOS'' and p.nombre IN(''INSTALADOR'',''TECNICO'') and u.estatus = 1 order by Instalador';
frmbusquedas.campo_retorno:='idusuario';
frmbusquedas.campo_busqueda:='idusuario';          ////,clientes.NotaBloqueo,clientes.numero as Numero,clientes.ciudad as Ciudad,clientes.estado as Estado
frmbusquedas.tblorigen := 'usuarios';
frmbusquedas.tabla:='usuarios';
frmbusquedas.ShowModal;
if frmbusquedas.resultado <> '' then
 begin
  edcvetecnico.Text := frmbusquedas.resultado;
  chtecla := #13;
  edcvetecnico.OnKeyPress(self,chtecla);
 end;
end;

procedure Tfrmmantenimientos.edCveTecnicoChange(Sender: TObject);
begin
//if (ednomcte.Text <> '') and (cbonomtecnico.Text <> '') and (edcvetecnico.Text <> '') then
if ((ednomcte.Text <> '') and (cbonomtecnico.Text <> '')) or ((edcvecol.Text <> '') and (cbonom_colonia.Text <> '')) and (edcvetecnico.Text <> '') then
 btnaplicar.Enabled := true
else
 btnaplicar.Enabled := false;
end;

procedure Tfrmmantenimientos.edcvecolButtonClick(Sender: TObject);
begin
frmbusquedas.query:='Select idcol,nombre,cp as CP, idtipoasenta as idtipoasenta, idmnp as idmnp, idestado as idestado, usuario as Usuario,fecha as Fecha,hora as Hora From colonias order by idcol';
frmbusquedas.campo_retorno:='idcol';
frmbusquedas.campo_busqueda:='nombre';
frmbusquedas.tblorigen := 'colonias';
frmbusquedas.lbldesc.Caption:='Busqueda por Nombre:';
frmbusquedas.ShowModal;
if frmbusquedas.resultado <> '' then
 begin
  edcvecol.Text:=frmbusquedas.resultado;
 //trae el nombre de la colonia
  querys('select nombre from colonias where idcol='+edcvecol.Text,0,sqlgeneral);
  cbonom_colonia.Text := sqlgeneral.fieldbyname('nombre').AsString;
 //trae la cantida de clientes en esa colonia
 querys('select count(idcliente) as c from clientes where idcol='+edcvecol.Text+' and estatus=1',0,sqlgeneral);
 lblestatus.Caption :='Se encontraron '+sqlgeneral.fieldbyname('c').AsString+' clientes en la colonia '+cbonom_colonia.Text;
 end;
end;

procedure Tfrmmantenimientos.sqlrejillaAfterOpen(DataSet: TDataSet);
begin
lblestatus.Caption := 'Registros encontrados '+inttostr(dataset.RecordCount);
end;

procedure Tfrmmantenimientos.eddesdeButtonClick(Sender: TObject);
begin
frmbusquedas.query:='Select clientes.idcliente,concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')) as Nombre,ClientesFact.rsocial AS Razon_Social,clientes.bloqueado as Bloqueado,clientes.TipoCont,'+
                    'concat(clientes.dir,'','',clientes.numero,'','',clientes.ciudad,'','',clientes.estado) as Direccion,clientes.usuario as Usuario,clientes.fecha as Fecha,clientes.hora as Hora From clientes left join ClientesFact on clientes.idfact = '+
                    ' ClientesFact.idfact where clientes.estatus=1 order by idcliente';
frmbusquedas.campo_retorno:='idcliente';
frmbusquedas.campo_busqueda:='Nombre';
frmbusquedas.tabla:='clientes';
frmbusquedas.tblorigen := 'clientes';
frmbusquedas.cbofiltro.ItemIndex:=1;
frmbusquedas.cbofiltro.OnClick(nil);
frmbusquedas.ShowModal;
if frmbusquedas.resultado <> '' then
 begin
 (sender as trzbuttonedit).Text := frmbusquedas.resultado;
  
 end;
end;

procedure Tfrmmantenimientos.eddesdeChange(Sender: TObject);
begin
try
 if strtoint(eddesde.text) > strtoint(edhasta.text) then
  edhasta.Text := eddesde.Text;

 if (eddesde.Text <> '') and (edhasta.Text <> '') then
  begin
   querys('select count(idcliente) as c from clientes where idcliente >='+eddesde.Text+' and idcliente<='+edhasta.Text+' and estatus=1',0,sqlgeneral);
   lblestatus.Caption := 'Se encontraron '+sqlgeneral.fieldbyname('c').AsString+' clientes activos en el rango seleccionado';
  end;
 except
end;
end;

procedure Tfrmmantenimientos.eddesdeKeyPress(Sender: TObject;
  var Key: Char);
begin
key := validaNumeros(key,false);
if (key = #13) and ((sender as trzbuttonedit).Text = '') then
 (sender as trzbuttonedit).OnButtonClick(sender);
if (key = #13) and ((sender as trzbuttonedit).Text <> '') then
 begin
  //busca el cliente
  querys('select idcliente,estatus from clientes where idcliente='+(sender as trzbuttonedit).Text,0,sqlgeneral);
  if sqlgeneral.RecordCount = 0 then
   begin
    application.MessageBox('El cliente seleccionado no existe','Aviso',mb_iconinformation);
    exit;
   end
  else
   if sqlgeneral.FieldByName('estatus').AsInteger = 0 then
   begin
    application.MessageBox('El cliente seleccionado tiene estatus de cancelado y no podra signarle un mantenimiento','Aviso',mb_iconinformation);
    exit;
   end
  else
   (sender as trzbuttonedit).Text := sqlgeneral.FieldByName('idcliente').Asstring;
end;


end;

procedure Tfrmmantenimientos.sqlrejillaAfterPost(DataSet: TDataSet);
begin
if sqlrejilla.FieldByName('realizada').AsString = '1' then
  querys('Update DetMantenimientos set FechaRealizada="'+datetostr(date)+'" where iddif  = '+sqlrejilla.FieldByName('iddif').AsString, 1, sqlgeneral)
else
  querys('Update DetMantenimientos set FechaRealizada="0000-00-00" where iddif  = '+sqlrejilla.FieldByName('iddif').AsString, 1, sqlgeneral);
sqlrejilla.Close;
sqlrejilla.Open;
end;

end.
