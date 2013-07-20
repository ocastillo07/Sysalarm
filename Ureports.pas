{///////////////////////////////////////////////////////////////////////////////
2010/11/03 dalyla reporte de correos
--------------------------------------------------------------------------------
2009/03/18 dalyla quitar variables de mas
2009/01/13 dalyla hacerla midi child y quitarle menu y print components que no se usan
--------------------------------------------------------------------------------
2008/12/04 dalyla reprote de estadistica agregar el resumen 4
2008/11/14 dalyla update en servicios y envio de edo. cuent apor email
2008/09/24 dalyla borrar temporales
2008/09/23 dalyla quitar corre@alarmex.com.mx por sistemasspa
2008/04/24 dalyla cliente cambios
2008/02/28 dalyla zona horaria ok
ULTIMA MODIFICACION POR     Dalila Robledo    EL    2007/10/15

2007/10/15   Agrego opcion de imprimir a los que no se envia
}///////////////////////////////////////////////////////////////////////////////
unit Ureports;

interface

uses
  Windows,dateutils, RpRender, RpRenderPDF, Dialogs, RpRave,  RpBase,
  RpSystem,  Grids, Gauges, Controls, StdCtrls,
  RzLstBox, RzPanel, RzSplit, Buttons, ComCtrls, Classes, Messages, SysUtils,
  Variants, Graphics, Forms, DBGrids,Menus, jpeg, DBCtrls, RpDefine, RpRenderHTML,
   RzButton, ExtCtrls, ImgList, DB, DBAccess, MyAccess, MemDS, RzRadChk,
  Mask, RzEdit,StrUtils;

type
  TReports_Alarmex = class(TForm)
    PANBUSCA: TPanel;
    PANFECHA_C: TPanel;
    Label105: TLabel;
    DATE1_C: TDateTimePicker;
    DATE2_C: TDateTimePicker;
    Panel1: TPanel;
    cuenta1: TEdit;
    cuenta2: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Panel6: TPanel;
    criterio: TComboBox;
    Label6: TLabel;
    orden: TComboBox;
    Panel7: TPanel;
    Label7: TLabel;
    Combocol: TComboBox;
    ComboBox2: TComboBox;
    boletin: TOpenDialog;
    btnguardar: TButton;
    Button1: TButton;
    rgaccion: TRadioGroup;
    Spliter: TRzSplitter;
    Label8: TLabel;
    CuerpoEmail: TMemo;
    listaadjuntos: TRzListBox;
    Label10: TLabel;
    Label11: TLabel;
    btnadjuntar: TButton;
    btnlimpiar: TButton;
    ImageList1: TImageList;
    bbimprimir_c: TRzBitBtn;
    rgpatrullaje: TRadioGroup;
    memo: TMemo;
    Panel2: TPanel;
    Porcento: TGauge;
    porcentosk: TGauge;
    lprint: TLabel;
    Image1: TImage;
    Memo1: TMemo;
    Panel3: TPanel;
    countClie: TLabel;
    Panel4: TPanel;
    countsk: TLabel;
    Panel5: TPanel;
    countdet: TLabel;
    pnlerrores: TPanel;
    Label9: TLabel;
    SpeedButton1: TSpeedButton;
    lista: TStringGrid;
    RvProject1: TRvProject;
    RvSystem1: TRvSystem;
    RvRenderPDF1: TRvRenderPDF;
    btncerrar: TRzBitBtn;
    sqlgeneral: TMyQuery;
    RzGroupBox1: TRzGroupBox;
    edgrupo: TRzEdit;
    RzPanel1: TRzPanel;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    rbgrupos: TRadioButton;
    chkEstadoCuenta: TRzCheckBox;
    chkvistaprevia: TRzCheckBox;
    rbnoenvia: TRadioButton;
    chkboletin: TRzCheckBox;
    chkvencidos: TRzCheckBox;
    procedure FormShow(Sender: TObject);
    procedure BBIMPRIMIR_CClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
    procedure validar(Sender: Tobject);
    procedure btnguardarClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure rgaccionClick(Sender: TObject);
    procedure btnadjuntarClick(Sender: TObject);
    procedure listaadjuntosKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnlimpiarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncerrarClick(Sender: TObject);
    procedure rbgruposClick(Sender: TObject);
    procedure cuenta1Change(Sender: TObject);
    procedure chkboletinClick(Sender: TObject);
    procedure chkvencidosClick(Sender: TObject);
    procedure chkvistapreviaClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    path_boletin:string;
    procedure estadocuenta(const cuenta:string);
  end;

var
  Reports_Alarmex: TReports_Alarmex;

implementation

uses UDM, Urecursos, Uprincipal, Udmrep;

{$R *.dfm}

procedure TReports_Alarmex.estadocuenta(const cuenta:string);
var
cliente,sector,idcontacto,cobrador,total,total1,total2,fecha1,valor1,fecha2,valor2,valor3,valor4,nota1,nota2,nota3:string;
begin
//PRIMERO VAMOS A VER SI SON POR TODAS O POR UN RANGO
total:='';cliente:='';idcontacto:='';cobrador:='';nota1:='';nota2:='';nota3:='';
total:='';total1:='';total2:='';
fecha1:='';valor1:='';fecha2:='';valor2:='';valor3:='';valor4:='';

//Vista Previa?
if chkvistaprevia.Checked = true then
 begin
  dmreportes.rvsystem1.DefaultDest:=rdpreview;
  dmreportes.RVP.Engine:=dmreportes.RvSystem1;
 end
else
 begin
  dmreportes.rvsystem2.DefaultDest:=rdprinter;
  dmreportes.RVP.Engine:=dmreportes.RvSystem2;
 end;

with dmreportes do
  begin
  querys('select col.nombre,c.idcliente as cliente,c.idcontacto as contac,c.sector as s from clientes as c left '+
         'join colonias as col on(col.idcol=c.idcol) left join contratos as con ON(con.TipoCont=c.TipoCont) where '+
         'idcliente='+quotedstr(cuenta)+' and  con.estatus =1 ',0,sqlgeneral5);
  if sqlgeneral5.fieldbyname('cliente').asstring <> '' then
    begin
    cliente := sqlgeneral5.fieldbyname('cliente').AsString;
    idcontacto:= SqlGeneral5.FieldByName('contac').AsString;
    sector:=SqlGeneral5.FieldByName('s').AsString;
    //busca contacto
    ban:=0;//bandera para saber cuanto debe por periodos
    cobrador:='';
    ////GENERAR REPORTE
    if idcontacto <> '' then
      begin
      querys('SELECT  Concat(ifnull(nombre,'' ''),'' '',ifnull(apaterno,'' ''),'' '',ifnull(amaterno,'' '')) AS '+
             'nombre, min(idcontador)  from contactos where idcontacto='+quotedstr(idcontacto)+' and (nombre <> '+
             '''TELEFONO 1'' and  nombre <> ''TELEFONO 2''  ) group by idcontacto',0,sqlgeneral);
      idcontacto:=sqlgeneral.fieldbyname('nombre').AsString;
      end;

    //buscar el usuario que tiene ese sector para la cobranza
    querys('SELECT Concat(ifnull(u.nombre,'' ''),'' '',ifnull(u.apaterno,'' ''),'' '',ifnull(u.amaterno,'' ''))  AS '+
           'cobrador FROM usuarios as u INNER JOIN areas as a ON (a.idarea=u.idarea) WHERE u.idsector='+
           quotedstr(sector)+' AND a.nombre=''COBRANZA'' ',0,sqlgeneral);
    if sqlgeneral.fieldbyname('cobrador').AsString <> '' then
      cobrador:=sqlgeneral.fieldbyname('cobrador').AsString
    else
      begin
      querys('SELECT Concat(ifnull(u.nombre,'' ''),'' '',ifnull(u.apaterno,'' ''),'' '',ifnull(u.amaterno,'' '')) AS '+
             'cobrador FROM usuarios as u INNER JOIN areas as a ON (a.idarea=u.idarea) LEFT JOIN UsuarioSector as us ON '+
             '(us.idusuario=u.idusuario) WHERE us.idsector='+quotedstr(sector)+' AND a.nombre=''COBRANZA'' ',0,sqlgeneral);     if sqlgeneral.fieldbyname('cobrador').AsString <> '' then
      cobrador:=sqlgeneral.fieldbyname('cobrador').AsString
      end;

    querys('DROP TABLE IF EXISTS temporal_estadocuenta'+frmprincipal.idmaq,1,sqlgeneral);
    querys('CREATE TABLE temporal_estadocuenta'+frmprincipal.idmaq+' (mov integer (11),idcliente integer (11),idpedido '+
           'integer (11),fechaalta date,fechavence date,total float,saldo float,cobrador varchar(50),estatus integer(11),'+
           'idpago integer(11),contacto varchar(50),KEY idpedido(idpedido)) ',1,sqlgeneral);

    querys('select idpago,pc.idpedido as ped from PagosClientes as pc LEFT JOIN pedidos as p ON (p.idpedido='+
           'pc.idpedido) WHERE pc.idcliente='+quotedstr(cliente)+' AND p.estatus in(3,4,6) and movimiento = 1',0,sqlgeneral2);

    querys('INSERT INTO temporal_estadocuenta'+frmprincipal.idmaq+'(mov,idcliente,saldo,idpedido,estatus,idpago) '+
           'SELECT pc.movimiento,pc.idcliente,pc.restante,pc.idpedido,0,pc.idpago FROM PagosClientes as pc LEFT JOIN '+
           'pedidos as p ON (p.idpedido=pc.idpedido) WHERE pc.idcliente='+quotedstr(cliente)+' AND p.estatus in(3,4,6) '+
           'AND pc.restante <> 0 AND pc.movimiento in(0,1) ',1,sqlgeneral);
   if sqlgeneral2.FieldByName('idpago').AsString  <> '' then begin
     while not sqlgeneral2.Eof do begin

         querys('DELETE FROM temporal_estadocuenta'+frmprincipal.idmaq+' WHERE  idpedido='+
                quotedstr(sqlgeneral2.FieldByName('ped').AsString)+' and mov =0 ',1,sqlgeneral3);
         sqlgeneral2.Next;
     end;
   end;

   querys('SELECT idpago,idpedido,idcliente,cargo,FechaAlta,FechaVence,if(FechaVence > "'+datetostr(date)+'",1,0) as estatus '+
          'FROM PagosClientes WHERE idcliente='+quotedstr(cliente)+' and movimiento in(0,1) order by idpedido',0,sqlgeneral);     // and saldado = 0  and (estatus=3 or estatus=4)

   sqlgeneral.First;
   while not sqlgeneral.Eof do
      begin
      querys('UPDATE temporal_estadocuenta'+frmprincipal.idmaq+' SET  fechaalta='+quotedstr(sqlgeneral.fieldbyname('FechaAlta').AsString)+',fechavence='+quotedstr(sqlgeneral.fieldbyname('FechaVence').AsString)+',total='+quotedstr(sqlgeneral.fieldbyname('cargo').AsString)+',estatus='+quotedstr(sqlgeneral.fieldbyname('estatus').AsString)+' '+
             'WHERE idpago='+quotedstr(sqlgeneral.fieldbyname('idpago').AsString),1,dmaccesos.sqlgeneral);
      sqlgeneral.Next;
      end;


   ///total
  querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+
         frmprincipal.idmaq+' as t WHERE t.total <> '' ''  GROUP BY t.idcliente',0,sqlgeneral);
  if sqlgeneral.FieldByName('suma').AsString <> '' then
    begin
    total:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
    delete(total,1,1);
    end
  else
    total:='0';

  //total vencido
  querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+
         frmprincipal.idmaq+' as t WHERE t.total <> '' '' AND estatus=0 GROUP BY t.idcliente',0,sqlgeneral);
  if sqlgeneral.FieldByName('suma').AsString <> '' then
    begin
    total1:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
    delete(total1,1,1);
    end
  else
    total1:='0';

  //total x vencer
  querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+
         frmprincipal.idmaq+' as t WHERE t.total <> '' '' AND estatus=1 GROUP BY t.idcliente',0,sqlgeneral);
  if sqlgeneral.FieldByName('suma').AsString <> '' then
    begin
    total2:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
    delete(total2,1,1);
    end
  else
    total2:=' 0';

  ///cantidad de 0 a 30
fecha1:=datetostr(now-30);
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.fechavence between   '+quotedstr(fecha1)+' AND "'+datetostr(date)+'" and t.total <> '' '' GROUP BY t.idcliente',0,sqlgeneral);
if sqlgeneral.FieldByName('suma').AsString <> '' then
 begin
  valor1:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
  ban:=1;
 end
else
 valor1:='$ 0';

///cantidad de 31 a 60
fecha1:=datetostr(now-31);
fecha2:=datetostr(now-60);
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.fechavence between '+quotedstr(fecha2)+' AND '+quotedstr(fecha1)+' and t.total <> '' '' GROUP BY t.idcliente',0,sqlgeneral);
if sqlgeneral.FieldByName('suma').AsString <> '' then
 begin
  valor2:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
  ban:=2;
 end
else
 valor2:='$ 0';

///cantidad de 61 a 90
fecha1:=datetostr(now-61);
fecha2:=datetostr(now-90);
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.fechavence between '+quotedstr(fecha2)+' AND '+quotedstr(fecha1)+' and t.total <> '' '' GROUP BY t.idcliente',0,sqlgeneral);
if sqlgeneral.FieldByName('suma').AsString <> '' then
 begin
  valor3:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
  ban:=3;
 end
else
 valor3:='$ 0';

///cantidad mas de 90
fecha1:=datetostr(now-90);
querys('SELECT t.fechaalta,t.fechavence,sum(t.saldo) as suma,t.contacto,t.idpedido FROM temporal_estadocuenta'+frmprincipal.idmaq+' as t WHERE t.fechavence < '+quotedstr(fecha1)+' and t.total <> '' '' GROUP BY t.idcliente',0,sqlgeneral);
if sqlgeneral.FieldByName('suma').AsString <> '' then
 begin
  valor4:=Format('%8.3m',[sqlgeneral.fieldbyname('suma').AsFloat]);
  ban:=4;
 end
else
 valor4:='$ 0';
//trae los datos del cliente
        querys('SELECT cf.NombreCres AS nombre,c.idcliente,cf.CdCres as ciudad,cf.EstadoCres as estado,cf.DirCres as dir,cf.CPCres as cp,cf.ColCres as col,c.sector as sector,t.fechaalta,'+
               't.fechavence,t.total,t.saldo,'+quotedstr(idcontacto)+' as contacto,concat( ifnull(c.dir,'' ''),'','',ifnull(c.numero,'' ''),'' , COL:'',ifnull(col.nombre,'' '') ) AS DirInst , c.ciudad as CdInst, '+
               't.idpedido,p.concepto,l.nombre as negocio,t.estatus  FROM clientes AS c LEFT JOIN ClientesFact as cf on(cf.idfact=c.idfact) LEFT JOIN  colonias AS col ON (col.idcol=c.idcol) LEFT JOIN temporal_estadocuenta'+frmprincipal.idmaq+' as t ON (t.idcliente=c.idcliente) LEFT JOIN pedidos AS p ON (p.idpedido=t.idpedido) LEFT JOIN DetPedido AS dp ON '+
               '(dp.idpedido=p.idpedido) LEFT JOIN  articulos as a ON (a.cod_cve=dp.cod_cve) LEFT JOIN lineas as l ON (l.idlinea=a.idlinea) WHERE c.idcliente='+quotedstr(cliente)+' GROUP BY t.idpago Order by estatus',0,sqlgeneral3);
       //mostrar nota correspondiente......
       querys('SELECT concepto,ValorMemo FROM configuraciones',0,sqlgeneral);
             while not sqlgeneral.Eof do begin

                 if sqlgeneral.fieldbyname('concepto').AsString='CobNotasPago' then
                     nota1:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                 if sqlgeneral.fieldbyname('concepto').AsString='CobNotasObs' then
                     nota2:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                 if ban = 1 then begin
                 if sqlgeneral.fieldbyname('concepto').AsString='A30' then
                     nota3:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                 end;
                 if ban = 2 then begin
                 if sqlgeneral.fieldbyname('concepto').AsString='A60' then
                     nota3:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                 end;
                 if ban = 3 then begin
                 if sqlgeneral.fieldbyname('concepto').AsString='A90' then
                     nota3:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                 end;
                 if ban = 4 then begin
                 if sqlgeneral.fieldbyname('concepto').AsString='M90' then
                     nota3:=sqlgeneral.fieldbyname('ValorMemo').AsString;
                 end;
                    sqlgeneral.Next;
              end;

         if sqlgeneral3.fieldbyname('DirInst').AsString  <> '' then
            RVP.SetParam('titulo2',sqlgeneral3.fieldbyname('DirInst').AsString)
         else
            RVP.SetParam('titulo2','');

         if sqlgeneral3.fieldbyname('CdInst').AsString  <> '' then
            RVP.SetParam('tax',sqlgeneral3.fieldbyname('CdInst').AsString)
         else
            RVP.SetParam('tax','');

         if rgaccion.ItemIndex =1 then begin


         //rvsystem2.DefaultDest:=rdprinter;
         //RVP.ProjectFile:=uprincipal.my_path+'Reportes_sysalarm.rav';
         RVP.ProjectFile:=GetConfiguraciones('PathSysalarmServer', true)+'Reportes_sysalarm.rav';

         RVP.SetParam('titulo1',cobrador);
         RVP.SetParam('total',total);
         RVP.SetParam('total1',total1);
         RVP.SetParam('total2',total2);
         RVP.SetParam('nota1',nota1);
         RVP.SetParam('nota2',nota3);
         RVP.SetParam('nota3',nota2);
         RVP.SetParam('comodin1',valor1);
         RVP.SetParam('comodin2',valor2);
         RVP.SetParam('comodin3',valor3);
         RVP.SetParam('comodin4',valor4);
         RVP.ExecuteReport('RepEstadoCuentaC');
         rvp.Close;
         //RVP.Engine:=dmreportes.RvSystem1;
         end else begin

        RVP.ProjectFile:=GetConfiguraciones('PathSysalarmServer', true)+'Reportes_sysalarm.rav';
        rvsystem2.DefaultDest:=rdfile;
        RvSystem2.DoNativeOutput:=false;
        RvSystem2.RenderObject:=RvRenderPDF1;
        RvSystem2.OutputFileName:=uprincipal.my_path+'EstadoCuenta_Alarmex'+frmprincipal.idmaq+'.pdf';
        RVP.SetParam('total',total);
        RVP.SetParam('total1',total1);
         RVP.SetParam('total2',total2);
         RVP.SetParam('nota1',nota1);
         RVP.SetParam('nota2',nota3);
         RVP.SetParam('nota3',nota2);
         RVP.SetParam('comodin1',valor1);
         RVP.SetParam('comodin2',valor2);
         RVP.SetParam('comodin3',valor3);
         RVP.SetParam('comodin4',valor4);
         RVP.ExecuteReport('RepEstadoCuentaC');
         rvp.Close;
        end;



         querys('DROP TABLE IF EXISTS temporal_estadocuenta'+frmprincipal.idmaq,1,sqlgeneral);
         nota1:='';
         nota2:='';
         nota3:='';

         //sqlgeneral5.Next;

      end; //if

   end;//with       
end;

procedure TReports_Alarmex.validar(Sender: TObject);
begin
 if (cuenta1.Text<>'') AND (cuenta2.Text<>'') and (rgaccion.ItemIndex<>-1) then
  BBIMPRIMIR_C.Enabled:=true;
end;
procedure TReports_Alarmex.FormShow(Sender: TObject);
begin

 rgaccion.ItemIndex:=-1;
 cuenta1.Clear;
 cuenta2.Clear;
 listaadjuntos.Clear;
 lista.Visible:=false;
 DATE1_C.Date:=now;
 date2_c.Date:=now;
 //actualiza el memo
 querys('select ValorMemo from configuraciones where concepto=''CuerpoEmail'' ',0,sqlgeneral);
 cuerpoemail.Text:=sqlgeneral.fieldbyname('ValorMemo').AsString;
 rgaccion.ItemIndex:=-1;
end;

procedure TReports_Alarmex.BBIMPRIMIR_CClick(Sender: TObject);
var
  print,aclie,bsk,cdet,x,y,z,count1,count2,count3,ContSinCorreo,CorreosErroneos:integer;
  ano2:word;
  fecha1,fecha2,d2,m2,col1,col2,fecha,tsk,top,patrulla,Envio,
  cadena,ordenamiento, bonopat, ctoserv:string;
  f, res: integer;
  sqltemp : tmyquery;
begin
  cadena:='';patrulla:='';envio:='';
  memo.Clear;
  lista.RowCount:=2;
  lista.ColCount:=2;
  lista.Cells[0,1]:='';
  lista.Cells[1,1]:='';
  lista.Cells[0,0]:='Cuenta';
  lista.Cells[1,0]:='Email';
  pnlerrores.Visible:=false;
  CorreosErroneos:=0;
  ContSinCorreo:=0;
  print:=0;
  count1:=0;
  count2:=0;
  count3:=0;
  x:=0;
  ano2:=0;
  f:=0;
  porcento.Progress:=0;
  porcentosk.Progress:=0;

  // Patrullaje ?
  if rgpatrullaje.ItemIndex = 1 then
    patrulla:=' and clientes.NoPatrulla = 0 ';
  if rgpatrullaje.ItemIndex = 2 then
    patrulla:=' and clientes.NoPatrulla = 1 ';

  //Tipo de Envio
  if rgaccion.ItemIndex = 0 then
    envio:=' and DetClientes.TrafEmail=1 and DetClientes.NoTraf=0 '
  else
    envio:=' and DetClientes.TrafEnPersona=1 and DetClientes.NoTraf=0 ';

  //Ordenar
  if (criterio.ItemIndex  = 0) and (orden.itemindex = 0 ) then
    ordenamiento:=' Order by clientes.nombre';
  if (criterio.ItemIndex = 0) and (orden.ItemIndex = 1) then
    ordenamiento := ' Order by clientes.nombre DESC';
  if (criterio.ItemIndex  = 1) and (orden.itemindex = 0 ) then
    ordenamiento:=' Order by dir';
  if (criterio.ItemIndex = 1) and (orden.ItemIndex = 1) then
    ordenamiento:=' Order by dir DESC';
  with dmreportes do
  begin
    {edit y grabar de la tabla de fechas_rep}
    fecha:= datetostr(DATE1_C.date) + ' A '+ datetostr(DATE2_C.date);
    fecha1:=formatdatetime('yyyy"/"mm"/"dd',DATE1_C.Date);
    fecha2:=inttostr(ano2)+'-'+m2+'-'+d2;
    fecha2:=formatdatetime('yyyy"/"mm"/"dd',DATE2_C.Date);
    querys('delete from trafic',1,sqlgeneral);

    ////////// ****** POR CUENTA ****** \\\\\\\\\\\\\\
    if Radiobutton1.Checked = true then  // Opcion Cuenta
    begin
      //trae la cantidad de cuentas en el rango que se tecleo
      querys('Select count(*)as account From clientes left join DetClientes on clientes.idcliente = '+
           'DetClientes.idcliente where clientes.idcliente BETWEEN '+quotedstr(cuenta1.Text)+' AND '+
           quotedstr(cuenta2.Text)+' and estatus=1 and GrupoTrafico <> 1 '+patrulla+' '+envio,0,sqlgeneral);
      countClie.Caption:='Total Clientes: '+dmreportes.sqlgeneral.fieldbyname('account').AsString;
      //mostrar total cuentas
      x := dmreportes.sqlgeneral.fieldbyname('account').AsInteger;
      porcento.MaxValue:=x;
      count1:=x+count1;
      //trae los datos de las cuentas que estan en el rango seleccionado
      querys('Select clientes.idcliente,if(clientes.rsocial="" or clientes.rsocial is null, concat(ifnull'+
           '(clientes.nombre,"")," ",ifnull(clientes.apaterno,"")," ",ifnull(clientes.amaterno,"")), '+
           'clientes.rsocial) as NombreCliente, clientes.dir, clientes.numero, clientes.refs, '+
           'colonias.nombre as colonia,clientes.cp,clientes.sector,clientes.alarm,categorias.nombre as '+
           'categoria,clientes.idcol as idcol,clientes.email as email,clientes.ultfectraf, ultfectrafmail '+
           'From clientes left join DetClientes on clientes.idcliente=DetClientes.idcliente left join '+
           'colonias on(clientes.idcol=colonias.idcol) left join categorias ON (clientes.idcategoria = '+
           'categorias.idcategoria) where clientes.idcliente BETWEEN '+quotedstr(cuenta1.Text)+' AND '+
           quotedstr(cuenta2.Text)+' and estatus=1 and GrupoTrafico <> 1 '+patrulla+' '+envio+' '+
           ordenamiento,0,sqlgeneral1);
    end;//fin cuenta

    ////// ****** COLONIAS ****** \\\\\\
    if Radiobutton2.Checked = true then
    begin
      if (combocol.Text = '- TODAS -') OR (combobox2.Text='- TODAS -') then
      begin
        querys('Select count(*) as account From clientes left join colonias on(clientes.idcol=colonias.idcol) '+
             'left join DetClientes on clientes.idcliente=DetClientes.idcliente where estatus=1 '+' '+
             patrulla+' '+envio+' and GrupoTrafico <> 1',0,sqlgeneral);
        countClie.Caption:='Total Clientes: '+sqlgeneral.fieldbyname('account').AsString;
        x:=sqlgeneral.fieldbyname('account').AsInteger;
        porcento.MaxValue:=x;
        count1:=x+count1;
        querys('Select * From clientes, colonias left join DetClientes on clientes.idcliente = '+
             'DetClientes.idcliente WHERE clientes.idcol=colonias.idcol and estatus=1 '+patrulla+' '+
             envio+' and GrupoTrafico <> 1 Order by colonias.nombre, dir',0,sqlgeneral2);
      end
      else
      begin
        cadena := '';
        col1:= combocol.Text;
        col2:= combobox2.Text;
        //verifica cuantos estan activos en este rango de colonias
        querys('Select count(*)as account From clientes left join colonias on(clientes.idcol=colonias.idcol) '+
             'left join DetClientes on clientes.idcliente=DetClientes.idcliente where estatus=1 and '+
             'colonias.nombre BETWEEN '+quotedstr(combocol.Text)+' AND '+quotedstr(combobox2.Text)+
             patrulla+' '+envio+' and GrupoTrafico <> 1 Order by colonias.nombre,dir',0,sqlgeneral);
        countClie.Caption:='Total Clientes: '+sqlgeneral.fieldbyname('account').AsString;
        x:=sqlgeneral.fieldbyname('account').AsInteger;
        porcento.MaxValue:=x;
        count1:=x+count1;
        querys('Select clientes.idcliente, if(clientes.rsocial='''' or clientes.rsocial is null, '+
             'concat(ifnull(clientes.nombre,"")," ",ifnull(clientes.apaterno,"")," ",ifnull'+
             '(clientes.amaterno,"")),clientes.rsocial) as NombreCliente, clientes.dir, clientes.numero, '+
             'clientes.refs, colonias.nombre as colonia, clientes.cp, clientes.sector, clientes.alarm, '+
             'categorias.nombre as categoria, clientes.idcol as idcol, clientes.email as email, '+
             'clientes.ultfectraf, ultfectrafmail From clientes left join DetClientes on clientes.idcliente = '+
             'DetClientes.idcliente left join colonias on(clientes.idcol=colonias.idcol) left join categorias '+
             'ON ( clientes.idcategoria=categorias.idcategoria ) WHERE colonias.nombre BETWEEN '+
             quotedstr(combocol.Text)+' AND '+quotedstr(combobox2.Text)+' and GrupoTrafico <> 1 and estatus=1 '+
             patrulla+' '+envio+' Order by colonias.nombre, dir',0,sqlgeneral1);
      end;
    end;  //Colonias

    ////// ****** GRUPOS ****** \\\\\\

    if Rbgrupos.Checked = true then
    begin
      //trae la cantidad de cuentas en el rango que se tecleo
      querys('select ClientesFact.idcliente as account, ClientesFact.nombre, ClientesFact.rsocial, '+
           'clientes.GrupoTrafico from ClientesFact left join clientes on (clientes.idfact = '+
           'ClientesFact.idfact) left join DetClientes on clientes.idcliente=DetClientes.idcliente '+
           ' where (ClientesFact.nombre like '+quotedstr('%'+edgrupo.text+'%')+' or ClientesFact.rsocial '+
           'like '+quotedstr('%'+edgrupo.text+'%')+') and estatus=1 and clientes.GrupoTrafico = 1 '+
           patrulla+' '+envio,0,sqlgeneral5);
      cadena :='';
      countClie.Caption:='Total Clientes: '+sqlgeneral5.fieldbyname('account').AsString;
      //mostrar total cuentas
      x:=sqlgeneral5.fieldbyname('account').AsInteger;
      porcento.MaxValue:=x;
      count1:=x+count1;
      //trae los datos de las cuentas que estan en el rango seleccionado
      querys('select clientes.idcliente,if(clientes.rsocial="" or clientes.rsocial is null, '+
           'concat(ifnull(clientes.nombre,"")," ",ifnull(clientes.apaterno,"")," ", '+
           'ifnull(clientes.amaterno,"")),clientes.rsocial) as NombreCliente, clientes.dir, clientes.numero, '+
           'clientes.refs, colonias.nombre as colonia, clientes.cp, clientes.sector, clientes.alarm, '+
           'categorias.nombre as categoria, clientes.idcol as idcol, clientes.email as email, '+
           'clientes.ultfectraf, ultfectrafmail from ClientesFact left join clientes on (clientes.idfact = '+
           'ClientesFact.idfact) left join colonias on(clientes.idcol=colonias.idcol) left join categorias '+
           'ON ( clientes.idcategoria=categorias.idcategoria ) where (ClientesFact.nombre like '+
           quotedstr('%'+edgrupo.text+'%')+' or ClientesFact.rsocial like '+quotedstr('%'+edgrupo.text+'%')+
           ' ) and estatus=1 and clientes.GrupoTrafico = 1 '+patrulla+' '+envio+' '+ordenamiento,0,sqlgeneral1);
    end;//fin grupos

    if Rbnoenvia.Checked = true then   //No envia trafico
    begin
       //trae la cantidad de cuentas en el rango que se tecleo
      querys('Select count(clientes.idcliente) as account From clientes left join DetClientes on clientes.idcliente = '+
           'DetClientes.idcliente where  clientes.idcliente > 3206 and '+
           //'clientes.idcliente BETWEEN '+quotedstr(cuenta1.Text)+' AND '+quotedstr(cuenta2.Text)+' and '+
           'estatus=1 and GrupoTrafico <> 1 and (DetClientes.NoTraf=1 or (DetClientes.NoTraf is NULL) or (TrafEmail=0 and TrafEnPersona=0 and  NoTraf=0))',0,sqlgeneral);
      countClie.Caption:='Total Clientes: '+dmreportes.sqlgeneral.fieldbyname('account').AsString;
      //mostrar total cuentas
      x := dmreportes.sqlgeneral.fieldbyname('account').AsInteger;
      porcento.MaxValue:=x;
      count1:=x+count1;
      //trae los datos de las cuentas que estan en el rango seleccionado
      querys('Select clientes.idcliente,if(clientes.rsocial="" or clientes.rsocial is null, concat(ifnull'+
           '(clientes.nombre,"")," ",ifnull(clientes.apaterno,"")," ",ifnull(clientes.amaterno,"")), '+
           'clientes.rsocial) as NombreCliente, clientes.dir, clientes.numero, clientes.refs, '+
           'colonias.nombre as colonia,clientes.cp,clientes.sector,clientes.alarm,categorias.nombre as '+
           'categoria,clientes.idcol as idcol,clientes.email as email,clientes.ultfectraf, ultfectrafmail '+
           'From clientes left join DetClientes on clientes.idcliente=DetClientes.idcliente left join '+
           'colonias on(clientes.idcol=colonias.idcol) left join categorias ON (clientes.idcategoria = '+
           'categorias.idcategoria) where '+//clientes.idcliente > 3206 and '+
           'clientes.idcliente BETWEEN '+quotedstr(cuenta1.Text)+' AND '+quotedstr(cuenta2.Text)+' and '+
           'estatus=1 and GrupoTrafico <> 1 and (DetClientes.NoTraf=1 or (DetClientes.NoTraf is NULL) or (TrafEmail=0 and TrafEnPersona=0 and  NoTraf=0)) '+
           ordenamiento,0,sqlgeneral1);
    end;//fin no envia

    //          TERMINA DE HACER LA SELECCION DE LOS CLIENTES             //


    if(x>0) then
    begin
     //##################################################################################################
     //############################# aqui solo se envia el boletin ######################################
     //##################################################################################################
     if(chkboletin.Checked=true) then
     begin
        memo.Text := listaadjuntos.Items.Text;
        //me trae el correo del gerente de central
        //querys('SELECT if(usuarios.email1 is null or usuarios.email1='''',if(usuarios.email2 is null or '+
        //       'usuarios.email2="","'+frmprincipal.origensspa+'",usuarios.email2),usuarios.email1) as Correo '+
        //       'FROM usuarios INNER JOIN areas ON (usuarios.idarea = areas.idarea) INNER JOIN puestos ON '+
        //       '(usuarios.idpuesto = puestos.idpuesto) WHERE (areas.nombre = "CENTRAL") AND (puestos.nombre = '+
        //       '"GERENTE")',0,sqlgeneral);

        cadena := GetConfiguraciones('UserEmail', true); //'CORREO@ALARMEX.COM.MX';//sqlgeneral.fieldbyname('correo').AsString;
        sqlgeneral1.First;
        while not sqlgeneral1.Eof = true do
        begin
          res := send_email(cadena,cadena,sqlgeneral1.fieldbyname('email').AsString,'Alarmex le Informa',memo,CuerpoEmail,2);
          if res = 1 then
          begin
                inc(CorreosErroneos);
                lista.RowCount:=lista.RowCount + 1;
                lista.Cells[0,CorreosErroneos+ContSinCorreo]:=sqlgeneral1.fieldbyname('idcliente').AsString;
                lista.Cells[1,CorreosErroneos+ContSinCorreo]:=sqlgeneral1.fieldbyname('email').AsString;
                lista.visible:=true;
          end;
          sqlgeneral1.Next;
        end;

        //si hubo errores
        if lista.RowCount > 2 then
        begin
          pnlerrores.Visible:=true;
          querys('DROP TABLE IF EXISTS bademails'+frmprincipal.idmaq,1, sqlgeneral);
          querys('CREATE TABLE bademails'+frmprincipal.idmaq+' (idcliente int(11) NOT NULL default "0", '+
                'correo varchar(80) NOT NULL default "") ',1,sqlgeneral);     //TYPE=MyISAM
          for f:=1 to lista.RowCount-2 do
           querys('insert into bademails'+frmprincipal.idmaq+'(idcliente,correo) values ('+lista.Cells[0,f]+
                  ','+quotedstr(lista.cells[1,f])+')',1,sqlgeneral);
          querys('select * from bademails'+frmprincipal.idmaq+' order by idcliente',0,dmreportes.sqlgeneral);
          OperacionReporte('EmailIncorrectos','','IMP',1);
          querys('drop table bademails'+frmprincipal.idmaq,1,sqlgeneral);
        end;
     end
     else if(chkvencidos.Checked=true) then
     begin
      //######################################################################################################
      //############ aqui se envia las cuentas con saldo y reporte de edo cuenta #############################
      //######################################################################################################
      sqltemp := tmyquery.Create(self);
      sqltemp.Connection := dmaccesos.conexion;

      //traer el listado de clientes que tienen saldo pendiente
      //trae los datos de las cuentas que estan en el rango seleccionado
      cadena := GetConfiguraciones('UserEmail', true);
      if querys('select * from ( SELECT DISTINCT ' +
             ' IF ( pc.movimiento = 0, IF (pc2.movimiento = 1, - 1, 0), 1 ) AS condicion, ' +
             ' IF ( to_days("2013/03/13") - to_days(pc.FechaVence) > 0, to_days("2013/03/13") - to_days(pc.FechaVence), 0 ) AS dias, ' +
             ' pc.idpago AS idpago, pc.movimiento, p.concepto, pc.cargo, pc.restante, pc.idpedido, pc.idfactura, pc.FechaVence, pc.idcliente, ' +
             ' IF ( pc.FechaVence <= "2013/03/13", pc.restante, 0 ) AS debe, IF ( pc.FechaVence > "2013/03/13", pc.restante, 0 ) AS xvencer, c.email ' +
             ' FROM PagosClientes AS pc ' +
             ' LEFT JOIN pedidos AS p ON (p.idpedido = pc.idpedido) ' +
             ' left join clientes c on c.idcliente = p.idcliente ' +
             ' LEFT JOIN PagosClientes AS pc2 ON (pc2.idpedido = pc.idpedido AND pc2.movimiento = 1 ) ' +
             ' WHERE p.estatus IN (3, 4, 6) and c.estatus = 1 ' +
             ' AND p.saldado = 0 AND pc.movimiento IN (0, 1) ' +
             ' AND pc.restante > 0 and c.idcliente BETWEEN '+quotedstr(cuenta1.Text)+' AND '+quotedstr(cuenta2.Text)+
             ' HAVING condicion >= 0 and dias > 0) as t ' +
             ' group by idcliente order by idcliente',0,sqltemp) > 0 then
      begin
        sqltemp.First;
        while not sqltemp.Eof = true do
        begin
          if FileExists(uprincipal.my_path+'EstadoCuenta_Alarmex'+frmprincipal.idmaq+'.pdf') then
              DeleteFile(uprincipal.my_path+'EstadoCuenta_Alarmex'+frmprincipal.idmaq+'.pdf');

          estadocuenta(sqltemp.fieldbyname('idcliente').AsString);

          //  prepara el correo
          memo.Clear;
          //memo.Text := listaadjuntos.Items.Text;
          memo.Lines.Add(uprincipal.my_path+'EstadoCuenta_Alarmex'+frmprincipal.idmaq+'.pdf');
          //listaadjuntos.Items.Add(uprincipal.my_path+'EstadoCuenta_Alarmex'+frmprincipal.idmaq+'.pdf');

          res := send_email(cadena,cadena,sqltemp.fieldbyname('email').AsString,'Alarmex le Informa',memo,CuerpoEmail,2);
          if res = 1 then
          begin
            inc(CorreosErroneos);
            lista.RowCount:=lista.RowCount + 1;
            lista.Cells[0,CorreosErroneos+ContSinCorreo]:=sqltemp.fieldbyname('idcliente').AsString;
            lista.Cells[1,CorreosErroneos+ContSinCorreo]:=sqltemp.fieldbyname('email').AsString;
            lista.visible:=true;
          end;
          sqltemp.Next;
        end;

      end;
     end
     else
     begin
      //######################################################################################################
      //########################### aqui se envia el trafico #################################################
      //######################################################################################################
      aclie:=0;
      REPEAT
        //aqui vamos a mandar la cuenta........
        if chkEstadoCuenta.Checked then
          estadocuenta(sqlgeneral1.fieldbyname('idcliente').AsString);
        Self.Caption := 'Reporte de trafico de '+sqlgeneral1.fieldbyname('idcliente').AsString;
        sqlgeneral2.CLOSE;
        sqlgeneral2.SQL.Clear;
        sqlgeneral2.Sql.Add('Select * From colonias WHERE idcol='+
                          quotedstr(sqlgeneral1.fieldbyname('idcol').AsString));
        if f=1 then
          sqlgeneral2.sql.add('Order by colonias.nombre');
        sqlgeneral2.Open;
        bsk:=0;
        querys('Select sk_alarmas.*,alarmas_conclusion.status as conclusion2 From sk_alarmas left join '+
             'alarmas_conclusion ON(sk_alarmas.conclusion=alarmas_conclusion.id) WHERE idcliente='+
             quotedstr(sqlgeneral1.fieldbyname('idcliente').AsString)+' and fecha_pc BETWEEN '+
             quotedstr(fecha1)+' AND '+quotedstr(fecha2)+' and user<>"SYS" ',0,sqlgeneral3);
        //  sacar el total de alarmas.......
        querys('Select count(*)as cuenta From sk_alarmas WHERE idcliente='+
             quotedstr(sqlgeneral1.fieldbyname('idcliente').AsString)+' and fecha_pc BETWEEN '+
             quotedstr(fecha1)+' AND '+quotedstr(fecha2)+' and user<>"SYS" ',0,sqlgeneral);
        y:=sqlgeneral.fieldbyname('cuenta').AsInteger;
        countsk.Caption:='Total Activaciones: '+sqlgeneral.fieldbyname('cuenta').AsString;
        tsk:=sqlgeneral.fieldbyname('cuenta').AsString;
        count2:=y+count2;
        if(y>0)then
        begin
          porcentosk.MaxValue:=y;
          bsk:=0;
          Repeat
            //saca el total de detalles
            querys('Select count(aid) as aid From alarmas_detalle WHERE aid='+
                 quotedstr(sqlgeneral3.fieldbyname('id').AsString),0,sqlgeneral);
            z:=sqlgeneral.fieldbyname('aid').AsInteger;
            countdet.Caption:='Total detalles por evento: '+sqlgeneral.fieldbyname('aid').AsString;
            querys('Select * From alarmas_detalle WHERE aid='+quotedstr(sqlgeneral3.fieldbyname('id').AsString)+
                 ' order by did ',0,sqlgeneral4);
            count3:=z+count3;
            if(z>0)then
            begin
              cdet:=0;
              memo1.Clear;
              repeat
                memo1.Lines.Add(sqlgeneral4.fieldbyname('detalle').AsString);
                sqlgeneral4.Next;
                inc(cdet);
              until(cdet=z);
            end; //if(z>0)
            querys('insert into trafic (id, idcliente, tipo, zona, fecha_pc, hora_pc, descripcion, user, '+
                 'conclusion2,c_zona,detalle) values ('+inttostr(bsk+1)+','+quotedstr(sqlgeneral3.fieldbyname('idcliente').AsString)+
                 ','+quotedstr(sqlgeneral3.fieldbyname('tipo').AsString)+', '+quotedstr(sqlgeneral3.fieldbyname('zona').AsString)+
                 ','+quotedstr(sqlgeneral3.fieldbyname('fecha_pc').Asstring)+','+quotedstr(FormatDateTime('HH:mm:ss',sqlgeneral3.fieldbyname('hora_pc').AsDateTime))+
                 ','+quotedstr(sqlgeneral3.fieldbyname('descripcion').AsString)+', '+quotedstr(sqlgeneral3.fieldbyname('user').AsString)+
                 ','+quotedstr(sqlgeneral3.fieldbyname('conclusion2').AsString)+','+quotedstr(sqlgeneral3.fieldbyname('c_zona').AsString)+
                 ','+quotedstr(MEMO1.Text)+')',1,sqlgeneral8);
            memo1.Clear;
            sqlgeneral3.Next;
            inc(bsk);
            porcentosk.Progress:=bsk;
          until(bsk=y);
        end;  //if(y>0)
        inc(aclie);
        porcento.Progress:=aclie;
        IF(bsk=y)then
        begin
          querys('select * from trafic where idcliente='+quotedstr(sqlgeneral1.fieldbyname('idcliente').AsString)+
               ' order by id',0,sqlgeneral8);
          querys('Select * From open_close WHERE idcliente='+quotedstr(sqlgeneral1.fieldbyname('idcliente').AsString)+
               ' and fecha_pc BETWEEN '+quotedstr(fecha1)+' AND '+quotedstr(fecha2)+'and tipo not in("4", "5", '+
               '"CL", "OP", "400")',0,sqlgeneral4);
          top:=inttostr(sqlgeneral4.recordcount);
          querys('Select '''' as notaps', 0, sqlgeneral5);
          //comentado por el edwin por que hay que revisarlo , deberia ser por rango de fechas mas no lo pueden capturar.
          querys('select notas.nota from notas inner join clientes on clientes.idnota = notas.idnota where '+
             'TipoNota="NOALARMAS" and notas.fecha between '+quotedstr(fecha1)+
             ' and '+quotedstr(fecha2)+' and clientes.idcliente = '+
              sqlgeneral1.fieldbyname('idcliente').AsString,0,dmreportes.sqlgeneral3);
          inc(print);

          //########################################  imprimir trafico   ##################################################
          if rgaccion.ItemIndex=1 then  //
          begin
            //bpcambios('clientes', sqlgeneral1.fieldbyname('idcliente').AsString, 'idcliente');
            querys('update clientes set ultfectraf="'+datetostr(date)+'" where idcliente='+sqlgeneral1.fieldbyname('idcliente').AsString,1,sqlgeneral);
            //apcambios('idcliente', sqlgeneral1.fieldbyname('idcliente').AsString, 'clientes', 'frmreports');
            if chkvistaprevia.Checked = true then
            begin
              rvsystem1.DefaultDest:=rdpreview;
              RVP.Engine:=dmreportes.RvSystem1;
            end
            else
            begin
              rvsystem2.DefaultDest:=rdprinter;
              RVP.Engine:=dmreportes.RvSystem2;
            end;
            //rvsystem1.DefaultDest:=rdprinter;
            RVP.ProjectFile:=GetConfiguraciones('PathSysalarmServer', true)+'reports_alarmex.rav';
            rvp.setparam('Tax',tsk);
            rvp.setparam('TotalPrice',top);
            rvp.setparam('ReportTitle',fecha);
            rvp.ExecuteReport('trafic');
            rvp.Close;
            { //aqui vamos a mandar la cuenta........
            if chkEstadoCuenta.Checked then
            estadocuenta(sqlgeneral1.fieldbyname('idcliente').AsString);}
          end;

          if sqlgeneral1.fieldbyname('email').AsString = ''  then
          begin
            inc(ContSinCorreo);
            lista.RowCount:=lista.RowCount + 1;
            lista.Cells[0,CorreosErroneos+ContSinCorreo]:=sqlgeneral1.fieldbyname('idcliente').AsString;
            lista.Cells[1,CorreosErroneos+ContSinCorreo]:=sqlgeneral1.fieldbyname('email').AsString;
            lista.visible:=true;
          end;
          if (sqlgeneral1.fieldbyname('email').AsString <> '') and (sqlgeneral1.fieldbyname('ultfectrafmail').AsDateTime <> date) and (rgaccion.ItemIndex=0) then
          begin
            //verifica que existan los archivos pdf y si existen lon borra
            if FileExists(uprincipal.my_path+'Trafico_Alarmex'+frmprincipal.idmaq+'.pdf') then
              DeleteFile(uprincipal.my_path+'Trafico_Alarmex'+frmprincipal.idmaq+'.pdf');
            if FileExists(uprincipal.my_path+'Estadistica_Alarmex'+frmprincipal.idmaq+'.pdf') then
              DeleteFile(uprincipal.my_path+'Estadistica_Alarmex'+frmprincipal.idmaq+'.pdf');
            if FileExists(uprincipal.my_path+'EstadoCuenta_Alarmex'+frmprincipal.idmaq+'.pdf') then
              DeleteFile(uprincipal.my_path+'EstadoCuenta_Alarmex'+frmprincipal.idmaq+'.pdf');
            if FileExists(uprincipal.my_path+'ServiciosCliente'+frmprincipal.idmaq+'.pdf') then
              DeleteFile(uprincipal.my_path+'ServiciosCliente'+frmprincipal.idmaq+'.pdf');
            RVP.Engine:=RvSystem2;
            rvsystem2.DefaultDest:=rdfile;
            RVP.ProjectFile:=GetConfiguraciones('PathSysalarmServer', true)+'reports_alarmex.rav';
            rvsystem2.DefaultDest:=rdfile;
            RvSystem2.DoNativeOutput:=false;
            RvSystem2.RenderObject:=RvRenderPDF1;
            RvSystem2.OutputFileName:=uprincipal.my_path+'Trafico_Alarmex'+frmprincipal.idmaq+'.pdf';
            rvp.Engine:=rvsystem2;
            rvp.setparam('Tax',tsk);
            rvp.setparam('TotalPrice',top);
            rvp.setparam('ReportTitle',fecha);
            rvp.ExecuteReport('trafic');
            rvp.Close;
            //trae el encabezado
            querys('SELECT sum(AjusteInv.totalmn*'+floattostr(1+getIVA)+') as totales FROM AjusteInv INNER JOIN servicios ON (AjusteInv.idajuste = servicios.idajuste) INNER JOIN clientes ON (servicios.idcliente = clientes.idcliente) WHERE servicios.idcliente = '+sqlgeneral1.fieldbyname('idcliente').AsString+' AND servicios.FechaFinSys BETWEEN '+quotedstr(datetostr(date1_c.date))+' AND '+quotedstr(datetostr(date2_c.date)),0,dmreportes.sqlgeneral);
            if dmreportes.sqlgeneral.fieldbyname('totales').AsString <> '' then
              cadena := dmreportes.sqlgeneral.fieldbyname('totales').AsString
            else
              cadena := '0';
            if querys('SELECT '+cadena+' as GranTotal,servicios.sid,servicios.idcliente,if(clientes.rsocial is NULL '+
                      'or clientes.rsocial = "", if(clientes.apaterno is NULL or clientes.apaterno="", '+
                      'clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno = "",'+
                      ' concat(clientes.nombre,"", clientes.apaterno),concat(clientes.nombre,"",clientes.apaterno," ",'+
                      ' clientes.amaterno))), clientes.rsocial) AS cliente, servicios.FechaFinSys, servicios.idajuste, '+
                      'servicios.CodTecnico, servicios.problema, servicios.trab_realizado, AjusteInv.TipoCambio, '+
                      'AjusteInv.SubTotal,AjusteInv.SubTotal*'+floattostr(getIVA)+' as iva, AjusteInv.total*'+floattostr(1+getIVA)+' as total, AjusteInv.totalmn*'+floattostr(1+getIVA)+' '+
                      'as totalmn, AjusteInv.TotalProductos, DetAjusteInv.cod_cve, DetAjusteInv.cant_ord, DetAjusteInv.costo,'+
                      '(DetAjusteInv.costo*DetAjusteInv.cant_ord) as TotalArt,articulos.nombre FROM AjusteInv INNER JOIN '+
                      'servicios ON (AjusteInv.idajuste = servicios.idajuste) inner join DetAjusteInv on DetAjusteInv.idajuste '+
                      '= AjusteInv.idajuste INNER JOIN articulos ON (DetAjusteInv.cod_cve = articulos.cod_cve) INNER JOIN '+
                      'clientes ON (servicios.idcliente = clientes.idcliente) WHERE servicios.idcliente = '+
                      quotedstr(sqlgeneral1.fieldbyname('idcliente').AsString)+' AND servicios.FechaFinSys BETWEEN '+
                      quotedstr(datetostr(date1_c.date))+' AND '+quotedstr(datetostr(date2_c.date)),0,dmreportes.sqlgeneral) > 0 then
            begin
              with dmreportes do
              begin
                ppReport.Template.DatabaseSettings.Name := 'ServiciosCliente';
                ppReport.Template.LoadFromDatabase;
                ppReport.AllowPrintToFile := True;
                ppReport.ShowPrintDialog := false;
                ppReport.TextFileName := uprincipal.my_path+'ServiciosCliente'+frmprincipal.idmaq+'.pdf';
                ppReport.DeviceType := 'PDFFile';
                ppReport.Print;
              end;
            end;
            //  concentrado
            querys('select '+ClienteNombre('clientes')+' as nombre, ConcentradoAlarmas.*, alarmas_conclusion.status from '+
                  'ConcentradoAlarmas left join alarmas_conclusion ON(ConcentradoAlarmas.conclusion = '+
                  '  alarmas_conclusion.id) left join clientes on (ConcentradoAlarmas.idcliente=clientes.idcliente) '+
                  'where ConcentradoAlarmas.idcliente = '+quotedstr(sqlgeneral1.fieldbyname('idcliente').AsString)+
                  ' and year=year("'+datetostr(date)+'") ',0,dmreportes.sqlgeneral);
                  //     --** Asistencia Patrulleros  **--  (Dentro del Reporte de Concentrado de Alarmas)//
            bonopat := GetConfiguraciones('CostoservicioPat', true);
            ctoserv := GetConfiguraciones('CostoServicoTec', true);
            querys('Drop table if exists tmpConPat'+frmprincipal.idmaq ,1, dmreportes.sqlgeneral8);
            querys('Create table tmpConPat'+frmprincipal.idmaq+' (tipo varchar(15), a1 int(11) default 0, a2 int(11) '+
                   'default 0, a3 int(11) default 0, a4 int(11) default 0, a5 int(11) default 0, a6 int(11) '+
                   'default 0, a7 int(11) default 0, a8 int(11) default 0, a9 int(11) default 0, a10 int(11) default 0, '+
                   'a11 int(11) default 0, a12 int(11) default 0 )' ,1, dmreportes.sqlgeneral8);
            querys('select '+ClienteNombre('clientes')+' as nombre, count(t.nombre) as asistencias, month( t.fecha) as mes from '+
                   'tiempo_respuesta as t left join alarmas as a on (t.aid = a.aid) left join clientes on (a.idcliente'+
                    '=clientes.idcliente) where a.idcliente='+quotedstr(sqlgeneral1.fieldbyname('idcliente').AsString)+
                    ' and (t.fecha) = year("'+datetostr(date1_c.date)+'") group by mes', 0, dmreportes.sqlgeneral8);
            querys('Insert into tmpConPat'+frmprincipal.idmaq+' set tipo = ''Asistencias'' ', 1, dmreportes.sqlgeneral7);
            dmreportes.sqlgeneral8.First;
            while not dmreportes.sqlgeneral8.eof = true do
            begin
              querys('Update tmpConPat'+frmprincipal.idmaq+' set a'+dmreportes.sqlgeneral8.fieldbyname('mes').AsString+
                 '='+quotedstr(dmreportes.sqlgeneral8.fieldbyname('asistencias').AsString), 1, dmreportes.sqlgeneral5);
              dmreportes.sqlgeneral8.Next;
            end;
            querys('select *, '+bonopat+' as bono from tmpConPat'+frmprincipal.idmaq, 0, dmreportes.sqlgeneral4);
            //   ---*** Concentrado Servicios   ***--//
            querys('update ConcentradoServicios set total = m1+m2+m3+m4+m5+m6+m7+m8+m9+m10+m11+m12 where idcliente ='+quotedstr(sqlgeneral1.fieldbyname('idcliente').AsString)+' and year=year("'+datetostr(date)+'")',1,sqlgeneral2);
            querys('select *, '+ctoserv+' as serv  from ConcentradoServicios where idcliente ='+quotedstr(sqlgeneral1.fieldbyname('idcliente').AsString)+' and year=year("'+datetostr(date)+'")',0,sqlgeneral2);
            //attach here => EMA resumen<=
            querys('Select "MONITOREO" as concepto, count(p.idpedido) as cant,  round(cat.CostoMensual*1.10,2) as costo, '+
               'sum(p.TotMn) as importe from pedidos p left join clientes c on c.idcliente= p.idcliente left join '+
               'categorias cat on cat.idcategoria=c.idcategoria where p.idcliente = '+
               sqlgeneral1.fieldbyname('idcliente').AsString+' and p.idunidadnegocio = 4 and p.estatus in(3,4,5) '+
               'and year(p.FechaCreacion) = year("'+datetostr(date1_c.date)+'") group by p.idcliente '+
               'UNION  '+
               'Select "ASISTENCIAS", count(t.nombre) as cant, round('+bonopat+',2) as costo, count(t.nombre) * -'+bonopat+' as '+
               'importe from tiempo_respuesta as t left join alarmas as a on (t.aid = a.aid) left join clientes on '+
               '(a.idcliente=clientes.idcliente) where a.idcliente='+sqlgeneral1.fieldbyname('idcliente').AsString+' and '+
               'year(t.fecha) = year("'+datetostr(date1_c.date)+'") group by a.idcliente '+
               'UNION '+
               'select "SERVICIOS", total-sc.cant, round('+ctoserv+',2), (total-sc.cant)*-'+ctoserv+' from ConcentradoServicios '+
               'join (Select count(p.idpedido) as cant from pedidos p left join clientes c on c.idcliente= p.idcliente '+
               'left join categorias cat on cat.idcategoria=c.idcategoria where p.idcliente = '+
               sqlgeneral1.fieldbyname('idcliente').AsString+' and p.idunidadnegocio = 2 and p.estatus in(3,4,5) and '+
               'year(p.FechaCreacion) = year("'+datetostr(date1_c.date)+'") group by p.idcliente) as sc where idcliente = '+
               sqlgeneral1.fieldbyname('idcliente').AsString+' and year = year("'+datetostr(date1_c.date)+'") '+
               'UNION '+
               'Select "SERVICIOS COBRABLES" as concepto, count(p.idpedido) as cant, round(p.TotMn,2) as costo, '+
               '(sum(p.TotMn)-sum(p.saldo))*-1 as importe from pedidos p left join clientes c on c.idcliente= p.idcliente '+
               'left join categorias cat on cat.idcategoria=c.idcategoria where p.idcliente = '+sqlgeneral1.fieldbyname('idcliente').AsString+
               ' and p.idunidadnegocio = 2 and p.estatus in(3,4,5) and year(p.FechaCreacion) = year("'+datetostr(date1_c.date)+'") '+
               'group by p.idcliente', 0, sqlgeneral3);
            ppReport.Template.DatabaseSettings.Name := 'CentralConcentradoAlarmas';
            ppReport.Template.LoadFromDatabase;
            ppReport.AllowPrintToFile := True;
            ppReport.ShowPrintDialog := false;
            ppReport.TextFileName := uprincipal.my_path+'Estadistica_Alarmex'+frmprincipal.idmaq+'.pdf';
            ppReport.DeviceType := 'PDFFile';
            ppReport.Print;
            //concentrado(1,monthof(date),sqlgeneral1.fieldbyname('account').Asinteger,formatdatetime('yyyy',now));
            {querys('select ConcentradoAlarmas.*,alarmas_conclusion.status as concepto from ConcentradoAlarmas left join alarmas_conclusion  ON(ConcentradoAlarmas.conclusion=alarmas_conclusion.id) where idcliente = '+quotedstr(sqlgeneral1.fieldbyname('idcliente').AsString)+' and year=year("'+datetostr(date)+'") ',0,sqlgeneral5);
            querys('select * from ConcentradoServicios where idcliente ='+quotedstr(sqlgeneral1.fieldbyname('idcliente').AsString)+' and year=year("'+datetostr(date)+'")',0,sqlgeneral6);
            RVP.ProjectFile:=uprincipal.my_path+'Reportes_alarmex.rav';
            rvsystem2.DefaultDest:=rdfile;
            RvSystem2.DoNativeOutput:=false;
            RvSystem2.RenderObject:=RvRenderPDF1;
            RvSystem2.OutputFileName:=uprincipal.my_path+'Estadistica_Alarmex'+frmprincipal.idmaq+'.pdf';
            RVP.Engine:=rvsystem2;
            RVP.SetParam('fecha',formatdatetime('yyyy',now));
            RVP.SetParam('cuenta',sqlgeneral1.fieldbyname('idcliente').Asstring);
            RVP.ExecuteReport('RepConcentradoAlarmas');
            rvp.Close;
            }
            ///aqui vamos a mandar la cuenta........
            //estadocuenta(sqlgeneral1.fieldbyname('account').AsString);
            //     RVP.Engine:=dmrep.RvSystem1;
            if chkEstadoCuenta.Checked then
              estadocuenta(sqlgeneral1.fieldbyname('idcliente').AsString);
            //  prepara el correo
            if listaadjuntos.Items.IndexOf(uprincipal.my_path+'Trafico_Alarmex'+frmprincipal.idmaq+'.pdf') =-1 then
            begin
              memo.Text := listaadjuntos.Items.Text;
              memo.Lines.Add(uprincipal.my_path+'Estadistica_Alarmex'+frmprincipal.idmaq+'.pdf');
              listaadjuntos.Items.Add(uprincipal.my_path+'Estadistica_Alarmex'+frmprincipal.idmaq+'.pdf');
              memo.Lines.Add(uprincipal.my_path+'Trafico_Alarmex'+frmprincipal.idmaq+'.pdf');
              listaadjuntos.Items.Add(uprincipal.my_path+'Trafico_Alarmex'+frmprincipal.idmaq+'.pdf');
              memo.Lines.Add(uprincipal.my_path+'ServiciosCliente'+frmprincipal.idmaq+'.pdf');
              listaadjuntos.Items.Add(uprincipal.my_path+'ServiciosCliente'+frmprincipal.idmaq+'.pdf');
              if  chkEstadoCuenta.Checked then
              begin
                memo.Lines.Add(uprincipal.my_path+'EstadoCuenta_Alarmex'+frmprincipal.idmaq+'.pdf');
                listaadjuntos.Items.Add(uprincipal.my_path+'EstadoCuenta_Alarmex'+frmprincipal.idmaq+'.pdf');
              end;
            end;
            //me trae el correo del gerente de central
            querys('SELECT if(usuarios.email1 is null or usuarios.email1='''',if(usuarios.email2 is null or '+
               'usuarios.email2="","'+frmprincipal.origensspa+'",usuarios.email2),usuarios.email1) as Correo '+
               'FROM usuarios INNER JOIN areas ON (usuarios.idarea = areas.idarea) INNER JOIN puestos ON '+
               '(usuarios.idpuesto = puestos.idpuesto) WHERE (areas.nombre = "CENTRAL") AND (puestos.nombre = '+
               '"GERENTE")',0,sqlgeneral);
            cadena := GetConfiguraciones('UserEmail', true); //'CORREO@ALARMEX.COM.MX';//sqlgeneral.fieldbyname('correo').AsString;
            if send_email(cadena,cadena,sqlgeneral1.fieldbyname('email').AsString,'Alarmex le Informa',memo,CuerpoEmail,2) = 1 then
            begin
              inc(CorreosErroneos);
              lista.RowCount:=lista.RowCount + 1;
              lista.Cells[0,CorreosErroneos+ContSinCorreo]:=sqlgeneral1.fieldbyname('idcliente').AsString;
              lista.Cells[1,CorreosErroneos+ContSinCorreo]:=sqlgeneral1.fieldbyname('email').AsString;
              lista.visible:=true;
            end
            else
              //actualiza la ultima fecha de envio de correo si tiene email claro jejejeje
              if(AnsiContainsText(sqlgeneral1.fieldbyname('email').AsString,'@')) then
              begin
                // bpcambios('clientes', sqlgeneral1.fieldbyname('idcliente').AsString, 'idcliente');
                querys('update clientes set ultfectrafmail="'+datetostr(date)+'" where idcliente='+sqlgeneral1.fieldbyname('idcliente').AsString,1,sqlgeneral);
                // apcambios('idcliente', sqlgeneral1.fieldbyname('idcliente').AsString, 'clientes', 'frmreports');
              end;
              // contrasenia.send_email('sistemaSSPA@alarmex.com.mx','sistemaSSPA@alarmex.com.mx',dm4.clieemail.AsString,'Su estado de Cuenta',menuprincipal.my_path+'trafico.html',path_boletin,CuerpoEmail);
            shortdateformat:='yyyy/mm/dd';
          end;
        end;
        sqlgeneral1.Next;
        memo1.Clear;
      until(aclie=x);
     end;//boletin o trafico
    end; //if(x>0)

    if(chkboletin.Checked=true) then
    begin
      if lista.RowCount > 2 then
      begin
          pnlerrores.Visible:=true;
      end;
    end
    else
    begin
      if chkvistaprevia.Checked = true then
      begin
        rvsystem1.DefaultDest:=rdpreview;
        RVP.Engine:=dmreportes.RvSystem1;
      end
      else
      begin
        rvsystem2.DefaultDest:=rdprinter;
        RVP.Engine:=dmreportes.RvSystem2;
      end;
      //rvsystem1.DefaultDest:=rdpreview;
      RVP.Engine:=dmreportes.RvSystem1;
      //rvsystem2.DefaultDest:=rdprinter;
      countclie.Caption:='Total Clientes: '+inttostr(count1);
      countsk.Caption:='Total Activaciones: '+inttostr(count2);
      countdet.Caption:='Total detalles: '+inttostr(count3);
      lprint.Caption:=inttostr(print);
      querys('delete from trafic',1,sqlgeneral);
      querys('select * from trafic',0,sqlgeneral);
      //verifica que existan los archivos pdf y si existen lon borra
      if FileExists(uprincipal.my_path+'Trafico_Alarmex'+frmprincipal.idmaq+'.pdf') then
        DeleteFile(uprincipal.my_path+'Trafico_Alarmex'+frmprincipal.idmaq+'.pdf');
      if FileExists(uprincipal.my_path+'Estadistica_Alarmex'+frmprincipal.idmaq+'.pdf') then
        DeleteFile(uprincipal.my_path+'Estadistica_Alarmex'+frmprincipal.idmaq+'.pdf');
      if FileExists(uprincipal.my_path+'EstadoCuenta_Alarmex'+frmprincipal.idmaq+'.pdf') then
        DeleteFile(uprincipal.my_path+'EstadoCuenta_Alarmex'+frmprincipal.idmaq+'.pdf');
      if FileExists(uprincipal.my_path+'ServiciosCliente'+frmprincipal.idmaq+'.pdf') then
        DeleteFile(uprincipal.my_path+'ServiciosCliente'+frmprincipal.idmaq+'.pdf');
      if rgaccion.ItemIndex=0 then
      begin
         {  //INDICA SI HUBO CUENTAS SIN EMAIL
         col1:='Se encontraron '+inttostr(ContSinCorreo)+' clientes sin direccion de correo electrónico';
        if ContSinCorreo > 0 then
         application.MessageBox(pchar(col1),'Informacion',mb_iconinformation);
       if CorreosErroneos > 0 then
         begin
         col1:='Hay ' + inttostr(CorreosErroneos) + ' Correos con errores de captura';
         application.MessageBox(pchar(col1),'Aviso',mb_iconwarning);
         end;}
       if lista.RowCount > 2 then
       begin
          pnlerrores.Visible:=true;
          querys('DROP TABLE IF EXISTS bademails'+frmprincipal.idmaq,1, sqlgeneral);
          querys('CREATE TABLE bademails'+frmprincipal.idmaq+' (idcliente int(11) NOT NULL default "0", '+
                'correo varchar(80) NOT NULL default "") ',1,sqlgeneral);     // TYPE=MyISAM
          for f:=1 to lista.RowCount-2 do
           querys('insert into bademails'+frmprincipal.idmaq+'(idcliente,correo) values ('+lista.Cells[0,f]+
                  ','+quotedstr(lista.cells[1,f])+')',1,sqlgeneral);
          querys('select * from bademails'+frmprincipal.idmaq+' order by idcliente',0,dmreportes.sqlgeneral);
          OperacionReporte('EmailIncorrectos','','IMP',1);
          querys('drop table bademails'+frmprincipal.idmaq,1,sqlgeneral);
       end;

      querys('Select c.idcliente, '+ClienteNombre('c')+' as cliente, c.email from clientes c where c.ultfectrafmail = curdate()', 0, dmreportes.sqlgeneral);
      OperacionReporte('CuentaEnvEmail', 'CuentaEnvEmail', 'IMP', 1);
      end;
      querys('Drop table if exists tmpConPat'+frmprincipal.idmaq ,1, dmreportes.sqlgeneral8);
    end;
  end;//with dmon
  showmessage('Termino la Impresion de Trafico');
end;

procedure TReports_Alarmex.BitBtn1Click(Sender: TObject);
begin
close;
end;

procedure TReports_Alarmex.RadioButton1Click(Sender: TObject);
begin
Panel1.Visible:=true;
Panel6.Visible:=true;
PANFECHA_C.top:=120;
label4.Caption:='Cuenta';
label5.visible:=true;
label3.Visible:=true;
cuenta1.Enabled:=true;
cuenta2.Enabled:=true;
validar(self);
label5.Caption:='Fecha';
panel7.Visible:=false;
label6.Visible:=true;
end;


procedure TReports_Alarmex.RadioButton2Click(Sender: TObject);
begin
button1click(self);
Panel1.Visible:=false;
Panel6.Visible:=false;
PANFECHA_C.top:=72;
label5.caption:='Colonia';
label3.Visible:=true;
label4.Caption:='Fecha';
panel6.Visible:=false;
label6.Visible:=false;
panel7.Visible:=true;
end;

procedure TReports_Alarmex.rbgruposClick(Sender: TObject);
begin
Panel1.Visible:=true;
Panel6.Visible:=true;
PANFECHA_C.top:=120;
label4.Caption:='Cuenta';
label5.visible:=true;
label3.Visible:=true;
cuenta1.Enabled:=false;
cuenta2.Enabled:=false;
validar(self);
label5.Caption:='Fecha';
panel7.Visible:=false;
label6.Visible:=true;

if rbgrupos.Checked = true then
  edgrupo.Enabled := true
else
  edgrupo.Enabled := false;
end;

procedure TReports_Alarmex.RadioButton3Click(Sender: TObject);
begin
cuenta1.Enabled:=false;
cuenta2.Enabled:=false;
end;




procedure TReports_Alarmex.btnguardarClick(Sender: TObject);
begin
   if CuerpoEmail.Text <> '' then
      begin
         //actualiza la informacion del mensaje que se pondra en el email
        querys('update configuraciones set ValorMemo='+quotedstr(cuerpoemail.Text)+' where concepto=''CuerpoEmail'' ',1,sqlgeneral);
      end
       else
       application.MessageBox('Debe de insertar un mensaje, para enviarlo en el cuerpo del Email','Aviso',mb_iconwarning);
end;

procedure TReports_Alarmex.Button1Click(Sender: TObject);
var
p,q: INTEGER;
begin
  p:=0;
   querys('Select * from colonias Order by nombre',0,sqlgeneral);
   q:=sqlgeneral.RecordCount;
   combobox2.Clear;
   sqlgeneral.First;
   combobox2.Items.Add('- TODAS -');
   combocol.Items.Add('- TODAS -');
   IF(q>0)THEN
   BEGIN
   REPEAT
   combobox2.Items.Add(sqlgeneral.fieldbyname('nombre').AsString);
   combocol.Items.Add(sqlgeneral.fieldbyname('nombre').asstring);
   INC(p);
   sqlgeneral.Next;
   UNTIL p=q;
   Combocol.ItemIndex:=0;
   combobox2.ItemIndex:=0;
   end;

end;

procedure TReports_Alarmex.rgaccionClick(Sender: TObject);
begin

if rgaccion.ItemIndex >-1 then
   bbimprimir_c.Enabled:=true
else
  bbimprimir_c.Enabled:=false;

if rgaccion.ItemIndex=0 then
   begin
     bbimprimir_c.Caption := 'Email';
     bbimprimir_c.ImageIndex := 0;
     cuerpoemail.Enabled:=true;
     btnguardar.Enabled:=true;
     btnadjuntar.Enabled:=true;
     btnlimpiar.Enabled:=true;
      //actualiza el memo
       querys('select ValorMemo from configuraciones where concepto=''CuerpoEmail'' ',0,sqlgeneral);

       cuerpoemail.Text:=sqlgeneral.fieldbyname('ValorMemo').AsString;
       if CuerpoEmail.Text = '' then
          begin
            application.MessageBox('Debe de insertar un mensaje, para enviarlo en el cuerpo del Email','Aviso',mb_iconwarning);
            cuerpoemail.Text:='Alarmex Tel. 557-02-02';
            btnguardar.Click;
          end;
   end
else
  begin
    btnadjuntar.Enabled:=false;
    cuerpoemail.Enabled:=false;
    btnguardar.Enabled:=false;
    btnlimpiar.Click;
    btnlimpiar.Enabled:=false;
    bbimprimir_c.Caption := 'Imprimir';
    bbimprimir_c.ImageIndex := 1;
  end;

end;

procedure TReports_Alarmex.btnadjuntarClick(Sender: TObject);
begin
if boletin.Execute then
begin
listaadjuntos.Items.Add(boletin.FileName);
memo.Lines.Add(boletin.FileName)
end;
end;

procedure TReports_Alarmex.listaadjuntosKeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if key = 46 then
begin
listaadjuntos.Items.Delete(listaadjuntos.ItemIndex);
memo.Lines.Delete(listaadjuntos.ItemIndex);
end;
end;

procedure TReports_Alarmex.btnlimpiarClick(Sender: TObject);
begin
listaadjuntos.Clear;
memo.Clear;
end;

procedure TReports_Alarmex.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
//conMonitor.Disconnect;
action:=cafree;
end;

procedure TReports_Alarmex.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure TReports_Alarmex.cuenta1Change(Sender: TObject);
begin
cuenta2.Text := cuenta1.Text;
end;
{
function TReports_Alarmex.PruebasFaltan(cliente:string):string;
var fp:Integer;
psmemo:Tmemo;
com,tmp:string;
ps,h:tdate;
begin
psmemo := TMemo.Create(nil);
psmemo.Parent := panbusca;
psmemo.visible := false;
com := 'Falta Prueba de Semana del dia ';
querys('Select fecha_pc, tipo From open_close WHERE idcliente='+cliente+' and '+
       'fecha_pc BETWEEN "'+datetostr(Date1_c.Date)+'" AND "'+datetostr(Date2_c.Date)+
       '" and (tipo  in("RP", "0", "602") '+'or descripcion = "PRUEBA SEMANAL") ', 0, sqlgeneral);
if sqlgeneral.RecordCount = 0 then       //psmemo.Lines.Add('No se encontraron Pruebas Semanales')
  begin
  if  daysbetween(date2_c.date, date1_c.date) >= 7 then
    psmemo.text := 'No se encontraron Pruebas Semanales'
  end
else
  begin
  sqlgeneral.first;
  ps := sqlgeneral.fieldbyname('fecha_pc').AsDateTime;
  fp := daysbetween(ps, date1_c.date);
  if fp > 7 then //si faltaron pruebas antes de la primera señal
    begin
      h := IncDay(ps, -7);
      repeat
      h := IncDay(h, -7);
      psmemo.text := pchar(psmemo.text+ com +datetostr(h)+chr(13));
      until (h < date1_c.Date );
    end;

  sqlgeneral.Next;     //si faltaron entre las que llegaron
  while not sqlgeneral.Eof = true do
    begin
    ps := IncDay(ps, 7);
    tmp := datetostr(ps);
    if ps <> sqlgeneral.fieldbyname('fecha_pc').AsDateTime then
       if(ps < Date2_c.Date) then
          psmemo.text := pchar(psmemo.text+ com+datetostr(ps)+chr(13));

    sqlgeneral.Next;
    end;

  sqlgeneral.last; //las que faltaron antes de la fecha de fin de busqueda
  ps := sqlgeneral.fieldbyname('fecha_pc').AsDateTime;

  repeat
    ps := IncDay(ps, 7);
    if ps <= date2_c.Date then

      psmemo.text := pchar(psmemo.text+ com +datetostr(ps)+chr(13));
  until (IncDay(ps, 7) > date2_c.Date );

  end;
result := psmemo.text;

end;}

procedure TReports_Alarmex.chkboletinClick(Sender: TObject);
begin
  chkvistaprevia.Checked:=false;
  chkEstadoCuenta.Checked:=false;
  chkvencidos.Checked:= false;
end;

procedure TReports_Alarmex.chkvencidosClick(Sender: TObject);
begin
  chkvistaprevia.Checked:=false;
  chkEstadoCuenta.Checked:=false;
  chkboletin.Checked:= false;
end;

procedure TReports_Alarmex.chkvistapreviaClick(Sender: TObject);
begin
  chkvencidos.Checked:=false;
  chkvencidos.Checked:= false;
end;

End.
