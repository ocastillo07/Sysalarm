{///////////////////////////////////////////////////////////////////////////////
2010/05/12 dalyla al final de imprimir() querys('Drop table if exists tmppresup3'+frmprincipal.idmaq, 1, sqlgeneral);
2009-03-30 Oscar Modificacion Ventas

2009/02/26 Oscar Configuracion para acrilicos en enlaces y conexiones
2009/01/28 Oscar enlaces y conexiones default acrilicos
2008/07/25 Oscar correccion en los descuentos
2008/07/23 Oscar Agregre nueva etiqueta en los totales "Financiamiento"
2008/06/26 correccion del presupueso economico se borraba
2008/05/26 oscar agrege capacitacion en cambio de control
2007/12/05 Modificado por Oscar agrege descuentos en calcula totales y en el onchangecant
2007/11/10 Dalila nvorenglon y combo paketes
// Modificado por: Oscar Castillo
// Fecha: 09/Nov/07 validacion en procedure tresbotones

Modificado 10/Sep/07
Dalila Robledo
}///////////////////////////////////////////////////////////////////////////////

unit fpresupuesto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, RzButton, Mask, RzEdit, ExtCtrls, RzPanel,
  RzCmboBx, RzRadGrp, Grids, RzBtnEdt, DB, MemDS, DBAccess, MyAccess;

type
  TFrame1 = class(TFrame)
    btnecon: TRzBitBtn;
    btnbas: TRzBitBtn;
    btn100: TRzBitBtn;
    btnimp3: TRzBitBtn;
    RzLabel16: TRzLabel;
    lbconcepto: TRzLabel;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label14: TLabel;
    btnsave: TRzBitBtn;
    btnlimpiar: TRzBitBtn;
    btnSvDefault: TRzBitBtn;
    Ptotales: TRzPanel;
    Label12: TLabel;
    Label11: TLabel;
    Label10: TLabel;
    Label9: TLabel;
    Label8: TLabel;
    Label13: TLabel;
    Label7: TLabel;
    lbtipo: TRzLabel;
    RzLabel5: TRzLabel;
    edTotal: TRzEdit;
    edIva: TRzEdit;
    edsub2: TRzEdit;
    edTotMo: TRzEdit;
    edTotEq: TRzEdit;
    edTotHrs: TRzEdit;
    sqlgeneral: TMyQuery;
    pnlpresup: TRzPanel;
    sqltemp: TMyQuery;
    btnrenglon: TRzBitBtn;
    ppaquete: TRzPanel;
    RzLabel1: TRzLabel;
    cbpaquetes: TRzComboBox;
    Label15: TLabel;
    eddesctos: TRzEdit;
    edsuma: TRzEdit;
    Label17: TLabel;
    RzLabel2: TRzLabel;
    edintereses: TRzEdit;
    edsub1: TRzEdit;
    RzLabel3: TRzLabel;
    eddescpp: TRzEdit;
    RzLabel4: TRzLabel;
    btnenviar: TRzBitBtn;
    procedure btneconClick(Sender: TObject);
    procedure btnbasClick(Sender: TObject);
    procedure btn100Click(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);
    procedure btnlimpiarClick(Sender: TObject);
    procedure btnSvDefaultClick(Sender: TObject);
    procedure btnrenglonClick(Sender: TObject);
    procedure cbpaquetesKeyPress(Sender: TObject; var Key: Char);
    procedure cbpaquetesNotInList(Sender: TObject);
    procedure btnimp3Click(Sender: TObject);
    procedure btnenviarClick(Sender: TObject);
  private
     totzonas:integer;
     procedure CargaPresup(Tipo:string);
     procedure CalculaTotales;
     procedure CreaComponentes;
     procedure Revisa(Nuevo:integer);
     procedure buscatotzonas;
     procedure TraePT;
     procedure focuscolor(color:Tcolor; pos:integer);
     procedure CreaRenglon(i:integer;idconcepto, nombre:string);
     procedure creapagos;
    { Private declarations }
  public
     tiposis, PreTipo,maxi:integer;
     nvorenglon, edicion :boolean;
     TCP, oportunidad, tipooportunidad, nopres,moneda,giro:string;
     combo: array of trzcombobox;
     edart: array of trzbuttonedit;
     etiqueta,encabezados: array of trzlabel;
     edtiempo,edcant, edcantp,edmo,edeq,edcosto: array of trzedit;
     sg:array of tstringGrid;
//     procedure sontres;
     procedure llenar;
     procedure habilita;
     procedure tresbotones;
     procedure GuardaDetalle;
     procedure LimpiaTotales;
     procedure EliminaComponentes;
     procedure CargaCbo(sql,tabla:string;combo : TRzComboBox;edt:trzedit);
     procedure KeyPressCant(Sender: TObject;var Key: Char);
     procedure KeyPressCbo(Sender: TObject;var Key: Char);
     procedure KeyPressart(Sender: TObject;var Key: Char);
     procedure KeyPressDesc(Sender: TObject;var Key: Char);
     procedure KeyPressCapturable(Sender: TObject; var Key: Char);
     procedure OnButtonClick(Sender: TObject);
     procedure CreaEdit(var ed: array of trzedit;l,t,w,num:integer;nom:string);
     procedure CreaButtonEdit(var ed: array of trzbuttonedit;l,t,w,num:integer;nom:string);
     procedure CreaCombo(var cbo: array of trzComboBox;l,t,w,num:integer;nom:string);
     procedure lbls(var lbl: array of trzlabel;l,t,w,num:integer;nom,cap:string);
     procedure OnChangeCant(Sender: Tobject);
     procedure OnNoEnLista(Sender: Tobject);
     procedure OnEnterCombo(Sender: Tobject);
     procedure OnExitCombo(Sender: Tobject);
     procedure OnSelectCombo(Sender: Tobject);

     function imprimir(tipoimp:string):string;

    { Public declarations }
  end;

implementation

uses Uprincipal, Urecursos, UPresupuesto2, Udm, Ubusquedas, Udmrep,
  UBuscaArt, UEnviarCorreo, StrUtils;

{$R *.dfm}

procedure TFrame1.LimpiaTotales;
begin
edTotHrs.clear;
edTotEq.Clear;
edTotMo.Clear;
edsuma.Clear;
eddesctos.clear;
eddescpp.Clear;
edintereses.Clear;
edsub1.Clear;
edsub2.Clear;
edIva.Clear;
edTotal.Clear;
totzonas:=0;
end;

procedure TFrame1.OnEnterCombo(Sender: Tobject);
var pos : integer;
begin
if sender is trzcombobox then
  begin
  pos := (sender as trzcombobox).Tag;
  onSelectCombo(sender);
  end
else
begin
 pos := (sender as trzedit).Tag;

end;

focuscolor(clskyblue, pos);
end;

procedure TFrame1.OnExitCombo(Sender: Tobject);
var pos : integer;
    cadena : string;
    key:char;
begin
  if sender is trzcombobox then
   begin
   pos := (sender as trzcombobox).Tag;
   lbconcepto.Visible := false;
   if combo[pos].Text = '' then
     begin
     edtiempo[pos].clear;
     // edcant[pos].Enabled := false;
     edcosto[pos].Clear;
     edcant[pos].Clear;
     edcantp[pos].Clear;
     edmo[pos].Clear;
     edeq[pos].Clear;
     end
   else
     begin
     key:= #13;
     KeyPressCbo((sender as trzcombobox),key);
     //CalculaTotales;
     end;
  end
 else //si no es combo
  begin
    pos := (sender as trzedit).Tag;
    if (sender as trzedit).Text = '' then
    begin
     combo[(sender as trzedit).Tag].Text := '';
     edtiempo[(sender as trzedit).Tag].Text := '';
     //  edcant[(sender as trzedit).Tag].Enabled := false;
     edcosto[(sender as trzedit).Tag].Clear;
    end
    else
      if edcant[(sender as trzedit).Tag].Text[length(edcant[(sender as trzedit).Tag].text)] = '.' then
      begin
        cadena := edcant[(sender as trzedit).Tag].Text;
        delete(cadena,length(cadena),1);
        edcant[(sender as trzedit).Tag].Text := cadena;
        CalculaTotales;
      end;
  end;
focuscolor(clwhite, pos);
end;

procedure TFrame1.GuardaDetalle;
  var i, d: integer;
begin
   //elimina los articulos que hubiera en el presupuesto que se esta haciendo
   querys('delete from DetPresupuestos2 where idopcion='+inttostr(PreTipo)+' and idpresupuesto='+nopres,1,sqlgeneral);
   //for 10 to maxi do
   for i:=0 to maxi do
   begin
      if Length(combo) <> 0 then
         if (combo[i].Text <> '') and (edcant[i].Text <> '') then
         begin
            //trae el idconcepto de la tabla CfgPresup
            querys('select iddpto from dptos where nombre='+quotedstr(etiqueta[i].Caption),0,sqlgeneral);
            if etiqueta[i].Caption = 'SIN DEPARTAMENTO' then
               d:= 0
            else
               d:= sqlgeneral.fieldbyname('iddpto').AsInteger;
            querys('insert into DetPresupuestos2(idpresupuesto,cant,cod_cve,idopcion,costo,idconcepto,tiempo, usuario, fecha, hora, CostoHrs) '+
            'values ('+nopres+','+edcant[i].Text+','+quotedstr(combo[i].Text)+','+
            inttostr(PreTipo)+','+edcosto[i].Text+','+inttostr(d)+','+
            format('%8.2f',[strtofloat(edtiempo[i].text)])+',"'+frmprincipal.ucprincipal.CurrentUser.loginname+'","'+datetostr(date)+'","'+
            timetostr(Time)+'", "'+edmo[i].text+'")',1,sqlgeneral);
         end;
   end;
   if PreTipo = 1 then
      if btn100.Enabled = false then
         btn100.Enabled := true;
   //sontres;
end;

procedure TFrame1.CargaPresup(Tipo:string);
var ban:boolean;
begin
   LimpiaTotales;
   ban:=false;
   if maxi > 0 then
      EliminaComponentes;
   CreaComponentes;

   //insertar capacitacion
   if (tipooportunidad='AMPLIACION') OR (tipooportunidad='CAMBIO DE CONTROL') OR (tipooportunidad='REINSTALACION')  then
   begin
      querys('select cod_cve from DetPresupuestos2 where idpresupuesto='+nopres,0,sqltemp);
      sqltemp.First;
      while not sqltemp.Eof do
      begin
         if sqltemp.FieldByName('cod_cve').AsString='CAPACITACION' then
            ban:=true;
         sqltemp.Next;
      end;
      if ban=false then
         querys('insert into DetPresupuestos2 (idpresupuesto,cant,cod_cve,idopcion,idconcepto,tiempo,CostoHrs) '+
         ' VALUES ('+nopres+',1,"CAPACITACION",'+tipo+',26,0.5,0)',1,sqltemp);
   end;

   //insertar acrilico
   if querys('select idtipo_oportunidad from agenda_vendedores av left join presupuestos2 p using (idoportunidad) '+
             ' where idpresupuesto='+nopres+' and av.idtipo_oportunidad in ('+getconfiguraciones('acrilicos',true)+')',0,sqltemp)>0 then
   begin
      querys('select cod_cve from DetPresupuestos2 where idpresupuesto='+nopres,0,sqltemp);
      sqltemp.First;
      while not sqltemp.Eof do
      begin
         if sqltemp.FieldByName('cod_cve').AsString='ACRILICOS' then
            ban:=true;
         sqltemp.Next;
      end;
      if ban=false then
      begin
         if querys('select precioa as p,tinstalacion as t from articulos where cod_cve="ACRILICOS"',0,sqltemp)>0 then
          querys('insert into DetPresupuestos2 (idpresupuesto,cant,cod_cve,idopcion,idconcepto,tiempo,CostoHrs) '+
                   ' VALUES ('+nopres+',1,"ACRILICOS",'+tipo+',26,'+sqltemp.fieldbyname('t').asstring+','+
                   sqltemp.fieldbyname('p').asstring+')',1,sqltemp);
      end;
   end;

   if querys('select * from DetPresupuestos2 where idopcion='+Tipo+' and idpresupuesto='+
       nopres+' order by idconcepto',0,sqltemp) > 0 then
   begin
      llenar;
   end
   else
   begin
      if edicion = true then
      begin
         if querys('select * from DetPresupuestos2 where idopcion='+inttostr(strtoint(Tipo)-1)+' and idpresupuesto='+
           nopres,0,sqltemp) > 0 then
         begin
            if application.messagebox('Desea pasar los datos del presupuesto anterior a este?', 'Atencion', MB_ICONINFORMATION+MB_YESNO)=idyes then
               llenar;
            if Tipo = '1' then
               btn100.enabled := true;
         end// si
         else
         begin
            querys('select * from PresupuestoDefault',0,sqltemp);
            llenar;
         end;
      end;
   end;//edicion
end;

procedure TFrame1.EliminaComponentes;
var i:integer;
begin
   //btnlimpiar.onclick(self);
   if maxi > 0 then
      for i:=0 to (maxi) do
      begin
         edeq[i].Free;
         edcosto[i].Free;
         edmo[i].Free;
         edcantp[i].Free;
         edtiempo[i].Free;
         etiqueta[i].Free;
         combo[i].Free;
         edcant[i].Free;
      end;
   maxi := -1;
end;

procedure TFrame1.CreaComponentes;
var i, len:integer;
begin
nvorenglon := false;
querys('select * from dptos where estatus = 1 order by nivel',0,sqlgeneral);
maxi := sqlgeneral.RecordCount-1;
len := 40;//30;
if sqlgeneral.RecordCount > 0 then
 begin

  SetLength(combo,len);
  SetLength(etiqueta,len);
  SetLength(edtiempo,len);
  SetLength(edcant,len);
  SetLength(edcantp,len);
  SetLength(edmo,len);
  SetLength(edeq,len);
  SetLength(edcosto,len);

  //for i:=0 to sqlgeneral.RecordCount-1 do
  for i:=0 to maxi do
    begin
    crearenglon(i, sqlgeneral.fieldbyname('iddpto').AsString, sqlgeneral.fieldbyname('nombre').AsString);
    sqlgeneral.Next;
    end;
  end;
end;

procedure TFrame1.Revisa(nuevo:integer);
var i, j:integer;
cadena:string;
begin
j:=0;
if  (pnlpresup.enabled = true) then
begin
  for i:=0 to maxi do
  begin
    if edcant[i].text <> '' then
       j:= j+1;
  end;
  if j <> 0 then
  begin
    querys('Select * from DetPresupuestos2 where idpresupuesto='+nopres+
           ' and idopcion = '+inttostr(PreTipo), 0, sqlgeneral);
    if sqlgeneral.RecordCount = 0 then
    begin
      if PreTipo <> nuevo then
        cadena :=  'Deseas Guardar los Cambios del Presupuesto Anterior, si no se perderan los cambios.'
      else
        cadena :=  'Deseas Guardar los Cambios del Presupuesto Actual, si no se perderan los cambios.';

      if (application.messagebox(pchar(cadena), 'Atencion', MB_ICONWARNING+MB_YESNO)) = idyes then
      begin
        GuardaDetalle
      end
      else
      begin
        if (edicion = true) and (Pretipo <> nuevo) then
        begin
          application.messagebox('No ha capturado la opcion Actual', 'Atencion', mb_iconstop);
          exit;
        end;
      end;
    end;
  end
  else
  begin
    if (edicion = true) and (Pretipo <> nuevo) then
    begin
      application.messagebox('No ha capturado la opcion Actual', 'Atencion', mb_iconstop);
      exit;
    end;
  end;
end;

PreTipo := nuevo;
end;

procedure TFrame1.OnSelectCombo(Sender: Tobject);
var pos : integer;
begin
if sender is trzcombobox then
  begin
  pos := (sender as trzcombobox).Tag;
  querys('Select nombre, precioa from articulos where cod_cve="'+combo[pos].text+'"', 0, sqlgeneral);
  if combo[pos].text <> '' then
    lbconcepto.caption := sqlgeneral.fieldbyname('nombre').asstring+'  $ '+sqlgeneral.fieldbyname('precioa').asstring
  else
    lbconcepto.caption := '';

  lbconcepto.Visible := true;
  end;
end;

procedure TFrame1.buscatotzonas;
begin
querys('Select sum(d.cant) as zonas From DetPresupuestos2 AS d left Join articulos AS a ON(a.cod_cve '+
       '= d.cod_cve) Where d.idpresupuesto = '+nopres+' AND d.idopcion = '+inttostr(PreTipo)+
       ' and eszona=1', 0, sqlgeneral);
if sqlgeneral.FieldByName('zonas').asinteger >= 8 then
  begin
  //Busca de cuantas zonas es el control
  querys('select eszona from DetPresupuestos2 as d left join dptos as c on (c.iddpto=d.idconcepto) '+
         'left join articulos as a on(a.cod_cve=d.cod_cve) where idpresupuesto = '+nopres+
         ' and idopcion = '+inttostr(PreTipo)+' and (d.idconcepto in (1, 4) or (a.nombre = "Control de 8 zn '+
         'c/ teclado Alfanumerico" or a.nombre = "Expansor de 8 Zonas" )) and a.nombre like "% 8 z%"', 0, sqlgeneral);
 if sqlgeneral.recordcount < 2 then
  application.messagebox('Se ha aumentado el numero de zonas, favor de cambiar el control', 'Atencion', MB_ICONEXCLAMATION);
 end;
end;

procedure TFrame1.KeyPressCbo(Sender: TObject;var Key: Char);
begin
   if key = #13 then
   begin
      if combo[(sender as trzcombobox).tag].Text <> '' then
      begin
         //aqui busca el articulo por codigo de barras o por clave
         querys('select tinstalacion,precioa,desc_esp,moneda,cod_cve From articulos where cod_cve='+
         quotedstr(combo[(sender as trzcombobox).tag].Text)+ ' and status="1"',0,SqlGeneral);
         if SqlGeneral.RecordCount = 0 then
         begin
            application.MessageBox(pchar('No existe ningun Articulo con esa Clave... '+
            combo[(sender as trzcombobox).tag].Text+'! o Esta Desactivado'),'Aviso',mb_iconinformation);
            combo[(sender as trzcombobox).tag].text:='';
            {combo[(sender as trzcombobox).tag].SelectAll;
            combo[(sender as trzcombobox).tag].clear;}
            edcosto[(sender as trzcombobox).Tag].Clear;
            edcant[(sender as trzcombobox).Tag].Clear;
            edcant[(sender as trzcombobox).Tag].setfocus;
            edcantp[(sender as trzcombobox).Tag].Clear;
            edtiempo[(sender as trzcombobox).Tag].Clear;
            edmo[(sender as trzcombobox).Tag].Clear;
            edeq[(sender as trzcombobox).Tag].Clear;
         end
         else
         begin
            if querys('select d.nombre from articulos as a left join dptos as d on d.iddpto=a.iddpto where cod_cve="'+
            combo[(sender as trzcombobox).tag].text+'" and d.nombre is not null order by nivel', 0, dmaccesos.sqlgeneral) > 0 then
               etiqueta[(sender as trzcombobox).Tag].caption := dmaccesos.sqlgeneral.fieldbyname('nombre').asstring
            else
               etiqueta[(sender as trzcombobox).Tag].caption := 'SIN DEPARTAMENTO';
            edtiempo[(sender as trzcombobox).Tag].text := sqlgeneral.fieldbyname('tinstalacion').asstring;
            edcantp[(sender as trzcombobox).Tag].text:=edcant[(sender as trzcombobox).Tag].text;
            moneda:=sqlgeneral.fieldbyname('moneda').AsString;
      ////////////si es descuento/////////////////////
            if etiqueta[(sender as trzcombobox).Tag].caption = 'DESCUENTOS' then
            begin
               if (combo[(sender as trzcombobox).tag].text='DESCUENTO E') or (combo[(sender as trzcombobox).tag].text='DESCUENTO PP') then
               begin
                  if querys('select costo from DetPresupuestos2 where idopcion='+inttostr(pretipo)+' and idpresupuesto='+nopres+' and cod_cve="'+combo[(sender as trzcombobox).tag].text+'"',0,dmreportes.sqlgeneral)>0 then
                     edcosto[(sender as trzcombobox).Tag].text:=dmreportes.sqlgeneral.fieldbyname('costo').asstring
                  else
                  begin
                     edmo[(sender as trzcombobox).tag].text:='0';
                     edeq[(sender as trzcombobox).tag].text:='0';
                     edcosto[(sender as trzcombobox).tag].text:='0';
                     edcosto[(sender as trzcombobox).tag].enabled:=true;
                     edcosto[(sender as trzcombobox).tag].setfocus;
                     edcosto[(sender as trzcombobox).Tag].OnKeyPress := KeyPressDesc;
                     exit;
                  end;
               end
               else
               begin
                  edmo[(sender as trzcombobox).Tag].text:='0';
                  if sqlgeneral.fieldbyname('desc_esp').asstring='0' then
                  begin
                     edcosto[(sender as trzcombobox).Tag].Text:=Format('%8.2f',[sqlgeneral.fieldbyname('precioa').AsFloat*strtofloat(edcantp[(sender as trzcombobox).Tag].text)]);
                  end;
                  if sqlgeneral.fieldbyname('precioa').asstring='0' then
                  begin
                     edcosto[(sender as trzcombobox).Tag].Text:=Format('%8.2f',[((sqlgeneral.fieldbyname('desc_esp').Asfloat/100)*((strtofloat(edsuma.text)+strtofloat(eddesctos.Text))))*-1]);
                  end;
               end;
            end
            else
            if etiqueta[(sender as trzcombobox).Tag].caption = 'INTERESES' then
            begin
               if querys('select costo from DetPresupuestos2 where idopcion='+inttostr(pretipo)+' and idpresupuesto='+nopres+
                  ' and cod_cve="'+combo[(sender as trzcombobox).tag].text+'"',0,dmreportes.sqlgeneral)>0 then
                  edcosto[(sender as trzcombobox).Tag].text:=dmreportes.sqlgeneral.fieldbyname('costo').asstring
               else
                  edcosto[(sender as trzcombobox).tag].text:='0';
            end
            else
      ////////conexiones y enlaces////////////
            if (combo[(sender as trzcombobox).tag].text='CONEXION') or (combo[(sender as trzcombobox).tag].text='CONEXION C') or
               (combo[(sender as trzcombobox).tag].text='ENLACE') or (combo[(sender as trzcombobox).tag].text='ENLACE C') or
               (combo[(sender as trzcombobox).tag].text='RECONEXION') or (combo[(sender as trzcombobox).tag].text='RECONEXION C') or
               (combo[(sender as trzcombobox).tag].text='CARGOS RX') then
            begin
               edcosto[(sender as trzcombobox).Tag].Text := sqlgeneral.fieldbyname('precioa').asstring;
            end
    ////////si son articulos////////////
            else
               edcosto[(sender as trzcombobox).Tag].Text := sqlgeneral.fieldbyname('precioa').asstring;
            //pasa a el siguiente renglon
            if (((sender as trzcombobox).Tag+1) <= maxi) and (edicion=true) then
               edcant[(sender as trzcombobox).Tag+1].Enabled := true;
            chtecla := #13;
            //en el evento onchange calcula totales
            if edcant[(sender as trzcombobox).Tag].Text <> '' then
               edcant[(sender as trzcombobox).Tag].OnChange(edcant[(sender as trzcombobox).Tag]);
            querys('select preciocapturable from articulos where cod_cve="'+combo[(sender as trzcombobox).tag].text+'"',0,dmreportes.sqlgeneral);
            if (dmreportes.sqlgeneral.fieldbyname('preciocapturable').AsInteger=1) and (edicion=true) then
            begin
               edcosto[(sender as trzcombobox).Tag].Enabled:=true;
               edcosto[(sender as trzcombobox).tag].setfocus;
               edcosto[(sender as trzcombobox).Tag].OnKeyPress:=KeyPressCapturable;
            end;
            if (edcant[(sender as trzcombobox).tag].tag+2 <= maxi+1) then
            begin
               if (edcant[(sender as trzcombobox).tag+1].enabled = true) then
                  edcant[(sender as trzcombobox).tag+1].SetFocus;
            end
            else
               if btnsave.enabled = true then
                  btnsave.setfocus;
         end;//else
      end
      else
      begin
        if (edcant[(sender as trzcombobox).tag].tag+2 <= maxi+1) then
            begin
               if (edcant[(sender as trzcombobox).tag+1].enabled = true) then
                  edcant[(sender as trzcombobox).tag+1].SetFocus;
            end
            else
               if btnsave.enabled = true then
                  btnsave.setfocus;
      end;
   end;//key
end;


procedure TFrame1.OnNoEnLista(Sender: Tobject);
begin
//combo[(sender as trzcombobox).tag].text := '';
end;

procedure TFrame1.KeyPressCant(Sender: TObject;
  var Key: Char);
begin
if key = #27 then
 (sender as trzedit).Text := '';

key:=ValidaNumeros(key,true);
if (key=#13)then
 begin
  key:=#0;
  combo[(sender as trzedit).Tag].SetFocus;
 end;
end;

procedure TFrame1.KeyPressDesc(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  (sender as trzedit).Text := '';
  if (key=#13) then
  begin
    if (sender as trzedit).text<>'0' then
    begin
        if moneda='D' then
            Eddesctos.Text:=floattostr(strtofloat(Eddesctos.Text) + strtofloat((sender as trzedit).Text))
         else
            Eddesctos.Text:=floattostr(strtofloat(Eddesctos.Text) + ((strtofloat((sender as trzedit).Text))*(strtofloat(TCP))));
         CalculaTotales;
    end;
    (sender as trzedit).Enabled:=false;
  end;
end;

procedure TFrame1.KeyPressCapturable(Sender: TObject; var Key: Char);
begin
  if key = #27 then
  (sender as trzedit).Text := '';
  if (key=#13) then
  begin
    if (sender as trzedit).text<>'0' then
    begin
        edmo[(sender as trzedit).Tag].Text:=floattostr(strtofloat(edtiempo[(sender as trzedit).Tag].Text)*strtofloat(edcant[(sender as trzedit).Tag].Text));
        edeq[(sender as trzedit).tag].Text:=Format('%8.2f',[strtofloat(edcosto[(sender as trzedit).tag].Text)*strtofloat(edcant[(sender as trzedit).Tag].Text)]);
        CalculaTotales;
        edcosto[(sender as trzedit).tag].Enabled:=false;
    end;
    //(sender as trzedit).Enabled:=false;
  end;
end;


procedure TFrame1.CalculaTotales;
var i:integer; descuento,costohora:Double; ban:boolean;
begin
   ban:=false;
   descuento:=0.0;
   edTotHrs.Text := '0';edTotEq.Text := '0';edTotMo.Text := '0'; eddesctos.text:='0';
   edsub1.Text := '0';edIva.Text := '0';edTotal.Text := '0'; edsuma.text:='0';
   edintereses.Text:='0'; eddescpp.text:='0'; edsub2.Text:='0';
   //querys('select CostoXHrs from presupuestos2 where idpresupuesto='+nopres,0, sqlgeneral);
   //costohora:=sqlgeneral.FieldByName('CostoXHrs').AsFloat;

   //trae el valor por hora de instalacion de la tabla configuraciones
   querys('select idoportunidad from presupuestos2 where idpresupuesto='+nopres,0,sqlgeneral);
   if querys('select op.idunidadnegocio from agenda_vendedores ag '+
             ' left join tipo_oportunidad op on op.idtipo_oportunidad=ag.idtipo_oportunidad'+
             ' where idoportunidad='+sqlgeneral.fieldbyname('idoportunidad').AsString+' and op.idunidadnegocio=14',0,sqlgeneral)>0 then
      querys('select valor from configuraciones where concepto='+quotedstr('CostoHoraCCTV'),0,SqlGeneral)
   else
      querys('select valor from configuraciones where concepto='+quotedstr('CostoHora'),0,SqlGeneral);
   costohora:=strtofloat(trim(Format('%8.2f',[SqlGeneral.Fields.Fields[0].AsFloat])));

   for i:=0 to maxi do
   begin
      //////si son articulos/////////
      if (etiqueta[i].caption<>'DESCUENTOS') and (etiqueta[i].caption<>'INTERESES') then
      begin
         if edeq[i].Text <> '' then
            edTotEq.Text := Format('%8.2f',[strtofloat(edTotEq.Text)+strtofloat(edeq[i].Text)]);
         if edmo[i].Text <> '' then
            edTotHrs.Text := Format('%8.2f',[strtofloat(edTotHrs.Text)+strtofloat(edmo[i].Text)]);
      end;
      if etiqueta[i].caption='DESCUENTOS' then
      begin
         if (combo[i].text='DESCUENTO E') or (combo[i].text='DESCUENTO CC') or (combo[i].text='DESCUENTO CT') or
            (combo[i].text='DESCUENTO PP') then
         begin
            if edcosto[i].text<>'' then
               eddesctos.text:=Format('%8.2f',[strtofloat(eddesctos.text)+strtofloat(edcosto[i].Text)]);
         end
         else
            if edcosto[i].text<>'' then
               eddescpp.text:=Format('%8.2f',[strtofloat(eddescpp.text)+strtofloat(edcosto[i].Text)]);
      end;
      if etiqueta[i].caption='INTERESES' then
      begin
         if edcosto[i].text<>'' then
            edintereses.text:=Format('%8.2f',[strtofloat(edintereses.text)+strtofloat(edcosto[i].Text)]);
      end;
      if combo[i].text='CAPACITACION' then
      begin
         if edcosto[i].text<>'' then
            edTotMo.Text := Format('%8.2f',[strtofloat(edTotmo.Text)+(strtofloat(edcosto[i].text))]);
      end;
      if (combo[i].text='CONEXION') or (combo[i].text='CONEXION C') or
         (combo[i].text='ENLACE') or (combo[i].text='ENLACE C') or
         (combo[i].text='RECONEXION') or (combo[i].text='RECONEXION C') OR
         (combo[i].text='CARGOS RX') then
      begin
         if edcosto[i].text<>'' then
            edTotMo.Text := Format('%8.2f',[strtofloat(edTotmo.Text)+(strtofloat(edcosto[i].text))]);
      end;
   end;
   querys('select CostoXHrs from presupuestos2 where idpresupuesto='+nopres,0, sqlgeneral);
   edTotMo.Text := Format('%8.2f',[strtofloat(edtotmo.text)+strtofloat(edTotHrs.Text)*sqlgeneral.FieldByName('CostoXHrs').AsFloat]);
   edsuma.Text := Format('%8.2f',[strtofloat(edTotMo.Text)+strtofloat(edTotEq.Text)]);
   edsub1.text:= Format('%8.2f',[strtofloat(edsuma.text)+strtofloat(eddescpp.text)+strtofloat(eddesctos.text)]);
   edsub2.text:=Format('%8.2f',[strtofloat(edsub1.text)+strtofloat(edintereses.text)]);
   edIva.Text := Format('%8.2f',[strtofloat(edsub2.Text)*(GetIva)]);
   edTotal.Text := Format('%8.2f',[(strtofloat(edsub2.Text)+strtofloat(edIva.Text))]);
end;

procedure TFrame1.OnChangeCant(Sender: Tobject);
var entro:boolean;
begin
   entro:=false;
   if (sender as trzedit).Text <> '' then
   begin
      try
         if etiqueta[(sender as trzedit).tag].caption='DESCUENTOS' then
            calculatotales;
         if etiqueta[(sender as trzedit).tag].caption='INTERESES' then
            calculatotales;
         if (combo[(sender as trzedit).tag].text='CONEXION') or (combo[(sender as trzedit).tag].text='CONEXION C') or
            (combo[(sender as trzedit).tag].text='ENLACE') or (combo[(sender as trzedit).tag].text='ENLACE C') or
            (combo[(sender as trzedit).tag].text='RECONEXION') or (combo[(sender as trzedit).tag].text='RECONEXION C') OR
            (combo[(sender as trzedit).tag].text='CARGOS RX') then
         begin
            querys('select precioa from articulos where cod_cve='+quotedstr(combo[(sender as trzedit).Tag].Text),0,sqlgeneral);
            edmo[(sender as trzedit).Tag].Text:='0';
            edeq[(sender as trzedit).Tag].Text:='0';
            edcantp[(sender as trzedit).tag].text := edcant[(sender as trzedit).tag].text;
            {edSubTotal.Text := Format('%8.2f',[strtofloat(edSubTotal.Text)+strtofloat(sqlgeneral.fieldbyname('precioa').AsString)]);
            edIva.Text := Format('%8.2f',[strtofloat(edSubTotal.Text)*(GetIva)]);
            edTotal.Text := Format('%8.2f',[(strtofloat(edSubTotal.Text)+strtofloat(edIva.Text))]);
            }
            CalculaTotales;
         end
         else
            if (combo[(sender as trzedit).tag].text='CAPACITACION') then
            begin
               //querys('select precioa from articulos where cod_cve='+quotedstr(combo[(sender as trzedit).Tag].Text),0,sqlgeneral);
               edmo[(sender as trzedit).Tag].Text:=floattostr(strtofloat(edtiempo[(sender as trzedit).Tag].Text)*strtofloat(edcant[(sender as trzedit).Tag].Text));
               edeq[(sender as trzedit).Tag].Text:='0';
               edcantp[(sender as trzedit).tag].text := edcant[(sender as trzedit).tag].text;
               CalculaTotales;
            end
     /////////son articulos////////////
            else
            begin
               querys('select precioa from articulos where cod_cve='+quotedstr(combo[(sender as trzedit).Tag].Text),0,sqlgeneral);
               edmo[(sender as trzedit).Tag].Text:=floattostr(strtofloat(edtiempo[(sender as trzedit).Tag].Text)*strtofloat(edcant[(sender as trzedit).Tag].Text));
               edeq[(sender as trzedit).Tag].Text:=floattostr(sqlgeneral.fieldbyname('precioa').AsFloat*strtofloat(edcant[(sender as trzedit).Tag].Text));
               edcantp[(sender as trzedit).tag].text := edcant[(sender as trzedit).tag].text;
               CalculaTotales;
            end;
      except
      end;
   end
   else
   begin
      (sender as trzedit).Text:='';
      edmo[(sender as trzedit).Tag].Text:='';
      edeq[(sender as trzedit).Tag].Text:='';
      edcantp[(sender as trzedit).tag].text := '';
      edcosto[(sender as trzedit).Tag].Clear;
      edtiempo[(sender as trzedit).tag].text := '';
      CalculaTotales;
   end;
end;

procedure TFrame1.CargaCbo(sql,tabla : string;combo : TRzComboBox;edt:trzedit);
var sqlgral:tmyquery;
begin
sqlgral := tmyquery.Create(nil);
sqlgral.Connection := dmaccesos.conexion;
combo.Items.Clear;
//carga los vendedores
querys(sql,0,sqlgral);
if sqlgral.RecordCount = 0 then
   application.MessageBox(pchar('No hay '+tabla+' registrados en el sistema!'),'Aviso',mb_iconwarning)
else
  begin
    sqlgral.First;
    while not sqlgral.Eof do
       begin
          combo.Items.Add(sqlgral.Fieldbyname('Nombre').AsString);
          edt.Text := sqlgral.Fieldbyname('tiempo').AsString;
          sqlgral.Next;
       end;
  end;
  sqlgral.Free;
end;

procedure TFrame1.CreaEdit(var ed: array of trzedit;l,t,w,num:integer;nom:string);
begin
ed[num] := trzedit.Create(self);
ed[num].Parent := self;
ed[num].Left := l;
ed[num].Top := t;
ed[num].Name := nom;
ed[num].Width := w;
ed[num].Tag := num;
ed[num].DisabledColor := clwhite;
ed[num].FrameHotTrack := true;
end;

procedure TFrame1.CreaButtonEdit(var ed: array of trzbuttonedit;l,t,w,num:integer;nom:string);
begin
ed[num] := trzbuttonedit.Create(self);
ed[num].Parent := self;
ed[num].Left := l;
ed[num].Top := t;
ed[num].Name := nom;
ed[num].Width := w;
ed[num].Tag := num;
ed[num].DisabledColor := clwhite;
ed[num].FrameHotTrack := true;
end;

procedure TFrame1.CreaCombo(var cbo: array of trzComboBox;l,t,w,num:integer;nom:string);
begin
cbo[num]:= trzComboBox.Create(self);
cbo[num].Parent := self;
cbo[num].Left := l;
cbo[num].Top := t;
cbo[num].Name := nom;
cbo[num].Width := w;
cbo[num].Tag := num;
cbo[num].DisabledColor := clwhite;
cbo[num].enabled := true;
end;

procedure TFrame1.lbls(var lbl: array of trzlabel;l,t,w,num:integer;nom,cap:string);
begin
lbl[num] := trzlabel.Create(self);
lbl[num].Parent := self;
lbl[num].Left := l;
lbl[num].Top := t;
lbl[num].Name := nom;
lbl[num].Width := w;
lbl[num].Caption := cap;
lbl[num].Visible := true;
lbl[num].tag := num;
end;

procedure TFrame1.focuscolor(color:Tcolor; pos:integer);
begin
combo[pos].Color    := color;
etiqueta[pos].Color := color;
edtiempo[pos].Color := color;
edcant[pos].Color   := color;
edcantp[pos].Color  := color;
edmo[pos].Color     := color;
edcosto[pos].Color  := color;
edeq[pos].Color     := color;
end;

procedure TFrame1.CreaRenglon(i:integer;idconcepto, nombre:string);
begin
    //Cantidad modificable
    CreaEdit(edcant,10,80+(20*i),35,i,'edcant'+inttostr(i));
    edcant[i].OnKeyPress := KeyPressCant;
    edcant[i].OnChange := OnChangeCant;
    edcant[i].OnExit := OnExitCombo;
    edcant[i].OnEnter := OnEnterCombo;

    {if (i < maxi2) and (i >= maxi) then
      begin
      //Edit articulo
      CreaButtonEdit(edart,57,80+(20*i),90,i,'edart'+inttostr(i));
      edart[i].OnKeyPress := KeyPressart;
      edart[i].OnDblClick := OnDblClick;
      edart[i].CharCase := ecUpperCase;
      edart[i].OnEnter := OnEnterCombo;
      edart[i].OnExit := OnExitCombo;
      edart[i].FlatButtons := true;
      edart[i].FlatButtonColor := clwhite;
      edart[i].FrameHotTrack := true;
      edcant[i].Enabled := edicion;
      edart[i].Enabled := edicion;
      end
    else
      begin}
      //Combo articulo
      CreaCombo(combo,57,80+(20*i),90,i,'combo'+inttostr(i));
      combo[i].OnNotInList := OnNoEnLista;
      combo[i].OnKeyPress := KeyPressCbo;
      combo[i].OnDblClick := OnDblClick;
      combo[i].CharCase := ecUpperCase;
      combo[i].OnEnter := OnEnterCombo;
      combo[i].OnExit := OnExitCombo;
      combo[i].OnEnter := OnEnterCombo;
      combo[i].OnSelect := OnSelectCombo;
      combo[i].FlatButtons := true;
      combo[i].FlatButtonColor := clwhite;
      combo[i].FrameHotTrack := true;
      if  idconcepto <> '0' then
        CargaCombo2('select cod_cve from articulos as a left join dptos as d on a.iddpto=d.iddpto where a.status = 1 and a.iddpto = "'+idconcepto+'" order by cod_cve' ,'cod_cve', 'cod_cve',combo[i])
      else
        CargaCombo2('select cod_cve from articulos as a left join dptos as d on a.iddpto=d.iddpto where a.status = 1 order by cod_cve' ,'cod_cve', 'cod_cve',combo[i]);
      edcant[i].Enabled := edicion;
      combo[i].Enabled := edicion;
     // end;
    //Concepto
    lbls(etiqueta,160,88+(20*i),70,i,'etiqueta'+inttostr(i),nombre);
     //tiempo
    CreaEdit(edtiempo,412,80+(20*i),50,i,'edtiempo'+inttostr(i));
    edtiempo[i].enabled := false;
    //cantidad preview
    CreaEdit(edcantp,466,80+(20*i),50,i,'edcantp'+inttostr(i));
    edcantp[i].enabled := false;
    //Mano de Obra
    CreaEdit(edmo,522,80+(20*i),50,i,'edmo'+inttostr(i));
    edmo[i].enabled := false;
    //Costo
    CreaEdit(edcosto,578,80+(20*i),50,i,'edcosto'+inttostr(i));
    edcosto[i].enabled := false;
    //Equipo
    CreaEdit(edeq,634,80+(20*i),50,i,'edeq'+inttostr(i));
    edeq[i].enabled := false;
    if combo[i].Count = 0 then
      focuscolor(clyellow, i);
end;


procedure TFrame1.btneconClick(Sender: TObject);
begin
   if maxi = 0 then
      CreaComponentes;
   if (PreTipo <> 0) or ((edtotal.Text = '')) then
      Revisa(0);
   TraePT;
   tresbotones;
end;

procedure TFrame1.btnbasClick(Sender: TObject);
begin
  if PreTipo <> 1 then
    Revisa(1);
  TraePT;
  tresbotones;
end;

procedure TFrame1.btn100Click(Sender: TObject);
begin
   if maxi = 0 then
      CreaComponentes;
   if maxi <> 0 then
   begin
      if PreTipo <> 2 then
         Revisa(2);
      TraePT;
      tresbotones;
  end;
end;

procedure TFrame1.TraePT;
begin
//CargaPresup(inttostr(PreTipo));
case PreTipo of
  0: lbtipo.caption := 'Económico';
  1: lbtipo.caption := 'Básico';
  2: lbtipo.caption := '100 %';
  end;
CargaPresup(inttostr(PreTipo));
if (edcant[0].enabled = true) then
  edcant[0].setfocus;
end;


procedure TFrame1.tresbotones;
var temp:integer;
begin
   querys('Select max(idopcion) as m from DetPresupuestos2 where idpresupuesto='+nopres+' group by idpresupuesto', 0, sqlgeneral);
   if edicion = true then
   begin
      pnlpresup.enabled := true;
      btnlimpiar.enabled := true;
      ppaquete.enabled:=true;
      btnsave.enabled := true;
      if (copy(tipooportunidad,1,6)<>'EQUIPO') then
         btnsave.enabled := false
      else
         btnsave.enabled := true;
      if sqlgeneral.fieldbyname('m').IsNull then
         temp:=0
      else
         temp:=sqlgeneral.fieldbyname('m').asinteger;
      case temp of
         0: begin
            btnecon.enabled := true;
            btnbas.enabled:= true;
            btn100.enabled:= false;
            end;
         1: begin
            btnecon.enabled:=true;
            btnbas.enabled := true;
            btn100.enabled:= true;
            end;
         2: begin
            btnecon.enabled:=true;
            btnbas.enabled := true;
            btn100.enabled:= true;
            end;
      end;
   end
   else
   begin
      case sqlgeneral.fieldbyname('m').asinteger of
         0: begin
            btnecon.Enabled:=true;
            btnbas.enabled := false;
            btn100.enabled:= false;
            end;
         1: begin
            btnecon.Enabled:=true;
            btnbas.enabled := true;
            btn100.enabled:= false;
            end;
         2: begin
            btnecon.Enabled:=true;
            btnbas.enabled := true;
            btn100.enabled:= true;
            end;
      end;
      pnlpresup.enabled := false;
      ppaquete.enabled:=false;
      btnlimpiar.enabled := false;
      btnsave.enabled := false;
   end;
   if (copy(tipooportunidad,1,6)<>'EQUIPO') then
   begin
      btnecon.Enabled:=false;
      btnbas.Enabled:=false;
   end;
end;

procedure TFrame1.btnsaveClick(Sender: TObject);
begin
   if edicion = true then
   begin
      {frmpresupuestos2.tspagos.TabVisible := true;
      frmpresupuestos2.tspagos.TabEnabled := true;
      frmpresupuestos2.GuardaEncabezado;}
      GuardaDetalle;
      buscatotzonas;
      if querys('Select max(idopcion) as m from DetPresupuestos2 where idpresupuesto='+nopres+' group by idpresupuesto', 0, sqlgeneral)>0 then
         case sqlgeneral.fieldbyname('m').AsInteger of
            0: begin
               btnecon.Enabled:=true;
               btnbas.Enabled:=true;
               btn100.Enabled:=false;
               end;
            1: begin
               btnecon.Enabled:=true;
               btnbas.Enabled:=true;
               btn100.Enabled:=true;
               end;
            2: begin
               btnecon.Enabled:=true;
               btnbas.Enabled:=true;
               btn100.Enabled:=true;
               end;
         end;
   end;
end;

procedure TFrame1.btnlimpiarClick(Sender: TObject);
var i:integer;
begin
if maxi > 0 then
  begin
  for i:=0 to maxi do
    begin
    combo[i].text:= '';
    edcant[i].text:= '';
    end;
  end;
end;

procedure TFrame1.btnSvDefaultClick(Sender: TObject);
  var i: integer;
begin
//elimina los articulos que hubiera en el presupuesto que se esta haciendo
querys('delete from PresupuestoDefault',1,sqlgeneral);
for i:=0 to maxi do
  begin
  if (combo[i].Text <> '') and (edcant[i].Text <> '') then
    begin
    querys('select iddpto from dptos where nombre='+quotedstr(etiqueta[i].Caption),0,sqlgeneral);
    querys('insert into PresupuestoDefault(cant,cod_cve,idconcepto, usuario, fecha, hora) '+
           'values ('+edcant[i].Text+','+quotedstr(combo[i].Text)+','+
           sqlgeneral.fieldbyname('iddpto').AsString+',"'+
           frmprincipal.ucprincipal.CurrentUser.loginname+'","'+datetostr(date)+'","'+
           timetostr(time)+'")',1,sqlgeneral);
    end;
  end;
end;

procedure TFrame1.habilita;
var i:integer;
begin
if maxi <> 0 then
  begin
  for i:=0 to maxi do
  begin
    combo[i].enabled:= edicion;
    edcant[i].enabled:= edicion;
  end;
  end;
end;

procedure TFrame1.CreaPagos;
var TotFinal, cadena:string;
   i,j : integer;
   sqlvar, consulta : tmyquery;
   importe,porcentaje,parcialidad,acum:double;
begin
   querys('select sum(((d.cant*d.costo)+(d.cant*d.tiempo*e.CostoXHrs))) as SubTotal from DetPresupuestos2 as d '+
       'left join presupuestos2 as e on d.idpresupuesto = e.idpresupuesto where e.idpresupuesto = '+nopres+' and '+
       'd.idopcion='+inttostr(TipoSis),0,sqlgeneral);
       // +' and d.cod_cve not in ('+GetConfiguraciones('InvalidaCalcPres', false)+')'

   //aNTES estaba sin iva , lo modifique no le entendia jijiji , eEdwin
   TotFinal := format('%8.2f',[sqlgeneral.FieldByName('SubTotal').AsFloat*(1+(GetIVA))]);
   //creamos query temporal
   //sqltemp := tmyquery.Create(self);
   //sqltemp.Connection := dmaccesos.conexion;
   //importe := strtofloat(edTotFinal.Text);
   importe := strtofloat(format('%8.2f',[sqlgeneral.FieldByName('SubTotal').AsFloat*(1+(GetIVA))]));
   querys('select * from FormasPagoPre order by idopcion',0,sqltemp);


   sqlvar := tmyquery.Create(self);
   sqlvar.Connection := dmaccesos.conexion;
   consulta := tmyquery.Create(self);
   consulta.Connection := dmaccesos.conexion;

   querys('select * from FormasPagoPre order by idopcion',0,consulta);
   querys('drop table if exists tmpPT'+frmprincipal.idmaq,1,sqlgeneral);
   consulta.First;
   cadena := 'CREATE TABLE tmpPT'+frmprincipal.idmaq+' (id int(11) auto_increment,mes varchar (30),';
   while not consulta.Eof do
   begin
      cadena := cadena + consulta.fieldbyname('idopcion').AsString+'p varchar (30),';
      consulta.Next;
   end;
   cadena := cadena+' KEY (id)) ';  //   TYPE=MyISAM
   querys(cadena,1,sqlgeneral);
   //trae el el pago que tenga mas pagos
   querys('select parcialidades from FormasPagoPre order by parcialidades desc limit 1',0,dmreportes.sqlgeneral);
   for i:=0 to dmreportes.sqlgeneral.fieldbyname('parcialidades').AsInteger+1 do
   begin
      case i of
         0:querys('insert into tmpPT'+frmprincipal.idmaq+'(mes) values ('+quotedstr(' ')+')',1,sqlgeneral);
         1:querys('insert into tmpPT'+frmprincipal.idmaq+'(mes) values ('+quotedstr('Anticipo')+')',1,sqlgeneral);
         else
            querys('insert into tmpPT'+frmprincipal.idmaq+'(mes) values ('+quotedstr(inttostr(i-1))+')',1,sqlgeneral);
      end;
      dmreportes.sqlgeneral.Next;
   end;
   querys('insert into tmpPT'+frmprincipal.idmaq+'(mes) values ('+quotedstr('Suma')+')',1,sqlgeneral);
   //llena los nombre de las columas x concepto
   querys('select nombre from FormasPagoPre order by idopcion',0,sqlvar);
   for j := 1 to sqlvar.RecordCount do
   begin
      querys('update tmpPT'+frmprincipal.idmaq+' set '+inttostr(j)+'p'+'='+quotedstr(sqlvar.fieldbyname('nombre').AsString)+' where id=1',1,sqlgeneral);
      sqlvar.Next;
   end;
   sqltemp.first;
   //Crea e inicializa la tabla de pagos
   SetLength(sg,sqltemp.RecordCount);
   SetLength(encabezados,sqltemp.RecordCount);
   //recorremos la query y creamos etiquetas y rejillas con datos
   while not sqltemp.Eof do
   begin
      acum := 0;
      porcentaje := sqltemp.fieldbyname('porcentaje').AsFloat;
      parcialidad := importe+(importe*(porcentaje/100));

      if sqltemp.fieldbyname('parcialidades').Asinteger <> 0 then
         parcialidad := parcialidad/(sqltemp.fieldbyname('parcialidades').Asinteger+1);
      parcialidad := strtofloat(format('%8.2f',[parcialidad]));
      //actualiza la tabla temporal de pagos
      querys('update tmpPT'+frmprincipal.idmaq+' set '+sqltemp.fieldbyname('idopcion').AsString+'p='+quotedstr('$'+floattostr(parcialidad))+' where mes=''Anticipo''',1,sqlgeneral);
      acum := acum+parcialidad;
      //para llenar las parcialidades en caso de tener x forma de pago
      for i:= 1 to sqltemp.fieldbyname('parcialidades').AsInteger do
      begin
         //actualiza la tabla temporal de pagos
         querys('update tmpPT'+frmprincipal.idmaq+' set '+sqltemp.fieldbyname('idopcion').AsString+'p='+quotedstr('$'+floattostr(parcialidad))+' where mes='+quotedstr(inttostr(i)),1,sqlgeneral);
         acum := acum+parcialidad;
      end;
      //actualiza la tabla temporal de pagos
      querys('update tmpPT'+frmprincipal.idmaq+' set '+sqltemp.fieldbyname('idopcion').AsString+'p='+quotedstr('$'+floattostr(acum))+' where mes=''Suma''',1,sqlgeneral);
      sqltemp.Next;
   end;
end;

procedure TFrame1.llenar;
var ban, i:integer;
dpto:string;
begin
   sqltemp.first;
   while not sqltemp.Eof = true do
   begin
      ban := 0;
      querys('Select a.iddpto, d.nombre from articulos as a left join dptos as d on d.iddpto=a.iddpto '+
         'where cod_cve="'+sqltemp.fieldbyname('cod_cve').Asstring+'" and d.estatus=1', 0, sqlgeneral);
      dpto:=sqlgeneral.fieldbyname('nombre').AsString;
      for i:=0 to maxi do
      begin
         if  dpto=etiqueta[i].Caption then
         begin
            if edcant[i].Text = '' then
            begin
               edcant[i].Text := sqltemp.fieldbyname('cant').AsString;
               edcantp[i].Text := sqltemp.fieldbyname('cant').AsString;
               combo[i].Text := sqltemp.fieldbyname('cod_cve').AsString;
               chtecla := #13;
               combo[i].OnKeyPress(combo[i],chtecla);
               ban := 1;
            end;
         end;
      end;
      if ban=0 then
      begin
         if querys('select d.nombre from articulos as a left join dptos as d on d.iddpto=a.iddpto where cod_cve="'+
         sqltemp.fieldbyname('cod_cve').Asstring+'" and d.nombre is not null order by nivel',0,dmaccesos.sqlgeneral) > 0 then
            crearenglon(maxi+1, sqltemp.fieldbyname('idconcepto').Asstring, dmaccesos.sqlgeneral.fieldbyname('nombre').Asstring)
         else
            crearenglon(maxi+1, sqltemp.fieldbyname('idconcepto').Asstring, 'SIN DEPARTAMENTO');
         maxi := maxi+1;
         edcant[maxi].Text := sqltemp.fieldbyname('cant').AsString;
         edcantp[maxi].Text := sqltemp.fieldbyname('cant').AsString;
         combo[maxi].Text := sqltemp.fieldbyname('cod_cve').AsString;
         chtecla := #13;
         combo[maxi].OnKeyPress(combo[maxi],chtecla);
         focuscolor(clRed, maxi);
         nvorenglon := true;
      end;
      sqltemp.Next;
   end;
end;

procedure TFrame1.OnButtonClick(Sender: TObject);
begin
end;

procedure TFrame1.KeyPressart(Sender: TObject;var Key: Char);
begin
end;

procedure TFrame1.btnrenglonClick(Sender: TObject);
begin
inc(maxi);
CreaRenglon(maxi,'0','Seleccione Articulo');
nvorenglon := true;
edcant[maxi].setfocus;
end;

procedure TFrame1.cbpaquetesKeyPress(Sender: TObject; var Key: Char);
begin
if (key = #13) and (cbpaquetes.text <> '') then
  begin
  if edTotal.Text <> '0' then
    if application.MessageBox('Deseas agregar el paquete y limpiar el presupuesto actual?', 'Pregunta', MB_YESNO+MB_ICONQUESTION) <> idyes then
      exit;
    querys('Select ac.cant, ac.cod_cve, a.iddpto as idconcepto from art_compuestos as ac left join articulos as a on a.cod_cve=ac.cod_cve where cod_paq="'+cbpaquetes.text+'"', 0, sqltemp);
  if nvorenglon = true then
    begin
    EliminaComponentes;
    CreaComponentes;
    end
  else
    btnlimpiar.onclick(self);
  llenar;
  end;
end;

procedure TFrame1.cbpaquetesNotInList(Sender: TObject);
begin
cbpaquetes.text := '';
end;

procedure TFrame1.btnimp3Click(Sender: TObject);
begin
    imprimir('IMP');
end;

procedure TFrame1.btnenviarClick(Sender: TObject);
   var hija:TfrmEnviarCorreo; reporte:string;
begin
   reporte:=imprimir('PDFC');
   application.CreateForm(TfrmEnviarCorreo, hija);
   frmprincipal.mmdatos.Clear;
   frmprincipal.mmdatos.Lines.Add(uprincipal.my_path+Reporte+frmprincipal.idmaq+'.pdf');
   hija.inicializa('Presupuesto Alarmex',frmprincipal.Mmdatos);
   hija.edenviar.text := correoproviene;
   hija.chkCorreoInterno.Checked:=false;
   hija.Show;
end;


function TFrame1.imprimir(tipoimp:string):string;
var i:integer; tipo:string;
begin
   //guardar
   GuardaDetalle;

   //checar si hay datos
   querys('Select count(idpresupuesto) as tot from DetPresupuestos2 where idpresupuesto ='+nopres,0, sqlgeneral);
   if sqlgeneral.fieldbyname('tot').AsInteger > 0 then
   begin
      querys('select idunidadnegocio from presupuestos2 pre'+
             ' left join agenda_vendedores ag on ag.idoportunidad=pre.idoportunidad '+
             ' left join tipo_oportunidad tp on tp.idtipo_oportunidad=ag.idtipo_oportunidad '+
             ' where idpresupuesto = '+nopres,0,sqlgeneral);
      //para saber si es equipo y se lleva los 3 presupuestos
      if  sqlgeneral.fieldbyname('idunidadnegocio').asstring='1' then
      begin
         if querys('Select idpresupuesto from DetPresupuestos2 where idpresupuesto ='+nopres+' group by idopcion',0, sqlgeneral)<3 then
         begin
            application.MessageBox('No tiene guardados los 3 presupuestos','Aviso',MB_OK+MB_ICONWARNING);
            exit;
         end;

         try
            repeat
               tiposis:=strtoint(InputBox('Presupuestos','Que presupuesto deseas imprimir? '+#13+
                                       ' Opciones: '+#13+#9+' 1 - Economico '+#13+#9+' 2 - Basico '+#13+#9 +
                                       ' 3 - 100% '+#13+#9+' 4: Todos','0'));
               if tiposis=0 then
                  exit;
               dec(tiposis);
            until (tiposis>=0) and (tiposis<4);
         except
            On e:Exception do
            begin
               MessageDlg('"Error: El valor no es un Numero Valido"',mtError,[mbOK],0);
               exit;
            end;
         end;
      end
      else
         Tiposis:=pretipo;

      //Crea el contenido de los tres presupuestos
      querys('Drop table if exists tmppresup3'+frmprincipal.idmaq, 1, sqlgeneral);
      if tiposis=3 then
         querys('Create table tmppresup3'+frmprincipal.idmaq+' (idpres int (11), idconcepto int (11), concepto varchar(100), '+
               'cod_cve varchar (15),nombre varchar (80),'+
                'costo decimal (10,2) default 0,tiempo decimal (10,2) default 0, cant1 int (11) default 0, Mo1 decimal '+
                '(10,2) default 0, Eq1 decimal (10,2) default 0, cant2 int (11) default 0, Mo2 decimal (10,2) default 0, '+
                'Eq2 decimal (10,2) default 0, cant3 int (11) default 0, Mo3 decimal (10,2) default 0, Eq3 decimal (10,2)'+
                'default 0)',1, sqlgeneral)
      else
         querys('Create table tmppresup3'+frmprincipal.idmaq+' (idpres int (11), idconcepto int (11), concepto varchar(100), '+
               'cod_cve varchar (15),nombre varchar (80),'+
                'costo decimal (10,2) default 0,tiempo decimal (10,2) default 0, cant int (11) default 0, Mo decimal '+
                '(10,2) default 0, Eq decimal (10,2) default 0)',1, sqlgeneral);
      if tiposis=3 then
         querys('Insert into tmppresup3'+frmprincipal.idmaq+' (idpres, cod_cve,nombre,costo,tiempo, idconcepto, concepto) '+
                ' select p.idpresupuesto,dp.cod_cve,a.nombre,dp.costo,dp.tiempo,dp.idconcepto, cp.nombre '+
                ' from DetPresupuestos2 as dp left join articulos as a on dp.cod_cve = a.cod_cve left join dptos as cp on(cp.iddpto=dp.idconcepto) '+
                ' left join presupuestos2 as p on p.idpresupuesto = dp.idpresupuesto where dp.idpresupuesto='+
                nopres+' group by dp.cod_cve order by nivel', 1, sqlgeneral)
      else
         querys('Insert into tmppresup3'+frmprincipal.idmaq+' (idpres, cod_cve,nombre,costo,tiempo, idconcepto, concepto) '+
                ' select p.idpresupuesto,dp.cod_cve,a.nombre,dp.costo,dp.tiempo,dp.idconcepto, cp.nombre '+
                ' from DetPresupuestos2 as dp left join articulos as a on dp.cod_cve = a.cod_cve left join dptos as cp on(cp.iddpto=dp.idconcepto) '+
                ' left join presupuestos2 as p on p.idpresupuesto = dp.idpresupuesto where dp.idpresupuesto='+
                nopres+' and dp.idopcion='+inttostr(tiposis)+' group by dp.cod_cve order by nivel', 1, sqlgeneral);

      if tiposis=3 then
      begin
         for i:=0 to 2 do
         begin
            querys('select dp.cod_cve,a.nombre,dp.costo,dp.tiempo,dp.cant,round(dp.cant*dp.tiempo*p.CostoXHrs,2) as Mo,round(dp.cant*dp.costo,2) as Eq '+
                      ' from DetPresupuestos2 as dp left join articulos as a on dp.cod_cve = a.cod_cve '+
                      ' left join presupuestos2 as p on p.idpresupuesto=dp.idpresupuesto '+
                      ' where dp.idpresupuesto='+nopres+' and dp.idopcion='+inttostr(i)+
                      ' group by dp.cod_cve', 0, sqlgeneral);
            sqlgeneral.first;
            while not sqlgeneral.eof do
            begin
                  querys('update tmppresup3'+frmprincipal.idmaq+
                        ' set cant'+ inttostr(i+1) + '="' +sqlgeneral.fieldbyname('cant').AsString+ '", '+
                        ' Mo'+inttostr(i+1)+ '="' +sqlgeneral.fieldbyname('Mo').AsString+ '", '+
                        ' Eq'+inttostr(i+1)+ '="' +sqlgeneral.fieldbyname('Eq').AsString+ '"  '+
                        ' where idpres='+nopres+' and cod_cve="' +sqlgeneral.fieldbyname('cod_cve').AsString+'"',1,dmreportes.sqlgeneral6);
                  sqlgeneral.Next;
            end;
         end;
      end
      else
      begin
         querys('select dp.cod_cve,a.nombre,dp.costo,dp.tiempo,dp.cant,round(dp.cant*dp.tiempo*p.CostoXHrs,2) as Mo,round(dp.cant*dp.costo,2) as Eq '+
                      ' from DetPresupuestos2 as dp left join articulos as a on dp.cod_cve = a.cod_cve '+
                      ' left join presupuestos2 as p on p.idpresupuesto=dp.idpresupuesto '+
                      ' where dp.idpresupuesto='+nopres+' and dp.idopcion='+inttostr(tiposis)+
                      ' group by dp.cod_cve', 0, sqlgeneral);
         sqlgeneral.first;
         while not sqlgeneral.eof do
         begin
            querys('update tmppresup3'+frmprincipal.idmaq+
                   ' set cant ="' +sqlgeneral.fieldbyname('cant').AsString+ '", '+
                   ' Mo ="' +sqlgeneral.fieldbyname('Mo').AsString+ '", '+
                   ' Eq ="' +sqlgeneral.fieldbyname('Eq').AsString+ '"  '+
                   ' where idpres='+nopres+' and cod_cve="' +sqlgeneral.fieldbyname('cod_cve').AsString+'"',1,dmreportes.sqlgeneral6);
            sqlgeneral.Next;
         end;
      end;

      if tiposis=3 then
      begin
         tiposis:=PreTipo;
         creapagos;
         tiposis:=3;
      end
      else
         creapagos;

      if tiposis=3 then
      begin
         case PreTipo of
         0: tipo := 'ECONOMICO';
         1: tipo := 'BASICO';
         2: tipo := '100%';
      end;
      end
      else
         case tiposis of
            0: tipo := 'ECONOMICO';
            1: tipo := 'BASICO';
            2: tipo := '100%';
         end;


       if tiposis=3 then
         querys('select  if(dp.cod_cve in('+GetConfiguraciones('InvalidaCalcPres', false)+'), 1, 0) as agrupar, '+
                ' dp.idpresupuesto, cp.nombre, dp.cod_cve,dp.tiempo, dp.costo, '+
                ' ifnull(o1.cant,0) as cant1, ifnull(o1.Mo, 0) as Mo1, ifnull(o1.Eq, 0) as Eq1, '+
                ' ifnull(o2.cant,0) as cant2, ifnull(o2.Mo, 0) as Mo2, ifnull(o2.Eq, 0) as Eq2, '+
                ' ifnull(o3.cant,0) as cant3, ifnull(o3.Mo, 0) as Mo3, ifnull(o3.Eq, 0) as Eq3, p.comentarios '+
                ' from DetPresupuestos2 as dp left join articulos as a on dp.cod_cve = a.cod_cve '+
                ' left join dptos as cp on cp.iddpto=dp.idconcepto '+
                ' left join ( select dp.cod_cve, dp.cant, round(dp.cant*dp.tiempo,2) as Mo, round(dp.cant*dp.costo,2) as Eq '+
                ' from DetPresupuestos2 as dp left join articulos as a on dp.cod_cve = a.cod_cve where dp.idpresupuesto='+
                nopres+' and dp.idopcion=0 group by dp.cod_cve ) as o1 on o1.cod_cve=dp.cod_cve '+
                ' left join ( select dp.cod_cve, dp.cant, round(dp.cant*dp.tiempo,2) as Mo, round(dp.cant*dp.costo,2) as Eq '+
                ' from DetPresupuestos2 as dp left join articulos as a on dp.cod_cve = a.cod_cve where dp.idpresupuesto='+
                nopres+' and dp.idopcion=1 group by dp.cod_cve ) as o2 on o2.cod_cve=dp.cod_cve '+
                ' left join ( select dp.cod_cve, dp.cant, round(dp.cant*dp.tiempo,2) as Mo, round(dp.cant*dp.costo,2) as Eq '+
                ' from DetPresupuestos2 as dp left join articulos as a on dp.cod_cve = a.cod_cve where dp.idpresupuesto='+
                nopres+' and dp.idopcion=2 group by dp.cod_cve ) as o3 on o3.cod_cve=dp.cod_cve left join presupuestos2 p '+
                ' on dp.idpresupuesto=p.idpresupuesto '+
                ' where dp.idpresupuesto='+nopres+' group by dp.cod_cve order by nivel, agrupar', 0, dmreportes.sqlgeneral)
      else
         querys('select  if(dp.cod_cve in('+GetConfiguraciones('InvalidaCalcPres',false)+'), 1, 0) as agrupar,'+
                ' dp.idpresupuesto, cp.nombre, dp.cod_cve,dp.tiempo, dp.costo,'+
                ' dp.cant, round(dp.cant*dp.tiempo,2) as Mo, round(dp.cant*dp.costo,2) as Eq ,'+
                ' p.comentarios from DetPresupuestos2 as dp left join articulos as a on dp.cod_cve = a.cod_cve'+
                ' left join dptos as cp on cp.iddpto=dp.idconcepto '+
                ' left join presupuestos2 p  on dp.idpresupuesto=p.idpresupuesto '+
                ' where dp.idpresupuesto='+nopres+' and dp.idopcion= '+ inttostr(tiposis) +
                ' group by dp.cod_cve order by nivel, agrupar ',0,dmreportes.sqlgeneral);

      querys('SELECT "'+tipo+'" as opcion, if(o.apaterno is NULL or o.apaterno="", o.nombre, if(o.amaterno is NULL or o.amaterno="",'+
         ' concat(o.nombre, " ", o.apaterno), concat(o.nombre, " ", o.apaterno, " ", o.amaterno))) as nombre, '+
         ' if(o.rsocial is NULL or o.rsocial="","",o.rsocial) AS rsocial, concat(if(o.numero is null or o.numero="", o.dir, '+
         'concat(o.dir," " ,o.numero)), "   Col. ",  c.nombre) as dir, c.CP,  max(t.tel) as telefono, max(t.cel) '+
         'as celular, max(t.nex) as nextel, cont.nombre as contacto, cont.relacion, cs.idsector, o.alta, o.idoportunidad, '+
         'f.nombre as fuente, o.usuario, concat(u.codigo,"  ",'+usuarionombre('u')+') as vendedor, tp.nombre as TipoOportunidad '+
         'FROM oportunidades as o LEFT JOIN colonias AS c ON c.idcol = o.idcol LEFT JOIN col_sector as cs on cs.idcol=c.idcol '+
         'LEFT JOIN ( Select o.idoportunidad, if(tipo_tel in("CONVENCIONAL", "ALARMA"), telefono, "")  as tel, if(tipo_tel = '+
         '"CELULAR", telefono, "")  as cel, if(tipo_tel in("NEXTEL RADIO", "NEXTEL"), telefono, "")  as nex '+
         'FROM oportunidades as o LEFT JOIN telefonos AS t ON t.idtel = o.idtel where o.idoportunidad = '+oportunidad+') as t on '+
         't.idoportunidad = o.idoportunidad LEFT JOIN agenda_vendedores as a on a.idoportunidad = o.idoportunidad '+
         'LEFT JOIN usuarios as u on u.idusuario = a.idvendedor LEFT JOIN contactos AS cont ON o.idcontacto=cont.idcontacto '+
         'LEFT JOIN tipo_oportunidad as tp on a.idtipo_oportunidad=tp.idtipo_oportunidad LEFT JOIN fuentes f on f.idfuente=o.idfuente '+
         'where o.idoportunidad = '+oportunidad+' group by idoportunidad limit 1', 0, dmreportes.sqlgeneral2);

      querys('select * from tmpPT'+frmprincipal.idmaq+' order by id',0,dmreportes.sqlgeneral3);

      if tiposis=3 then
         querys('select eq1,mo1,st1,descuento1,(st1+descuento1) as sub1,finan1,(finan1+(st1+descuento1)) as subtotal1,'+
                ' round((finan1+(st1+descuento1))*'+floattostr(GetIVA)+',2) as iva1,round((finan1+(st1+descuento1))*'+floattostr(1+(GetIVA))+',2) as total1,'+
                ' eq2,mo2,st2,descuento2,(st2+descuento2) as sub2,finan2,(finan2+(st2+descuento2)) as subtotal2,'+
                ' round((finan2+(st2+descuento2))*'+floattostr(GetIVA)+',2) as iva2,round((finan2+(st2+descuento2))*'+floattostr(1+(GetIVA))+',2) as total2,'+
                ' eq3,mo3,st3,descuento3,(st3+descuento3) as sub3,finan3,(finan3+(st3+descuento3)) as subtotal3,'+
                ' round((finan3+(st3+descuento3))*'+floattostr(GetIVA)+',2) as iva3,round((finan3+(st3+descuento3))*'+floattostr(1+(GetIVA))+',2) as total3'+
                ' from( Select Sum(t.Eq1) AS eq1, Sum(t.Eq2) AS eq2, Sum(t.Eq3) AS eq3, Sum(t.Mo1) AS mo1, Sum(t.Mo2) AS mo2,'+
                ' Sum(t.Mo3) AS mo3,Sum(t.Mo1) + Sum(t.Eq1) AS st1,Sum(t.Mo2)  + Sum(t.Eq2) AS st2,Sum(t.Mo3) + Sum(t.Eq3) AS st3,'+
                ' round(if((select sum(eq1) from tmppresup3'+frmprincipal.idmaq+' where idconcepto = 30) is null,0,(select sum(eq1) from tmppresup3'+frmprincipal.idmaq+' where idconcepto = 30)),2) as descuento1,'+
                ' round(if((select sum(eq1) from tmppresup3'+frmprincipal.idmaq+' where idconcepto = 38) is null,0,(select sum(eq1) from tmppresup3'+frmprincipal.idmaq+' where idconcepto = 38)),2) as finan1,'+
                ' round(if((select sum(eq2) from tmppresup3'+frmprincipal.idmaq+' where idconcepto = 30) is null,0,(select sum(eq2) from tmppresup3'+frmprincipal.idmaq+' where idconcepto = 30)),2) as descuento2,'+
                ' round(if((select sum(eq2) from tmppresup3'+frmprincipal.idmaq+' where idconcepto = 38) is null,0,(select sum(eq2) from tmppresup3'+frmprincipal.idmaq+' where idconcepto = 38)),2) as finan2,'+
                ' round(if((select sum(eq3) from tmppresup3'+frmprincipal.idmaq+' where idconcepto = 30) is null,0,(select sum(eq3) from tmppresup3'+frmprincipal.idmaq+' where idconcepto = 30)),2) as descuento3,'+
                ' round(if((select sum(eq3) from tmppresup3'+frmprincipal.idmaq+' where idconcepto = 38) is null,0,(select sum(eq3) from tmppresup3'+frmprincipal.idmaq+' where idconcepto = 38)),2) as finan3'+
                ' From tmppresup3'+frmprincipal.idmaq+' AS t where t.cod_cve not in ("FINAN", "DESCUENTO PP", "DESC05%", "DESC10%", "DESC15%", "DESC20%","DESC30%","DESC40%", "DESC50%")'+
                ' group By t.idpres ) as tab ',0,dmreportes.sqlgeneral4)

      else
         querys('select eq,mo,st,descuento,(st+descuento) as sub,finan,(finan+(st+descuento)) as subtotal,'+
                ' round((finan+(st+descuento))*'+floattostr(GetIVA)+',2) as iva,round((finan+(st+descuento))*'+floattostr(1+(GetIVA))+',2) as total '+
                ' from( Select Sum(t.Eq) AS eq, Sum(t.Mo) AS mo,Sum(t.Mo) + Sum(t.Eq) AS st,'+
                ' round(if((select sum(costo) from tmppresup3'+frmprincipal.idmaq+' where idconcepto = 30) is null,0,(select sum(costo) from tmppresup3'+frmprincipal.idmaq+' where idconcepto = 30)),2) as descuento,'+
                ' round(if((select sum(costo) from tmppresup3'+frmprincipal.idmaq+' where idconcepto = 38) is null,0,(select sum(costo) from tmppresup3'+frmprincipal.idmaq+' where idconcepto = 38)),2) as finan'+
                ' From tmppresup3'+frmprincipal.idmaq+' AS t where t.cod_cve not in '+
                ' ("FINAN", "DESCUENTO PP", "DESC05%", "DESC10%", "DESC15%", "DESC20%","DESC30%","DESC40%", "DESC50%") '+
                ' group By t.idpres) as tab',0,dmreportes.sqlgeneral4);

      //Impresion del reporte
      if tiposis=3 then //los tres presupuestos
      begin
         if tipoimp='PDFC' then
         begin
            OperacionReporte('Presupuesto33','Presupuesto33', tipoimp, 1);
            result:='Presupuesto33';
         end
         else
         begin
            OperacionReporte('Presupuesto3','Presupuesto3', tipoimp, 1);
            result:='Presupuesto3';
         end;
      end
      else //solo un presupuesto
      begin
         if tipoimp='PDFC' then
         begin
            OperacionReporte('Presupuesto22','Presupuesto22', tipoimp, 1);
            result:='Presupuesto22';
         end
         else
         begin
            OperacionReporte('Presupuesto2','Presupuesto2', tipoimp, 1);
            result:='Presupuesto2';
         end
      end;
   end
   else
      application.messagebox('No hay Datos guardados a mostrar', 'Atencion', mb_iconinformation);
querys('Drop table if exists tmppresup3'+frmprincipal.idmaq, 1, sqlgeneral);      
end;

End.


