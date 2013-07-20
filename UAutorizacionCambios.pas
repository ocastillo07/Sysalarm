//2008/04/24 dalyla cliente cambios
//2008/02/28 dalyla zona horaria ok
unit UAutorizacionCambios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, cxGridLevel, cxClasses, cxControls,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView,
  cxGridDBTableView, cxGrid, RzTabs,MyAccess, StdCtrls, ExtCtrls, RzPanel,
  RzButton;

type
   TCampos = Record
   NombreCampo,Descripcion,Tabla : string;
end;

  TfrmAutorizacionCambios = class(TForm)
    PageControl: TRzPageControl;
    tabOportunidades: TRzTabSheet;
    tabMostrarCambios: TRzTabSheet;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    DS: TDataSource;
    cxGrid1DBTableView1DBColumn1: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn2: TcxGridDBColumn;
    cxGrid1DBTableView1DBColumn3: TcxGridDBColumn;
    cxGrid2: TcxGrid;
    cxGridDBTableView1: TcxGridDBTableView;
    cxGridDBColumn1: TcxGridDBColumn;
    cxGridDBColumn2: TcxGridDBColumn;
    cxGridDBColumn3: TcxGridDBColumn;
    cxGridLevel1: TcxGridLevel;
    DS2: TDataSource;
    RzPanel1: TRzPanel;
    Label1: TLabel;
    lblNombre: TLabel;
    Label2: TLabel;
    lblOportunidad: TLabel;
    Label3: TLabel;
    lblCuenta: TLabel;
    btncancelar: TRzBitBtn;
    btnGuardar: TRzBitBtn;
    btnQuitar: TRzBitBtn;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cxGrid1DBTableView1DblClick(Sender: TObject);
    procedure CargarCampos;
    procedure btncancelarClick(Sender: TObject);
    procedure cxGrid1DBTableView1KeyPress(Sender: TObject; var Key: Char);
    procedure CompararCampos;
    procedure btnQuitarClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure Cancelar;
    procedure CargarGrid;
  private
    { Private declarations }
  public
    { Public declarations }
   // campos: array [1..7] of string = ();
    sqlgeneralForm,sqlgeneralCambios : tmyquery;
  end;

var
  frmAutorizacionCambios: TfrmAutorizacionCambios;
  Campos : Array of TCampos;

implementation

uses Urecursos, Udm, Udmrep, Uprincipal;

{$R *.dfm}

procedure TfrmAutorizacionCambios.CargarGrid;
begin
querys('select oportunidades.idoportunidad, if(oportunidades.rsocial is NULL or oportunidades.rsocial='''', if(oportunidades.apaterno is NULL or oportunidades.apaterno='''', oportunidades.nombre, if(oportunidades.amaterno is NULL or oportunidades.amaterno='''' ,'+
       ' concat(oportunidades.nombre, '' '', oportunidades.apaterno), concat(oportunidades.nombre, '' '', oportunidades.apaterno, '' '', oportunidades.amaterno))), oportunidades.rsocial) as Nombre,clientes.idcliente as CuentaCliente from oportunidades '+
       ' inner join agenda_vendedores on (agenda_vendedores.idoportunidad=oportunidades.idoportunidad ) inner join estatus_eventos on(estatus_eventos.idestatus = agenda_vendedores.idestatus) inner join OportunidadesFact on '+
       ' (OportunidadesFact.idfact = oportunidades.idfact) inner join clientes on(clientes.idfact = OportunidadesFact.idfact_cliente) where ModificarDatos = 1 and AceptaModificacion is null and estatus_eventos.nombre in(''ACEPTADA'',''CERRADA'') ',0,sqlgeneralForm);
end;

procedure TfrmAutorizacionCambios.CargarCampos;
begin

  SetLength(Campos,30);
  Campos[0].NombreCampo := 'idgiro';
  Campos[0].Descripcion := 'GIRO';
  Campos[0].Tabla := 'giros';
  Campos[1].NombreCampo := 'idcol';
  Campos[1].Descripcion := 'COLONIA';
  Campos[1].Tabla := 'colonias';
  Campos[2].NombreCampo := 'idorigen';
  Campos[2].Descripcion := 'ORIGEN';
  Campos[2].Tabla := 'origen';
  Campos[3].NombreCampo := 'idfuente';
  Campos[3].Descripcion := 'FUENTE';
  Campos[3].Tabla := 'fuentes';
  Campos[4].NombreCampo := 'idcategoria';
  Campos[4].Descripcion := 'CATEGORIA';
  Campos[4].Tabla := 'categorias';
  Campos[5].NombreCampo := 'ciudad';
  Campos[5].Descripcion := 'CIUDAD';
  Campos[5].Tabla := '';
  Campos[6].NombreCampo := 'nombre';
  Campos[6].Descripcion := 'NOMBRE';
  Campos[6].Tabla := '';
  Campos[7].NombreCampo := 'apaterno';
  Campos[7].Descripcion := 'APELLIDO PATERNO';
  Campos[7].Tabla := '';
  Campos[8].NombreCampo := 'amaterno';
  Campos[8].Descripcion := 'APELLIDO MATERNO';
  Campos[8].Tabla := '';
  Campos[9].NombreCampo := 'rsocial';
  Campos[9].Descripcion := 'RAZON SOCIAL';
  Campos[9].Tabla := '';
  Campos[10].NombreCampo := 'dir';
  Campos[10].Descripcion := 'DIRECCION';
  Campos[10].Tabla := '';
  Campos[11].NombreCampo := 'estado';
  Campos[11].Descripcion := 'ESTADO';
  Campos[11].Tabla := '';
  Campos[12].NombreCampo := 'refs';
  Campos[12].Descripcion := 'UBICACION';
  Campos[12].Tabla := '';
  Campos[13].NombreCampo := 'numero';
  Campos[13].Descripcion := 'NUMERO';
  Campos[13].Tabla := '';
  Campos[14].NombreCampo := 'cp';
  Campos[14].Descripcion := 'CP';
  Campos[14].Tabla := '';
  Campos[15].NombreCampo := 'rsocial';
  Campos[15].Descripcion := 'FACT_RAZON SOCIAL';
  Campos[15].Tabla := '';
  Campos[16].NombreCampo := 'nombre';
  Campos[16].Descripcion := 'FACT_NOMBRE';
  Campos[16].Tabla := '';
  Campos[17].NombreCampo := 'apaterno';
  Campos[17].Descripcion := 'FACT_APELLIDO_PATERNO';
  Campos[17].Tabla := '';
  Campos[18].NombreCampo := 'amaterno';
  Campos[18].Descripcion := 'FACT_APELLIDO_MATERNO';
  Campos[18].Tabla := '';
  Campos[19].NombreCampo := 'dir';
  Campos[19].Descripcion := 'FACT_DIRECCION';
  Campos[19].Tabla := '';
  Campos[20].NombreCampo := 'numero';
  Campos[20].Descripcion := 'FACT_NUMERO';
  Campos[20].Tabla := '';
  Campos[21].NombreCampo := 'idcol';
  Campos[21].Descripcion := 'FACT_COLONIA';
  Campos[21].Tabla := 'colonias';
  Campos[22].NombreCampo := 'ciudad';
  Campos[22].Descripcion := 'FACT_CIUDAD';
  Campos[22].Tabla := '';
  Campos[23].NombreCampo := 'EstadoCres';
  Campos[23].Descripcion := 'FACT_ESTADO';
  Campos[23].Tabla := '';
  Campos[24].NombreCampo := 'cp';
  Campos[24].Descripcion := 'FACT_CODIGO POSTAL';
  Campos[24].Tabla := '';
  Campos[25].NombreCampo := 'rfc';
  Campos[25].Descripcion := 'FACT_RFC';
  Campos[25].Tabla := '';
  Campos[26].NombreCampo := 'telefono';
  Campos[26].Descripcion := 'FACT_TELEFONO';
  Campos[26].Tabla := '';
  Campos[27].NombreCampo := 'casa';
  Campos[27].Descripcion := 'FACT_CASA';
  Campos[27].Tabla := '';

end;

procedure TfrmAutorizacionCambios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
sqlgeneralCambios.Free;
sqlgeneralForm.Free;
action:=cafree;
end;

procedure TfrmAutorizacionCambios.FormCreate(Sender: TObject);
begin
sqlgeneralForm := tmyquery.Create(nil);
sqlgeneralForm.Connection := dmaccesos.conexion;

sqlgeneralCambios := tmyquery.Create(nil);
sqlgeneralCambios.Connection := dmaccesos.conexion;

DS.DataSet := sqlgeneralForm;
DS2.DataSet := sqlgeneralCambios;

CargarCampos;   
end;

procedure TfrmAutorizacionCambios.FormShow(Sender: TObject);
begin
CargarGrid();
PageControl.ActivePageIndex := 0;       
cxGrid1.SetFocus;

end;

procedure TfrmAutorizacionCambios.cxGrid1DBTableView1DblClick(
  Sender: TObject);

begin
         CompararCampos();
end;


procedure TfrmAutorizacionCambios.CompararCampos;
var i:integer;
  entro:Boolean;
begin

if(sqlgeneralForm.fieldbyname('idoportunidad').AsString <> '' )then
begin

entro := false;
NullStrictConvert := false;
with dmreportes do
  begin
    querys('Delete from OportunidadesCambios where idmaq ='+''''+ frmprincipal.idmaq+''' ',1,sqlgeneral1);
    querys(' Select gp.nombre,cp.nombre,op.nombre,fp.nombre,cat.nombre,p.ciudad,p.nombre,p.apaterno,p.amaterno,p.rsocial,p.dir,p.estado,entre,p.numero,p.cp,pf.rsocial,pf.nombre,pf.apaterno,pf.amaterno,pf.dir,pf.numero,colfact.nombre,pf.ciudad,pf.estado,pf.cp,pf.rfc,'+
           'pf.telefono,pf.casa,idfact_cliente from oportunidades  as p  Left join OportunidadesFact as pf on (p.idfact=pf.idfact) LEFT JOIN giros as gp on (gp.idgiro=p.idgiro) LEFT JOIN colonias as cp on (cp.idcol=p.idcol) LEFT JOIN origen as op on  '+
           '(op.idorigen=p.idorigen) LEFT JOIN fuentes as fp on (fp.idfuente=p.idfuente) LEFT JOIN categorias as cat on (cat.idcategoria=p.idcategoria) LEFT JOIN colonias as colfact on (colfact.idcol=pf.idcol) where idoportunidad ='+sqlgeneralForm.fieldbyname('idoportunidad').AsString,0,sqlgeneral2);

        if (sqlgeneral2.RecordCount>0) then
           begin

              querys('select gc.nombre,cc.nombre,oc.nombre,fc.nombre,cat.nombre,c.ciudad,c.nombre,c.apaterno,c.amaterno,c.rsocial,c.dir,c.estado,c.refs,c.numero,c.cp,cf.rsocial,cf.nombre,cf.apaterno,cf.amaterno,cf.dir,cf.numero,colfact.nombre,cf.ciudad,cf.EstadoCres,'+
                     'cf.cp,cf.rfc,cf.telefono,cf.casa from clientes as c Left join ClientesFact as cf on (cf.idfact=c.idfact) LEFT JOIN giros as gc on (gc.idgiro=c.idgiro) LEFT JOIN colonias as cc on (cc.idcol=c.idcol) LEFT JOIN origen as oc on (oc.idorigen=c.idorigen) '+
                    ' LEFT JOIN fuentes as fc on (fc.idfuente=c.idfuente) LEFT JOIN categorias as cat on (cat.idcategoria=c.idcategoria) LEFT JOIN colonias as colfact on (colfact.idcol=cf.idcol) where c.idcliente ='+sqlgeneralForm.fieldbyname('CuentaCliente').AsString,0,sqlgeneral3);
               if (sqlgeneral3.RecordCount>0) then
                begin
                   for i:=0 to 27 do
                      begin
                         if(sqlgeneral2.Fields.Fields[i].AsString <> sqlgeneral3.Fields.Fields[i].AsString) then
                            begin
                                entro := true;
                                querys('Insert into OportunidadesCambios (NombreCampo,NombreDescripcion,oportunidad,cliente,idmaq,posicion,idfact) values('+''''+Campos[i].NombreCampo+''' ,'+''''+Campos[i].Descripcion+''','+''''+sqlgeneral2.Fields.Fields[i].AsString+''','+''''+sqlgeneral3.Fields.Fields[i].AsString+''','+''''+ frmprincipal.idmaq +''','+inttostr(i)+','+''''+sqlgeneral2.fieldbyname('idfact_cliente') .AsString+''' ) ',1,sqlgeneral1);
                            end;
                        end;

                 end;

             if (entro = true) then
                begin
                    querys('Select * from  OportunidadesCambios where idmaq ='+''''+ frmprincipal.idmaq+''' order by posicion asc',0,sqlgeneralCambios);
                    PageControl.ActivePageIndex := 1;
                    lblNombre.Caption := sqlgeneralForm.fieldbyname('Nombre').AsString;
                    lblOportunidad.Caption := sqlgeneralForm.fieldbyname('idoportunidad').AsString;
                    lblCuenta.Caption := sqlgeneralForm.fieldbyname('CuentaCliente').AsString;
                    btncancelar.Caption := 'Cancelar';
                    btnGuardar.enabled := true;
                    btncancelar.Hint := 'Cancelar actualizacion de cliente';
                    btnQuitar.Enabled := true;
                end else
                  begin
                        if application.MessageBox('No tiene ningun campo a actualizar,desea que se quite de la lista de oportunidades pendientes?','Confirmación',mb_yesno+mb_iconwarning) = IDYES then
                           begin
                            querys('Update oportunidades set AceptaModificacion= "'+datetostr(date)+'" where idoportunidad='+sqlgeneralForm.fieldbyname('idoportunidad').AsString,1,dmreportes.sqlgeneral2);
                            CargarGrid();
                           end;

                  end;

            end else
               Application.MessageBox('No hay datos a modificar!','Aviso',MB_OK+MB_ICONINFORMATION);


end;               
  NullStrictConvert := true;

end;
end;


procedure TfrmAutorizacionCambios.Cancelar;
begin
         PageControl.ActivePageIndex := 0;
         lblNombre.Caption := '';
         lblOportunidad.Caption := '';
         lblCuenta.Caption := '';

         if(sqlgeneralCambios.RecordCount > 0) then
             querys('Delete from OportunidadesCambios where idmaq ='+''''+ frmprincipal.idmaq+''' ',1,sqlgeneralCambios);

         btncancelar.Caption := 'Cerrar';
         btnGuardar.enabled := false;
         btncancelar.Hint := 'Cerrar Pantalla';
         btnQuitar.Enabled := false;

end;


procedure TfrmAutorizacionCambios.btncancelarClick(Sender: TObject);
begin
if( btncancelar.Caption = 'Cancelar') then
begin
  if application.MessageBox('Estas seguro de cancelar la actualizacion?','Confirmación',mb_yesno+mb_iconwarning) = IDYES then
     Cancelar;
end
  else
     close;

end;



procedure TfrmAutorizacionCambios.cxGrid1DBTableView1KeyPress(
  Sender: TObject; var Key: Char);
begin
if (Key = #13) then
 begin
      key := #0;
      CompararCampos();
 end;

end;

procedure TfrmAutorizacionCambios.btnQuitarClick(Sender: TObject);
begin
if(sqlgeneralCambios.RecordCount > 0) then
   begin
      querys('Delete from OportunidadesCambios where idmaq ='+''''+ frmprincipal.idmaq+''' and posicion='+''''+sqlgeneralCambios.fieldbyname('posicion').AsString+''' '  ,1,dmreportes.sqlgeneral2);
      querys('Select * from  OportunidadesCambios where idmaq ='+''''+ frmprincipal.idmaq+''' order by posicion asc',0,sqlgeneralCambios);
    end;
end;

procedure TfrmAutorizacionCambios.btnGuardarClick(Sender: TObject);
var tabla,id,CampoUpdate,ValorNuevo,ValorAnterior,idfact,cadena:string;

begin

try

if(sqlgeneralCambios.RecordCount > 0) then
   begin
       if application.MessageBox(pchar('Se realizaran las modificaciones de los datos que se muestran, a la cuenta '+lblCuenta.Caption+' desea continuar?'),'Confirmación',mb_yesno+mb_iconwarning) = IDYES then
           begin
              sqlgeneralCambios.First;

               while not sqlgeneralCambios.Eof do
                  begin
                      if(sqlgeneralCambios.FieldByName('posicion').AsInteger < 15) then  // actualizar a clientes
                         begin
                               id := lblCuenta.Caption; CampoUpdate := 'idcliente'; tabla := 'clientes';
                         end else
                          begin // actualizar a ClientesFact
                               id := sqlgeneralCambios.fieldbyname('idfact').AsString; CampoUpdate := 'idfact'; tabla := 'ClientesFact';
                               idfact :=  id;
                         end;
                         if( Campos[sqlgeneralCambios.FieldByName('posicion').AsInteger].Tabla <> '' ) then
                            begin
                               querys('Select '+ Campos[sqlgeneralCambios.FieldByName('posicion').AsInteger].NombreCampo+' from '+Campos[sqlgeneralCambios.FieldByName('posicion').AsInteger].Tabla+'  where nombre =  '+''''+sqlgeneralCambios.FieldByName('oportunidad').AsString +''' ',0,dmreportes.sqlgeneral2);
                               ValorNuevo := dmreportes.sqlgeneral2.Fields.Fields[i].AsString;
                               querys('Select '+ Campos[sqlgeneralCambios.FieldByName('posicion').AsInteger].NombreCampo+' from '+Campos[sqlgeneralCambios.FieldByName('posicion').AsInteger].Tabla+'  where nombre =  '+''''+sqlgeneralCambios.FieldByName('cliente').AsString +''' ',0,dmreportes.sqlgeneral2);
                               ValorAnterior := dmreportes.sqlgeneral2.Fields.Fields[i].AsString;
                            end
                               else
                            begin
                               ValorNuevo := sqlgeneralCambios.FieldByName('oportunidad').AsString;
                               ValorAnterior :=  sqlgeneralCambios.FieldByName('cliente').AsString;
                            end;


                        querys('Update '+tabla+' set '+ Campos[sqlgeneralCambios.FieldByName('posicion').AsInteger].NombreCampo+' = '+''''+ValorNuevo+'''  where '+CampoUpdate+'='+''''+id+''' '  ,1,dmreportes.sqlgeneral2);

                        querys('Select max(idcambio) as total from Cambios', 0, dmreportes.sqlgeneral3);
                        querys('Insert into Cambios set idcambio='+inttostr(dmreportes.sqlgeneral3.fieldbyname('total').asinteger+1)+', idprimario='+''''+lblCuenta.Caption+''', tabla='+''''+tabla+''' '+
                               ', anterior='+''''+ValorAnterior+''',nuevo='+''''+ValorNuevo+''', usuario='+''''+frmprincipal.ucprincipal.CurrentUser.loginname+''', fecha="'+datetostr(date)+'"' +
                               ',hora="'+timetostr(time)+'", campo='+''''+Campos[sqlgeneralCambios.FieldByName('posicion').AsInteger].NombreCampo+''', pantalla=''frmAutorizacionCambios'' ',1,dmreportes.sqlgeneral2);

                        sqlgeneralCambios.Next;
                  end;

                if(idfact <> '') then
                  begin
                   cadena := 'Update ClientesFact,colonias set DirCres= Concat(dir,'' '',numero), ColCres=colonias.nombre,CPCres = colonias.cp, CdCres=ciudad,RFCCres=rfc ';
                      querys('select rsocial,nombre,apaterno,amaterno from ClientesFact where idfact='+''''+idfact+''' ',0,dmreportes.sqlgeneral2);
                          if(dmreportes.sqlgeneral2.Fields.Fields[0].AsString <> '' ) then
                             begin
                               cadena := cadena + ',NombreCres = rsocial ';
                             end
                                else
                             begin
                               cadena := cadena + ',NombreCres = '+quotedstr(dmreportes.sqlgeneral2.Fields.Fields[1].AsString +' '+dmreportes.sqlgeneral2.Fields.Fields[2].AsString + ' ' +dmreportes.sqlgeneral2.Fields.Fields[3].AsString) ;
                             end;

                         cadena :=  cadena + 'where idfact= '+''''+ idfact +''' AND colonias.idcol=ClientesFact.idcol ';
                       querys(cadena,1,dmreportes.sqlgeneral2);

                  end;

                querys('Update oportunidades set AceptaModificacion= "'+datetostr(date)+'" where idoportunidad='+''''+lblOportunidad.Caption+''' ',1,dmreportes.sqlgeneral2);
                Application.MessageBox('La actualizacion fue realizada!','Aviso',MB_OK+MB_ICONINFORMATION);
                CargarGrid();
                Cancelar;

           end;
   end;

except
   Application.MessageBox('Hubo un error al intentar pasar los datos, por favor comunicarse al area de sistemas!','Aviso',MB_OK+MB_ICONEXCLAMATION);
end;

end;

end.
