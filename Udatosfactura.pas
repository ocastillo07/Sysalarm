{///////////////////////////////////////////////////////////////////////////////
2012/05/18 dalyla usar el arreglo para el idcol correcto al guardar   otra vez
2012/03/20 dalyla usar el arreglo para el idcol correcto al guardar
2010/02/16 dalyla colonias con arreglo para sacar el valor correcto del cp, mnp y edo
//Ultima modificacion el Edwin 11 de sep
//grababa direcion + numero + numero.
}///////////////////////////////////////////////////////////////////////////////
unit Udatosfactura;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzButton, RzRadChk, ExtCtrls, RzPanel, RzRadGrp,
  RzLabel, RzEdit, Mask, RzDBEdit, DBCtrls, RzDBCmbo, DB, MemDS, DBAccess,
  MyAccess, RzCmboBx;

type
  Tfrmdatosfactura = class(TForm)
    gbfacturacion: TGroupBox;
    lbnombre: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    rgcasa: TRzRadioGroup;
    mismo_dom: TRzCheckBox;
    ednombre: TRzEdit;
    eddir: TRzEdit;
    edcd: TRzEdit;
    edtel: TRzEdit;
    SQLcolonias: TMyQuery;
    btnalta: TRzBitBtn;
    btncerrar: TRzBitBtn;
    sqlgeneral: TMyQuery;
    RzLabel8: TRzLabel;
    ednum: TRzEdit;
    lbpaterno: TRzLabel;
    lbmaterno: TRzLabel;
    edpaterno: TRzEdit;
    edmaterno: TRzEdit;
    edrazon_social: TRzEdit;
    lbrazon: TRzLabel;
    rgtipo: TRzRadioGroup;
    RzLabel1: TRzLabel;
    lbcolonias: TRzComboBox;
    edcp: TRzEdit;
    SQLcoloniasnombre: TStringField;
    SQLcoloniasidcol: TIntegerField;
    SQLcoloniascp: TIntegerField;
    SQLcoloniasidsector: TSmallintField;
    edd: TRzEdit;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    RzLabel11: TRzLabel;
    edc: TRzEdit;
    RzLabel12: TRzLabel;
    edcpostal: TRzEdit;
    RzLabel14: TRzLabel;
    edrfcc: TRzEdit;
    RzLabel13: TRzLabel;
    edNombreCres: TRzEdit;
    edrfc: TRzEdit;
    RzLabel15: TRzLabel;
    ededo: TRzEdit;
    RzLabel16: TRzLabel;
    lbufh: TRzLabel;
    procedure btncerrarClick(Sender: TObject);
    procedure mismo_domClick(Sender: TObject);
    procedure asignar;
    procedure deshabilitar;
    procedure habilitar;
    procedure limpiar;
    procedure combo;
    procedure tipo;
    procedure fisica;
    procedure moral;
    procedure btnaltaClick(Sender: TObject);
    procedure edtelKeyPress(Sender: TObject; var Key: Char);
    procedure lbcoloniasExit(Sender: TObject);
    procedure edcdEnter(Sender: TObject);
    procedure ednumKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgtipoClick(Sender: TObject);
    procedure lbcoloniasMatch(Sender: TObject);
    procedure edrfcExit(Sender: TObject);
  private
    { Private declarations }
     procedure nomover(var m: TWMWINDOWPOSCHANGED); message
   WM_WINDOWPOSCHANGING ;
   procedure deducible;
  public


  public
    { Public declarations }
     aridcol : array of string;
     idc:string;
     idfac:integer;
     constructor inicializa(const id:string;idf:integer);
  end;

var
  frmdatosfactura: Tfrmdatosfactura;

implementation

uses Udm, Urecursos, Uprincipal, Udmrep, Uclientes;

{$R *.dfm}

procedure tfrmdatosfactura.nomover(var m : TWMWINDOWPOSCHANGED);
begin

        m.windowpos.x :=round((screen.Width - self.Width) div 2);;  {Left/Posicion X}
        m.windowpos.y :=round((screen.Height - self.Height) div 2);;  {Left/Posicion X}

end;

procedure tfrmdatosfactura.fisica;
begin
ednombre.Visible:=true; edpaterno.Visible:=true; edmaterno.Visible:=true;
lbnombre.Visible:=true; lbpaterno.Visible:=true; lbmaterno.Visible:=true;
edrazon_social.Visible:=false; lbrazon.Visible:=false;
end;

procedure tfrmdatosfactura.moral;
begin
ednombre.Visible:=false; edpaterno.Visible:=false; edmaterno.Visible:=false;
lbnombre.Visible:=false; lbpaterno.Visible:=false; lbmaterno.Visible:=false;
edrazon_social.Visible:=true; lbrazon.Visible:=true;
end;

procedure tfrmdatosfactura.combo;
var i:integer;  
begin
cargacombo2('Select idcol, nombre from colonias order by nombre, idmnp', 'nombre', 'idcol', lbcolonias);
querys('Select idcol, nombre from colonias order by nombre, idmnp', 0, sqlgeneral);
i:=0;
while not sqlgeneral.eof do
   begin
   setlength(aridcol, i+1);
   aridcol[i] :=  sqlgeneral.fieldbyname('idcol').AsString;
   inc(i);
   sqlgeneral.next;
   end;
{
      sqlcolonias.Close;
      lbcolonias.Clear;
      sqlcolonias.Open;

      while not sqlcolonias.Eof = TRUE do begin
      lbcolonias.Items.Add(sqlcolonias.fieldbyname('nombre').AsString);
      sqlcolonias.Next;
      end;                      }
      lbcolonias.ItemIndex:=-1;     
 end;

procedure tfrmdatosfactura.limpiar;
begin

            ednombre.Text:='';
            edrfc.Text:='';
            eddir.Text:='';
            ednum.Text:='';
            lbcolonias.Text:='';
            edcp.text:='';
            edtel.Text:='';
            edcd.Text:='';
            ededo.text := '';
            rgcasa.ItemIndex:=-1;
            edpaterno.Text:=''; edmaterno.Text:='';
            edrazon_social.Text:='';
            edpaterno.text:='';
            edmaterno.text:='';
            lbufh.Caption := '';
end;

procedure tfrmdatosfactura.deshabilitar;
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
ededo.Enabled:=false;
rgcasa.Enabled:=false;
edcp.Enabled := false;
end;

procedure tfrmdatosfactura.habilitar;
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
         ededo.Enabled:=true;
         rgcasa.Enabled:=true;
end;

procedure tfrmdatosfactura.asignar;
begin
//EDRFC.EditMask:='';
// asignar datos a los componentes
if sqlgeneral.fieldbyname('rsocial').asstring = '' then begin
fisica;
ednombre.Text:=sqlgeneral.fieldbyname('nombre').asstring;
edpaterno.Text:=sqlgeneral.fieldbyname('apaterno').asstring;
edmaterno.Text:=sqlgeneral.fieldbyname('amaterno').asstring;
rgtipo.ItemIndex:=0;
end else begin
moral;
edrazon_social.Text:=sqlgeneral.fieldbyname('rsocial').asstring;
rgtipo.ItemIndex:=1;
end;

edrfc.Text:=sqlgeneral.fieldbyname('rfc').asstring;
eddir.Text:=sqlgeneral.fieldbyname('dir').asstring;
edcd.Text:=sqlgeneral.fieldbyname('ciudad').asstring;

ededo.Text:=sqlgeneral.fieldbyname('EstadoCres').asstring;
if (sqlgeneral.fieldbyname('EstadoCres').asstring <> '') then
  ededo.Tag := 1;

edcp.Text:=sqlgeneral.fieldbyname('cp').asstring;
ednum.Text:=sqlgeneral.fieldbyname('numero').asstring;

edtel.Text:=sqlgeneral.fieldbyname('telefono').asstring;

querys('select idcol,nombre from colonias where idcol='+quotedstr(sqlgeneral.fieldbyname('idcol').asstring)+'',0,sqlgeneral);
lbcolonias.Text:=sqlgeneral.fieldbyname('nombre').asstring;
mismo_dom.Enabled:=false;

//edrfc.EditMask:='cLLL-000000-AAA;1;_';
end;

procedure tfrmdatosfactura.tipo;
begin
sleep(1000);//si es fisica


end;


constructor tfrmdatosfactura.inicializa(const id:string;idf:integer);
var temp:string;
begin
//edrfc.EditMask:='';
idc:=id;
idfac:=idf;
limpiar;
mismo_dom.Checked:=false;
//querys('select nombre,idcliente from clientes where idcliente='+quotedstr(idc)+'',0,sqlgeneral);
 //comentado 13 julio 2006
//querys('Select idcliente, idfact from ClientesFact where idcliente='+quotedstr(idc), 0, dmreportes.sqlgeneral3);
querys('Select idcliente, idfact from ClientesFact where idfact='+inttostr(idf), 0, dmreportes.sqlgeneral3);
if dmreportes.sqlgeneral3.recordcount = 0 then
  querys('Update clientes set idfact = 0 where idcliente='+quotedstr(idc), 1, dmreportes.sqlgeneral5);

querys('select rsocial,idcliente,idfact,nombre,apaterno,amaterno,dir,numero,ciudad,cp,idcol,rfc,celular,telefono, usuario, fecha, hora '+
       'from clientes where idcliente='+quotedstr(idc)+'',0,sqlgeneral);
lbufh.Caption := UFH(sqlgeneral);
if sqlgeneral.fieldbyname('idfact').asstring = '0' then  begin  // si no tiene asignado un valor en el id de ClientesFact
      habilitar;
      mismo_dom.Enabled:=true;
      btnalta.Caption:='&Grabar';
      btncerrar.Caption:='&Cancelar';
      btnalta.Hint:='Grabar los datos de la factura del cliente';
      combo; //llenar el comobobox con las colonias;

end else begin        // pero si tiene un id asignadado busca en ClientesFact.
      temp:=sqlgeneral.fieldbyname('idfact').asstring;
      limpiar;
      querys('select * from ClientesFact where idfact='+quotedstr(temp)+'',0,sqlgeneral);
      rgcasa.ItemIndex:= sqlgeneral.fieldbyname('casa').AsInteger;
      edd.Text:=sqlgeneral.fieldbyname('DirCres').Asstring;
      edNombreCres.Text :=sqlgeneral.fieldbyname('NombreCres').Asstring;
      edc.Text:=sqlgeneral.fieldbyname('ColCres').Asstring;
      edcpostal.Text:=sqlgeneral.fieldbyname('CPCres').Asstring;
      edrfcc.TEXT:=sqlgeneral.fieldbyname('RFCCres').Asstring;
      asignar;
      deshabilitar;
      mismo_dom.Enabled:=false;
      btnalta.Caption:='&Editar';
      btncerrar.Caption:='&Cerrar';
      btnalta.Hint:='Editar la factura del cliente';
end;
//edrfc.Editmask:='cLLL-000000-AAA;1;_';
end;

procedure Tfrmdatosfactura.btncerrarClick(Sender: TObject);
begin
if btncerrar.Caption='&Cancelar' then begin
       if mismo_dom.Checked=true then
          mismo_dom.Checked:=false;
       if btnalta.Caption='&Guardar' then  begin
          btnalta.Caption:='&Editar';
          deshabilitar;
       end else begin
          limpiar; end;
          //deshabilitar;
          btncerrar.Caption:='&Cerrar';

         IF  mismo_dom.Enabled=false THEN
         mismo_dom.Enabled:=TRUE;
end else begin
if mismo_dom.Checked=true then
mismo_dom.Checked:=false;
close;
end;
end;


procedure Tfrmdatosfactura.mismo_domClick(Sender: TObject);
begin
querys('select rsocial,idcliente,idfact,nombre,apaterno,amaterno,dir,numero,ciudad,cp,idcol,rfc,telefono,estado as EstadoCres from clientes where idcliente='+quotedstr(idc)+'',0,sqlgeneral);
if (((trim(sqlgeneral.fieldbyname('rsocial').asstring) = '') and (rgtipo.ItemIndex = 0)) or ((trim(sqlgeneral.fieldbyname('nombre').asstring) = '') and (rgtipo.ItemIndex = 1)))   then
   asignar
else
   begin
     if mismo_dom.Checked=true then
        begin
          mismo_dom.Checked:=false;
          showmessage('NO SE PUEDEN ASIGNAR DATOS YA QUE SON INCOMPATIBLES, DATOS PERSONA/FISICA CON DATOS PERSONA/MORAL');
        end
   end;

if btncerrar.Caption ='&Cerrar' then
   btncerrar.Caption:='&Cancelar';;
end;


procedure Tfrmdatosfactura.btnaltaClick(Sender: TObject);
var
  temp:string;       //cp,   ,col
  i:integer;
begin
  if btnalta.Caption='&Grabar' then
    begin
    if idfac = 0 then
      begin
      querys('select max(idfact) as idfact from ClientesFact',0,sqlgeneral);
      idfac:=sqlgeneral.fieldbyname('idfact').AsInteger + 1;
      end;

    if ((eddir.Text= '')  OR (eddir.Text= '') OR (edtel.Text= '') OR (edcp.Text= '') OR (ednum.Text= '') OR (lbcolonias.Text= '') OR (rgcasa.itemindex= -1)) then
      begin
      showmessage('Algunos Campos estan incompletos');
      exit;
      end;

    //col:=sqlgeneral.fieldbyname('idcol').asstring;

    if ednombre.Visible= true then
      begin
      querys('INSERT into ClientesFact(idfact,nombre,apaterno,amaterno,dir,numero,idcol,ciudad,cp,rfc,telefono,'+
             'casa,idcliente,DirCres,ColCres,CdCres,CpCres,RFCCres,NombreCres) values ('+
             inttostr(idfac)+','+quotedstr(ednombre.Text)+','+quotedstr(edpaterno.Text)+','+quotedstr(edmaterno.Text)+','+
             quotedstr(eddir.Text)+','+quotedstr(ednum.Text)+','+
             aridcol[lbcolonias.itemindex]+
             ','+quotedstr(edcd.text)+','+
             quotedstr(edcp.Text)+
             ','+
             quotedstr(edrfc.Text)+','+quotedstr(edtel.text)+','+inttostr(rgcasa.itemindex)+','+idc+','+
             quotedstr(eddir.Text+' '+ednum.Text)+','+quotedstr(lbcolonias.Text)+','+quotedstr(edcd.Text)+','+quotedstr(edcp.Text)+','+
             quotedstr(edrfc.Text)+','+quotedstr(ednombre.Text+' '+edpaterno.Text+' '+edmaterno.Text)+')',1,sqlgeneral);
      frmprincipal.ucprincipal.Log('Dio de Alta datos de la factura:'+quotedstr(inttostr(idfac)),1);
      querys('update clientes set idfact='+inttostr(idfac)+' where idcliente='+quotedstr(idc)+'',1,sqlgeneral);
      showmessage('Se realizo el registro exitosamente');
      btnalta.Caption:='&Editar';
      btncerrar.Caption:='&Cerrar';
      deshabilitar;
      end;

    if edrazon_social.Visible = true then
      begin
      querys('INSERT into ClientesFact(idfact,rsocial,dir,numero,idcol,ciudad,cp,rfc,telefono,casa,idcliente,'+
             'DirCres,ColCres,CdCres,CpCres,RFCCres,NombreCres) values ('+inttostr(idfac)+','+quotedstr(edrazon_social.Text)+','+
             quotedstr(eddir.Text)+','+quotedstr(ednum.Text)+','+aridcol[lbcolonias.itemindex]+','+quotedstr(edcp.text)+','+quotedstr(edcp.text)+','+
             quotedstr(edrfc.Text)+','+quotedstr(edtel.text)+','+inttostr(rgcasa.itemindex)+','+idc+','+
             quotedstr(eddir.Text+' '+ednum.Text)+','+quotedstr(lbcolonias.Text)+','+quotedstr(edcd.Text)+','+quotedstr(edcp.Text)+','+
             quotedstr(edrfc.Text)+','+quotedstr(edrazon_social.text)+')',1,sqlgeneral);
      frmprincipal.ucprincipal.Log('Dio de Alta datos de la factura:'+inttostr(idfac),1);
      querys('update clientes set idfact='+inttostr(idfac)+' where idcliente='+quotedstr(idc)+'',1,sqlgeneral);
      showmessage('Se realizo el registro exitosamente');
      btnalta.Caption:='&Editar';
      btncerrar.Caption:='&Cerrar';
      deshabilitar;
      end;

    for i:=0 to screen.FormCount - 1 do
      if screen.Forms[i].Name = 'frmclientes' then
        begin
        (screen.Forms[i] as Tfrmclientes).tblclientes.Refresh;
        (screen.Forms[i] as Tfrmclientes).tblclientes.Edit;
        end;
  deducible;
  end //Grabar
else
  begin
  if btnalta.Caption ='&Editar' then
    begin
    edcp.Enabled := true;
    rgtipo.Enabled:=true;
    btnalta.Caption:='&Guardar';
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
    if btnalta.Caption ='&Guardar' then
      begin
      rgtipo.Enabled:=false;
      if ednombre.Visible= true then
        begin
        edrazon_social.Clear;
        bpcambios('ClientesFact',  inttostr(idfac), 'idfact');
        querys('update ClientesFact set nombre='+quotedstr(ednombre.Text)+',apaterno='+quotedstr(edpaterno.Text)+',amaterno='+quotedstr(edmaterno.Text)+','+
               'dir='+quotedstr(eddir.Text)+',rfc='+quotedstr(edrfc.Text)+',numero='+quotedstr(ednum.Text)+','+
               'idcol='+aridcol[lbcolonias.itemindex]+',cp='+quotedstr(edcp.text)+','+
               'ciudad='+quotedstr(edcd.Text)+',telefono='+quotedstr(edtel.Text)+',casa='+inttostr(rgcasa.itemindex)+','+
               'rsocial='+quotedstr(edrazon_social.text)+',DirCres='+quotedstr(eddir.Text+' '+ednum.Text)+','+
               'ColCres='+quotedstr(lbcolonias.Text)+',CdCres='+quotedstr(edcd.Text)+',EstadoCres='+quotedstr(ededo.Text)+','+
               'CPCres='+quotedstr(edcp.text)+',RFCCres='+quotedstr(edrfc.text)+','+
               'NombreCres='+quotedstr(edNombre.Text+' '+edpaterno.Text+' '+edmaterno.Text)+' '+
               'where idfact='+inttostr(idfac)+'',1,sqlgeneral);
        apcambios('idfact', inttostr(idfac), 'ClientesFact', 'frmdatosfactura');

        frmprincipal.ucprincipal.Log('Edito datos de la factura:'+inttostr(idfac),2);
        deshabilitar;
        btnalta.Caption:='&Editar';
        btncerrar.Caption:='&Cerrar';
        mismo_dom.Enabled:=true;
        end;
      end;
    if edrazon_social.Visible = true then
      begin
      ednombre.Clear;  edpaterno.Clear; edmaterno.Clear;
      bpcambios('ClientesFact',  inttostr(idfac), 'idfact');

      if((ededo.Tag = 1)and (ededo.Text = '')) then
          querys('update ClientesFact set rsocial='+quotedstr(edrazon_social.Text)+',dir='+quotedstr(eddir.Text)+','+
                 'rfc='+quotedstr(edrfc.Text)+',numero='+quotedstr(ednum.Text)+','+
                 'idcol='+aridcol[lbcolonias.itemindex]+',cp='+quotedstr(edcp.text)+','+
                 'ciudad='+quotedstr(edcd.Text)+',telefono='+quotedstr(edtel.Text)+',casa='+inttostr(rgcasa.itemindex)+',nombre='+quotedstr(ednombre.Text)+',apaterno='+quotedstr(edpaterno.Text)+',amaterno='+quotedstr(edmaterno.Text)+
                 ',DirCres='+quotedstr(eddir.Text+' '+ednum.Text)+',ColCres='+quotedstr(lbcolonias.Text)+',CdCres='+quotedstr(edcd.Text)+',CPCres='+quotedstr(edcp.text)+',RFCCres='+quotedstr(edrfc.text)+',NombreCres='+quotedstr(edrazon_social.Text)+',EstadoCres = '''' where idfact='+inttostr(idfac),1,sqlgeneral)
      else
          querys('update ClientesFact set rsocial='+quotedstr(edrazon_social.Text)+',dir='+quotedstr(eddir.Text)+','+
                 'rfc='+quotedstr(edrfc.Text)+',numero='+quotedstr(ednum.Text)+','+
                 'idcol='+aridcol[lbcolonias.itemindex]+',cp='+quotedstr(edcp.text)+','+
                 'ciudad='+quotedstr(edcd.Text)+',telefono='+quotedstr(edtel.Text)+',casa='+inttostr(rgcasa.itemindex)+',nombre='+quotedstr(ednombre.Text)+',apaterno='+quotedstr(edpaterno.Text)+',amaterno='+quotedstr(edmaterno.Text)+
                 ',DirCres='+quotedstr(eddir.Text+' '+ednum.Text)+',ColCres='+quotedstr(lbcolonias.Text)+',CdCres='+quotedstr(edcd.Text)+',CPCres='+quotedstr(edcp.text)+',RFCCres='+quotedstr(edrfc.text)+',NombreCres='+quotedstr(edrazon_social.Text)+' where idfact='+inttostr(idfac),1,sqlgeneral);

      apcambios('idfact', inttostr(idfac), 'ClientesFact', 'frmdatosfactura');

      frmprincipal.ucprincipal.Log('Edito datos de la factura:'+inttostr(idfac),2);

      for i:=0 to screen.FormCount - 1 do
        if screen.Forms[i].Name = 'frmclientes' then
          begin
            (screen.Forms[i] as Tfrmclientes).tblclientes.Refresh;
            (screen.Forms[i] as Tfrmclientes).tblclientes.Edit;
          end;

      deshabilitar;
      btnalta.Caption:='&Editar';
      btncerrar.Caption:='&Cerrar';
      mismo_dom.Enabled:=true;
      end;
    deducible;
    end; //if guardar
    querys('select * from ClientesFact where idfact='+inttostr(idfac),0,sqlgeneral);
    rgcasa.ItemIndex:= sqlgeneral.fieldbyname('casa').AsInteger;
    edd.Text:=sqlgeneral.fieldbyname('DirCres').Asstring;
    edNombreCres.Text :=sqlgeneral.fieldbyname('NombreCres').Asstring;
    edc.Text:=sqlgeneral.fieldbyname('ColCres').Asstring;
    edcpostal.Text:=sqlgeneral.fieldbyname('CPCres').Asstring;
    edrfcc.TEXT:=sqlgeneral.fieldbyname('RFCCres').Asstring;
    end;
end;

procedure Tfrmdatosfactura.edtelKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);

end;
end;

procedure Tfrmdatosfactura.lbcoloniasExit(Sender: TObject);
begin
querys('select * from colonias where nombre='+quotedstr(lbcolonias.Text),1,sqlgeneral);
edcp.text:=sqlgeneral.fieldbyname('cp').AsString;
end;

procedure Tfrmdatosfactura.edcdEnter(Sender: TObject);
begin

querys('Select valor from configuraciones where concepto = "ciudad"', 0, sqlgeneral);
edcd.Text:=sqlgeneral.fieldbyname('valor').AsString;
end;

procedure Tfrmdatosfactura.ednumKeyPress(Sender: TObject; var Key: Char);
begin
 if ( StrScan('0123456789.-',Key) <> nil ) or
     ( Key = Char(VK_BACK) ) then { BackSpace Key }
  begin

  end else //begin

  if key=#13 then begin
    lbcolonias.SetFocus;
   end;

  end;

procedure Tfrmdatosfactura.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmdatosfactura.rgtipoClick(Sender: TObject);
begin

if RGTIPO.ItemIndex=0 then begin
     fisica;
end else begin
  if RGTIPO.ItemIndex=1 then begin
     moral;
  end;
 end;

end;

procedure Tfrmdatosfactura.lbcoloniasMatch(Sender: TObject);
begin
//showmessage(inttostr(lbcolonias.itemindex)+' '+quotedstr(lbcolonias.Value));
//trae el nombre del movil y el CP dependiendo del nombre de la colonia
querys('SELECT c.cp, m.nombre as municipio, e.nombre as estado FROM colonias c left join municipios m on m.idmnp=c.idmnp left join estados e on '+
       'e.idestado =m.idestado WHERE c.idcol = '+quotedstr(aridcol[lbcolonias.itemindex]),0,sqlgeneral);
//edsector.Text:=sqlgeneral.fieldbyname('nombre').AsString;
edcp.Text:=sqlgeneral.fieldbyname('cp').AsString;
edcd.Text:=sqlgeneral.fieldbyname('municipio').AsString;
ededo.Text:=sqlgeneral.fieldbyname('estado').AsString;
end;

procedure Tfrmdatosfactura.deducible;
begin
 {DEDUCCION IVA}

  if querys('Select c.idcliente, cf.rfc from clientes as c left join ClientesFact as cf on c.idfact=cf.idfact where cf.idfact = '+inttostr(idfac), 0, sqlgeneral) > 0 then
    begin
    bpcambios('clientes', sqlgeneral.fieldbyname('idcliente').AsString, 'idcliente');
    if (sqlgeneral.fieldbyname('rfc').AsString = '') or (sqlgeneral.fieldbyname('rfc').AsString = NULL) then
      querys('Update clientes set deducible = 0 where idfact ='+inttostr(idfac), 1, dmreportes.sqlgeneral7)
    else
      querys('Update clientes set deducible = 1 where idfact ='+inttostr(idfac), 1, dmreportes.sqlgeneral7);
    apcambios('idcliente', sqlgeneral.fieldbyname('idcliente').AsString, 'clientes', 'frmdatosfactura');
    end;
//      RzDBCheckBox1.Checked := true;
  {FIN DEDUCCION IVA}
end;

procedure Tfrmdatosfactura.edrfcExit(Sender: TObject);
begin
 ValidarRFC(edrfc.text);
end;

end.
