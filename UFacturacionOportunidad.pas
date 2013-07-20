unit UFacturacionOportunidad;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzCmboBx, Mask, RzEdit, RzPanel, RzRadGrp,
  RzLabel, RzRadChk, ExtCtrls, DB, MemDS, DBAccess, MyAccess;

type
  TfrmFacturacionOportunidad = class(TForm)
    pnlAlta: TRzPanel;
    mismo_dom: TRzCheckBox;
    lbrazon: TRzLabel;
    lbpaterno: TRzLabel;
    lbmaterno: TRzLabel;
    rgtipo: TRzRadioGroup;
    edmaterno: TRzEdit;
    edpaterno: TRzEdit;
    edrazon_social: TRzEdit;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    edrfc: TRzEdit;
    eddir: TRzEdit;
    RzLabel1: TRzLabel;
    RzLabel8: TRzLabel;
    ednum: TRzEdit;
    lbcolonias: TRzComboBox;
    edcp: TRzEdit;
    RzLabel5: TRzLabel;
    RzLabel4: TRzLabel;
    edcd: TRzEdit;
    ededo: TRzEdit;
    RzLabel15: TRzLabel;
    RzLabel7: TRzLabel;
    edtel: TRzEdit;
    rgcasa: TRzRadioGroup;
    btnalta: TRzBitBtn;
    btncerrar: TRzBitBtn;
    lbnombre: TRzLabel;
    ednombre: TRzEdit;
    SQLcolonias: TMyQuery;
    SQLcoloniasnombre: TStringField;
    SQLcoloniasidcol: TIntegerField;
    SQLcoloniascp: TIntegerField;
    SQLcoloniasidsector: TSmallintField;
    procedure btnaltaClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mismo_domClick(Sender: TObject);
    procedure edtelKeyPress(Sender: TObject; var Key: Char);
    procedure lbcoloniasExit(Sender: TObject);
    procedure edcdEnter(Sender: TObject);
    procedure ednumKeyPress(Sender: TObject; var Key: Char);
    procedure rgtipoClick(Sender: TObject);
    procedure lbcoloniasMatch(Sender: TObject);
    procedure asignar;
    procedure deshabilitar;
    procedure habilitar;
    procedure limpiar;
    procedure tipo;
    procedure fisica;
    procedure moral;

  private
    { Private declarations }
  public
    { Public declarations }
    idc:string;
    idfac:integer;
    sqlgeneral : tmyquery;
    constructor inicializa(const id:string;idf:integer);
  end;

var
  frmFacturacionOportunidad: TfrmFacturacionOportunidad;

implementation

uses Udmrep, Urecursos, Udm, Uprincipal;

{$R *.dfm}


constructor TfrmFacturacionOportunidad.inicializa(const id:string;idf:integer);
var temp:string;
begin
sqlgeneral := tmyquery.Create(nil);
sqlgeneral.Connection := dmaccesos.conexion;

idc:=id;
idfac:=idf;
limpiar;
mismo_dom.Checked:=false;



if idf = 0 then  begin  // si no tiene asignado un valor en el id de ClientesFact
      habilitar;
      mismo_dom.Enabled:=true;
      btnalta.Caption:='&Grabar';
      btncerrar.Caption:='&Cancelar';
      btnalta.Hint:='Grabar los datos de la facturación de la oportunidad ';
      CargaCombo('SELECT colonias.nombre FROM colonias INNER JOIN col_sector ON (colonias.idcol = col_sector.idcol) where col_sector.idsector <> 0','Colonias',lbcolonias);

end else begin        // pero si tiene un id asignadado busca en ClientesFact.
      temp:= inttostr(idf);
      limpiar;
      querys('select * from OportunidadesFact where idfact='+quotedstr(temp)+'',0,sqlgeneral);
      rgcasa.ItemIndex:= sqlgeneral.fieldbyname('casa').AsInteger;

      asignar;
      deshabilitar;
      mismo_dom.Enabled:=false;
      btnalta.Caption:='&Editar';
      btncerrar.Caption:='&Cerrar';
      btnalta.Hint:='Editar la facturación de la oportunidad';
end;

end;


procedure TfrmFacturacionOportunidad.fisica;
begin
ednombre.Visible:=true; edpaterno.Visible:=true; edmaterno.Visible:=true;
lbnombre.Visible:=true; lbpaterno.Visible:=true; lbmaterno.Visible:=true;
edrazon_social.Visible:=false; lbrazon.Visible:=false;
end;

procedure TfrmFacturacionOportunidad.moral;
begin
ednombre.Visible:=false; edpaterno.Visible:=false; edmaterno.Visible:=false;
lbnombre.Visible:=false; lbpaterno.Visible:=false; lbmaterno.Visible:=false;
edrazon_social.Visible:=true; lbrazon.Visible:=true;
end;


procedure TfrmFacturacionOportunidad.limpiar;
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
end;

procedure TfrmFacturacionOportunidad.deshabilitar;
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

procedure TfrmFacturacionOportunidad.habilitar;
begin
   ednombre.Enabled:=true;
   edpaterno.Enabled:=true;
   edmaterno.Enabled:=true;

    edrazon_social.enabled:=true;
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

procedure TfrmFacturacionOportunidad.asignar;
begin

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


eddir.Text:=sqlgeneral.fieldbyname('dir').asstring;
edcd.Text:=sqlgeneral.fieldbyname('ciudad').asstring;


edcp.Text:=sqlgeneral.fieldbyname('cp').asstring;
ednum.Text:=sqlgeneral.fieldbyname('numero').asstring;

try
edrfc.Text:=sqlgeneral.fieldbyname('rfc').asstring;
edtel.Text:=sqlgeneral.fieldbyname('telefono').asstring;
ededo.Text:=sqlgeneral.fieldbyname('estado').asstring;
except

end;

querys('select idcol,nombre from colonias where idcol='+quotedstr(sqlgeneral.fieldbyname('idcol').asstring)+'',0,sqlgeneral);
lbcolonias.Text:=sqlgeneral.fieldbyname('nombre').asstring;
mismo_dom.Enabled:=false;
end;

procedure TfrmFacturacionOportunidad.tipo;
begin
sleep(1000);//si es fisica
end;

procedure TfrmFacturacionOportunidad.btncerrarClick(Sender: TObject);
begin
if btncerrar.Caption='&Cancelar' then begin
       if mismo_dom.Checked=true then
          mismo_dom.Checked:=false;
       if btnalta.Caption='&Guardar' then  begin
          btnalta.Caption:='&Editar';
          deshabilitar;
       end else begin
          limpiar; end;

          btncerrar.Caption:='&Cerrar';

         IF  mismo_dom.Enabled=false THEN
         mismo_dom.Enabled:=TRUE;
end else begin
if mismo_dom.Checked=true then
mismo_dom.Checked:=false;
close;
end;
end;



procedure TfrmFacturacionOportunidad.mismo_domClick(Sender: TObject);
begin
querys('select rsocial,idfact,nombre,apaterno,amaterno,dir,numero,ciudad,cp,idcol,estado from oportunidades where idoportunidad='+quotedstr(idc)+'',0,sqlgeneral);
if (((sqlgeneral.fieldbyname('rsocial').asstring = '') and (rgtipo.ItemIndex = 0)) or ((sqlgeneral.fieldbyname('nombre').asstring = '') and (rgtipo.ItemIndex = 1)))   then
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


procedure TfrmFacturacionOportunidad.btnaltaClick(Sender: TObject);
var
  temp,cp,col:string;
//  i:integer;
begin
if btnalta.Caption='&Grabar' then
  begin
  if idfac = 0 then
    begin
    querys('select max(idfact) as idfact from OportunidadesFact',0,sqlgeneral);
    idfac:=sqlgeneral.fieldbyname('idfact').AsInteger + 1;
    end;
  if ((eddir.Text= '')  OR (eddir.Text= '') OR (edtel.Text= '') OR (edcp.Text= '') OR (ednum.Text= '') OR (lbcolonias.Text= '') OR (rgcasa.itemindex= -1)) then
    showmessage('Algunos Campos estan incompletos');

    querys('select * from colonias where nombre='+quotedstr(lbcolonias.Text),1,sqlgeneral);
    cp:=sqlgeneral.fieldbyname('cp').AsString;
    col:=sqlgeneral.fieldbyname('idcol').asstring;

        if ednombre.Visible= true then
           edrazon_social.Clear
        else begin
           edpaterno.Clear;
           edmaterno.Clear;
           ednombre.Clear;
        end;

      querys('INSERT into OportunidadesFact(idfact,rsocial,nombre,apaterno,amaterno,dir,numero,idcol,ciudad,cp,rfc,telefono,casa,estado) values ('+inttostr(idfac)+','+quotedstr(edrazon_social.Text)+','+quotedstr(ednombre.Text)+','+quotedstr(edpaterno.Text)+','+quotedstr(edmaterno.Text)+','+quotedstr(eddir.Text)+','+quotedstr(ednum.Text)+','+quotedstr(col)+','+quotedstr(edcd.text)+','+quotedstr(cp)+','+quotedstr(edrfc.Text)+','+quotedstr(edtel.text)+','+inttostr(rgcasa.itemindex)+','+quotedstr(ededo.text)+')',1,sqlgeneral);

      frmprincipal.ucprincipal.Log('Dio de Alta datos de la factura de oportunidad:'+quotedstr(inttostr(idfac)),1);
      querys('update oportunidades set idfact='+inttostr(idfac)+' where idoportunidad='+quotedstr(idc)+'',1,sqlgeneral);
      showmessage('Se realizo el registro exitosamente');
      btnalta.Caption:='&Editar';
      btncerrar.Caption:='&Cerrar';
      deshabilitar;      // end;
      close;



   end else
     begin


    if btnalta.Caption ='&Guardar' then
      begin
      rgtipo.Enabled:=false;

        querys('select * from colonias where nombre='+quotedstr(lbcolonias.Text),1,sqlgeneral);
        cp:=sqlgeneral.fieldbyname('cp').AsString;
        if sqlgeneral.fieldbyname('idcol').asstring <> '' then
          col:=sqlgeneral.fieldbyname('idcol').asstring
        else
          col:='0';


        if ednombre.Visible= true then
           edrazon_social.Clear
        else begin
           edpaterno.Clear;
           edmaterno.Clear;
           ednombre.Clear;
        end;
        bpcambios('OportunidadesFact',  inttostr(idfac), 'idfact');
        querys('update OportunidadesFact set nombre='+quotedstr(ednombre.Text)+',apaterno='+quotedstr(edpaterno.Text)+',amaterno='+quotedstr(edmaterno.Text)+',dir='+quotedstr(eddir.Text)+',rfc='+quotedstr(edrfc.Text)+',numero='+quotedstr(ednum.Text)+',idcol='+quotedstr(col)+',cp='+quotedstr(cp)+',ciudad='+quotedstr(edcd.Text)+',telefono='+quotedstr(edtel.Text)+',casa='+inttostr(rgcasa.itemindex)+',rsocial='+quotedstr(edrazon_social.text)+
               ',estado='+quotedstr(ededo.Text)+' where idfact='+inttostr(idfac)+'',1,sqlgeneral);
        apcambios('idfact', inttostr(idfac), 'OportunidadesFact', 'frmFacturacionOportunidad');

        frmprincipal.ucprincipal.Log('Edito datos oportunidad de la factura :'+inttostr(idfac),2);
        deshabilitar;
        btnalta.Caption:='&Editar';
        btncerrar.Caption:='&Cerrar';
        mismo_dom.Enabled:=true;

      end else
        begin


    if btnalta.Caption ='&Editar' then
    begin
    rgtipo.Enabled:=true;
    btnalta.Caption:='&Guardar';
    btnalta.hint:='Guardar los cambios';
    btncerrar.Caption:='&Cancelar';
    btncerrar.hint:='Cancelar los cambios';
    temp:=lbcolonias.Text;
          CargaCombo('SELECT colonias.nombre FROM colonias INNER JOIN col_sector ON (colonias.idcol = col_sector.idcol) where col_sector.idsector <> 0','Colonias',lbcolonias);
    lbcolonias.Text:=temp;
    habilitar;
    mismo_dom.Enabled:=true;
    if ednombre.Visible = true then
      ednombre.SetFocus
    else
      edrazon_social.SetFocus;

    end;
        end;

   end;
  //  querys('select * from ClientesFact where idfact='+inttostr(idfac),0,sqlgeneral);

end;

procedure TfrmFacturacionOportunidad.edtelKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
begin
  key:=#0;
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);

end;
end;

procedure TfrmFacturacionOportunidad.lbcoloniasExit(Sender: TObject);
begin
querys('select * from colonias where nombre='+quotedstr(lbcolonias.Text),1,sqlgeneral);
edcp.text:=sqlgeneral.fieldbyname('cp').AsString;
end;

procedure TfrmFacturacionOportunidad.edcdEnter(Sender: TObject);
begin
querys('Select valor from configuraciones where concepto = "ciudad"', 0, sqlgeneral);
edcd.Text:=sqlgeneral.fieldbyname('valor').AsString;
end;

procedure TfrmFacturacionOportunidad.ednumKeyPress(Sender: TObject; var Key: Char);
begin
 if ( StrScan('0123456789.-',Key) <> nil ) or
     ( Key = Char(VK_BACK) ) then { BackSpace Key }
  begin

  end else //begin

  if key=#13 then begin
    lbcolonias.SetFocus;
   end;

  end;

procedure TfrmFacturacionOportunidad.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmFacturacionOportunidad.rgtipoClick(Sender: TObject);
begin

if RGTIPO.ItemIndex=0 then
     fisica
else
  if RGTIPO.ItemIndex=1 then
     moral;


end;

procedure TfrmFacturacionOportunidad.lbcoloniasMatch(Sender: TObject);
begin
//trae el nombre del movil y el CP dependiendo del nombre de la colonia
querys('SELECT colonias.cp FROM colonias INNER JOIN col_sector ON (colonias.idcol = col_sector.idcol) INNER JOIN sectores ON (col_sector.idsector = sectores.idsector) WHERE colonias.nombre = '+quotedstr(lbcolonias.Text),0,sqlgeneral);
//edsector.Text:=sqlgeneral.fieldbyname('nombre').AsString;
edcp.Text:=sqlgeneral.fieldbyname('cp').AsString;
end;


end.
