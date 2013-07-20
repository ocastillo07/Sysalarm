{///////////////////////////////////////////////////////////////////////////////
 2009-03-30 Oscar modificacion ventas

 2008/10/13 oscar comentario de sin enlace en pasar a pedido
 2008/07/24 Cambios sincronizacion
 2008/07/23 dalyla derechos sys gurada pres dflt
 2008/07/23 Oscar Agrege nueva etiqueta en los totales "Financiamiento"
 2008/06/26 correccion en el presupuesto economico se borraba
 2008/03/31 Oscar agrege un mensaje en el boton guardar para los 3 pres.
 2008/02/28 dalyla zona horaria ok
 2007/11/10 Dalila Llenar el combo de paquetes
 Modificado por: Oscar Castillo
 Fecha: 09/Nov/07 agrege un nuevo campo "tipo oportunidad"

//Creado por: Angel Javier Hernandez
//Ultima Modificacion: 2007/Sep/10
//Modificacion por: Dalila Robledo
}///////////////////////////////////////////////////////////////////////////////
unit UPresupuesto2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzDBEdit, StdCtrls, RzCmboBx, Mask, RzEdit, RzBtnEdt, RzLabel,
  RzTabs, ExtCtrls, RzPanel, RzSplit, RzGroupBar, DB, MemDS, DBAccess,
  MyAccess, RzButton, Buttons, RzRadGrp, Grids, LMDCustomComponent,
  LMDContainerComponent, LMDBaseDialog, LMDCustomCheckListDlg,
  LMDCheckListDlg, LMDCustomControl, LMDCustomPanel, LMDCustomBevelPanel,
  LMDSBar, fpresupuesto;

type
  Tfrmpresupuestos2 = class(TForm)
    PCPresup: TRzPageControl;
    tsprincipal: TRzTabSheet;
    tspresupuesto: TRzTabSheet;
    gbVendedor: TGroupBox;
    RzLabel11: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel28: TRzLabel;
    RzLabel29: TRzLabel;
    edNumCotizacion: TRzButtonEdit;
    Edcve_vend: TRzEdit;
    cbonom_vend: TRzComboBox;
    edTCP: TRzEdit;
    edCostoHoras: TRzEdit;
    edFechaCreacion: TRzEdit;
    sqlgeneral: TMyQuery;
    gboportunidad: TGroupBox;
    RzLabel1: TRzLabel;
    lblmovil: TRzLabel;
    lblciudad: TRzLabel;
    lblestado: TRzLabel;
    lblcolonia: TRzLabel;
    lblentre: TRzLabel;
    lblalta: TRzLabel;
    lblfuente: TRzLabel;
    lblorigen: TRzLabel;
    lblnombre: TRzLabel;
    lblgiro: TRzLabel;
    lblcategoria: TRzLabel;
    RzLabel7: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    RzLabel9: TRzLabel;
    RzLabel31: TRzLabel;
    RzLabel39: TRzLabel;
    edentre: TRzDBEdit;
    ednombre: TRzDBEdit;
    edestatus: TRzDBEdit;
    edorigen: TRzDBEdit;
    edfuente: TRzDBEdit;
    edgiro: TRzDBEdit;
    edcategoria: TRzDBEdit;
    edNumOpor: TRzButtonEdit;
    edcalle: TRzDBEdit;
    ednumero: TRzDBEdit;
    edciudad: TRzDBEdit;
    edestado: TRzDBEdit;
    edcolonia: TRzDBEdit;
    edcodigo: TRzDBEdit;
    RzDBEdit12: TRzDBEdit;
    edsector: TRzDBEdit;
    edrazon: TRzDBEdit;
    edcvecte: TRzButtonEdit;
    sqloportunidades: TMyQuery;
    dsoportunidades: TDataSource;
    RzPanel2: TRzPanel;
    btnalta: TRzBitBtn;
    btnborrar: TRzBitBtn;
    btnmodificar: TRzBitBtn;
    btncancelar: TRzBitBtn;
    sqlclientes: TMyQuery;
    tsPagos: TRzTabSheet;
    rgTipoSis: TRzRadioGroup;
    RzLabel10: TRzLabel;
    edTotFinal: TRzNumericEdit;
    btnimprimir: TRzBitBtn;
    RzLabel13: TRzLabel;
    potros: TRzPanel;
    mmcomentarios: TRzMemo;
    rgPresupDefault: TRzRadioGroup;
    cbostatus: TRzComboBox;
    RzLabel12: TRzLabel;
    lblpresupuesto: TRzLabel;
    RzLabel15: TRzLabel;
    btnpasar: TRzBitBtn;
    edcuenta: TRzDBEdit;
    fpres: TFrame1;
    RzLabel5: TRzLabel;
    edtipopor: TRzEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Edcve_vendChange(Sender: TObject);
    procedure Edcve_vendKeyPress(Sender: TObject; var Key: Char);
    procedure cbonom_vendChange(Sender: TObject);
    procedure cbonom_vendClick(Sender: TObject);
    procedure cbonom_vendKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure btnaltaClick(Sender: TObject);
    procedure edNumOporButtonClick(Sender: TObject);
    procedure edNumOporChange(Sender: TObject);
    procedure edNumOporKeyPress(Sender: TObject; var Key: Char);
    procedure edcvecteButtonClick(Sender: TObject);
    procedure edcvecteChange(Sender: TObject);
    procedure edcvecteKeyPress(Sender: TObject; var Key: Char);
    procedure btncancelarClick(Sender: TObject);
    procedure edNumCotizacionButtonClick(Sender: TObject);
    procedure btnGuardarClick(Sender: TObject);
    procedure btnmodificarClick(Sender: TObject);
    procedure edTotFinalKeyPress(Sender: TObject; var Key: Char);
    procedure rgTipoSisClick(Sender: TObject);
    procedure edNumCotizacionKeyPress(Sender: TObject; var Key: Char);
    procedure PCPresupTabClick(Sender: TObject);
    procedure btnimprimirClick(Sender: TObject);
    procedure edNumCotizacionChange(Sender: TObject);
    procedure rgPresupDefaultClick(Sender: TObject);
    procedure cboFormaPagoClick(Sender: TObject);
    {procedure btneconClick(Sender: TObject);
    procedure btnbasClick(Sender: TObject);
    procedure btn100Click(Sender: TObject);
    procedure btnimp3Click(Sender: TObject);
    procedure btnlimpiarClick(Sender: TObject);
    procedure btnsaveClick(Sender: TObject);    }
    procedure btnpasarClick(Sender: TObject);
    procedure fpresbtneconClick(Sender: TObject);
    procedure fpresbtnbasClick(Sender: TObject);
    procedure fpresbtnsaveClick(Sender: TObject);
    procedure cbostatusSelect(Sender: TObject);
    procedure fpresbtn100Click(Sender: TObject);
    procedure fpresbtnimp3Click(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure fpresRzBitBtn1Click(Sender: TObject);
    //procedure btnSvDefaultClick(Sender: TObject);
    //procedure scrollScroll(Sender: TObject; ScrollCode: TScrollCode;var ScrollPos: Integer);

  private
     {PreTipo, totzonas, p:integer;
     procedure CargaPresup(Tipo:string);

     procedure GuardaDetalle;
     procedure CalculaTotales;
     procedure CreaComponentes;
     procedure EliminaComponentes;}
     procedure TraeDatos;
     procedure CreaPagos(consulta:tmyquery);
     procedure limpia;
     procedure EliminaEncabezadosYRejillas;
     procedure sontres;
     {  procedure LimpiaTotales;

   procedure Revisa(Nuevo:integer);
     procedure buscatotzonas;
     procedure TraePT;

     procedure tresbotones;
     procedure focuscolor(color:Tcolor; pos:integer);
     procedure CreaRenglon(i:integer;idconcepto, nombre:string);  }
    { Private declarations }
  public
    { Public declarations }
     max:integer;
     combo: array of trzcombobox;
     etiqueta,encabezados: array of trzlabel;
     edtiempo,edcant, edcantp,edmo,edeq,edcosto: array of trzedit;
     sg:array of tstringGrid;
     procedure GuardaEncabezado;
    { procedure CargaCbo(sql,tabla:string;combo : TRzComboBox;edt:trzedit);
     procedure KeyPressCant(Sender: TObject;var Key: Char);
     procedure KeyPressCbo(Sender: TObject;var Key: Char);
     procedure CreaEdit(var ed: array of trzedit;l,t,w,num:integer;nom:string);
     procedure CreaCombo(var cbo: array of trzComboBox;l,t,w,num:integer;nom:string);
     procedure lbls(var lbl: array of trzlabel;l,t,w,num:integer;nom,cap:string);
     procedure OnChangeCant(Sender: Tobject);
     procedure OnNoEnLista(Sender: Tobject);
     procedure OnEnterCombo(Sender: Tobject);
     procedure OnExitCombo(Sender: Tobject);
     procedure OnSelectCombo(Sender: Tobject);      }
     procedure OnDblClick(Sender: Tobject);
     constructor inicializa(const tipo,idoportunidad:integer);
  end;

var
  frmpresupuestos2: Tfrmpresupuestos2;

implementation

uses Udm, Ubusquedas, Uprincipal, Udmrep, Upedidos,
  Uasig_eve_vend, Urecursos, Uprospectos;

{$R *.dfm}


constructor Tfrmpresupuestos2.inicializa(const tipo,idoportunidad:integer);
var
tecla:char;
begin

if tipo = 1 then
begin
   tecla:=#13;

   with dmreportes do
   begin

      querys('select ag.idevento as evento,ta.nombre as actividad,ag.idvendedor as vendedor from agenda_vendedores as ag LEFT join actividades_vendedores as av on(ag.idevento=av.idevento) '+
             'INNER JOIN tipos_actividades as ta on(ta.idtipo_actividad=av.idtipo_actividad and ta.nombre=''PRESUPUESTO'') where ag.idoportunidad='+inttostr(idoportunidad),0,sqlgeneral2);
      if(sqlgeneral2.FieldByName('actividad').AsString = 'PRESUPUESTO') then
      begin
         querys('SELECT presupuestos2.idpresupuesto as presupuesto,presupuestos2.idoportunidad,clientes.idcliente,if(oportunidades.idoportunidad<>0,if(oportunidades.rsocial='''',concat(ifnull(oportunidades.nombre,''''),'' '',ifnull(oportunidades.apaterno,''''),'' '','+
                'ifnull(oportunidades.amaterno,'''')),oportunidades.rsocial),if(clientes.rsocial='''',concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '',ifnull(clientes.amaterno,'''')),clientes.rsocial)) as Cliente,'+
                'concat(ifnull(usuarios.nombre,''''),'' '',ifnull(usuarios.apaterno,''''),'' '',ifnull(usuarios.amaterno,'''')) as Vendedor, presupuestos2.fecha,presupuestos2.hora FROM oportunidades left JOIN presupuestos2  ON (presupuestos2.idoportunidad = '+
                ' oportunidades.idoportunidad) left JOIN usuarios ON (presupuestos2.idvendedor = usuarios.idusuario) left JOIN agenda_vendedores as ag ON (ag.idoportunidad = oportunidades.idoportunidad) left join clientes on presupuestos2.idcliente=clientes.idcliente '+
                ' where presupuestos2.idoportunidad='+inttostr(idoportunidad),0,sqlgeneral2);
        if(sqlgeneral2.FieldByName('presupuesto').AsString = '' ) then
        begin
            //No tiene realizado el presupuesto
            btnalta.OnClick(SELF);
            edNumOpor.Text := inttostr(idoportunidad);
            edNumOpor.OnButtonClick(SELF);
            //trae el tipo de cambio de la tabla configuraciones
            querys('select valor from configuraciones where concepto='+quotedstr('TipoCambio'),0,SqlGeneral);
            edTCP.Text:=trim(Format('%8.2f',[SqlGeneral.Fields.Fields[0].AsFloat]));
            //trae el valor por hora de instalacion de la tabla configuraciones
            if querys('select op.idunidadnegocio from agenda_vendedores ag '+
                ' left join tipo_oportunidad op on op.idtipo_oportunidad=ag.idtipo_oportunidad'+
                ' where idoportunidad='+inttostr(idoportunidad)+' and op.idunidadnegocio=14',0,sqlgeneral)>0 then
               querys('select valor from configuraciones where concepto='+quotedstr('CostoHoraCCTV'),0,SqlGeneral)
            else
               querys('select valor from configuraciones where concepto='+quotedstr('CostoHora'),0,SqlGeneral);
            edCostoHoras.Text:=trim(Format('%8.2f',[SqlGeneral.Fields.Fields[0].AsFloat]));
        end
        else
        begin
             //si existe que lo traiga.
             edNumCotizacion.Text := sqlgeneral2.FieldByName('presupuesto').AsString;
             edNumCotizacion.OnKeyPress(self,tecla);

        end;
      end
      else
      begin
         //no tiene evento de presupuesto .....
          querys('select idevento as evento,idvendedor as vendedor from agenda_vendedores where idoportunidad='+inttostr(idoportunidad),0,sqlgeneral2);

             querys('insert into actividades_vendedores (idevento,observaciones,realizada,idvendedor,fecha,hora,'+
             'idtipo_actividad)  SELECT '+quotedstr(sqlgeneral2.fieldbyname('evento').AsString)+','''',0,'+quotedstr(sqlgeneral2.fieldbyname('vendedor').AsString)+',"'+
             datetostr(date)+'","'+timetostr(time)+'",idtipo_actividad from tipos_actividades where nombre=''PRESUPUESTO''  ',1,sqlgeneral);
             btnalta.OnClick(SELF);
             edNumOpor.Text := inttostr(idoportunidad);
             edNumOpor.OnKeyPress(self,tecla);

      end;
   end;//with
end;
end;

procedure tfrmpresupuestos2.CreaPagos(consulta:tmyquery);
var cadena:string;
    i,j : integer;
    sqlvar : tmyquery;
begin
   sqlvar := tmyquery.Create(self);
   sqlvar.Connection := dmaccesos.conexion;
   querys('drop table if exists tmpPT'+frmprincipal.idmaq,1,sqlgeneral);
   consulta.First;
   cadena := 'CREATE TABLE tmpPT'+frmprincipal.idmaq+' (id int(11) auto_increment,mes varchar (30),';
   while not consulta.Eof do
   begin
      cadena := cadena + consulta.fieldbyname('idopcion').AsString+'p varchar (30),';
      consulta.Next;
   end;
   cadena := cadena+' KEY (id)) ';     // TYPE=MyISAM 
   querys(cadena,1,sqlgeneral);
   //trae el el pago que tenga mas pagos
   querys('select max(parcialidades) as parcialidades from FormasPagoPre',0,dmreportes.sqlgeneral);
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
end;

procedure tfrmpresupuestos2.EliminaEncabezadosYRejillas;
var i : integer;
begin
   //elimina encabezados y rejillas y libera su memoria
   if high(sg) <> -1 then
      for i:=0 to high(sg) do
      begin
         if sg[i] <> nil then
            sg[i].Free;
        if encabezados[i] <> nil then
            encabezados[i].free;
      end;
   setlength(sg,0);
   setlength(encabezados,0);
   //elimina tabla temporal
   querys('drop table if exists tmpPT'+frmprincipal.idmaq,1,sqlgeneral);
end;

procedure tfrmpresupuestos2.GuardaEncabezado;
 var tipo,valor,cve_vend:string;
begin
   shortdateformat:='yyyy/mm/dd';
   if (ednumopor.Text<>'') and (ednumopor.Text<>'0') then
   begin
      tipo:='idoportunidad';
      valor:=sqloportunidades.fieldbyname('idoportunidad').AsString;
   end
   else
   begin
      tipo:='idcliente';
      valor:=sqlclientes.fieldbyname('idcliente').AsString;
   end;
   if edcve_vend.Text='' then
      cve_vend:='0'
   else
      cve_vend:=edcve_vend.Text;
   //verifica si ya se guardo el encabezado
   querys('select idpresupuesto from presupuestos2 where idpresupuesto='+edNumCotizacion.Text,0,sqlgeneral);
   if sqlgeneral.RecordCount = 0 then
   begin
      //trae el ultimo numero de cotizacion
      querys('select max(idpresupuesto) from presupuestos2',0,SqlGeneral);
      edNumcotizacion.Text:=inttostr(sqlgeneral.Fields.Fields[0].Asinteger+1);
      //guarda los datos en la tabla de presupuestos
      querys('insert into presupuestos2(idpresupuesto,'+tipo+',idvendedor,FechaCreacion,TipoCambio,fecha,hora,usuario,tc,CostoXHrs,PresupDefault,comentarios) '+
      'values ('+edNumcotizacion.Text+','+valor+','+cve_vend+','+quotedstr(datetostr(FechaServidor))+','+edTCP.Text+','+quotedstr(datetostr(FechaServidor))+','+
      quotedstr(timetostr(HoraServidor))+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+','+edtcp.text+','+edCostohoras.Text+','+inttostr(rgPresupDefault.ItemIndex)+','+quotedstr(mmcomentarios.text)+')',1,SqlGeneral);

      edNumcotizacion.Text := inttostr(sqlgeneral.InsertId);

      if tipo='idoportunidad' then
      begin
         if copy(edtipopor.Text,1,6)='EQUIPO' then
         begin
            querys('select count(distinct(d.idopcion)) as opcion from DetPresupuestos2 as d left join presupuestos2 as p on (d.idpresupuesto=p.idpresupuesto) where p.idoportunidad='+edNumOpor.Text,0,dmreportes.sqlgeneral5);
            if dmreportes.sqlgeneral5.FieldByName('opcion').AsInteger=3 then
            begin
               //me trae el idactividad para poder modificar de realizado false a true
               querys('SELECT actividades_vendedores.idactividades FROM agenda_vendedores left JOIN actividades_vendedores ON (agenda_vendedores.idevento = actividades_vendedores.idevento) INNER JOIN tipos_actividades ON ' +
               '(actividades_vendedores.idtipo_actividad = tipos_actividades.idtipo_actividad) WHERE (agenda_vendedores.idoportunidad = '+edNumOpor.Text+') AND tipos_actividades.nombre = '+quotedstr('PRESUPUESTO'),0,sqlgeneral);
               //actualiza la tabla de actividades_vendedores el campo realizado
               querys('update actividades_vendedores set realizada = 1 where idactividades = '+sqlgeneral.Fields.Fields[0].AsString,1,SqlGeneral);
            end;
         end
         else
         begin
            //me trae el idactividad para poder modificar de realizado false a true
            querys('SELECT actividades_vendedores.idactividades FROM agenda_vendedores left JOIN actividades_vendedores ON (agenda_vendedores.idevento = actividades_vendedores.idevento) INNER JOIN tipos_actividades ON ' +
            '(actividades_vendedores.idtipo_actividad = tipos_actividades.idtipo_actividad) WHERE (agenda_vendedores.idoportunidad = '+edNumOpor.Text+') AND tipos_actividades.nombre = '+quotedstr('PRESUPUESTO'),0,sqlgeneral);
            //actualiza la tabla de actividades_vendedores el campo realizado
            querys('update actividades_vendedores set realizada = 1 where idactividades = '+sqlgeneral.Fields.Fields[0].AsString,1,SqlGeneral);
         end
      end;
      frmprincipal.ucprincipal.Log('Dio de Alta la Cotizacion '+edNumCotizacion.text,1);
   end
   else
   begin //actualiza el encabezado
      if tipo='idoportunidad' then
      begin
         if copy(edtipopor.Text,1,6)='EQUIPO' then
         begin
            querys('select count(distinct(d.idopcion)) as opcion from DetPresupuestos2 as d left join presupuestos2 as p on (d.idpresupuesto=p.idpresupuesto) where p.idoportunidad='+edNumOpor.Text,0,dmreportes.sqlgeneral5);
            if dmreportes.sqlgeneral5.FieldByName('opcion').AsInteger=3 then
            begin
               //me trae el idactividad para poder modificar de realizado false a true
               querys('SELECT actividades_vendedores.idactividades FROM agenda_vendedores left JOIN actividades_vendedores ON (agenda_vendedores.idevento = actividades_vendedores.idevento) INNER JOIN tipos_actividades ON ' +
               '(actividades_vendedores.idtipo_actividad = tipos_actividades.idtipo_actividad) WHERE (agenda_vendedores.idoportunidad = '+edNumOpor.Text+') AND tipos_actividades.nombre = '+quotedstr('PRESUPUESTO'),0,sqlgeneral);
               //actualiza la tabla de actividades_vendedores el campo realizado
               querys('update actividades_vendedores set realizada = 1 where idactividades = '+sqlgeneral.Fields.Fields[0].AsString,1,SqlGeneral);
            end;
         end
         else
         begin
            //me trae el idactividad para poder modificar de realizado false a true
            querys('SELECT actividades_vendedores.idactividades FROM agenda_vendedores left JOIN actividades_vendedores ON (agenda_vendedores.idevento = actividades_vendedores.idevento) INNER JOIN tipos_actividades ON ' +
            '(actividades_vendedores.idtipo_actividad = tipos_actividades.idtipo_actividad) WHERE (agenda_vendedores.idoportunidad = '+edNumOpor.Text+') AND tipos_actividades.nombre = '+quotedstr('PRESUPUESTO'),0,sqlgeneral);
            //actualiza la tabla de actividades_vendedores el campo realizado
            querys('update actividades_vendedores set realizada = 1 where idactividades = '+sqlgeneral.Fields.Fields[0].AsString,1,SqlGeneral);
         end;
      end;
      // '+tipo+',idvendedor,FechaCreacion,TipoCambio,fecha,hora,usuario,tc,CostoXHrs
      querys('update presupuestos2 set '+tipo+'='+valor+',idvendedor='+cve_vend+',TipoCambio='+edtcp.Text+',CostoXHrs='+edCostoHoras.Text+',PresupDefault='+inttostr(rgPresupDefault.ItemIndex)+',idvendedor='+edcve_vend.Text+',comentarios='+quotedstr(mmcomentarios.text)+' where idpresupuesto='+edNumCotizacion.Text,1,sqlgeneral);
   end;
   //Revisa si se puede pasar a pedido
   //ExistePedido;
   querys('select presupuestos2.*,ifnull(FormasPagoPre.nombre,'''') as forma,FormasPagoPre.idopcion from '+
        'presupuestos2 left join FormasPagoPre on FormasPagoPre.idopcion = presupuestos2.idopcion '+
        'where idpresupuesto='+edNumCotizacion.Text,0,sqlgeneral);
   if sqlgeneral.RecordCount > 0 then
   begin
      //verifica si este presupuesto esta siendo usado en un pedido
      rgPresupDefault.ItemIndex := sqlgeneral.fieldbyname('PresupDefault').Asinteger;
      if querys('select idpedido from pedidos where idpresupuesto='+edNumCotizacion.Text,0,sqlgeneral) > 0 then
      begin
         lblpresupuesto.Visible := true;
         lblpresupuesto.Caption := 'Este presupuesto ha sido pasado al pedido '+sqlgeneral.fieldbyname('idpedido').AsString;
         btnmodificar.Enabled := false;
      end
      else
      begin
         if rgPresupDefault.ItemIndex <> -1 then
         begin
            querys('Select p.cod_cve from DetPresupuestos2 as p left join articulos as a on (p.cod_cve=a.cod_cve)'+
             'where idpresupuesto='+edNumCotizacion.Text+'  and a.status = 0', 0, sqlgeneral);
            if (sqlgeneral.RecordCount = 0) and (cbostatus.Text='CERRADA') then
               btnpasar.enabled := true;
         end;
      end;
   end;
end;

procedure tfrmpresupuestos2.limpia;
begin
   mmcomentarios.Text:='';
   mmcomentarios.Enabled := false;
   edcvecte.Clear;
   lblpresupuesto.Visible := false;
   rgPresupDefault.ItemIndex := -1;
   rgPresupDefault.Enabled := false;
   // btnguardar.Enabled := false;
   gbvendedor.Enabled := true;
   tspagos.TabVisible := false;
   tspagos.TabEnabled := false;
   cbostatus.Enabled := false;
   cbostatus.Text := '';
   //cboFormaPago.Text := '';
   edTotFinal.Clear;
   rgTipoSis.ItemIndex := -1;
   // lblsuma.Caption := '';
   dsoportunidades.DataSet.Close;
   edNumCotizacion.Enabled:=true;
   edNumCotizacion.Text:='';
   edcve_vend.Enabled:=false;
   CboNom_Vend.Enabled:=false;
   //cboFormaPago.Enabled := false;
   edTCP.Enabled:=false;
   gboportunidad.Enabled:=false;
   btnmodificar.Enabled:=false;
   btnborrar.Enabled:=false;
   btnalta.Caption:='&Alta';
   btnalta.Hint:='Dar de Alta un presupuesto';
   btncancelar.Caption:='&Cerrar';
   btncancelar.Hint:='Cerrar esta Ventana';
   btnalta.ImageIndex:=5;
   //btnborrar.Enabled:=true;
   //btnmodificar.Enabled:=true;
   edNumOpor.Clear;
   edcve_vend.clear;
   edtipopor.Clear;
   cbonom_vend.text := '';
   edtcp.clear;
   edfechacreacion.clear;
   edCostohoras.clear;
   PCPresup.TabIndex := 0;
   tspresupuesto.TabVisible := false;
   btnpasar.enabled := false;
   fpres.EliminaComponentes;
end;
{
procedure tfrmpresupuestos2.CargaPresup(Tipo:string);
var
i, ban:integer;
sqltemp: tmyquery;
begin
LimpiaTotales;
sqltemp := tmyquery.Create(self);
sqltemp.Connection := dmaccesos.conexion;
querys('select * from DetPresupuestos2 where idopcion='+Tipo+' and idpresupuesto='+
       edNumCotizacion.Text+' order by idconcepto',0,sqltemp);
EliminaComponentes;
CreaComponentes;

//llena los articulos del presupuesto
if sqltemp.RecordCount > 0 then
  begin
  sqltemp.first;
  while not sqltemp.Eof = true do
    begin
    ban := 0;
    for i:=0 to max do
      begin
      if etiqueta[i].Tag = (sqltemp.fieldbyname('idconcepto').Asinteger-1) then
        begin
        edcant[i].Text := sqltemp.fieldbyname('cant').AsString;
        edcantp[i].Text := sqltemp.fieldbyname('cant').AsString;
        combo[i].Text := sqltemp.fieldbyname('cod_cve').AsString;
        chtecla := #13;
        combo[i].OnKeyPress(combo[i],chtecla);
        ban := 1;
        end;
      end;
    if ban = 0 then
      begin
         {
      SetLength(combo,max+1);
      SetLength(etiqueta,max+1);
      SetLength(edtiempo,max+1);
      SetLength(edcant,max+1);
      SetLength(edcantp,max+1);
      SetLength(edmo,max+1);
      SetLength(edeq,max+1);
      SetLength(edcosto,max+1);
          }     {
      querys('select nombre from dptos where iddpto='+sqltemp.fieldbyname('idconcepto').Asstring+' order by nivel',0,sqlgeneral);
      crearenglon(max+1, sqltemp.fieldbyname('idconcepto').Asstring, sqlgeneral.fieldbyname('nombre').Asstring);
      max := max+1;
      edcant[max].Text := sqltemp.fieldbyname('cant').AsString;
      edcantp[max].Text := sqltemp.fieldbyname('cant').AsString;
      combo[max].Text := sqltemp.fieldbyname('cod_cve').AsString;
      chtecla := #13;
      combo[max].OnKeyPress(combo[max],chtecla);
      focuscolor(clRed, max);
      end;
     {
    combo[sqltemp.fieldbyname('idconcepto').Asinteger-1].Text := sqltemp.fieldbyname('cod_cve').AsString;
    chtecla := #13;
    combo[sqltemp.fieldbyname('idconcepto').Asinteger-1].OnKeyPress(combo[sqltemp.fieldbyname('idconcepto').Asinteger-1],chtecla);
    edcant[sqltemp.fieldbyname('idconcepto').Asinteger-1].Text := sqltemp.fieldbyname('cant').AsString;
    edcantp[sqltemp.fieldbyname('idconcepto').Asinteger-1].Text := sqltemp.fieldbyname('cant').AsString;}
   { sqltemp.Next;
    end;
  //btnmodificar.SetFocus;
  end
else
  begin
  if pPresupuesto.Enabled = true then
    begin
    querys('select * from DetPresupuestos2 where idopcion='+inttostr(strtoint(Tipo)-1)+' and idpresupuesto='+
           edNumCotizacion.Text,0,sqltemp);
    if sqltemp.RecordCount > 0 then
      begin
      if application.messagebox('Desea pasar los datos del presupuesto anterior a este?', 'Atencion', MB_ICONINFORMATION+MB_YESNO)=idyes then
        begin
        sqltemp.first;
        while not sqltemp.Eof do
          begin
          edcant[sqltemp.fieldbyname('idconcepto').Asinteger-1].Text := sqltemp.fieldbyname('cant').AsString;
          edcantp[sqltemp.fieldbyname('idconcepto').Asinteger-1].Text := sqltemp.fieldbyname('cant').AsString;
          combo[sqltemp.fieldbyname('idconcepto').Asinteger-1].Text := sqltemp.fieldbyname('cod_cve').AsString;
          chtecla := #13;
          combo[sqltemp.fieldbyname('idconcepto').Asinteger-1].OnKeyPress(combo[sqltemp.fieldbyname('idconcepto').Asinteger-1],chtecla);
          sqltemp.Next;
          end;
        if Tipo = '1' then
          btn100.enabled := true;
        end;// si
      end
    else
      begin
      if btnalta.Caption = '&Guardar' then
        begin
        querys('select * from PresupuestoDefault',0,sqltemp);
        //llena los articulos del presupuesto
        if sqltemp.RecordCount > 0 then
          begin
          sqltemp.first;
          while not sqltemp.Eof = true do
            begin
            for i:=0 to max do
              begin
              if etiqueta[i].Tag = (sqltemp.fieldbyname('idconcepto').Asinteger-1) then
                begin
                edcant[i].Text := sqltemp.fieldbyname('cant').AsString;
                edcantp[i].Text := sqltemp.fieldbyname('cant').AsString;
                combo[i].Text := sqltemp.fieldbyname('cod_cve').AsString;
                chtecla := #13;
                combo[i].OnKeyPress(combo[i],chtecla);
                end;
              end; //for
            sqltemp.Next;
            end; //while
           end; //if recordcount
        end;//guardar
      end;
    end;
  end;
end;
                  }
procedure tfrmpresupuestos2.TraeDatos;
  var sqlaux:tmyquery;
    pres:string;
begin
   pres:= edNumCotizacion.text;
   limpia;
   edNumCotizacion.text:= pres;
   fpres.nopres := pres;
   fpres.maxi := 0;
   tspresupuesto.enabled := true;
   sqlaux := tmyquery.Create(self);
   sqlaux.Connection := dmaccesos.conexion;
   querys('select presupuestos2.*,ifnull(FormasPagoPre.nombre,"") as forma,FormasPagoPre.idopcion from '+
       'presupuestos2 left join FormasPagoPre on FormasPagoPre.idopcion = presupuestos2.idopcion '+
       'where idpresupuesto='+edNumCotizacion.Text,0,sqlaux);
   //ExistePedido;
   if sqlaux.RecordCount > 0 then
   begin
      tspagos.TabVisible:=true;
      tspagos.TabEnabled := true;
      edcve_vend.Text:=sqlaux.fieldbyname('idvendedor').AsString;
      edCostoHoras.Text:=sqlaux.fieldbyname('CostoXHrs').AsString;
      edFechaCreacion.Text:=sqlaux.fieldbyname('FechaCreacion').AsString;
      edcvecte.Text:=sqlaux.fieldbyname('idcliente').AsString;
      ednumopor.Text := sqlaux.fieldbyname('idoportunidad').AsString;
      edtcp.Text := sqlaux.fieldbyname('TipoCambio').AsString;
      //cboFormaPago.Text := sqlaux.fieldbyname('forma').Asstring;
      //cboFormaPago.ItemIndex := sqlaux.fieldbyname('idopcion').Asinteger;
      //cboFormaPago.Text := cboformaPago.Items.Strings[sqlaux.fieldbyname('idopcion').Asinteger];
      edcve_vend.Text := sqlaux.fieldbyname('idvendedor').Asstring;
      mmcomentarios.Text := sqlaux.fieldbyname('comentarios').Asstring;
      querys('Select o.idoportunidad, t.nombre as tipo From oportunidades AS o left Join '+
          ' agenda_vendedores AS ag ON o.idoportunidad = ag.idoportunidad left Join tipo_oportunidad AS t '+
          ' ON ag.idtipo_oportunidad = t.idtipo_oportunidad Where o.idoportunidad ='+edNumOpor.Text,0,sqlgeneral);
      edtipopor.Text:=sqlgeneral.fieldbyname('tipo').AsString;
      fpres.oportunidad := ednumopor.text;
      fpres.TCP := edTCP.text;
      chtecla:=#13;
      edcve_vend.OnKeyPress(self,chtecla);
      chtecla:=#13;
      if ednumopor.Text <> '0' then
      begin
         ednumopor.OnKeyPress(self,chtecla);
         if ednumopor.Text = '' then
            exit;
         dsoportunidades.DataSet:=sqloportunidades;
      end
      else
      begin
         edcvecte.OnKeyPress(self,chtecla);
         cbostatus.Enabled := false;
      end;
      edcve_vend.Enabled := false;
      cbonom_vend.Enabled := false;
      gboportunidad.Enabled:=false;
      btnmodificar.Enabled:=true;
      btnborrar.Enabled:=true;
      if (btnalta.Caption = '&Guardar') or (btnmodificar.Caption = '&Guardar') then
         cbostatus.Enabled := true;

      //verifica si este presupuesto esta siendo usado en un pedido
      rgPresupDefault.ItemIndex := sqlaux.fieldbyname('PresupDefault').Asinteger;
      if querys('select idpedido from pedidos where idpresupuesto='+edNumCotizacion.Text,0,sqlgeneral) > 0 then
      begin
         lblpresupuesto.Visible := true;
         lblpresupuesto.Caption := 'Este presupuesto ha sido pasado al pedido '+sqlgeneral.fieldbyname('idpedido').AsString;
         btnmodificar.Enabled := false;
      end
      else
      begin
         if rgPresupDefault.ItemIndex <> -1 then
         begin
            querys('Select a.nombre from DetPresupuestos2 as p left join articulos as a on (p.cod_cve=a.cod_cve)'+
             ' where p.idpresupuesto='+edNumCotizacion.Text+'  and a.status=0 and p.idopcion='+inttostr(rgPresupDefault.ItemIndex), 0, sqlgeneral);
            if sqlgeneral.RecordCount = 0 then //era igual a 0
            begin
               if copy(edtipopor.Text,1,6)='EQUIPO' then
               begin
                  querys('select count(distinct(idopcion)) as opcion from DetPresupuestos2 where idpresupuesto='+
                  edNumCotizacion.Text+' group by idpresupuesto ', 0, sqlgeneral);
                  if sqlgeneral.FieldByName('opcion').asinteger=3 then
                  begin
                     if cbostatus.Text='CERRADA' then
                        btnpasar.enabled := true;
                  end;
               end
               else
               begin
                  if cbostatus.Text='CERRADA' then
                     btnpasar.enabled := true;
               end;
            end
            else
               application.MessageBox(pchar('El articulo "'+sqlgeneral.fieldbyname('nombre').AsString+'" No esta activo'),'Aviso',MB_OK+MB_ICONWARNING);
         end;
      end;
      //trae el estatus del evento
      querys('SELECT estatus_eventos.nombre FROM agenda_vendedores left JOIN estatus_eventos ON (agenda_vendedores.idestatus = estatus_eventos.idestatus) WHERE agenda_vendedores.idoportunidad = '+edNumOpor.Text,0,sqlgeneral);
      cbostatus.Text := sqlgeneral.fieldbyname('nombre').AsString;
      //fpres.tresbotones;
   end
   else
   begin
      application.MessageBox('Ese numero de Presupuesto no existe...!','Aviso',mb_iconinformation);
      edNumCotizacion.Text:='';
   end;
end;
        {
procedure tfrmpresupuestos2.EliminaComponentes;
var i:integer;

begin
btnlimpiar.onclick(self);
for i:=0 to max do
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
  
max := -1;
end;

procedure tfrmpresupuestos2.CreaComponentes;
var i:integer;
begin
querys('select * from dptos where estatus = 1 order by nivel',0,sqlgeneral);
max := sqlgeneral.RecordCount-1;
scroll.max:= round(max*1.4);
scroll.LargeChange := round(max/5);
scroll.SmallChange := round(max/5);
scroll.PageSize := round(((Max*24)/scroll.max)/3);
scroll.position := 0;

    //if scroll.PageSize < scroll.MinHeight then PageSize := MinHeight;

if sqlgeneral.RecordCount > 0 then
 begin
                   {
  SetLength(combo,sqlgeneral.RecordCount);
  SetLength(etiqueta,sqlgeneral.RecordCount);
  SetLength(edtiempo,sqlgeneral.RecordCount);
  SetLength(edcant,sqlgeneral.RecordCount);
  SetLength(edcantp,sqlgeneral.RecordCount);
  SetLength(edmo,sqlgeneral.RecordCount);
  SetLength(edeq,sqlgeneral.RecordCount);
  SetLength(edcosto,sqlgeneral.RecordCount);      }      {
  SetLength(combo,25);
  SetLength(etiqueta,25);
  SetLength(edtiempo,25);
  SetLength(edcant,25);
  SetLength(edcantp,25);
  SetLength(edmo,25);
  SetLength(edeq,25);
  SetLength(edcosto,25);

  //for i:=0 to sqlgeneral.RecordCount-1 do
  for i:=0 to max do
    begin
    crearenglon(i, sqlgeneral.fieldbyname('iddpto').AsString, sqlgeneral.fieldbyname('nombre').AsString);
    sqlgeneral.Next;
    end;
  end;
end;            }

procedure Tfrmpresupuestos2.OnDblClick(Sender: Tobject);
begin
 chtecla := #13;
 combo[(sender as trzcombobox).Tag].OnKeyPress(sender,chtecla);
end;
             {
procedure Tfrmpresupuestos2.KeyPressCbo(Sender: TObject;var Key: Char);
begin
if key = #13 then
  begin
  if combo[(sender as trzcombobox).tag].Text <> '' then
    begin
    //aqui busca el articulo por codigo de barras o por clave
    querys('select tinstalacion,precioa,cod_cve From articulos where cod_cve='+quotedstr(combo[(sender as trzcombobox).tag].Text)+ ' or cod_barras='+quotedstr(combo[(sender as trzcombobox).tag].Text),0,SqlGeneral);
    if SqlGeneral.RecordCount = 0 then
      begin
      application.MessageBox('No existe ningun Articulo con esa Clave...!','Aviso',mb_iconinformation);
      combo[(sender as trzcombobox).tag].SelectAll;
      edcosto[(sender as trzcombobox).Tag].Clear;
      edcant[(sender as trzcombobox).Tag].Clear;
      edcantp[(sender as trzcombobox).Tag].Clear;
      edtiempo[(sender as trzcombobox).Tag].Clear;
      edmo[(sender as trzcombobox).Tag].Clear;
      edeq[(sender as trzcombobox).Tag].Clear;
      end
    else
      begin
      edtiempo[(sender as trzcombobox).Tag].text := sqlgeneral.fieldbyname('tinstalacion').asstring;
      edcosto[(sender as trzcombobox).Tag].Text := sqlgeneral.fieldbyname('precioa').asstring;
      if ((sender as trzcombobox).Tag+1) <= max then
        edcant[(sender as trzcombobox).Tag+1].Enabled := true;
      chtecla := #13;
      if edcant[(sender as trzcombobox).Tag].Text <> '' then
        edcant[(sender as trzcombobox).Tag].OnChange(edcant[(sender as trzcombobox).Tag]);
      end;
    end;
     //muestra el presupuesto     //esta habilitado
  if (pcpresup.TabIndex = 1) and (ppresupuesto.enabled = true) then
    if (edcant[(sender as trzcombobox).tag].tag+2 <= max+1) then
      begin
      if (edcant[(sender as trzcombobox).tag+1].enabled = true) then
        edcant[(sender as trzcombobox).tag+1].SetFocus;
      end
    else
      btnsave.setfocus;
  end;
end;

procedure Tfrmpresupuestos2.OnNoEnLista(Sender: Tobject);
begin
combo[(sender as trzcombobox).tag].text := '';
end;

procedure Tfrmpresupuestos2.KeyPressCant(Sender: TObject;
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

procedure tfrmpresupuestos2.CalculaTotales;
var i:integer;
begin
edTotHrs.Text := '0';edTotEq.Text := '0';edTotMo.Text := '0';
edSubTotal.Text := '0';edIva.Text := '0';edTotal.Text := '0';
for i:=0 to max do
 begin
  if edeq[i].Text <> '' then
   edTotEq.Text := Format('%8.2f',[strtofloat(edTotEq.Text)+strtofloat(edeq[i].Text)]);
  if edmo[i].Text <> '' then
   edTotHrs.Text := Format('%8.2f',[strtofloat(edTotHrs.Text)+strtofloat(edmo[i].Text)]);
 end;
edTotMo.Text := Format('%8.2f',[strtofloat(edTotHrs.Text)*15]);
edSubTotal.Text := Format('%8.2f',[strtofloat(edTotMo.Text)+strtofloat(edTotEq.Text)]);//+strtofloat(edPresupAnt.Text);
edIva.Text := Format('%8.2f',[strtofloat(edSubTotal.Text)*0.1]);
edTotal.Text := Format('%8.2f',[(strtofloat(edSubTotal.Text)+strtofloat(edIva.Text))]);
end;

procedure Tfrmpresupuestos2.OnChangeCant(Sender: Tobject);
begin
if (sender as trzedit).Text <> '' then
 begin
  try
   strtofloat(edcant[(sender as trzedit).Tag].Text);
   querys('select precioa from articulos where cod_cve='+quotedstr(combo[(sender as trzedit).Tag].Text),0,sqlgeneral);
   edmo[(sender as trzedit).Tag].Text:=floattostr(strtofloat(edtiempo[(sender as trzedit).Tag].Text)*strtofloat(edcant[(sender as trzedit).Tag].Text));
   edeq[(sender as trzedit).Tag].Text:=floattostr(sqlgeneral.fieldbyname('precioa').AsFloat*strtofloat(edcant[(sender as trzedit).Tag].Text));
   edcantp[(sender as trzedit).tag].text := edcant[(sender as trzedit).tag].text;
   CalculaTotales;
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
  CalculaTotales;
 end;
end;

procedure Tfrmpresupuestos2.CargaCbo(sql,tabla : string;combo : TRzComboBox;edt:trzedit);
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
end;         }


procedure Tfrmpresupuestos2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
querys('drop table if exists tmpPT'+frmprincipal.idmaq,1,sqlgeneral);
action := cafree;
end;          {

procedure Tfrmpresupuestos2.CreaEdit(var ed: array of trzedit;l,t,w,num:integer;nom:string);
begin
ed[num] := trzedit.Create(self);
if nom = 'edcant'+inttostr(num) then
  ed[num].Parent := pPresupuesto
else
  ed[num].Parent := PPresDet;
ed[num].Left := l;
ed[num].Top := t;
ed[num].Name := nom;
ed[num].Width := w;
ed[num].Tag := num;
ed[num].DisabledColor := clwhite;
ed[num].FrameHotTrack := true;
end;

procedure Tfrmpresupuestos2.CreaCombo(var cbo: array of trzComboBox;l,t,w,num:integer;nom:string);
begin
cbo[num]:= trzComboBox.Create(self);
cbo[num].Parent := pPresupuesto;
cbo[num].Left := l;
cbo[num].Top := t;
cbo[num].Name := nom;
cbo[num].Width := w;
cbo[num].Tag := num;
cbo[num].DisabledColor := clwhite;
cbo[num].enabled := true;
end;

procedure Tfrmpresupuestos2.lbls(var lbl: array of trzlabel;l,t,w,num:integer;nom,cap:string);
begin
lbl[num] := trzlabel.Create(self);
lbl[num].Parent := pPresupuesto;
lbl[num].Left := l;
lbl[num].Top := t;
lbl[num].Name := nom;
lbl[num].Width := w;
lbl[num].Caption := cap;
lbl[num].Visible := true;
lbl[num].tag := num;//sqlgeneral.fieldbyname('iddpto').asinteger;
end;            }

procedure Tfrmpresupuestos2.Edcve_vendChange(Sender: TObject);
begin
if edcve_vend.Text = '' then
cbonom_vend.Text:='';
end;

procedure Tfrmpresupuestos2.Edcve_vendKeyPress(Sender: TObject;
  var Key: Char);
begin
if (edcve_vend.Text<>'')and(key=#13) then
 begin
  try
   strtoint(edcve_vend.Text);
   //aqui me trae la clave del vendedor y su nombre ya sea que hallan tecleado su nombre,rfc,#vendedor en el rzedcve_vend                                                                                                                        //puestos.nombre = '+quotedstr('VENDEDOR')+' AND
   querys('SELECT usuarios.estatus,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre,idusuario FROM usuarios left JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) '+
          ' WHERE usuarios.idusuario='+EdCve_Vend.Text,0,SqlGeneral);
  except
   //aqui me trae la clave del vendedor y su nombre ya sea que hallan tecleado su nombre,rfc,#vendedor en el rzedcve_vend                                                                                                                       //puestos.nombre = '+quotedstr('VENDEDOR')+' AND
   querys('SELECT usuarios.estatus,concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre,idusuario FROM usuarios left JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE usuarios.codigo='+quotedstr(EdCve_Vend.Text),0,SqlGeneral);
  end;
  key:=#0;
 if SqlGeneral.RecordCount > 0 then
  begin
  CboNom_Vend.Text := SqlGeneral.fieldbyname('nombre').AsString;
  edcve_vend.Text :=SqlGeneral.fieldbyname('idusuario').AsString;
  end
 else
  begin
   if application.MessageBox('Esa Clave de Vendedor no se encontro deseas buscarlo!','Error',mb_yesno+mb_iconInformation) = idyes then
    begin
     frmbusquedas.query:='Select u.idusuario,u.codigo,concat(if (u.nombre is null,'' '',u.nombre),'' '', if (u.apaterno is null,'' '',u.apaterno),'' '',if (u.amaterno is null,'' '',u.amaterno)) as Nombre,u.idsector as Sector, '+
                         'a.nombre as Area,p.nombre as Puesto From usuarios as u LEFT JOIN areas as a ON (a.idarea=u.idarea) LEFT JOIN puestos as p ON (p.idpuesto=u.idpuesto) WHERE u.estatus = 1 order by u.codigo';
     frmbusquedas.campo_retorno:='codigo';
     frmbusquedas.campo_busqueda:='codigo';
     frmbusquedas.tblorigen := 'usuarios';
     frmbusquedas.ShowModal;
     if frmbusquedas.resultado <> '' then
      begin
       edcve_vend.Text := frmbusquedas.resultado;
       chtecla:=#13;
       edcve_vend.OnKeyPress(self,chtecla);
      end;
     end
    else
     begin
      edcve_vend.Text:='';
     end;
    end;
   end;
if key = #13 then
 begin
  key := #0;
  cbonom_vend.SetFocus;
 end;
end;

procedure Tfrmpresupuestos2.cbonom_vendChange(Sender: TObject);
begin
if cbonom_vend.Text = '' then
 edcve_vend.Text:='';
end;

procedure Tfrmpresupuestos2.cbonom_vendClick(Sender: TObject);
begin
querys('SELECT usuarios.idusuario FROM usuarios left JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) WHERE  (usuarios.estatus = 1 and concat(ifnull(usuarios.nombre,'' ''),'' '',ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) ='+quotedstr(cbonom_vend.Text)+')',0,SqlGeneral);
edcve_vend.Text:=SqlGeneral.fieldbyname('idusuario').AsString;
end;

procedure Tfrmpresupuestos2.cbonom_vendKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
begin
 key := #0;
 SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
end;
end;

procedure Tfrmpresupuestos2.FormShow(Sender: TObject);
begin
   PCPresup.ActivePageIndex := 0;
   edNumCotizacion.setfocus;
   max := -1;
   //lblsuma.Caption := '';
   tspresupuesto.TabVisible := false;
   //tspagos.TabVisible := false;
   tspagos.TabVisible := true;
   //carga los vendedores                                                                                                                                                                                                                             puestos.nombre = '+quotedstr('VENDEDOR')+' AND
   CargaCombo('SELECT usuarios.idusuario,concat(ifnull(usuarios.nombre,'' ''),'' '','+
              ' ifnull(usuarios.apaterno,'' ''),'' '',ifnull(usuarios.amaterno,'' '')) AS Nombre '+
              ' FROM usuarios left JOIN puestos ON (usuarios.idpuesto = puestos.idpuesto) '+
              ' WHERE  usuarios.estatus = 1 order by usuarios.nombre','Vendedores',cboNom_Vend);
   //asigna los estatus de evenos al combo
   //CargaCombo('select nombre from estatus_eventos where finaliza <> ''''','Estatus de Eventos',cbostatus);
   cbostatus.Items.Clear;
   cbostatus.Items.Add('CERRADA');
   cbostatus.Items.Add('PENDIENTE');
   //carga el combo de opciones de pago
   //CargaCombo('select nombre from FormasPagoPre order by parcialidades','Formas de Pago',cboFormaPago);
   //cboFormaPago.Tag := 0;
   {querys('select GuardaPresDefault from usuarios  as u left join UCTabUsers as uc on(uc.UCIdUser=u.idusuario) '+
          'where  UCLogin = "'+frmprincipal.ucprincipal.CurrentUser.loginname+'"', 0, sqlgeneral);
   if sqlgeneral.FieldByName('GuardaPresDefault').AsBoolean = True then}
   if DerechosSys('Guarda Presupuesto Default') = true then
      Fpres.btnSvDefault.visible := true
   else
      Fpres.btnSvDefault.visible := false;
end;

procedure Tfrmpresupuestos2.btnaltaClick(Sender: TObject);
begin
   if btnalta.Caption='&Alta' then
   begin
      limpia;
      fpres.LimpiaTotales;
      fpres.edicion := true;
      //  fpres.enabled := true;
      ednumopor.enabled :=true;
      tspresupuesto.tabVisible := false;
      edFechaCreacion.text:=datetostr(date);
      chtecla:=#13;

      //trae el ultimo numero de cotizacion
      querys('select max(idpresupuesto) from presupuestos2',0,SqlGeneral);
      edNumCotizacion.Text:=inttostr(SqlGeneral.Fields.Fields[0].AsInteger + 1);
      querys('insert into presupuestos2(idpresupuesto,FechaCreacion,fecha,hora,usuario) '+
          'values ('+edNumcotizacion.Text+','+quotedstr(datetostr(FechaServidor))+','+quotedstr(datetostr(FechaServidor))+','+
          quotedstr(timetostr(HoraServidor))+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+')',1,SqlGeneral);
      fpres.nopres :=  edNumCotizacion.Text;
      btnalta.Caption:='&Guardar';
      btnalta.Hint:='Guardar los datos de la alta';
      btnalta.ImageIndex:=1;
      btncancelar.Caption:='&Cancelar';
      btncancelar.Hint:='Cancelar la Alta';
      gbvendedor.Enabled:=true;
      btnborrar.Enabled:=false;
      btnmodificar.Enabled:=false;
      ednumcotizacion.Enabled:=false;
      sqloportunidades.Close;
      rgPresupDefault.Enabled := true;
      edcve_vend.Enabled := true;
      cbonom_vend.Enabled := true;
      //cboFormaPago.Enabled := true;
      {pPresupuesto.Enabled := true;
      btnsave.Enabled := true;
      btnlimpiar.Enabled := true;
      potros.enabled:= false;
      btn100.enabled:=false;}
      //cboformapago.ItemIndex := 0;
      //cboformapago.OnClick(self);
      edNumOpor.SetFocus;
   end
   ////guardar////
   else
   begin
      if dsoportunidades.DataSet.RecordCount > 0 then
      begin
         if (edcve_vend.Text='') or (cbonom_vend.Text='') then
         begin
            application.MessageBox('Debe de especificar el vendedor','Aviso',mb_iconinformation);
            cbonom_vend.DroppedDown:=true;
            exit;
         end;
         GuardaEncabezado;
         if pcpresup.TabIndex = 1 then
            fpres.GuardaDetalle;
         querys('select idUnidadNegocio from tipo_oportunidad where nombre="'+edtipopor.Text+'"',0,DMREPORTES.sqlgeneral);
         if dmreportes.sqlgeneral.FieldByName('idUnidadNegocio').asstring='1' then
         begin
            querys('select count(distinct(idopcion)) as opcion from DetPresupuestos2 where idpresupuesto='+
            edNumCotizacion.Text+' group by idpresupuesto ', 0, sqlgeneral);
            if sqlgeneral.FieldByName('opcion').asinteger <> 3 then
            begin
               application.MessageBox('No se han Guardado los 3 Presupuestos!!!','Aviso',MB_OK+MB_ICONWARNING);
               exit;
            end;
         end;
         fpres.edicion := false;
         ednumopor.enabled :=false;
         tspresupuesto.tabVisible := false;
         btnmodificar.Enabled:=true;
         btnborrar.Enabled:=true;
         potros.enabled:= false;
         btnalta.Caption:='&Alta';
         btnalta.Hint:='Dar de Alta un presupuesto';
         btncancelar.Caption:='&Cerrar';
         btncancelar.Hint:='Cerrar esta Ventana';
         btnalta.ImageIndex:=5;
         PCPresup.ActivePageIndex := 0;
      end;
end;
// fpres.tresbotones;
// fpres.habilita;
end;

procedure Tfrmpresupuestos2.btnmodificarClick(Sender: TObject);
begin
//sync
   {if ConectadaServidor = false then
   if querys('Select Sincronizado from presupuestos2 where idpresupuesto = '+ednumcotizacion.text+' and Sincronizado = 1', 0, sqlgeneral) = 0 then
    begin
    application.MessageBox('Necesita conectarse al servidor para realizar cambios', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;
    }
   if btnmodificar.Caption = '&Editar' then
   begin
      //verifica que no exista
      querys('select idpresupuesto from pedidos where idpresupuesto='+ednumcotizacion.Text,0,sqlgeneral);
      if sqlgeneral.RecordCount = 0 then
      begin
         //CboFormaPago.Enabled := true;
         fpres.edicion := true;
         btnmodificar.Caption:='&Guardar';
         btncancelar.Caption:='&Cancelar';
         btncancelar.Hint:='Cancelar la Edición';
         btnmodificar.hint:='Guarda los Cambios Realizados';
         btnmodificar.ImageIndex:=1;
         tspresupuesto.TabVisible := true;
         tspresupuesto.Enabled := true;
         mmcomentarios.Enabled := true;
         //verifica si se hizo algun presupuesto para habilitar el tspagos
         querys('select * from DetPresupuestos2 where idpresupuesto='+edNumCotizacion.Text,0,sqlgeneral);
         if sqlgeneral.RecordCount > 0 then
         begin
            tspagos.TabVisible := true;
            tspagos.TabEnabled := true;
            cbostatus.Enabled := true;
         end;
         btnalta.Enabled := false;
         btnborrar.Enabled := false;
         gbvendedor.Enabled := true;
         edcve_vend.Enabled := true;
         edTCP.Enabled:=true;
         cbonom_vend.Enabled := true;
         sontres;
         edNumCotizacion.Enabled := false;
         fpres.pnlpresup.enabled := true;
         fpres.ppaquete.enabled:=true;
         fpres.btnsave.Enabled := true;
         fpres.btnlimpiar.Enabled := true;
         ednumopor.enabled :=false;
         if ednumopor.Text <> '0' then
            ednumopor.Enabled:=true
         else
            edcvecte.Enabled:=true;
      end
      else
         application.MessageBox('No puede modificar este presupuesto, ya que se ha ligado con un Pedido!','Aviso',mb_iconinformation);
   end
   //////////guardar///////////////////////
   else
   begin
      btncancelar.Caption:='&Cerrar';
      btnmodificar.Caption:='&Editar';
      btncancelar.Hint:='Cerrar esta Pantalla';
      btnmodificar.hint:='Editar los datos del presupuesto Actual';
      btnmodificar.ImageIndex:=2;
      btnalta.Enabled:=true;
      btnborrar.Enabled:=true;
      frmprincipal.ucprincipal.Log('Edito el presupuesto '+ednumcotizacion.Text,2);
      gbvendedor.Enabled := false;
      edcve_vend.Enabled := false;
      edTCP.Enabled:=false;
      cbonom_vend.Enabled := false;
      gboportunidad.Enabled := false;
      GuardaEncabezado;
      if pcpresup.TabIndex = 1 then
         fpres.GuardaDetalle;
      //      fpres.enabled := false;
      fpres.edicion := false;
      edNumCotizacion.Enabled := true;
      potros.enabled:= false;
      //pPresupuesto.enabled:= false;
      fpres.pnlpresup.enabled:= false;
      fpres.ppaquete.enabled:=false;
      fpres.btnlimpiar.enabled := false;
      fpres.btnsave.enabled := false;
      btnborrar.Enabled:=true;
      btnmodificar.Enabled:=true;
   end;
   fpres.tresbotones;
   fpres.habilita;
end;

procedure Tfrmpresupuestos2.edNumOporButtonClick(Sender: TObject);
begin
if edNumOpor.Text = '' then
 begin
  frmbusquedas.query:='SELECT distinct agenda_vendedores.idoportunidad, '+
                      ClienteNombre('oportunidades')+
                      ' as Oportunidad,concat(usuarios.nombre,'' '',usuarios.apaterno,'' '',usuarios.amaterno) as Vendedor, cuenta FROM agenda_vendedores left JOIN actividades_vendedores ON (agenda_vendedores.idevento = ' +
                      ' actividades_vendedores.idevento) left JOIN tipos_actividades ON (actividades_vendedores.idtipo_actividad = tipos_actividades.idtipo_actividad)  left JOIN oportunidades ON (agenda_vendedores.idoportunidad = ' +
                      ' oportunidades.idoportunidad) left JOIN usuarios ON (agenda_vendedores.idvendedor = usuarios.idusuario) WHERE tipos_actividades.nombre = '+quotedstr('PRESUPUESTO')+' order by idoportunidad desc' ;

  frmbusquedas.campo_busqueda:='Oportunidad';
  frmbusquedas.campo_retorno:='idoportunidad';
  frmbusquedas.tblorigen := 'oportunidades';
  frmbusquedas.tabla:='oportunidades';
  frmbusquedas.ShowModal;
  if frmbusquedas.resultado <> '' then
   begin
    chtecla:=#13;
    edNumOpor.Text:=frmbusquedas.resultado;
    edNumOpor.OnKeyPress(self,chtecla);
   end;
 end
else
 edNumOpor.OnKeyPress(self,chtecla);
end;

procedure Tfrmpresupuestos2.edNumOporChange(Sender: TObject);
begin
if ednumopor.Text='' then
  begin
   edcvecte.Enabled:=true;
   dsoportunidades.DataSet.Close;
   tspresupuesto.tabVisible := false;
   edcve_vend.Clear;
   cbonom_vend.Text := '';
  end
else
  edcvecte.Enabled:=false;
end;

procedure Tfrmpresupuestos2.edNumOporKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key = #13) and (edNumOpor.Text<>'') then
  begin
  key:=#0;
  //trae los datos de la oportunidad dependiendo del idoportunidad
  sqloportunidades.Close;
  sqloportunidades.ParamByName('idoportunidad').AsInteger:=strtoint(edNumOpor.text);
  sqloportunidades.Open;
  dsoportunidades.DataSet:=sqloportunidades;
  querys('Select o.idoportunidad, t.nombre as tipo From oportunidades AS o left Join agenda_vendedores AS ag ON o.idoportunidad = ag.idoportunidad left Join tipo_oportunidad AS t ON ag.idtipo_oportunidad = t.idtipo_oportunidad Where o.idoportunidad ='+edNumOpor.Text,0,sqlgeneral);
  edtipopor.Text:=sqlgeneral.fieldbyname('tipo').AsString;
  if sqloportunidades.RecordCount = 0 then
    begin
    application.MessageBox('Ese numero de oportunidad no existe o no se le ha dado un estatus de Aceptada o Presupuesto','Aviso',mb_iconinformation);
    edNumOpor.Text:='';
    tspresupuesto.tabVisible := false;
    exit;
    end
  else
    begin
    querys('Select count(idpresupuesto) as tot from DetPresupuestos2 where idpresupuesto ='+edNumCotizacion.text, 0, sqlgeneral);
    if sqlgeneral.recordcount > 0 then
      begin
      tspresupuesto.tabVisible := true;
      //tspresupuesto.TabEnabled := true;
      fpres.pnlpresup.Enabled := true;
      fpres.ppaquete.enabled:=true;
      fpres.btnlimpiar.enabled := true;
      fpres.btnsave.enabled := true;
      end;
    //trae el estatus del evento
    querys('SELECT estatus_eventos.nombre FROM agenda_vendedores left JOIN estatus_eventos ON (agenda_vendedores.idestatus = estatus_eventos.idestatus) WHERE agenda_vendedores.idoportunidad = '+edNumOpor.Text,0,sqlgeneral);
    cbostatus.Text := sqlgeneral.fieldbyname('nombre').AsString;

    if btnalta.caption = '&Guardar' then
      begin
      edCve_Vend.Text:=sqloportunidades.fieldbyname('idvendedor').AsString;
      chtecla:=#13;
      edCve_Vend.OnKeyPress(self,chtecla);
      if btncancelar.Caption<>'&Cerrar' then
        begin
        edCve_Vend.Enabled:=true;
        CboNom_Vend.Enabled:=true;
        end;
      end
    else
      if (edCve_Vend.Text = '') and (cbonom_vend.Text = '') then
        begin
        edCve_Vend.Text:=sqloportunidades.fieldbyname('idvendedor').AsString;
        chtecla:=#13;
        edCve_Vend.OnKeyPress(self,chtecla);
        edCve_Vend.Enabled:=true;
        CboNom_Vend.Enabled:=true;
        end;
     end;
   end;
 if (key=#13) and (edNumOpor.Text='') then
    edNumOpor.Buttons.Button.Click;
 if ((key < #48) or (key > #57))and (key<>#8) then
     key:=#0;
end;

procedure Tfrmpresupuestos2.edcvecteButtonClick(Sender: TObject);
begin
frmbusquedas.query:='Select idcliente,nombre,apaterno,amaterno,rsocial AS Razon_Social,dir as Direccion,numero as Numero,ciudad as Ciudad, ' +
                    ' estado as Estado,usuario as Usuario,fecha as Fecha,hora as Hora From clientes order by idcliente';
frmbusquedas.campo_retorno:='idcliente';
frmbusquedas.campo_busqueda:='Nombre';
frmbusquedas.tabla:='clientes';
frmbusquedas.tblorigen := 'clientes';
frmbusquedas.cbofiltro.ItemIndex:=1;
frmbusquedas.cbofiltro.OnClick(self);
frmbusquedas.ShowModal;
if frmbusquedas.resultado <> '' then
 begin
  chtecla:=#13;
  edcvecte.Text:=frmbusquedas.resultado;
  edcvecte.OnKeyPress(self,chtecla);
 end;
end;

procedure Tfrmpresupuestos2.edcvecteChange(Sender: TObject);
begin
if edcvecte.Text='' then
 begin
  ednumopor.Enabled:=true;
  dsoportunidades.DataSet.Close;
  tspresupuesto.tabVisible := false;
  edcve_vend.Clear;
  cbonom_vend.Text := '';
 end
else
 begin
  tspresupuesto.tabVisible := true;
  ednumopor.Enabled:=false;
 end;
end;

procedure Tfrmpresupuestos2.edcvecteKeyPress(Sender: TObject;
  var Key: Char);
begin
  if key=#13 then begin
     key:=#0;
      if edcvecte.Text <> '' then
        begin
         sqlclientes.Close;
         sqlclientes.Params.Items[0].Value:=strtoint(edcvecte.Text);
         sqlclientes.Open;
         if sqlclientes.RecordCount=0 then
           begin
             tspresupuesto.tabVisible := false;
             application.MessageBox('No existe ningun cliente con ese numero de cuenta!','Aviso',mb_iconinformation);
             edcvecte.Text:='';
             edcvecte.SetFocus;
           end
         else
          begin
          tspresupuesto.tabVisible := true;
         { if (btnalta.Caption = '&Guardar') or (btnmodificar.Caption = '&Guardar') then
           begin
            //cboTipoPresup.Enabled := true;
          //  btnguardar.Enabled := true;
           end;  }
          dsoportunidades.DataSet:=sqlclientes;
          if (sqlclientes.fieldbyname('idvendedor').Asinteger>0)and(edcve_vend.Text='') then begin
           edcve_vend.Text:=sqlclientes.fieldbyname('idvendedor').AsString;
           chtecla:=#13;
           edcve_vend.OnKeyPress(self,chtecla);
          end;
          if edcve_vend.Text='' then
           begin
            edcve_vend.Enabled:=true;
            cbonom_vend.Enabled:=true;
            edcve_vend.Clear;
            cbonom_vend.Text:='';
           end;

         end;
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

procedure Tfrmpresupuestos2.btncancelarClick(Sender: TObject);
var i:integer;
begin
   if btncancelar.Caption='&Cancelar' then
   begin
      btncancelar.Hint:='Cerrar esta Pantalla';
      btncancelar.Caption:='&Cerrar';
      potros.enabled:= false;
      // fpres.tresbotones;
      fpres.edicion := false;
      //fpres.enabled := false;
      if btnmodificar.Enabled then
      begin
         btnmodificar.Caption:='&Editar';
         btnmodificar.hint:='Editar los datos del Presupuesto Actual';
         btnmodificar.ImageIndex:=2;
         gbvendedor.Enabled:=true;
         edcve_vend.Enabled:=false;
         cbonom_vend.Enabled:=false;
         edTCP.Enabled:=false;
         edNumCotizacion.Enabled:=true;
         gboportunidad.Enabled:=false;
         //limpia;
      end;
      if btnalta.Enabled then
      begin
         btnalta.Caption:='&Alta';
         btnalta.Hint:='Dar de Alta un Presupuesto';
         btnalta.ImageIndex:=5;
         //sync
         if edNumOpor.Text <> '' then
           begin
           //borra la tabla DetPresupuestos2
           querys('delete from DetPresupuestos2 where idpresupuesto='+edNumCotizacion.Text,1,sqlgeneral);
           //elimina de la tabla presupuestos2
           querys('delete from presupuestos2 where idpresupuesto='+edNumCotizacion.Text,1,sqlgeneral);
           //cambia el estatus de la actividad a no realizada
           querys('SELECT actividades_vendedores.idactividades FROM agenda_vendedores left JOIN actividades_vendedores ON (agenda_vendedores.idevento = actividades_vendedores.idevento) INNER JOIN tipos_actividades ON ' +
                   '(actividades_vendedores.idtipo_actividad = tipos_actividades.idtipo_actividad) WHERE (agenda_vendedores.idoportunidad = '+edNumOpor.Text+') AND tipos_actividades.nombre = '+quotedstr('PRESUPUESTO'),0,sqlgeneral);
           querys('update actividades_vendedores set realizada = 0 where idactividades = '+sqlgeneral.Fields.Fields[0].AsString,1,SqlGeneral);
           end;
         gboportunidad.Enabled := false;
         edcve_vend.Enabled := false;
         edTCP.Enabled := false;
         limpia;
         fpres.LimpiaTotales;
         tspagos.TabVisible := false;
      end;
      if fpres.maxi > 0 then
         fpres.EliminaComponentes;
      ednumopor.enabled :=false;
      //  {ppresupuesto.enabled:=false;
      fpres.pnlpresup.enabled:=false;
      fpres.ppaquete.enabled:=false;
      fpres.btnlimpiar.enabled := true;
      fpres.btnsave.enabled := false;
      querys('select count(idpresupuesto) as p from presupuestos2',0,sqlgeneral);
      if sqlgeneral.FieldByName('p').AsInteger = 0 then
         gbvendedor.Enabled:=false
      else
         gbvendedor.Enabled:=true;
      btnalta.Enabled:=true;
      fpres.habilita;
      Pcpresup.ActivePageIndex := 0;
   end
   else
   begin
      if BuscaForma(Tfrmprospectos.ClassName)=1 then
      begin
         for i:=0 to screen.FormCount-1 do
         begin
            if screen.Forms[i].Name='frmprospectos' then
            begin
               screen.Forms[i].Release;
               exit;
            end;
         end;
      end;
      if BuscaForma(Tfrmasig_even_vend.ClassName)=1 then
      begin
         for i:=0 to screen.FormCount-1 do
         begin
            if screen.Forms[i].Name='frmasig_even_vend' then
            begin
               screen.Forms[i].Release;
               exit;
            end;
         end;
      end
      else
         Release;
   end;
end;

procedure Tfrmpresupuestos2.edNumCotizacionButtonClick(Sender: TObject);
var codigo:word;
begin
   limpia;
   codigo:=66;
   self.OnKeyUp(self,codigo,[ssCtrl])
end;

procedure Tfrmpresupuestos2.btnGuardarClick(Sender: TObject);
begin
{if cbotipopresup.Text <> '' then
 begin            }
 { if (btnalta.Caption = '&Guardar') or (btnmodificar.Caption = '&Guardar') then
   begin
    tspagos.TabVisible := true;
    tspagos.TabEnabled := true;
    GuardaEncabezado;
    GuardaDetalle;
    cbostatus.Enabled := true;
   end
// end;   }
end;

procedure Tfrmpresupuestos2.edTotFinalKeyPress(Sender: TObject;
  var Key: Char);
begin
key := ValidaNumeros(key,true);
end;

procedure Tfrmpresupuestos2.rgTipoSisClick(Sender: TObject);
var sqltemp : tmyquery;
   importe,porcentaje,parcialidad,acum:double;
   i : integer;
begin
   querys('select round(sum((dp.cant*dp.costo) + (dp.cant*dp.tiempo*'+edcostohoras.text+')),2)  as subTotal, '+
       'round((sum((dp.cant*dp.costo) + (dp.cant*dp.tiempo*'+edcostohoras.text+')))*'+floattostr(GetIVA)+',2)  as Iva, '+
       'round((sum((dp.cant*dp.costo) + (dp.cant*dp.tiempo*'+edcostohoras.text+')))*'+floattostr(GetIVA+1)+',2)  as Total '+
       'from DetPresupuestos2 as dp left join presupuestos2 as p on p.idpresupuesto=dp.idpresupuesto '+
       'where dp.idpresupuesto='+edNumCotizacion.Text+' and dp.idopcion = '+inttostr(rgTipoSis.ItemIndex)+' '+
       'and dp.cod_cve not in ('+GetConfiguraciones('InvalidaCalcPres', false)+') group by dp.idopcion', 0, sqlgeneral);
   //aNTES estaba sin iva , lo modifique no le entendia jijiji , eEdwin
   edTotFinal.Text := format('%8.2f',[sqlgeneral.FieldByName('Total').AsFloat]);
   //creamos query temporal
   sqltemp := tmyquery.Create(self);
   sqltemp.Connection := dmaccesos.conexion;
   //importe := strtofloat(edTotFinal.Text);
   importe := sqlgeneral.FieldByName('Total').AsFloat;
   EliminaEncabezadosYRejillas;
   //consulta la cantidad de Formas de Pago yreserva memoria para los arreglos
   querys('select * from FormasPagoPre order by idopcion',0,sqltemp);
   CreaPagos(sqltemp);
   sqltemp.first;
   //Crea e inicializa la tabla de pagos
   SetLength(sg,sqltemp.RecordCount);
   SetLength(encabezados,sqltemp.RecordCount);
   //recorremos la query y creamos etiquetas y rejillas con datos
   while not sqltemp.Eof do
   begin
      //parcialidad := importe;
      acum := 0;
      porcentaje := sqltemp.fieldbyname('porcentaje').AsFloat;
      parcialidad := importe+((importe)*(porcentaje/100));
      if sqltemp.fieldbyname('parcialidades').Asinteger <> 0 then
         parcialidad := parcialidad/(sqltemp.fieldbyname('parcialidades').Asinteger+1);
      parcialidad := strtofloat(format('%8.2f',[parcialidad]));
      //crea etiquetas de encabezados para las rejillas
      encabezados[sqltemp.RecNo-1] := trzlabel.Create(self);
      encabezados[sqltemp.RecNo-1].Parent := tspagos;
      encabezados[sqltemp.RecNo-1].Top := 90;
      encabezados[sqltemp.RecNo-1].Left := (((sqltemp.RecNo-1)*160)+1);
      encabezados[sqltemp.RecNo-1].Name := 'encabezado'+inttostr(sqltemp.RecNo-1);
      encabezados[sqltemp.RecNo-1].Caption := sqltemp.fieldbyname('nombre').Asstring;
      encabezados[sqltemp.RecNo-1].Width := 180;
      //crea rejillas de formas de pago
      sg[sqltemp.RecNo-1] := tstringgrid.Create(self);
      sg[sqltemp.RecNo-1].Name :='Rejilla'+inttostr(sqltemp.RecNo-1);
      sg[sqltemp.RecNo-1].Parent := tspagos;
      sg[sqltemp.RecNo-1].Top := 107;
      sg[sqltemp.RecNo-1].Left := (((sqltemp.RecNo-1)*160)+1);
      sg[sqltemp.RecNo-1].ColCount := 2;
      sg[sqltemp.RecNo-1].RowCount := 9;
      sg[sqltemp.RecNo-1].FixedRows := 1;
      sg[sqltemp.RecNo-1].FixedCols := 1;
      sg[sqltemp.RecNo-1].Height := 270;
      sg[sqltemp.RecNo-1].Width := 180;
      sg[sqltemp.RecNo-1].DefaultRowHeight := 27;
      sg[sqltemp.RecNo-1].Cells[0,0] := 'Mes';
      sg[sqltemp.RecNo-1].Cells[1,0] := 'Pago';
      sg[sqltemp.RecNo-1].Cells[0,1]:='Anticipo';
      sg[sqltemp.RecNo-1].Cells[1,1]:=floattostr(parcialidad);
      //actualiza la tabla temporal de pagos
      querys('update tmpPT'+frmprincipal.idmaq+' set '+sqltemp.fieldbyname('idopcion').AsString+'p='+
      quotedstr('$'+floattostr(parcialidad))+' where mes=''Anticipo''',1,sqlgeneral);
      acum := acum+parcialidad;
      //para llenar las parcialidades en caso de tener x forma de pago
      for i:= 1 to sqltemp.fieldbyname('parcialidades').AsInteger do
      begin
         //actualiza la tabla temporal de pagos
         querys('update tmpPT'+frmprincipal.idmaq+' set '+sqltemp.fieldbyname('idopcion').AsString+'p='+
         quotedstr('$'+floattostr(parcialidad))+' where mes='+quotedstr(inttostr(i)),1,sqlgeneral);
         sg[sqltemp.RecNo-1].Cells[0,i+1]:=inttostr(i);
         sg[sqltemp.RecNo-1].Cells[1,i+1]:=floattostr(parcialidad);
         acum := acum+parcialidad;
      end;
        //actualiza la tabla temporal de pagos
      querys('update tmpPT'+frmprincipal.idmaq+' set '+sqltemp.fieldbyname('idopcion').AsString+'p='+quotedstr('$'+
      floattostr(acum))+' where mes=''Suma''',1,sqlgeneral);
      sg[sqltemp.RecNo-1].Cells[0,8] := 'Total';
      sg[sqltemp.RecNo-1].Cells[1,8] := floattostr(acum);
      sqltemp.Next;
   end;
   sqltemp.Free;
   //verifica que el presupuesto seleccionado exista
   querys('select * from DetPresupuestos2 where idpresupuesto='+ednumcotizacion.Text+' and idopcion='+
   inttostr(rgTipoSis.ItemIndex),0,sqlgeneral);
   if sqlgeneral.RecordCount > 0 then
      btnimprimir.Enabled := true
   else
      btnimprimir.Enabled := false;
end;

procedure Tfrmpresupuestos2.edNumCotizacionKeyPress(Sender: TObject;
  var Key: Char);
begin
   key := ValidaNumeros(key,false);
   if (key = #13) and (edNumCotizacion.Text <> '' ) then
   begin
      fpres.btnbas.Enabled := false;
      fpres.btn100.Enabled := false;
      if edNumCotizacion.Text = '' then
      begin
         key:=#0;
         edNumCotizacion.OnButtonClick(self);
     end
     else
     begin
         key:=#0;
         TraeDatos;
         //pPresupuesto.enabled:=false;
         fpres.btnsave.Enabled := false;
         fpres.btnlimpiar.Enabled := false;
     end;
   end;
end;

procedure Tfrmpresupuestos2.PCPresupTabClick(Sender: TObject);
begin
   if pcpresup.TabIndex = 0 then
   begin
      if btncancelar.Caption = '&Cancelar' then
      begin
         if copy(edtipopor.text,1,6)='EQUIPO' then
         begin
            if querys('select idopcion as t from DetPresupuestos2 where idpresupuesto='+
               edNumCotizacion.Text+' group by idopcion',0,sqlgeneral) = 3 then
            begin
               potros.Enabled := true;
                  if (cbostatus.Text='CERRADA') and (rgPresupDefault.ItemIndex <>-1) then
                     btnpasar.Enabled := true;
            end
            else
            begin
               potros.Enabled := false;
               btnpasar.Enabled := false;
            end;
         end
         else
         begin
            potros.Enabled := true;
            btnpasar.Enabled := true;
            rgPresupDefault.Enabled:=false;
            rgPresupDefault.ItemIndex:=2;
         end;
      end;
   end;
   if pcpresup.TabIndex = 2 then
   begin
      EliminaEncabezadosYRejillas;
      edTotFinal.clear;
      rgTipoSis.ItemIndex := -1;
   end;

if pcpresup.TabIndex = 1 then
begin
   if btnalta.caption = '&Guardar' then
      GuardaEncabezado;
   Fpres.tipooportunidad:=edtipopor.Text;
   Fpres.nopres := edNumCotizacion.Text;
   fpres.oportunidad := edNumOpor.text;
   fpres.TCP := edTCP.Text;
   fpres.giro:=edgiro.Text;
   cargacombo2('Select cod_cve from articulos where paquete=1 and status=1','cod_cve','cod_cve', fpres.cbpaquetes);
   // si es equipo realizara 3 presupuestos
   if copy(edtipopor.Text,1,6)='EQUIPO' then
   begin
      if( rgPresupDefault.ItemIndex > -1) then
      begin
         try
            case (rgPresupDefault.ItemIndex) of
            0: begin
                  fpres.PreTipo:=rgPresupDefault.ItemIndex;
                  Fpres.btnecon.OnClick(self);
               end;
            1: begin
                  fpres.PreTipo:=rgPresupDefault.ItemIndex;
                  Fpres.btnbas.OnClick(self);
               end;
            2: begin
                  fpres.PreTipo:=rgPresupDefault.ItemIndex;
                  Fpres.btn100.OnClick(self);
               end;
            end;
           except
         end;
      end
      else
      begin
         fpres.pretipo := 0;
         Fpres.btnecon.onclick(self);
      end;
   end
   //si no es EQUIPO es solo un presupuesto
   else
   begin
      fpres.PreTipo:=2;
      fpres.btnecon.Enabled:=false;
      fpres.btnbas.Enabled:=false;
      fpres.btn100.OnClick(self);
   end;
end;
end;

procedure Tfrmpresupuestos2.btnimprimirClick(Sender: TObject);
var SubTotal,Iva,Total : string;
begin     {
   //trae el monto de los presupuestos anteriores
   if rgTipoSis.ItemIndex > 0 then
    begin
   querys('select sum((d.cant*d.costo)+(d.cant*d.tiempo*e.CostoXHrs)) as SubTotal from DetPresupuestos2 as d left join presupuestos2 as e on d.idpresupuesto = e.idpresupuesto where e.idpresupuesto = '+edNumCotizacion.Text+' and d.idopcion<'+inttostr(rgTipoSis.ItemIndex),0,sqlgeneral);
   MontoAnt := sqlgeneral.fieldbyname('Subtotal').AsString;
   end
   else
   MontoAnt := '0'; }
   //trae los totales
   if (rgTipoSis.ItemIndex> -1) then
   begin
      querys('select round(sum((dp.cant*dp.costo) + (dp.cant*dp.tiempo*'+edcostohoras.text+')),2)  as subTotal, '+
       'round((sum((dp.cant*dp.costo) + (dp.cant*dp.tiempo*'+edcostohoras.text+')))*'+floattostr(GetIVA)+',2)  as Iva, '+
       'round((sum((dp.cant*dp.costo) + (dp.cant*dp.tiempo*'+edcostohoras.text+')))*'+floattostr(GetIVA+1)+',2)  as Total '+
       'from DetPresupuestos2 as dp left join presupuestos2 as p on p.idpresupuesto=dp.idpresupuesto '+
       'where dp.idpresupuesto='+edNumCotizacion.Text+' and dp.idopcion = '+inttostr(rgTipoSis.ItemIndex)+' group by dp.idopcion', 0, sqlgeneral);
      {
      querys('select round(sum((dp.cant*dp.tiempo*dp.CostoHrs)+(dp.cant*dp.costo)),2) as SubTotal,'+
       'round(sum(((dp.cant*dp.tiempo*dp.CostoHrs)+(dp.cant*dp.costo))*'+floattostr(GetIVA)+'),2) as iva,'+
       'round(sum(((dp.cant*dp.tiempo*dp.CostoHrs)+(dp.cant*dp.costo))*'+floattostr(1+GetIVA)+'),2) as total from DetPresupuestos2 '+
       ' as dp left join presupuestos2 as p on p.idpresupuesto=dp.idpresupuesto where dp.idpresupuesto='+edNumCotizacion.Text+' and dp.idopcion='+inttostr(rgTipoSis.ItemIndex)+' group by dp.idpresupuesto',0,sqlgeneral);}
      SubTotal := sqlgeneral.fieldbyname('Subtotal').AsString;
      Iva := floattostr(sqlgeneral.fieldbyname('iva').Asfloat);
      Total := floattostr(sqlgeneral.fieldbyname('total').Asfloat);
      //trae el encabezado del presupuesto
      querys('SELECT if (O.nombre = '''' or O.nombre is NULL, concat(cont.nombre,'' '', cont.apaterno,'' '',cont.amaterno), '+
      ' concat(O.nombre,'' '',O.apaterno,'' '',O.amaterno)) AS nombre,O.idoportunidad,O.rsocial,O.dir,O.numero,C.nombre AS colonia,'+
      ' O.ciudad,O.entre,T.telefono,T.tipo_tel,O.alta,O.usuario,concat(U.codigo,''  '',U.nombre,'' '',U.apaterno,'' '',U.amaterno) as '+
      ' vendedor, de.nombre as Empresa,concat(de.direccion,'' ,'',de.ciudad,'' ,'',de.estado) as DirEmpresa,'+
      ' concat(''Tel : '',de.telefono,''           RFC :'',de.rfc ) as rfc FROM oportunidades AS O join DatosEmpresa as de LEFT JOIN '+
      ' agenda_vendedores AS A ON (A.idoportunidad = O.idoportunidad) LEFT JOIN usuarios AS U ON (U.idusuario = A.idvendedor) '+
      ' LEFT JOIN colonias AS C ON (C.idcol = O.idcol) LEFT JOIN telefonos AS T ON (T.idtel = O.idtel) LEFT JOIN contactos AS cont '+
      ' ON (O.idcontacto=cont.idcontacto) Where O.idoportunidad ='+edNumOpor.text+' order by T.idtel asc limit 1',0,dmreportes.sqlgeneral);
      //trae el presupuesto elejido                                                                                                                                                                                                                                                                                 //+' and idopcion='+inttostr(rgTipoSis.ItemIndex)
      querys('select '+edNumCotizacion.text+' as NumCot,0 as PresupAnt,'+SubTotal+' as SubTotal,'+
       Iva+' as Iva,'+Total+' as Total,round((dp.cant*dp.tiempo*p.CostoXHrs)+(dp.cant*dp.costo),2) as suma,'+
       'dp.cant,de.nombre,dp.tiempo,round(dp.cant*dp.tiempo,2) as Mo,dp.costo,round(dp.cant*dp.costo,2) as Eq,'+
       'dp.cod_cve,round(dp.cant*dp.tiempo*p.CostoXHrs,2) as TotMo '+
       ',p.CostoXHrs,p.idpresupuesto,'+quotedstr(rgTipoSis.Items.Strings[rgTipoSis.itemindex])+
       ' as TipoPresup,p.fecha,p.comentarios from DetPresupuestos2 as dp left join articulos as '+
       'a on dp.cod_cve = a.cod_cve left join dptos de on a.iddpto=de.iddpto'+
       ' left join presupuestos2 as p on p.idpresupuesto=dp.idpresupuesto '+
       'where dp.idpresupuesto='+edNumcotizacion.Text+' and dp.idopcion='+inttostr(rgTipoSis.ItemIndex),0,dmreportes.sqlgeneral2);
      //trae las formas de pago
      querys('select * from tmpPT'+frmprincipal.idmaq+' order by id',0,dmreportes.sqlgeneral3);
      OperacionReporte('Presupuesto', '','IMP', 1);
      end
      else
      begin
         application.MessageBox('Seleccione por favor el tipo de sistema','Aviso',mb_iconinformation);
         rgTipoSis.setfocus();
      end;
end;

procedure Tfrmpresupuestos2.edNumCotizacionChange(Sender: TObject);
begin
if edNumCotizacion.Text = '' then
 limpia;
end;

procedure Tfrmpresupuestos2.rgPresupDefaultClick(Sender: TObject);
begin
  //verifica si existe el presupuesto default que eligio
  querys('select idpresupuesto from DetPresupuestos2 where idopcion='+inttostr(rgPresupDefault.ItemIndex)+' and idpresupuesto='+edNumCotizacion.Text,0,sqlgeneral);
  if sqlgeneral.RecordCount = 0 then
   begin
    application.MessageBox('No Existe el tipo de presupuesto que esta definiendo como default!!!','Aviso',mb_iconinformation);
    rgPresupDefault.ItemIndex := -1;
   end;
end;

procedure Tfrmpresupuestos2.cboFormaPagoClick(Sender: TObject);
begin
//querys('select idopcion from FormasPagoPre where nombre='+quotedstr(cboFormaPago.Text),0,sqlgeneral);
//cboFormaPago.Tag := sqlgeneral.fieldbyname('idopcion').AsInteger;
end;

procedure Tfrmpresupuestos2.btnpasarClick(Sender: TObject);
var hija:Tfrmpedidos;
begin
   querys('Select cuenta from oportunidades where idoportunidad='+edNumopor.Text, 0, sqlgeneral);
   if sqlgeneral.FieldByName('cuenta').AsInteger = 0 then
   begin
      application.MessageBox('Esta oportunidad no tiene asignada una cuenta y no podra pasar a pedido. Revise el estatus de la Oportunidad.', 'Atencion', MB_ICONEXCLAMATION);
      exit;
   end;
   querys('select idUnidadNegocio from tipo_oportunidad where nombre="'+edtipopor.Text+'"',0,DMREPORTES.sqlgeneral);
   if dmreportes.sqlgeneral.FieldByName('idUnidadNegocio').asstring='1' then
   begin
         querys('select count(distinct(idopcion)) as opcion from DetPresupuestos2 where idpresupuesto='+
         edNumCotizacion.Text+' group by idpresupuesto ', 0, sqlgeneral);
         if sqlgeneral.FieldByName('opcion').asinteger <> 3 then
         begin
            application.MessageBox('No se han Guardado los 3 Presupuestos!!!','Aviso',MB_OK+MB_ICONWARNING);
            exit;
         end;
   end;
   hija:=Tfrmpedidos.Create(Self);
   hija.btnalta.OnClick(Self);
   hija.edpresupuesto.text := edNumCotizacion.text;
   hija.opcion:=rgPresupDefault.ItemIndex;
   hija.tipooportunidad:=edtipopor.Text;
   hija.edpresupuesto.Text:=edNumCotizacion.Text;
   hija.edTCP.Text:=edTCP.Text;
   if (copy(edtipopor.Text,1,8)<>'CONEXION') and (copy(edtipopor.Text,1,10)<>'RECONEXION') and (copy(edtipopor.Text,1,6)<>'ENLACE') then
      if application.MessageBox('Deseas Modificar el TIPO DE CAMBIO?','Aviso',MB_YESNO+MB_ICONQUESTION)=idyes then
      begin
         hija.edTCP.Text:=InputBox('TIPO CAMBIO','Teclea el TIPO DE CAMBIO','');
         if hija.edTCP.Text='' then
            hija.edTCP.Text:=edTCP.Text;
      end;
   if hija.TraePresupuesto(edNumCotizacion.text) = 1 then
   begin
      hija.edPresupuesto.Enabled:=false;
      hija.gbotros.Enabled:=true;
   end;
   if OcurrenciaWord(edtipopor.Text,'SIN ENLACE')>0 then
      hija.RENotaInst.Lines.Add('*******SIN ENLACE*******');
   hija.Show;
end;

procedure Tfrmpresupuestos2.sontres;
begin
     if copy(edtipopor.Text,1,6)<>'EQUIPO' then
     begin
         potros.enabled:= true;
         rgPresupDefault.Enabled:=false;
         rgPresupDefault.ItemIndex:=2;
         if (rgPresupDefault.ItemIndex<>-1) and (edtipopor.Text='CERRADA') then
            btnpasar.Enabled:=true;
     end
     else
     begin
         querys('select count(distinct(idopcion)) as opcion from DetPresupuestos2 where idpresupuesto='+
         edNumCotizacion.Text+' group by idpresupuesto ', 0, sqlgeneral);
         if sqlgeneral.FieldByName('opcion').asinteger = 3 then
         begin
            potros.Enabled := true;
            rgPresupDefault.Enabled:=true;
            if (rgPresupDefault.ItemIndex<>-1) and (edtipopor.Text='CERRADA') then
               btnpasar.Enabled:=true;
         end
         else
            potros.Enabled := false;
     end;
end;

procedure Tfrmpresupuestos2.fpresbtneconClick(Sender: TObject);
begin
  fpres.btneconClick(Sender);

end;

procedure Tfrmpresupuestos2.fpresbtnbasClick(Sender: TObject);
begin
  fpres.btnbasClick(Sender);

end;

procedure Tfrmpresupuestos2.fpresbtnsaveClick(Sender: TObject);
begin
  GuardaEncabezado;
  fpres.btnsaveClick(Sender);
end;

procedure Tfrmpresupuestos2.cbostatusSelect(Sender: TObject);
begin
   querys('SELECT estatus_eventos.nombre FROM agenda_vendedores left JOIN estatus_eventos ON (agenda_vendedores.idestatus = estatus_eventos.idestatus) WHERE agenda_vendedores.idoportunidad = '+edNumOpor.Text+' and estatus_eventos.finaliza =''SI'' ',0,sqlgeneral);
   if(sqlgeneral.fieldbyname('nombre').AsString <> '' ) then
   begin
     application.MessageBox('Esta oportunidad ya fue finalizada, ya no podra modificar su estatus!','Atención',mb_iconwarning);
     exit;
   end;
   querys('select idevento from agenda_vendedores where idoportunidad='+ednumopor.text,0,dmreportes.sqlgeneral);
   if CerrarEventoOportunidad(cbostatus.Text,dmreportes.sqlgeneral.fieldbyname('idevento').AsString,dmreportes.sqlgeneral.fieldbyname('idevento').AsString,edNumOpor.Text)=1 then
      cbostatus.Text:='PENDIENTE';
   if cbostatus.Text='CERRADA' then
   begin
    querys('select cuenta from oportunidades where idoportunidad='+edNumOpor.Text,0,DMREPORTES.sqlgeneral);
    edcuenta.Text:=DMREPORTES.sqlgeneral.fieldbyname('cuenta').AsString;
   end;
end;

procedure Tfrmpresupuestos2.fpresbtn100Click(Sender: TObject);
begin
  fpres.btn100Click(Sender);

end;

procedure Tfrmpresupuestos2.fpresbtnimp3Click(Sender: TObject);
begin
  fpres.btnimp3Click(Sender);

end;

procedure Tfrmpresupuestos2.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
  var cadena:string;
begin
   if (ssCtrl in Shift) and (chr(Key) in ['B', 'b']) then
   begin
   cadena:='SELECT p.idpresupuesto,p.idoportunidad,cuenta,'+
   ' if(o.idoportunidad<>0,if(o.rsocial='''',concat(ifnull(o.nombre,''''),'' '','+
   ' ifnull(o.apaterno,''''),'' '',ifnull(o.amaterno,'''')),o.rsocial),'+
   ' if(clientes.rsocial='''',concat(ifnull(clientes.nombre,''''),'' '',ifnull(clientes.apaterno,''''),'' '','+
   ' ifnull(clientes.amaterno,'''')),clientes.rsocial)) as Cliente,concat(ifnull(usuarios.nombre,''''),'' '','+
   ' ifnull(usuarios.apaterno,''''),'' '',ifnull(usuarios.amaterno,'''')) as Vendedor, p.fecha,p.hora '+
   ' FROM presupuestos2 p left JOIN oportunidades o ON (p.idoportunidad = o.idoportunidad) '+
   ' left JOIN usuarios ON (p.idvendedor = usuarios.idusuario) left join clientes on '+
   ' p.idcliente=clientes.idcliente order by idpresupuesto desc';
   frmbusquedas.query:=cadena;
   frmbusquedas.campo_busqueda:='Cliente';
   frmbusquedas.campo_retorno:='idpresupuesto';
   frmbusquedas.tblorigen := 'presupuestos2';
   frmbusquedas.tabla:='presupuestos';
   frmbusquedas.cbofiltro.ItemIndex:=1;
   frmbusquedas.cbofiltro.OnClick(self);
   frmbusquedas.ShowModal;
   if frmbusquedas.resultado <> '' then
   begin
      chtecla:=#13;
      ednumcotizacion.Text:=frmbusquedas.resultado;
      gbvendedor.Enabled:=true;
      edcve_vend.Enabled:=false;
      cbonom_vend.Enabled:=false;
      edTCP.Enabled:=false;
      btnborrar.Enabled:=true;
      TraeDatos;
      querys('Select o.idoportunidad,o.cuenta, t.nombre as tipo From oportunidades AS o left Join '+
      ' agenda_vendedores AS ag ON o.idoportunidad = ag.idoportunidad left Join tipo_oportunidad AS t '+
      ' ON ag.idtipo_oportunidad = t.idtipo_oportunidad Where o.idoportunidad ='+edNumOpor.Text,0,sqlgeneral);
      edtipopor.Text:=sqlgeneral.fieldbyname('tipo').AsString;
      edcuenta.Text:=sqlgeneral.fieldbyname('cuenta').AsString;
   end;
   end;
end;

procedure Tfrmpresupuestos2.fpresRzBitBtn1Click(Sender: TObject);
begin
   fpres.btnenviarClick(sender);
end;

End.

