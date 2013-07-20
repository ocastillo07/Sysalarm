{///////////////////////////////////////////////////////////////////////////////
2008/07/24 Cambios sincronizacion
}///////////////////////////////////////////////////////////////////////////////
unit UDatosFactOPort;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, RzButton, Mask, RzEdit, RzRadChk, ExtCtrls,
  RzPanel, RzRadGrp, RzLabel,MyAccess;

type
  TfrmDatosFactOport = class(TForm)
    gbfacturacion: TGroupBox;
    lbnombre: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel8: TRzLabel;
    lbpaterno: TRzLabel;
    lbmaterno: TRzLabel;
    lbrazon: TRzLabel;
    RzLabel1: TRzLabel;
    RzLabel15: TRzLabel;
    rgcasa: TRzRadioGroup;
    mismo_dom: TRzCheckBox;
    ednombre: TRzEdit;
    eddir: TRzEdit;
    edcd: TRzEdit;
    edtel: TRzEdit;
    btnalta: TRzBitBtn;
    btncerrar: TRzBitBtn;
    ednum: TRzEdit;
    edpaterno: TRzEdit;
    edmaterno: TRzEdit;
    edrazon_social: TRzEdit;
    rgtipo: TRzRadioGroup;
    lbcolonias: TRzComboBox;
    edcp: TRzEdit;
    edrfc: TRzMaskEdit;
    chkNuevos: TRzCheckBox;
    foranea: TRzCheckBox;
    cboedo: TRzComboBox;
    procedure btncerrarClick(Sender: TObject);
    procedure mismo_domClick(Sender: TObject);
    procedure asignar(idfact:string);
    procedure deshabilitar;
    procedure habilitar;
    procedure limpiar;
    procedure combo;
    procedure tipo;
    procedure fisica;
    procedure moral;
    procedure btnaltaClick(Sender: TObject);
    procedure lbcoloniasExit(Sender: TObject);
    procedure edcdEnter(Sender: TObject);
    procedure ednumKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgtipoClick(Sender: TObject);
    procedure lbcoloniasMatch(Sender: TObject);
    procedure lbcoloniasKeyPress(Sender: TObject; var Key: Char);
    procedure edcdExit(Sender: TObject);
    procedure cboedoEnter(Sender: TObject);
  private
    { Private declarations }
{   procedure nomover(var m: TWMWINDOWPOSCHANGED); message WM_WINDOWPOSCHANGING ;}
   procedure deducible;
  public
    { Public declarations }
     idc:string;
     idfac,sincronizar:integer;
     constructor inicializa(const id:string;idf,syn:integer);
  end;

var
  frmDatosFactOport: TfrmDatosFactOport;
  sqlcolonias,sqlgeneral :TMyQuery;

implementation

uses Udmrep, Udm, Uprincipal, Urecursos, Uprospectos, DB, StrUtils;

{$R *.dfm}
      {

procedure TfrmDatosFactOport.nomover(var m : TWMWINDOWPOSCHANGED);
begin

        m.windowpos.x :=round((screen.Width - self.Width) div 2);;
        m.windowpos.y :=round((screen.Height - self.Height) div 2);;

end;
       }
procedure TfrmDatosFactOport.fisica;
begin
ednombre.Visible:=true; edpaterno.Visible:=true; edmaterno.Visible:=true;
lbnombre.Visible:=true; lbpaterno.Visible:=true; lbmaterno.Visible:=true;
edrazon_social.Visible:=false; lbrazon.Visible:=false;
edrazon_social.Text:='';
end;

procedure TfrmDatosFactOport.moral;
begin
ednombre.Text:='';
ednombre.Visible:=false; edpaterno.Visible:=false; edmaterno.Visible:=false;
lbnombre.Visible:=false; lbpaterno.Visible:=false; lbmaterno.Visible:=false;
edrazon_social.Visible:=true; lbrazon.Visible:=true;
end;

procedure TfrmDatosFactOport.combo;
begin
      sqlcolonias.Close;
      lbcolonias.Clear;
      sqlcolonias.Open;

      while not sqlcolonias.Eof = TRUE do begin
      lbcolonias.Items.Add(sqlcolonias.fieldbyname('nombre').AsString);
      sqlcolonias.Next;
      end;
      lbcolonias.ItemIndex:=-1;
 end;

procedure TfrmDatosFactOport.limpiar;
begin

            ednombre.Text:='';
            edrfc.Text:='';
            eddir.Text:='';
            ednum.Text:='';
            lbcolonias.Text:='';
            edcp.text:='';
            edtel.Text:='';
            edcd.Text:='';
            cboedo.text := '';
            rgcasa.ItemIndex:=-1;
            edpaterno.Text:=''; edmaterno.Text:='';
            edrazon_social.Text:='';
            edpaterno.text:='';
            edmaterno.text:='';
end;

procedure TfrmDatosFactOport.deshabilitar;
begin
ednombre.Enabled:=false;
edpaterno.Enabled:=false;
edmaterno.Enabled:=false;
edrazon_social.enabled:=false;
edrfc.Enabled:=false;
eddir.Enabled:=false;
ednum.Enabled:=false;
lbcolonias.Enabled:=false;
edtel.Enabled:=false;
edcd.Enabled:=false;
cboedo.Enabled:=false;
rgcasa.Enabled:=false;
edcp.Enabled := false;
chkNuevos.Enabled := false;
foranea.Enabled:=false;
end;

procedure TfrmDatosFactOport.habilitar;
begin

//if ednombre.visible=TRUE then begin

   ednombre.Enabled:=true;
   edpaterno.Enabled:=true;
   edmaterno.Enabled:=true;
//end else begin
    edrazon_social.enabled:=true;
//end;

         ednombre.Enabled:=true;
         edrfc.Enabled:=true;
         eddir.Enabled:=true;
         ednum.Enabled:=true;
         lbcolonias.Enabled:=true;
         edtel.Enabled:=true;
         edcd.Enabled:=true;
         cboedo.Enabled:=true;
         rgcasa.Enabled:=true;
         chkNuevos.Enabled := true;
end;

procedure TfrmDatosFactOport.tipo;
begin
sleep(1000);//si es fisica
end;

procedure TfrmDatosFactOport.asignar(idfact:string);
begin  //sync
   //querys('select * from ClientesFact where idfact="'+idfact+'"',0,sqlgeneral);
   querys('select * from OportunidadesFact where idfact="'+idfact+'"',0,sqlgeneral);
   if sqlgeneral.fieldbyname('rsocial').asstring = '' then
   begin
      fisica;
      ednombre.Text:=sqlgeneral.fieldbyname('nombre').asstring;
      edpaterno.Text:=sqlgeneral.fieldbyname('apaterno').asstring;
      edmaterno.Text:=sqlgeneral.fieldbyname('amaterno').asstring;
      rgtipo.ItemIndex:=0;
   end
   else
   begin
      moral;
      edrazon_social.Text:=sqlgeneral.fieldbyname('rsocial').asstring;
      rgtipo.ItemIndex:=1;
   end;
   eddir.Text:=sqlgeneral.fieldbyname('dir').asstring;
   edcd.Text:=sqlgeneral.fieldbyname('ciudad').asstring;
   //cboedo.Text := sqlgeneral.fieldbyname('EstadoCres').AsString;
   cboedo.Text := sqlgeneral.fieldbyname('estado').AsString;
   edcp.Text:=sqlgeneral.fieldbyname('cp').asstring;
   ednum.Text:=sqlgeneral.fieldbyname('numero').asstring;
   try
      edrfc.Text := sqlgeneral.fieldbyname('rfc').asstring;
      edtel.Text := sqlgeneral.fieldbyname('telefono').asstring;
      rgcasa.ItemIndex := sqlgeneral.fieldbyname('casa').AsInteger;
      except
   end;
   querys('select idcol,nombre from colonias where idcol='+quotedstr(sqlgeneral.fieldbyname('idcol').asstring)+'',0,sqlgeneral);
   lbcolonias.Text:=sqlgeneral.fieldbyname('nombre').asstring;
   mismo_dom.Enabled:=false;
end;


constructor TfrmDatosFactOport.inicializa(const id:string;idf,syn:integer);
var temp:string;
begin
   idc:=id;
   idfac:=idf;
   sincronizar:=syn;
   limpiar;
   mismo_dom.Checked:=false;
   CargaCombo('select nombre from estados','estados',cboedo);
   SQLcolonias := TMyQuery.Create(nil);
   sqlgeneral := TMyQuery.Create(nil);
   sqlgeneral.Connection := DMAccesos.conexion;
   SQLcolonias.Connection := DMAccesos.conexion;
   sqlcolonias.SQL.Add('select colonias.nombre,colonias.idcol,colonias.cp,col_sector.idsector '+
                       'from  colonias inner join col_sector on (colonias.idcol=col_sector.idcol) order by colonias.nombre');
   querys('select rsocial,idoportunidad,idfact,nombre,apaterno,amaterno,dir,numero,ciudad,estado,cp,idcol,cuenta '+
          'from oportunidades where idoportunidad='+quotedstr(idc)+'',0,sqlgeneral);

   if(sqlgeneral.fieldbyname('cuenta').asstring <> '0' ) then
      chkNuevos.Visible := true;
   if querys('select idfact from OportunidadesFact where idfact='+inttostr(idfac),0,dmreportes.sqlgeneral)=0 then
      chkNuevos.Checked:= true;
   // si no tiene asignado un valor en el id de ClientesFact
   if sqlgeneral.fieldbyname('idfact').asstring = '0' then
   begin
      habilitar;
      querys('select valor from configuraciones where concepto="estado"',0,DMREPORTES.sqlgeneral);
      cboedo.Text:=dmreportes.sqlgeneral.fieldbyname('valor').AsString;
      mismo_dom.Enabled:=true;
      btnalta.Caption:='&Grabar';
      btncerrar.Caption:='&Cancelar';
      btnalta.Hint:='Grabar los datos de la factura de la oportunidad';
      combo; //llenar el comobobox con las colonias;
   end
   else
   begin
   //sync
   // pero si tiene un id asignadado busca en ClientesFact.
      temp:= inttostr(idfac);
      limpiar;
      asignar(temp);
      deshabilitar;
      mismo_dom.Enabled:=false;
      btnalta.Caption:='&Editar';
      btncerrar.Caption:='&Cerrar';
      btnalta.Hint:='Editar la factura de la oportunidad';
   end;
end;

procedure TfrmDatosFactOport.btncerrarClick(Sender: TObject);
begin
if btncerrar.Caption='&Cancelar' then
begin
  if mismo_dom.Checked=true then
    mismo_dom.Checked:=false;
  if btnalta.Caption='&Guardar' then  begin
    btnalta.Caption:='&Editar';
  deshabilitar;
end
else
begin
  limpiar;
end;
//deshabilitar;
btncerrar.Caption:='&Cerrar';
if mismo_dom.Enabled=false THEN
  mismo_dom.Enabled:=TRUE;
end
else
begin
  if mismo_dom.Checked=true then
    mismo_dom.Checked:=false;
  close;
end;
end;


procedure TfrmDatosFactOport.mismo_domClick(Sender: TObject);
begin
   querys('select rsocial,idtel,nombre,apaterno,amaterno,dir,numero,ciudad,cp,idcol,estado from oportunidades where idoportunidad='+quotedstr(idc)+'',0,sqlgeneral);
   if (trim(sqlgeneral.fieldbyname('rsocial').asstring)='') and (trim(sqlgeneral.fieldbyname('nombre').asstring)<>'') then
   begin
      fisica;
      ednombre.Text:=sqlgeneral.fieldbyname('nombre').asstring;
      edpaterno.Text:=sqlgeneral.fieldbyname('apaterno').asstring;
      edmaterno.Text:=sqlgeneral.fieldbyname('amaterno').asstring;
      rgtipo.ItemIndex:=0;
   end;
   if (trim(sqlgeneral.fieldbyname('rsocial').asstring)<>'') and (trim(sqlgeneral.fieldbyname('nombre').asstring)='') then
   begin
      moral;
      edrazon_social.Text:=sqlgeneral.fieldbyname('rsocial').asstring;
      rgtipo.ItemIndex:=1;
   end
   else
   begin
      edrazon_social.Text:=sqlgeneral.fieldbyname('rsocial').asstring;
      ednombre.Text:=sqlgeneral.fieldbyname('nombre').asstring;
      edpaterno.Text:=sqlgeneral.fieldbyname('apaterno').asstring;
      edmaterno.Text:=sqlgeneral.fieldbyname('amaterno').asstring;
   end;
   eddir.Text:=sqlgeneral.fieldbyname('dir').asstring;
   edcd.Text:=sqlgeneral.fieldbyname('ciudad').asstring;
   cboedo.Text := sqlgeneral.fieldbyname('estado').AsString;
   edcp.Text:=sqlgeneral.fieldbyname('cp').asstring;
   ednum.Text:=sqlgeneral.fieldbyname('numero').asstring;
   querys('select idcol,nombre from colonias where idcol='+quotedstr(sqlgeneral.fieldbyname('idcol').asstring)+'',0,sqlcolonias);
   lbcolonias.Text:=sqlcolonias.fieldbyname('nombre').asstring;
   querys('select telefono from telefonos where idtel='+quotedstr(sqlgeneral.fieldbyname('idtel').asstring)+' and tipo_tel="CONVENCIONAL"',0,sqlgeneral);
   edtel.Text := sqlgeneral.fieldbyname('telefono').asstring;
   if btncerrar.Caption ='&Cerrar' then
      btncerrar.Caption:='&Cancelar';;
end;


procedure TfrmDatosFactOport.btnaltaClick(Sender: TObject);
var
  temp,cp,col,_nuevosDatos:string;
  i:integer; ban:boolean;
begin
   ban:=false;
   if btnalta.Caption='&Grabar' then
   begin
      if idfac = 0 then
      begin
         querys('select max(idfact) as idfact from OportunidadesFact',0,sqlgeneral);
         idfac:=sqlgeneral.fieldbyname('idfact').AsInteger + 1;
      end;
      if ((eddir.Text = '')  OR (eddir.Text= '') OR (edtel.Text= '') OR (edcp.Text= '') OR (ednum.Text= '') OR (lbcolonias.Text= '')) then
      begin
         application.messagebox('Algunos Campos estan incompletos','Aviso',MB_OK+MB_ICONWARNING);
         exit;
      end
      else
      begin
         querys('select * from colonias where nombre='+quotedstr(lbcolonias.Text),1,sqlgeneral);
         cp:=sqlgeneral.fieldbyname('cp').AsString;
         col:=sqlgeneral.fieldbyname('idcol').asstring;
         if (col='') or (col='0') then
         begin
            application.MessageBox('La colonia no corresponde al listado','Aviso',MB_ICONWARNING+MB_OK);
            lbcolonias.SetFocus;
            exit;
         end;
         if querys('select idestado from estados where nombre="'+cboedo.Text+'"',0,DMREPORTES.sqlgeneral4)=0 then
         begin
            application.MessageBox('El estado no corresponde al listado','Aviso',MB_ICONWARNING+MB_OK);
            cboedo.setfocus;
            exit;
         end;
         if(chkNuevos.Checked) then
            _nuevosDatos := '1'
         else
            _nuevosDatos := '0';

         repeat
         try
            if ednombre.Visible= true then
            begin
                  if querys('select idfact from OportunidadesFact where idfact='+inttostr(idfac),0,sqlgeneral)=0 then
                  begin
                     sqlgeneral.close;
                     sqlgeneral.SQL.Clear;
                     sqlgeneral.SQL.Add('INSERT into OportunidadesFact(idfact,nombre,apaterno,amaterno,dir,numero,idcol,ciudad,cp,rfc,telefono,casa,NuevosDatos,estado) '+
                     'values ('+inttostr(idfac)+','+quotedstr(ednombre.Text)+','+quotedstr(edpaterno.Text)+','+quotedstr(edmaterno.Text)+','+
                     quotedstr(eddir.Text)+','+quotedstr(ednum.Text)+','+quotedstr(col)+','+quotedstr(edcd.text)+','+
                     quotedstr(cp)+','+quotedstr(edrfc.Text)+','+quotedstr(edtel.text)+','+inttostr(rgcasa.itemindex)+','+_nuevosDatos+',"'+
                     cboedo.text+'")');
                     sqlgeneral.Execute;
                  end
                  else
                     querys('update OportunidadesFact set nombre='+quotedstr(ednombre.Text)+',apaterno='+quotedstr(edpaterno.Text)+',amaterno='+
                     quotedstr(edmaterno.Text)+',dir='+quotedstr(eddir.Text)+',rfc='+quotedstr(edrfc.Text)+',numero='+quotedstr(ednum.Text)+',idcol='+quotedstr(col)+',cp='+quotedstr(cp)+',ciudad='+quotedstr(edcd.Text)+',telefono='+quotedstr(edtel.Text)+',casa='+inttostr(rgcasa.itemindex)+',rsocial='+quotedstr(edrazon_social.text)+
                     ',NuevosDatos ='+_nuevosDatos+',estado="'+cboedo.text+'",Sincronizado='+inttostr(sincronizar)+' where idfact='+inttostr(idfac)+'',1,sqlgeneral);
            end;
            if edrazon_social.Visible = true then
            begin
               if querys('select idfact from OportunidadesFact where idfact='+inttostr(idfac),0,sqlgeneral)=0 then
               begin
                  sqlgeneral.close;
                  sqlgeneral.SQL.Clear;
                  sqlgeneral.SQL.Add('INSERT into OportunidadesFact(idfact,rsocial,dir,numero,idcol,ciudad,cp,rfc,telefono,casa,NuevosDatos,estado) '+
                  ' values ('+inttostr(idfac)+','+quotedstr(edrazon_social.Text)+','+quotedstr(eddir.Text)+','+quotedstr(ednum.Text)+','
                  +quotedstr(col)+','+quotedstr(edcd.text)+','+quotedstr(edcp.text)+','+quotedstr(edrfc.Text)+','+quotedstr(edtel.text)+','
                  +inttostr(rgcasa.itemindex)+','+_nuevosDatos+',"'+cboedo.text+'")');
                  sqlgeneral.Execute;
                  ban:=false;
               end
               else
                  querys('update OportunidadesFact set nombre='+quotedstr(ednombre.Text)+',apaterno='+quotedstr(edpaterno.Text)+',amaterno='+quotedstr(edmaterno.Text)+',dir='+quotedstr(eddir.Text)+',rfc='+quotedstr(edrfc.Text)+',numero='+quotedstr(ednum.Text)+',idcol='+quotedstr(col)+',cp='+quotedstr(cp)+',ciudad='+quotedstr(edcd.Text)+',telefono='+quotedstr(edtel.Text)+',casa='+inttostr(rgcasa.itemindex)+',rsocial='+quotedstr(edrazon_social.text)+
                  ',NuevosDatos ='+_nuevosDatos+',estado="'+cboedo.text+'" where idfact='+inttostr(idfac)+'',1,sqlgeneral);
            end;
         except
         On e:Exception do
            if OcurrenciaWord(e.message,'#23000Duplicate entry')>0 then
            begin
               ban:=true;
               inc(idfac);
               //inc(contador);
            end
            else
               ban:=false;
            end;
         until ban=false;

         if foranea.Checked then
            querys('update OportunidadesFact set colonia="'+lbcolonias.Text+'" where idfact='+inttostr(idfac),1,sqlgeneral);
         frmprincipal.ucprincipal.Log('Dio de Alta datos de la oportunidad factura:'+quotedstr(inttostr(idfac)),1);
         querys('update oportunidades set idfact='+inttostr(idfac)+' where idoportunidad='+quotedstr(idc)+'',1,sqlgeneral);
         application.MessageBox('Se realizo el registro exitosamente','Aviso',MB_OK+MB_ICONINFORMATION);
         btnalta.Caption:='&Editar';
         btncerrar.Caption:='&Cerrar';
         deshabilitar;      // end;

         for i:=0 to screen.FormCount - 1 do
            if screen.Forms[i].Name = 'frmprospectos' then
            begin
               (screen.Forms[i] as Tfrmprospectos).tbloportunidades.Refresh;
               (screen.Forms[i] as Tfrmprospectos).tbloportunidades.Edit;
            end;
         deducible;
      end;   //     end;//if del ednombre = a true // end; // campos en blanco
   end //Grabar
   else
   begin
      if btnalta.Caption ='&Editar' then
      begin
         chkNuevos.Checked:=true;
         edcp.Enabled := true;
         rgtipo.Enabled:=true;
         btnalta.Caption:='&Grabar';
         btnalta.hint:='Guardar los cambios';
         btncerrar.Caption:='&Cancelar';
         btncerrar.hint:='Cancelar los cambios';
         temp:=lbcolonias.Text;
         combo;
         lbcolonias.Text:=temp;
         habilitar;
         mismo_dom.Enabled:=true;
         if ednombre.Visible = true then
            ednombre.SetFocus
         else
            edrazon_social.SetFocus;
      end
      else
      begin
         if btnalta.Caption ='&Grabar' then
         begin
            rgtipo.Enabled:=false;
            if ednombre.Visible= true then
            begin
               querys('select * from colonias where nombre='+quotedstr(lbcolonias.Text),1,sqlgeneral);
               //cp:=sqlgeneral.fieldbyname('cp').AsString;
               cp:=edcp.text;
               if sqlgeneral.fieldbyname('idcol').asstring <> '' then
                  col:=sqlgeneral.fieldbyname('idcol').asstring;
               if(chkNuevos.Checked) then
                  _nuevosDatos := '1'
               else
                  _nuevosDatos := '0';
               edrazon_social.Clear;
               bpcambios('OportunidadesFact',  inttostr(idfac), 'idfact');
               querys('update OportunidadesFact set nombre='+quotedstr(ednombre.Text)+',apaterno='+quotedstr(edpaterno.Text)+
               ',amaterno='+quotedstr(edmaterno.Text)+',dir='+quotedstr(eddir.Text)+',rfc='+quotedstr(edrfc.Text)+',numero='+quotedstr(ednum.Text)+',idcol='+quotedstr(col)+',cp='+quotedstr(cp)+',ciudad='+quotedstr(edcd.Text)+',telefono='+quotedstr(edtel.Text)+',casa='+inttostr(rgcasa.itemindex)+',rsocial='+quotedstr(edrazon_social.text)+
               ',NuevosDatos ='+_nuevosDatos+',estado="'+cboedo.text+'" where idfact='+inttostr(idfac)+'',1,sqlgeneral);
               apcambios('idfact', inttostr(idfac), 'OportunidadesFact', 'TfrmDatosFactOport');
               frmprincipal.ucprincipal.Log('Edito datos de la factura : '+inttostr(idfac),2);
               deshabilitar;
               btnalta.Caption:='&Editar';
               btncerrar.Caption:='&Cerrar';
               mismo_dom.Enabled:=true;
            end;
         end;
         if edrazon_social.Visible = true then
         begin
            querys('select * from colonias where nombre='+quotedstr(lbcolonias.Text),1,sqlgeneral);
            // cp:=sqlgeneral.fieldbyname('cp').AsString;
            cp:=edcp.text;
            if sqlgeneral.fieldbyname('idcol').asstring <> '' then
               col:=sqlgeneral.fieldbyname('idcol').asstring;
            ednombre.Clear;  edpaterno.Clear; edmaterno.Clear;
            bpcambios('OportunidadesFact',  inttostr(idfac), 'idfact');
            querys('update OportunidadesFact set rsocial='+quotedstr(edrazon_social.Text)+',dir='+quotedstr(eddir.Text)+',rfc='+
            quotedstr(edrfc.Text)+',numero='+quotedstr(ednum.Text)+',idcol='+quotedstr(col)+',cp='+quotedstr(cp)+',ciudad='+
            quotedstr(edcd.Text)+',telefono='+quotedstr(edtel.Text)+',casa='+inttostr(rgcasa.itemindex)+',nombre='+
            quotedstr(ednombre.Text)+',apaterno='+quotedstr(edpaterno.Text)+',amaterno='+quotedstr(edmaterno.Text)+
            '  where idfact='+inttostr(idfac),1,sqlgeneral);
            apcambios('idfact', inttostr(idfac), 'OportunidadesFact', 'frmDatosFactOport');
            frmprincipal.ucprincipal.Log('Edito datos de la factura:'+inttostr(idfac),2);
            for i:=0 to screen.FormCount - 1 do
               if screen.Forms[i].Name = 'frmprospectos' then
               begin
                  (screen.Forms[i] as Tfrmprospectos).tbloportunidades.Refresh;
                  (screen.Forms[i] as Tfrmprospectos).tbloportunidades.Edit;
               end;
            deshabilitar;
            btnalta.Caption:='&Editar';
            btncerrar.Caption:='&Cerrar';
            mismo_dom.Enabled:=true;
         end;
         deducible;
      end; //if guardar
   end;
end;

procedure TfrmDatosFactOport.lbcoloniasExit(Sender: TObject);
begin
querys('select * from colonias where nombre='+quotedstr(lbcolonias.Text),1,sqlgeneral);
edcp.text:=sqlgeneral.fieldbyname('cp').AsString;
end;

procedure TfrmDatosFactOport.edcdEnter(Sender: TObject);
begin

querys('Select valor from configuraciones where concepto = "ciudad"', 0, sqlgeneral);
edcd.Text:=sqlgeneral.fieldbyname('valor').AsString;
end;

procedure TfrmDatosFactOport.ednumKeyPress(Sender: TObject; var Key: Char);
begin
 if ( StrScan('0123456789.-',Key) <> nil ) or
     ( Key = Char(VK_BACK) ) then { BackSpace Key }
  begin

  end else //begin

  if key=#13 then begin
    lbcolonias.SetFocus;
   end;

  end;

procedure TfrmDatosFactOport.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmDatosFactOport.rgtipoClick(Sender: TObject);
begin

if RGTIPO.ItemIndex=0 then begin
     fisica;
end else begin
  if RGTIPO.ItemIndex=1 then begin
     moral;
  end;
 end;

end;

procedure TfrmDatosFactOport.lbcoloniasMatch(Sender: TObject);
begin
//trae el nombre del movil y el CP dependiendo del nombre de la colonia
querys('SELECT colonias.cp FROM colonias INNER JOIN col_sector ON (colonias.idcol = col_sector.idcol) INNER JOIN sectores ON (col_sector.idsector = sectores.idsector) WHERE colonias.nombre = '+quotedstr(lbcolonias.Text),0,sqlgeneral);
//edsector.Text:=sqlgeneral.fieldbyname('nombre').AsString;
edcp.Text:=sqlgeneral.fieldbyname('cp').AsString;
end;

procedure TfrmDatosFactOport.deducible;
begin
 {DEDUCCION IVA}

  if querys('Select c.idoportunidad, cf.rfc from oportunidades as c left join OportunidadesFact as cf on c.idfact=cf.idfact where cf.idfact = '+inttostr(idfac), 0, sqlgeneral) > 0 then
    begin
    bpcambios('oportunidades', sqlgeneral.fieldbyname('idoportunidad').AsString, 'idoportunidad');
    if (sqlgeneral.fieldbyname('rfc').AsString = '') or (sqlgeneral.fieldbyname('rfc').AsString = NULL) then
      querys('Update oportunidades set deducible = 0 where idfact ='+inttostr(idfac), 1, dmreportes.sqlgeneral7)
    else
      querys('Update oportunidades set deducible = 1 where idfact ='+inttostr(idfac), 1, dmreportes.sqlgeneral7);
    apcambios('idoportunidad', sqlgeneral.fieldbyname('idoportunidad').AsString, 'oportunidades', 'frmDatosFactOport');
    end;
//      RzDBCheckBox1.Checked := true;
  {FIN DEDUCCION IVA}
end;

procedure TfrmDatosFactOport.lbcoloniasKeyPress(Sender: TObject;
  var Key: Char);
begin
   if key=#13 then
   begin
      key:=#0;
      SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
   end;
end;

procedure TfrmDatosFactOport.edcdExit(Sender: TObject);
begin
   if AnsiContainsStr(edcd.Text,'B.C.') then
      edcd.Text:=AnsiReplaceStr(edcd.text,'B.C.','');
   if AnsiContainsStr(edcd.Text,'BC') then
      edcd.Text:=AnsiReplaceStr(edcd.text,'BC','');
   if AnsiContainsStr(edcd.Text,'B.C') then
      edcd.Text:=AnsiReplaceStr(edcd.text,'B.C','');
   if AnsiContainsStr(edcd.Text,'BAJA') then
      edcd.Text:=AnsiReplaceStr(edcd.text,'BAJA','');
   if AnsiContainsStr(edcd.Text,'CALIFORNIA') then
      edcd.Text:=AnsiReplaceStr(edcd.text,'CALIFORNIA','');
end;

procedure TfrmDatosFactOport.cboedoEnter(Sender: TObject);
begin
   cboedo.ItemIndex:=1;
end;

end.
