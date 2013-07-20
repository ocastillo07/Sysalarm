{///////////////////////////////////////////////////////////////////////////////
2012/03/21 dalyla se agrego la opcion a hacer por un solo cliente
2012/02/28 dalyla no siempre sale el cr en pm, idcat nulo y DE de 151 caracteres
2009-03-23 Oscar validaciones personasmorales
2009/01/21 Oscar correccion a los datos del estado
2008/12/03 Oscar Ultima modificacion
2008/08/13 correcciones buro
2008/08/01 Oscar agrege el procedure agregartodos
2008/02/28 dalyla zona horaria ok
}///////////////////////////////////////////////////////////////////////////////
unit UBuroCredito;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzLabel, Mask, RzEdit,StrUtils,
  LMDCustomComponent, LMDIniCtrl,ShellApi,  RzRadChk,OleCtrls;

type
  TfrmBuroCredito = class(TForm)

    edClave: TRzEdit;
    lblFechaBajaRem: TRzLabel;
    btngenerar: TRzBitBtn;
    memofis: TRzMemo;
    ednombre: TRzEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    cuerpomail: TRzMemo;
    RzLabel3: TRzLabel;
    memolog: TRzMemo;
    memomor: TRzMemo;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    RzLabel6: TRzLabel;
    memoadjunto: TRzMemo;
    procedure edClaveKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btngenerarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
    procedure agregartodos;
    procedure Split(const Delimiter: Char;Input: string;const Strings: TStrings);
    procedure PersonasMorales();
    procedure PersonasFisicas(todos:boolean);
    procedure SegmentoEncabezadoPM();
    procedure SegmentoCierreArchivoPM();
    procedure comprimir;


    function BuscarLetrasNoValidas(cadena:string):bool;
    function ValidarRFC(cadena:string;ban:integer):bool;
    function ValidarLetrasXLongitud(cadena:string;longitud:integer):bool;
    function VerificarLong_Numeros(cadena,campo:string;longitud:integer):bool;
    function AgregarCaracter(cadena,caractere:string):string;
    function FechaBuroCredito(cadena:string):string;
    function ValidarNumeros(cadena:string):bool;
    function FechaUltimoPago(cadena:string):string;
    function FechaUltimaCompra(cadena:string):string;
    function SaldoVencido(cuenta:string):double;
    function FormaDePago(var NumPagosVenc:string):string;
    function NumeroPagosCuenta(var monto:integer;cuenta:string):integer;
    function Saldo(cuenta:string):double;
    function EncabezadoFisicas:string;

  end;

var
  frmBuroCredito: TfrmBuroCredito;
  ArregloNumeros: array[1..10] of string = ('0','1','2','3','4','5','6','7','8','9');
  alfabeto : 'A'..'Z';
  anos : set of 0..9;
  mesesBuroCredito :set of 0..12;
  dias : set of 0..31;
  gato : set of '#'..'#';
  TS:string;
  encabezadoPM, companiaPM, temporal,cadenaFisicas:string;
  BuroCredito: TextFile;
  entro,cerro:Boolean;
  idburo,idcredito,iddetalle:integer;
  rfc:string;
implementation

uses Urecursos, Udm, Udmrep, Uprincipal, DB, DateUtils;

{$R *.dfm}

// 0 - Fisica
// 1 - Moral
function  TfrmBuroCredito.ValidarRFC(cadena:string;ban:integer):bool;
var entro:bool; temp,c :integer;
begin
   try
     entro := false;
     if(ValidarLetrasXLongitud(cadena,4-ban) = false) then
     begin
        result := false;
        exit;
     end;

     temp := strtoint(cadena[5-ban]+cadena[6-ban]);
     if(temp in [0..99]) then
        entro := true
     else
     begin
        result:=false;
        exit;
     end;

     temp := strtoint(cadena[7-ban]+cadena[8-ban]);
     if(temp in [1..12]) then
        entro := true
     else
     begin
        result:=false;
        exit;
     end;

     temp := strtoint(cadena[9-ban]+cadena[10-ban]);
     if(temp in [1..31]) then
        entro := true
     else
     begin
        result:=false;
        exit;
     end;
     result := entro;

   except
      result:=false;
   end;

end;



procedure TfrmBuroCredito.edClaveKeyPress(Sender: TObject;
var Key: Char);
begin
   if (key<>'p') and (key<>'P') and (key<>#13) and (key <> #27) then
      key := ValidaNumeros(key,true);
   if key=#13 then
   begin
      querys('select c.idcliente,'+ClienteNombre('c')+' as cliente from clientes c where c.idcliente="'+edclave.text+'"',0,dmreportes.sqlgeneral);
      ednombre.text:=dmreportes.sqlgeneral.fieldbyname('cliente').asstring;
//      btnagregar.Click;
   end;
end;

function TfrmBuroCredito.ValidarLetrasXLongitud(cadena:string;longitud:integer):bool;
var entro:bool;
   c:integer;
begin
  entro := false;
  for c:=1 TO longitud DO
  begin
      if(cadena[c] IN ['a'..'z']+['A'..'Z']) then
         entro := TRUE
      else
      begin
         result:=false;
         exit;
      end;
  end;
  result:= entro;
end;

function TfrmBuroCredito.BuscarLetrasNoValidas(cadena:string):bool;
var entro:bool; c:integer; longitud : integer;
begin
   c:=0;
   entro := false;
   longitud := Length(cadena);
   gato:= ['.',',','#','-','!','@','$','%','^','&','*','(',')',';',':'];
   FOR c:=1 TO longitud DO
   BEGIN
      IF(cadena[C] IN gato) THEN
         entro := TRUE;
   END;
   result := entro;
end;

procedure TfrmBuroCredito.SegmentoEncabezadoPM();
begin
   with dmreportes do
   begin
      querys('select ClaveUsuarioBuroCreditoPM from DatosEmpresa',0,sqlgeneral);
      // Segmento Encabezado (HD)
      encabezadoPM:= 'HD';
      encabezadoPM:= encabezadoPM + 'BNCPM'; // identificador
      encabezadoPM:= encabezadoPM + '00';
      if ( Length(sqlgeneral.Fields.Fields[0].AsString) < 4 ) then
         encabezadoPM:= encabezadoPM + StringOfChar('0',4-Length(sqlgeneral.Fields.Fields[0].AsString)) + sqlgeneral.Fields.Fields[0].AsString
      else
         encabezadoPM:= encabezadoPM + sqlgeneral.Fields.Fields[0].AsString;
      // institucion
      encabezadoPM:= encabezadoPM + '01';
      encabezadoPM:= encabezadoPM + '0000'; // institucion anterior
      encabezadoPM:= encabezadoPM + '02';
      encabezadoPM:= encabezadoPM + '999'; // tipo de institucion
      encabezadoPM:= encabezadoPM + '03';
      encabezadoPM:= encabezadoPM + '2'; // formato
      encabezadoPM:= encabezadoPM + '04';
      encabezadoPM:= encabezadoPM + COPY(datetostr(date),9,2) + COPY(datetostr(date),6,2) + COPY(datetostr(date),0,4); // fecha
      encabezadoPM:= encabezadoPM + '05';
      encabezadoPM:= encabezadoPM + COPY(datetostr(date),6,2) + COPY(datetostr(date),0,4); // periodo
      encabezadoPM:= encabezadoPM + '06';
      encabezadoPM:= encabezadoPM + StringOfChar(#32,53); // filler (reservado para uso futuro)
      memomor.lines.Insert(0,encabezadoPM);
   end;
end;


procedure TfrmBuroCredito.PersonasMorales();
var facturas,saldo,fechaini,fechafin,CR,DE,CRV,DEV:String;      //  aux,
    x,d:integer;
    debe:double;
    band,entro:Boolean;
begin
   with DMREPORTES do
      begin

      //***********************************************************************
      //***********************************************************************
      // Segmento Compañia (EM)

      querys('SELECT cf.rfc as rfc, cl.curp as curp, cf.rsocial as rsocial, cf.dircres as dir, '+
             'cf.colcres as colonia, cf.cdcres as ciudad, edos.clave as estado, cf.cpcres as cp, cl.telefono as telefono '+
             'FROM clientes cl left join colonias col on cl.idcol = col.idcol '+
             'left join ClientesFact cf on cf.idCliente=cl.idcliente '+
             'left join estados edos on cf.estadocres=edos.nombre '+
             'WHERE  cl.idCliente = '+edClave.Text,0,sqlgeneral2);
      companiaPM:= 'EM';
      companiaPM:= companiaPM + 'EM'; // identificador
      //NUMERO DE RFC********************************************************
      temporal:=  trim(UpperCase(sqlgeneral2.fieldbyname('rfc').AsString));
      temporal:= AnsiReplaceStr(temporal,'-','');
      //validar rfc
      if temporal = '' then
        begin
        memolog.lines.Add('CUENTA : '+edclave.text+#9+' NO TIENE UN RFC VALIDO ');
        exit;
        end;

      if(ValidarRFC(temporal,1)=false) then
        begin
        memolog.Lines.Add('CUENTA : '+edclave.text+#9' TIENE EL RFC :'+temporal+' NO VALIDO!');
        exit;
        end;
      //**********************************************************************
      companiaPM:= companiaPM + '00';
      if Length(temporal) < 13 then
        companiaPM:= companiaPM + temporal + StringOfChar(#32,13-Length(temporal))
      else
        companiaPM:= companiaPM + temporal;

      // RFC
      companiaPM:= companiaPM + '01';
      companiaPM:= companiaPM + StringOfChar(#32,18); // CURP
      companiaPM:= companiaPM + '02' + StringOfChar('0',10); // Numero Dun opcional
      companiaPM:= companiaPM + '03';

      if sqlgeneral2.fieldbyname('rsocial').AsString = '' then
        begin
        memolog.Lines.Add('CUENTA : '+edclave.text+#9+' LA RAZON SOCIAL ES REQUERIDA');
        exit;
        end;

      if (Length(sqlgeneral2.fieldbyname('rsocial').AsString) < 75) then
        companiaPM:= companiaPM + sqlgeneral2.fieldbyname('rsocial').AsString + StringOfChar(#32,75-Length(sqlgeneral2.fieldbyname('rsocial').AsString))
      else
        companiaPM:= companiaPM + leftstr(sqlgeneral2.fieldbyname('rsocial').AsString,75);

      // Compania o Razon social
      companiaPM:= companiaPM + '04'+ StringOfChar(#32,75); // Nombre 1 no aplica
      companiaPM:= companiaPM + '05'+ StringOfChar(#32,75); // Nombre 2 no aplica
      companiaPM:= companiaPM + '06'+ StringOfChar(#32,25); // Apellido Paterno no aplica
      companiaPM:= companiaPM + '07'+ StringOfChar(#32,25); // Apellido Materno no aplica
      companiaPM:= companiaPM + '08'+ StringOfChar(#32,2); // Nacionalidad MX = Mexico
      companiaPM:= companiaPM + '09'+ StringOfChar(#32,2); // Calificacion de cartera
      companiaPM:= companiaPM + '10'+ StringOfChar('0',4) + StringOfChar('8',7); // Banxico 1 = 00008888888
      companiaPM:= companiaPM + '11'+ StringOfChar('0',11); // Banxico 2 no aplica
      companiaPM:= companiaPM + '12'+ StringOfChar('0',11); // Banxico 3 no aplica
      temporal:= AnsiReplaceStr(AnsiReplaceStr(sqlgeneral2.fieldbyname('dir').AsString,'"',''),#39,'');
      temporal := AnsiReplaceStr(temporal, '/', '');

      //********************************************************************
      // La direccion 1 es max de 40, si dir + numero es mayor de 40 lo q sobre se pasa a direccion 2
      if temporal = '' then
        begin
        memolog.Lines.Add('CUENTA : '+edclave.text+#9+' LA DIRECCION ES REQUERIDA ');
        exit;
        end;

      if (Length(temporal) < 40) then
        begin
        companiaPM:= companiaPM + '13'+ temporal + StringOfChar(#32,40-Length(temporal));
        companiaPM:= companiaPM + '14'+ StringOfChar(#32,40);
        end
      else
        begin
        if (Length(temporal) = 40) then
          begin
          companiaPM:= companiaPM + '13'+ temporal;
          companiaPM:= companiaPM + '14'+ StringOfChar(#32,40);
          end
        else
          begin
          companiaPM:= companiaPM + '13';

          for x:=1 to 40 do
            begin
            companiaPM:= companiaPM + temporal[x];
            end;

          companiaPM:= companiaPM + '14';
          for x:=41 to Length(temporal) do
            begin
            companiaPM:= companiaPM + temporal[x];
            end;

          companiaPM:= companiaPM + StringOfChar(#32,80-Length(temporal));
          end;
      end;

      // Direccion 1 y 2
      //**********************************************************************
      companiaPM:= companiaPM + '15';
      if  sqlgeneral2.fieldbyname('colonia').AsString = '' then
        begin
        memolog.Lines.Add('CUENTA : '+edClave.text+#9' LA COLONIA ES REQUERIDA ');
        exit;
        end;

      if (Length(sqlgeneral2.fieldbyname('colonia').AsString) < 60) then
        companiaPM:= companiaPM + sqlgeneral2.fieldbyname('colonia').AsString + StringOfChar(#32,60-Length(sqlgeneral2.fieldbyname('colonia').AsString))
      else
        companiaPM:= companiaPM + sqlgeneral2.fieldbyname('colonia').AsString;

      // Colonia/Poblacion
      companiaPM:= companiaPM + '16' + StringOfChar(#32,40); // Delegacion/municipio
      companiaPM:= companiaPM + '17';

      if sqlgeneral2.fieldbyname('ciudad').AsString = '' then
        begin
        memolog.Lines.add('CUENTA : '+edclave.Text+#9+' LA CIUDAD ES REQUERIDA ');
        exit;
        end;

      if (Length(sqlgeneral2.fieldbyname('ciudad').AsString) < 40) then
        companiaPM:= companiaPM + sqlgeneral2.fieldbyname('ciudad').AsString + StringOfChar(#32,40-Length(sqlgeneral2.fieldbyname('ciudad').AsString))
      else
        companiaPM:= companiaPM + sqlgeneral2.fieldbyname('ciudad').AsString;

      // Ciudad
      companiaPM:= companiaPM + '18';
      if sqlgeneral2.fieldbyname('estado').AsString = '' then
        begin
        memolog.Lines.Add('CUENTA : '+edclave.text+#9+' EL ESTADO ES REQUERIDO ');
        exit;
        end;

      if (Length(sqlgeneral2.fieldbyname('estado').AsString) < 4) then
         companiaPM:= companiaPM + sqlgeneral2.fieldbyname('estado').AsString + StringOfChar(#32,4-Length(sqlgeneral2.fieldbyname('estado').AsString))
      else
         companiaPM:= companiaPM + sqlgeneral2.fieldbyname('estado').AsString;

      // Estado
      companiaPM:= companiaPM + '19';
      if (sqlgeneral2.fieldbyname('cp').AsString = '') OR (length(sqlgeneral2.fieldbyname('cp').AsString) < 5) then
        begin
        memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' EL CODIGO POSTAL ES INCORRECTO ');
        exit;
        end;

      if (Length(sqlgeneral2.fieldbyname('cp').AsString) < 10) then
        companiaPM:= companiaPM + sqlgeneral2.fieldbyname('cp').AsString + StringOfChar(#32,10-Length(sqlgeneral2.fieldbyname('cp').AsString))
      else
        companiaPM:= companiaPM + sqlgeneral2.fieldbyname('cp').AsString;

      // Codigo Postal
      companiaPM:= companiaPM + '20';
      temporal:= sqlgeneral2.fieldbyname('telefono').AsString;
      temporal:= AnsiReplaceStr(temporal,'-','');
      if (Length(temporal) < 11) then
        companiaPM:= companiaPM + temporal + StringOfChar(#32,11-Length(temporal))
      else
        companiaPM:= companiaPM + temporal;

      // Telefono
      companiaPM:= companiaPM + '21' + StringOfChar(#32,8); // Extension
      companiaPM:= companiaPM + '22' + StringOfChar(#32,11); // Fax
      companiaPM:= companiaPM + '23' + '1'; // Tipo de Cliente
      companiaPM:= companiaPM + '24' + StringOfChar(#32,128); // Filler uso futuro
      if entro = false then
        begin
        entro := true;
        end;


      ////////////////////////
      //SEGMENTO CREDITO(CR)//
      ////////////////////////

      /////////////////FACTURAS VIGENTES//////////////////////////
      entro:=false;
      fechaini:='';
      fechafin:='';
      fechaini:=DateToStr(EncodeDate(YearOf(Date),MonthOf(Date),1));
      fechafin:=DateToStr(EncodeDate(YearOf(date),MonthOf(Date),DaysInMonth(Date)));
      querys('select Count(idpago) as nfacturas, sum(debe) as saldo from ('+
      ' SELECT distinct pc.idpago, pc.movimiento,pc.idpedido,pc.restante as debe, pc.fechavence, '+
      ' if(pc.movimiento=0,if(pc2.movimiento=1,-1,0),1) as condicion '+
      ' from PagosClientes as pc left join pedidos as p on (p.idpedido=pc.idpedido) '+
      ' left join PagosClientes as pc2 on (pc2.idpedido=pc.idpedido and pc2.movimiento=1) '+
      ' where p.estatus  in(3,4) and idunidadnegocio in (4,5) and p.saldado=0 and pc.movimiento in (0,1) and pc.idcliente='+edclave.text+
      ' and pc.fechavence>="'+fechaini+'" and pc.fechavence<="'+fechafin+'" having condicion>=0) as f',0,sqlgeneral);
      if sqlgeneral.RecordCount>0 then
      begin
         if sqlgeneral.FieldByName('nfacturas').AsInteger>0 then
         begin
            entro:=true;
            CR:='CRCR00'+rfc;
            CR:=CR+' '+'01';
            //numero de facturas vigentes
            facturas:=sqlgeneral.fieldbyname('nfacturas').AsString;
            for x :=1  to 6-Length(facturas)  do
               CR:=CR+'0';
            CR:=CR+facturas+'02';
            for x:=1 to 50 do
            begin
               CR:=CR+' ';
               if x=25 then CR:=CR+'03';
               if x=50 then CR:=CR+'04';
            end;
            for x :=1  to 275 do
            begin
               if x<169 then CR:=CR+'0';
               if x=8 then CR:=CR+'05';
               if x=13 then CR:=CR+'06';
               if x=17 then CR:=CR+'07';
               if x=37 then CR:=CR+'0800109';
               if x=41 then CR:=CR+'10';
               if x=44 then CR:=CR+'11';
               if x=64 then CR:=CR+'12';
               if x=72 then CR:=CR+'13';
               if x=80 then CR:=CR+'14';
               if x=100 then CR:=CR+'15';
               if x=108 then CR:=CR+'16';
               if x=128 then CR:=CR+'17';
               if x=148 then CR:=CR+'18';
               if x=168 then CR:=CR+'19    20 21';
               if x>=169 then CR:=CR+' ';
            end;//for

            ////////////////////////////
            //SEGMENTO DETALLE CREDITO//
            ////////////////////////////
            DE:='DEDE00'+rfc;
            DE:=DE+' '+'01';      //21
            for x :=1  to 25 do
               DE:=DE+' ';        //46
            DE:=DE+'0200003';      //53
            debe:= sqlgeneral.FieldByName('saldo').AsFloat;
            saldo:=inttostr(Round(debe));
            band:=false;
            for x := 1 to 20-Length(saldo) do
               DE:=DE+'0';
            //SUMA DE LOS SALDOS DE CADA CLIENTE
            frmprincipal.saldototal:=frmprincipal.saldototal+StrToInt(saldo);
            //SALDO DEUDOR DEL CLIENTE
            DE:=DE+saldo;  //73
            DE:=DE+'04';   //75
            //FILLER
            for x :=1  to 75 do      //150
               DE:=DE+' ';
            //memomor.lines.add(CR);
            //memomor.Lines.Add(DE);
         end;////de facturas vigentes////////
      end;

          ////////////////////////
          ///Facturas Vencidas////
          ////////////////////////
      querys('select count(idpago) as nfacturas,sum(saldo) as saldo,max(dias) as dias from ('+
      ' SELECT distinct pc.idpago, pc.movimiento,pc.idpedido,pc.abono as saldo, if(pc.movimiento=0, '+
      ' if(pc2.movimiento=1,-1,0),1) as condicion, if( to_days("'+datetostr(date)+'")-to_days(p.FechaVencimiento)> 0,'+
      ' to_days("'+datetostr(date)+'")-to_days(p.FechaVencimiento),0) as dias '+
      ' from PagosClientes as pc left join pedidos as p on (p.idpedido=pc.idpedido) '+
      ' left join PagosClientes as pc2 on (pc2.idpedido=pc.idpedido and pc2.movimiento=11) '+
      ' where p.estatus in(5) and p.saldado=1 and '+
      ' pc.movimiento in (11) and pc.idcliente="'+edclave.text+'" and pc.tipopago="MOR" having condicion>=0 and dias>0'+
      ' UNION ' +
      ' SELECT distinct pc.idpago, pc.movimiento,pc.idpedido,pc.restante as saldo, if(pc.movimiento=0,'+
      ' if(pc2.movimiento=1,-1,0),1) as condicion, if( to_days("'+datetostr(date)+'")-to_days(p.FechaVencimiento)> 0,'+
      ' to_days("'+datetostr(date)+'")-to_days(p.FechaVencimiento),0) as dias '+
      ' from PagosClientes as pc left join pedidos as p on (p.idpedido=pc.idpedido) '+
      ' left join PagosClientes as pc2 on (pc2.idpedido=pc.idpedido) '+
      ' where p.idcliente="'+edclave.text+'" and idunidadnegocio in (4,5) and p.estatus in (3) and p.saldado=0 '+
      ' having condicion>=0 and dias>0 '+
      ') as f',0,sqlgeneral);
      if sqlgeneral.RecordCount>0 then
      begin
         if sqlgeneral.FieldByName('nfacturas').AsInteger>0 then
         begin
            saldo:='';
            CRV:='CRCR00'+rfc;
            CRV:=CRV+' '+'01';
            //numero de facturas vencidas
            facturas:=sqlgeneral.fieldbyname('nfacturas').AsString;
            for x :=1  to 6-Length(facturas)  do
               CRV:=CRV+'0';
            CRV:=CRV+facturas+'02';
            for x:=1 to 50 do
            begin
               CRV:=CRV+' ';
               if x=25 then CRV:=CRV+'03';
               if x=50 then CRV:=CRV+'04';
            end;
            for x :=1  to 275 do
            begin
               if x<169 then CRV:=CRV+'0';
               if x=8 then CRV:=CRV+'05';
               if x=13 then CRV:=CRV+'06';
               if x=17 then CRV:=CRV+'07';
               if x=37 then CRV:=CRV+'0800109';
               if x=41 then CRV:=CRV+'10';
               if x=44 then CRV:=CRV+'11';
               if x=64 then CRV:=CRV+'12';
               if x=72 then CRV:=CRV+'13';
               if x=80 then CRV:=CRV+'14';
               if x=100 then CRV:=CRV+'15';
               if x=108 then CRV:=CRV+'16';
               if x=128 then CRV:=CRV+'17';
               if x=148 then CRV:=CRV+'18';
               if x=168 then CRV:=CRV+'19    20 21';
               if x>=169 then CRV:=CRV+' ';
            end;//for

            ////////////////////////////
            //SEGMENTO DETALLE CREDITO//
            ////////////////////////////
            DEV:='DEDE00'+rfc;
            DEV:=DEV+' '+'01';
            for x :=1  to 25 do
               DEV:=DEV+' ';
            DEV:=DEV+'02';//etiqueta de dias
            d:=sqlgeneral.fieldbyname('dias').AsInteger;
            if d > 999 then    //solo 3 caracteres
              d:= 999;
            for x:=1 to 3-length(inttostr(d)) do
               DEV:=DEV+'0';
            DEV:=DEV+inttostr(d)+'03';
            //etiqueta del saldo
            debe:= sqlgeneral.FieldByName('saldo').AsFloat;
            saldo:=inttostr(Round(debe));
            band:=false;
            for x := 1 to 20-Length(saldo) do
            begin
               DEV:=DEV+'0';
            end;
            //SUMA DE LOS SALDOS DE CADA CLIENTE
            frmprincipal.saldototal:=frmprincipal.saldototal+StrToInt(saldo);
            //SALDO DEUDOR DEL CLIENTE
            DEV:=DEV+saldo;
            DEV:=DEV+'04';
            //FILLER
            for x :=1  to 75 do
               DEV:=DEV+' ';
         end;//de facturas vencidas
      end;
      {if (sqlgeneral.FieldByName('nfacturas').AsInteger=0)  and (entro=false) then
      begin
         //application.MessageBox(pchar('La cuenta '+edclave.text+' no tiene pedidos pendientes'),'Aviso',MB_OK+MB_ICONINFORMATION);
         memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' NO TIENE NINGUN PEDIDO PENDIENTE');
         exit;
      end;}

      if ((cr<>'') and (DE<>''))  or ((CRV<>'') and (DEV<>'')) then
        begin

        memomor.Lines.Add(companiaPM);
        if (cr<>'') and (DE<>'') then
          begin
          memomor.Lines.Add(CR);
          memomor.Lines.Add(DE);
          end;

        if (CRV<>'') and (DEV<>'') then
          begin
          memomor.Lines.Add(CRV);
          memomor.Lines.Add(DEV);
          end;
        end
      else
        begin
        memolog.Lines.Add('CUENTA : '+edclave.text+#9+' NO SE ENCONTRARON FACTURAS VIEGENTES O VENCIDAS ');
        end;

      frmprincipal.numeroclientes:=frmprincipal.numeroclientes+1;
   end;
end;


procedure TfrmBuroCredito.SegmentoCierreArchivoPM();
var x:integer;
begin

//////////////////////////////////
  //SEGMENTO CIERRE DE ARCHIVO(TS)//
  //////////////////////////////////
  //IDENTIFICADOR DEL SEGMENTO
   TS:='TSTS00';
   for x :=1  to 7-length(inttostr(frmprincipal.numeroclientes)) do
   begin
    TS:=TS+'0';
   end;
   //NUMERO DE COMPANIAS
   TS:=TS+IntToStr(frmprincipal.numeroclientes)+'01';
   for x :=1  to 30-length(inttostr(frmprincipal.saldototal)) do
   begin
    TS:=TS+'0';
   end;
   //CANTIDAD DEL SEGMENTO DETALLE
   TS:=TS+inttostr(frmprincipal.saldototal)+'02';
   //FILLER
   for x :=1  to 53 do
   begin
      TS:=TS+' ';
   end;
   memomor.Lines.Add(TS);
   frmprincipal.numeroclientes:=0;
   frmprincipal.saldototal:=0;
   //showmessage('longitud cierre de archivo '+inttostr(Length(TS)));

end;


procedure TfrmBuroCredito.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
   if application.MessageBox('Estas seguro que deseas salir?','Aviso',MB_YESNO+MB_ICONQUESTION)=ID_YES then
   begin
     action:=cafree;
   end;
end;

procedure TfrmBuroCredito.btngenerarClick(Sender: TObject);
begin
   if not DirectoryExists(ExtractFilePath(Application.ExeName)+'/Buro') then
      CreateDir(ExtractFilePath(Application.ExeName)+'/Buro');

   //borrar el archivos si existen
   if FileExists(ExtractFilePath(Application.ExeName) + 'Buro\BuroCreditoPersonasMorales.txt') then
      DeleteFile(ExtractFilePath(Application.ExeName) + 'Buro\BuroCreditoPersonasMorales.txt');
   if FileExists(ExtractFilePath(Application.ExeName) + 'Buro\BuroCreditoPersonasFisicas.txt') then
      DeleteFile(ExtractFilePath(Application.ExeName) + 'Buro\BuroCreditoPersonasFisicas.txt');
   
   agregartodos;
   //morales
   SegmentoEncabezadoPM;
   SegmentoCierreArchivoPM;

   //log de errores
   memolog.lines.SaveToFile(ExtractFilePath(Application.ExeName)+'/log'+
   AnsiReplaceStr(datetostr(Date)+'.txt','/','-'));
   ShellExecute(0,nil,PChar(ExtractFilePath(Application.ExeName)+'/log'+
   AnsiReplaceStr(datetostr(Date),'/','-')+'.txt'),'','',SW_SHOWNORMAL);

   memomor.lines.SaveToFile(ExtractFilePath(Application.ExeName)+'/Buro/BuroCreditoPersonasMorales.txt');
   ShellExecute(0,nil,PChar(ExtractFilePath(Application.ExeName) + '/Buro/BuroCreditoPersonasMorales.txt'),'','',SW_SHOWNORMAL);

   //fisicas
   memofis.Clear;
   memofis.Lines.add(EncabezadoFisicas+cadenaFisicas);
   memofis.lines.SaveToFile(ExtractFilePath(Application.ExeName)+'/Buro/BuroCreditoPersonasFisicas.txt');
   ShellExecute(0,nil,PChar(ExtractFilePath(Application.ExeName) + '/Buro/BuroCreditoPersonasFisicas.txt'),'','',SW_SHOWNORMAL);

   //borrar el archivo zip si existe para despues comprimirlo
   if FileExists(ExtractFilePath(Application.ExeName) + 'Buro\buroCredito.zip') then
      DeleteFile(ExtractFilePath(Application.ExeName) + 'Buro\buroCredito.zip');

   comprimir;
   memomor.Clear;
   memofis.Clear;
   if Application.MessageBox('Deseas Mandarlo por correo?','AVISO',MB_YESNO+MB_ICONQUESTION)=idyes then
   begin
      //RenameFile(ExtractFilePath(Application.ExeName) + 'Buro\buroCredito.zip',ExtractFilePath(Application.ExeName) + 'Buro\buroCredito.zip_');
      memoadjunto.Lines.Add(ExtractFilePath(Application.ExeName) + 'Buro\buroCredito.zip');
      send_email(GetConfiguraciones('UserEmail', true),GetConfiguraciones('UserEmail', true),GetConfiguraciones('mailBuro',true),
      'Corporacion Mexicalense SA de CV',memoadjunto,cuerpomail,0);
      application.messagebox('Correo Enviado','Aviso',mb_ok);
   end
   else
      if Application.MessageBox('Deseas Abrir la carpeta del archivo?','AVISO',MB_YESNO+MB_ICONQUESTION)=idyes then
         ShellExecute(0,nil,PChar(ExtractFilePath(Application.ExeName) + 'Buro'),'','',SW_SHOWNORMAL);
end;


procedure TfrmBuroCredito.agregartodos;
var tipo, cliente:string;
begin
   with DMREPORTES do
   begin
      if edclave.text = '' then
        cliente := ''
      else
        cliente := ' and c.idcliente='+edclave.text;
      cerro:=false;
      btngenerar.Enabled:=true;
      if querys('select c.idcliente,if(c.rsocial is NULL or c.rsocial="", if(c.apaterno is NULL or c.apaterno="", c.nombre,'+
                ' if(c.amaterno is NULL or c.amaterno="", concat(c.nombre, " ", c.apaterno), '+
                ' concat(c.nombre, " ", c.apaterno, " ", c.amaterno))), c.rsocial) as cliente,'+
                ' replace(replace(cf.rfc," ",""),"-","") as rfc,length(replace(replace(cf.rfc," ",""),"-","")) as estatus'+
                ' from clientes c left join pedidos p using(idcliente) left join ClientesFact cf on c.idfact= cf.idfact'+
                ' left join PagosClientes pc on pc.idpedido=p.idpedido '+
                ' where c.tipocont="mor" and p.estatus in (5) and pc.tipopago="MOR"'+cliente+
                ' group by idcliente '+
                ' union '+
                ' select c.idcliente,if(c.rsocial is NULL or c.rsocial="",if(c.apaterno is NULL or c.apaterno="", c.nombre,'+
                ' if(c.amaterno is NULL or c.amaterno="", concat(c.nombre, " ", c.apaterno), '+
                ' concat(c.nombre, " ", c.apaterno, " ", c.amaterno))), c.rsocial) as cliente,'+
                ' replace(replace(cf.rfc," ",""),"-","") as rfc,length(replace(replace(cf.rfc," ",""),"-","")) as estatus '+
                ' from clientes c left join ClientesFact cf on c.idfact= cf.idfact '+
                ' where c.estatus=1 and tipocont in ("001","006") '+cliente+
                ' group by idcliente '+
                ' order by estatus,idcliente asc',0,sqlgeneral8)>0 then
      begin
         sqlgeneral8.First;
         while not sqlgeneral8.Eof do
         begin
            edclave.text:=sqlgeneral8.fieldbyname('idcliente').asstring;
            rfc:=sqlgeneral8.fieldbyname('rfc').asstring;
            if length(rfc)<12 then
               memolog.lines.Add('CUENTA : '+edclave.Text+#9+' RFC INCORRECTO ');
            if length(rfc)=12 then
            begin
               //memomor.Clear;
               PersonasMorales;
            end;
            if length(rfc)=13 then
            begin
               //memofis.Clear;
               personasfisicas(true);
            end;
            sqlgeneral8.Next;
         end;
      end;
   end;
end;

procedure TfrmBuroCredito.FormCreate(Sender: TObject);
begin
   entro:=false;
   cerro:=true;
   cadenaFisicas:='';
end;

function Tfrmburocredito.EncabezadoFisicas:string;
var INTF:string;
begin
  with dmreportes do
   begin
   if(querys('select VersionBuroCredito,ClaveUsuarioBuroCredito,NombreUsuarioBuroCredito '+
   ' from DatosEmpresa',0,sqlgeneral) > 0) then
   begin
      INTF := 'INTF';
      //VERSION DE BURO DE CREDITO
      if (Length(sqlgeneral.Fields.Fields[0].AsString) = 2 ) then
         INTF := INTF+ sqlgeneral.Fields.Fields[0].AsString
      else
      begin
         INTF := INTF+ '0';
         INTF := INTF + sqlgeneral.Fields.Fields[0].AsString;
      end;
      //CLAVE DEL USUARIO 10
      INTF := INTF + sqlgeneral.Fields.Fields[1].AsString;
      if ( Length(sqlgeneral.Fields.Fields[1].AsString) < 10 ) then
         INTF := INTF + StringOfChar(#32,10-Length(sqlgeneral.Fields.Fields[1].AsString));
      //NOMBRE DEL USUARIO 16
      INTF := INTF + sqlgeneral.Fields.Fields[2].AsString;
      if( Length(sqlgeneral.Fields.Fields[2].AsString) < 16 ) then
         INTF := INTF + StringOfChar(#32,16-Length(sqlgeneral.Fields.Fields[2].AsString));
      //NUMERO DE CICLO
      INTF := INTF + StringOfChar(#32,2);
      INTF := INTF + FechaBuroCredito(formatdatetime('yyyy"/"mm"/"',Date)+ vartostr(DaysInMonth(Date)) );
      //USO FUTURO
      INTF := INTF + StringOfChar(#48,10);
      //INFORMACION ADICIONAL.
      INTF := INTF + StringOfChar(#32,98);
      result:=INTF;
   end
   else
      result:='';
  end;
end;

procedure TfrmBuroCredito.PersonasFisicas(todos:boolean);
var INTF,PN,PA,TL,tmp,cadenaTmp,NumeroPagos: string;
   entro:bool;
   _arreglo: TStringList;
   c,_monto:integer;
begin
   _arreglo := TStringList.Create;
   with dmreportes do
   begin
      querys('select cf.rsocial as RSocial,cf.nombre as Nombre,cf.apaterno as Paterno,cf.amaterno as Materno,cf.rfc as RFC,'+
      'dt.NumLicMan as Licencia,dt.NumCredElec as Electoral,cf.DirCres as Direccion,'+
      'cf.ColCres as Colonia,CPCres as CP,c.st_date as FechaApertura,c.UltimaCompra as FechaUltimaCompra,'+
      'cast(c.credito as SIGNED) AS CreditoMaximo,e.clave as Estado,cf.CdCres as Ciudad '+
      ' from ClientesFact as cf inner join clientes as c on(c.idfact = cf.idfact) left join DetClientes as dt '+
      ' on(dt.idcliente=c.idcliente) LEFT JOIN estados as e on (e.nombre= cf.EstadoCres ) where c.idcliente ='+
      edClave.Text,0,sqlgeneral2);
      if(sqlgeneral2.RecordCount > 0 ) then
      begin
            //FORMATO DE ENCABEZADO INTF
            if todos=false then
               INTF:=encabezadoFisicas;

            //SEGMENTO DE NOMBRE (PN)
            PN := 'PN';
            //apellido paterno
            tmp := UpperCase(trim(AnsiReplaceStr(ansireplacestr(sqlgeneral2.fieldbyname('Paterno').AsString,'.',''),',','')));
            if(Length(tmp)<2) then//validar que tenga mas de 2 caracteres el apellido
            begin
                //Application.MessageBox('EL APELLIDO DEBE CONTENER MAS DE 2 CARACTERES , POR TAL NO PODRA INGRESAR AL ARCHIVO','ATENCION',MB_OK);
                memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' EL APELLIDO DEBE CONTENER MAS DE 2 CARACTERES');
                exit;
            end;

            //verificar si tiene un espacio en el apellido paterno
            entro := AnsiContainsText(tmp,' ');
            if(entro) then
            begin
               Split(' ', tmp, _arreglo);
               if(_arreglo.Count > 1) then
               begin
                    //application.MessageBox(PCHAR('El APELLIDO PATERNO :'+tmp+' NO ES VALIDO,NO DEBE TENER ESPACIOS EN EL APELLIDO'),'Atención',MB_OK);
                    memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' EL APELLIDO PATERNO NO ES VALIDO');
                    exit;
               end;
            end;
            tmp :=  StringReplace(tmp,'Ñ',#35,[rfReplaceAll, rfIgnoreCase]);

            //verificar longitud y alfabeto valido
            entro := VerificarLong_Numeros(tmp,'APELLIDO PATERNO',26);
            if(entro) then
               exit;
            PN := PN+AgregarCaracter(tmp,'0')+tmp;
            
           //APELLIDO MATERNO opcional
            tmp := UpperCase(trim(AnsiReplaceStr(AnsiReplaceStr(sqlgeneral2.fieldbyname('Materno').AsString,',',''),'.','')));
            tmp := StringReplace(tmp,'Ñ',#35,[rfReplaceAll, rfIgnoreCase]);
            if(Length(tmp) = 0) then
            begin
               //16 por que son 16 caracteres en no proporcionado.
                PN := PN+ '0016NO PROPORCIONADO';
            end
            else
            begin
               //verificar si tiene un espacio en el apellido MATERNO
               entro := AnsiContainsText(tmp,' ');
               if(entro) then
               begin
                  Split(' ', tmp, _arreglo);
                  if(_arreglo.Count > 1) then
                  begin
                     //application.MessageBox(PCHAR('El APELLIDO MATERNO :'+tmp+' NO ES VALIDO,'+#13+' NO DEBE TENER ESPACIOS EN EL APELLIDO'),'Atención',MB_OK);
                     memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' EL APELLIDO MATERNO NO ES VALIDO');
                     exit;
                  end;
               end;
               //SI NO
               entro := VerificarLong_Numeros(tmp,'APELLIDO MATERNO',26);
               if(entro) then
                  exit;
               PN := PN+'00'+AgregarCaracter(tmp,'0')+tmp;
            end;//materno
            //NOMBRE
            tmp := UpperCase(trim(ansireplacestr(AnsiReplaceStr(sqlgeneral2.fieldbyname('Nombre').AsString,'.',''),'','')));
            entro := AnsiContainsText(tmp,' ');
            if(entro) then
            begin
               Split(' ', tmp, _arreglo);
               if(_arreglo.Count > 1) then
               begin  //son 3 o menos nombres
                  if(_arreglo.Count < 4 )then
                  begin
                     //NOMBRE 1
                     _arreglo[0] := StringReplace(_arreglo[0],'Ñ',#35,[rfReplaceAll, rfIgnoreCase]);
                     entro := VerificarLong_Numeros(_arreglo[0],'NOMBRE',26);
                     if(entro) then
                        exit;
                     PN := PN+'02'+AgregarCaracter(_arreglo[0],'0')+_arreglo[0];
                     //NOMBRE2
                     _arreglo[1] := StringReplace(_arreglo[1],'Ñ',#35,[rfReplaceAll, rfIgnoreCase]);
                     entro := VerificarLong_Numeros(_arreglo[1],'NOMBRE',26);
                     if(entro) then
                        exit;
                     if (_arreglo.Count > 2) then
                     begin
                        //NOMBRE 3
                        _arreglo[2] := StringReplace(_arreglo[2],'Ñ',#35,[rfReplaceAll, rfIgnoreCase]);
                        entro := VerificarLong_Numeros(_arreglo[1]+_arreglo[2],'NOMBRE',26);
                        if(entro) then
                           exit;
                        PN := PN+'03'+AgregarCaracter(_arreglo[1]+_arreglo[2],'0')+_arreglo[1]+_arreglo[2];
                     end
                     else
                        PN := PN+'03'+AgregarCaracter(_arreglo[1],'0')+_arreglo[1];
                  end
                  else
                  begin
                     //application.MessageBox(PCHAR('EL NOMBRE :'+tmp+' NO ES VALIDO!,'+#13+'CONTIENE MAS DE 3 NOMBRE, NO PODRA SER INGRESADO AL ARCHIVO'),'Atención',MB_OK);
                     memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' NOMBRE NO ES VALIDO');
                     exit;
                  end;  //if count 4
               end;//if count
            end
            else
            begin
               tmp := StringReplace(tmp,'Ñ',#35,[rfReplaceAll, rfIgnoreCase]);
               entro := VerificarLong_Numeros(tmp,'NOMBRE',26);
               if(entro) then
                  exit;
               PN := PN+'02'+AgregarCaracter(tmp,'0')+tmp;
            end;
            //NUMERO DE RFC
            tmp :=  UpperCase(trim((sqlgeneral2.fieldbyname('RFC').AsString)));
            tmp :=  StringReplace(tmp,'-','',[rfReplaceAll, rfIgnoreCase]);
            //validar rfc
            if tmp<>'' then
               if(ValidarRFC(tmp,0)=false) then
               begin
                  //application.MessageBox(PCHAR('EL RFC :'+tmp+' NO ES VALIDO!,'+#13+'CONTIENE UN CARACTER NO VALIDO , NO PODRA SER INGRESADO AL ARCHIVO'),'Atención',MB_OK);
                  memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' EL RFC NO ES VALIDO');
                  exit;
               end;
            PN := PN+'0513'+ tmp;
            //Numero de licencia de conducior  NumLicMan
            tmp :=  UpperCase(trim((sqlgeneral2.fieldbyname('Licencia').AsString)));
            if(Length(tmp) > 20) then
               tmp := '' // no se agrega al archivo ya que es opcional y no cumple con el requisisto de longitud.
            else
               if(Length(tmp) > 1) then
                  PN := PN+'10' +AgregarCaracter(tmp,'0') + tmp;
            //Numero de Credencial Electoral
            tmp :=  UpperCase(trim((sqlgeneral2.fieldbyname('Electoral').AsString)));
            if(Length(tmp) > 20) then
               tmp := '' // no se agrega al archivo ya que es opcional y no cumple con el requisisto de longitud.
            else
               if(Length(tmp) > 1) then
                  PN := PN+'14' +AgregarCaracter(tmp,'0') + tmp;
            //application.MessageBox(pchar(PN),'hOLAS',MB_OK);
            //application.MessageBox(pchar(INTTOSTR( Length(PN))),'hOLAS',MB_OK);

            ///fin de segmento PN////////////////
            ///**SEGMENTO DE DIRECCION (PA)**////
            PA := 'PA';
            //Direccion
            tmp := UpperCase(trim((sqlgeneral2.fieldbyname('Direccion').AsString)));
            tmp := StringReplace(tmp,'#',#32,[rfReplaceAll, rfIgnoreCase]);
            tmp := StringReplace(tmp,'NO.',#32,[rfReplaceAll, rfIgnoreCase]);
            tmp := StringReplace(tmp,'.',#32,[rfReplaceAll, rfIgnoreCase]);
            tmp := StringReplace(tmp,'Ñ',#35,[rfReplaceAll, rfIgnoreCase]);
            tmp := AnsiReplaceStr(tmp, '/', '');

            if(Length(tmp) = 0 ) then
            begin
               //application.MessageBox('NO TIENE DIRECCION ESTA CUENTA! , NO PODRA SER AGREGADO AL ARCHIVO','Atención',MB_OK);
               memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' LA DIRECCION NO ES VALIDA O NO TIENE CAPTURADA');
               exit;
            end;
            if(Length(tmp) >  80) then
            begin
               //application.MessageBox('LA DIRECCION EXCEDE DE LONGITUD! , NO PODRA SER AGREGADO AL ARCHIVO','Atención',MB_OK);
               memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' LA DIRECCION EXCEDE LA LONGITUD PERMITIDA');
               exit;
            end;

            Split(#32, tmp, _arreglo);
            cadenaTmp := '';
            for c := 0 to _arreglo.Count-1 do
            begin
               if(Length(trim(_arreglo[c])) > 0) then
               begin
                  cadenaTmp := cadenaTmp + trim(_arreglo[c]);
                  if(c  < (_arreglo.Count-1)) then
                     cadenaTmp := cadenaTmp + StringOfChar(#32,1);
                  if(Length(cadenaTmp) > 40) then
                  begin
                     PA := PA + '40' +Copy(cadenaTmp,0,40);
                     cadenaTmp := Copy(cadenaTmp,41,length(cadenaTmp)-40);
                  end;
               end;
            end;
            if AnsiContainsStr(PA, 'PA40') then
            begin
               cadenaTmp := Copy(cadenaTmp,0,Length(cadenaTmp)-1);
               if(Length(cadenaTmp) > 0) then
                  PA := PA + '00'+ AgregarCaracter(cadenaTmp,'0')+ cadenaTmp;
            end
            else
               PA := PA + AgregarCaracter(trim(tmp),'0')+ trim(tmp);
            //Colonia
            tmp := UpperCase(trim((sqlgeneral2.fieldbyname('Colonia').AsString)));
            tmp := StringReplace(tmp,'Ñ',#35,[rfReplaceAll, rfIgnoreCase]);
            tmp := StringReplace(tmp,'.',#32,[rfReplaceAll, rfIgnoreCase]);
            tmp := AnsiReplaceStr(tmp, '/', '');
            cadenaTmp := '';
            if(Length(tmp) > 40 ) then
               tmp := ''
            else
            begin
               Split(#32, tmp, _arreglo);
               for c:= 0 to _arreglo.Count-1 do
               begin
                  if(Length(trim(_arreglo[c])) > 0) then
                  begin
                     cadenaTmp := cadenaTmp + trim(_arreglo[c]);
                     cadenaTmp := cadenaTmp + StringOfChar(#32,1);
                  end;
               end;
               PA := PA + '01'+AgregarCaracter(trim(cadenaTmp),'0')+ trim(tmp);
            end;
            //ciudad
            tmp := UpperCase(trim((sqlgeneral2.fieldbyname('Ciudad').AsString)));
            tmp := StringReplace(tmp,'Ñ',#35,[rfReplaceAll, rfIgnoreCase]);
            if(VerificarLong_Numeros(tmp,'CIUDAD',40)) then
               exit;
            PA := PA + '03'+AgregarCaracter(tmp,'0') + tmp;
            //estado
            tmp := UpperCase(trim((sqlgeneral2.fieldbyname('Estado').AsString)));
            if(Length(tmp) = 0) then
            begin
               //application.MessageBox('ESTA CUENTA NO TIENE REGISTRADO EL ESTADO! , NO PODRA SER AGREGADO AL ARCHIVO','Atención',MB_OK);
               memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' EL ESTADO NO ES VALIDO');
               exit;
            end;
            PA := PA + '04'+AgregarCaracter(trim(tmp),'0') + tmp;
            //codigo postal
            tmp := UpperCase(trim((sqlgeneral2.fieldbyname('CP').AsString)));
            tmp := StringReplace(tmp,'Ñ',#35,[rfReplaceAll, rfIgnoreCase]);
            if length(tmp)<5 then
               tmp:='0'+tmp;
            if(Length(tmp) <> 5) then
            begin
               //application.MessageBox(PCHAR('EL CODIGO POSTAL NO ES CORRECTO!, NO PODRA SER AGREGADO AL ARCHIVO ESTA CUENTA'),'Atención',MB_OK);
               memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' EL CODIGO POSTAL NO ES VALIDO');
               exit;
            end
            else
            begin
               if(ValidarNumeros(tmp)) then
               begin
                  //application.MessageBox(PCHAR('EL CODIGO POSTAL NO ES CORRECTO!, NO PODRA SER AGREGADO AL ARCHIVO ESTA CUENTA'),'Atención',MB_OK);
                  memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' EL CODIGO POSTAL NO ES VALIDO');
                  exit;
               end;
               PA := PA + '0505'+StringOfChar(#48,5-length(tmp))+ tmp;
            end;
            ///FIN SEGMENTO (PA)/////////////

            querys('select VersionBuroCredito,ClaveUsuarioBuroCredito,NombreUsuarioBuroCredito '+
                   ' from DatosEmpresa',0,sqlgeneral);
            ///INICIO DE SEGMENTO TL SEGMENTO DE CUENTAS///
            TL := 'TL02TL';
            TL := TL + '0110'+ sqlgeneral.fieldbyname('ClaveUsuarioBuroCredito').AsString;//CLAVE DEL OTORGANTE
            TL := TL + '02'+AgregarCaracter(sqlgeneral.fieldbyname('NombreUsuarioBuroCredito').AsString,'0')+sqlgeneral.fieldbyname('NombreUsuarioBuroCredito').AsString;//NOMBRE DEL USUARIO.

            //NUMERO DE CUENTA ACTUAL
            TL := TL + '0404'+StringOfChar(#48,4-length(edClave.Text))+ edClave.Text;
            //INDICADOR DE TIPO DE RESPONSABILIDAD
            TL:= TL + '0501I';
            //INDICADOR DE TIPO DE CUENTA
            TL := TL +'0601I';
            //TIPO DE CONTRATO
            TL := TL + '0702MI';
            //CLAVE DE LA UNIDAD MONETARIA
            TL := TL +'0802MX';
            //NUMERO DE PAGOS
            _monto := 0;
            NumeroPagos := inttostr(NumeroPagosCuenta(_monto,edclave.Text));
            if numeropagos<>'' then
               TL := TL + '10' + AgregarCaracter(NumeroPagos,'0')+NumeroPagos
            else
            begin
               memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' EL CAMPO NUMERO DE PAGOS ESTA VACIO');
               exit;
            end;

            //FRECUENCIA DE PAGOS.
            TL := TL +'1101M';

            //MONTO A PAGAR
            TL := TL + '12' + AgregarCaracter(inttostr(_monto),'0')+  inttostr(_monto);

            //FECHA DE APERTURA DE LA CUENTA
            if sqlgeneral2.fieldbyname('FechaApertura').AsString<>'' then
               TL := TL +'1308'+ FechaBuroCredito(sqlgeneral2.fieldbyname('FechaApertura').AsString)
            else
            begin
               memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' EL CAMPO FECHA DE APERTURA DE CUENTA ESTA VACIO');
               exit;
            end;

            //FECHA ULTIMO PAGO
            tmp := FechaUltimoPago(edClave.Text);
            if( tmp <> '') then
               TL := TL + '1408'+tmp
            else
            begin
               memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' EL CAMPO FECHA ULTIMO PAGO ESTA VACIO');
               exit;
            end;

            //FECHA ULTIMA COMPRA.
            tmp := fechaUltimaCompra(edclave.text);
            if(tmp <> '' ) then
               TL := TL + '1508'+FechaBuroCredito(tmp)
            else
            begin
               memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' EL CAMPO FECHA ULTIMA COMPRA ESTA VACIO');
               exit;
            end;

            //SALDO ACTUAL
            tmp := inttostr(trunc(Saldo(edclave.text)));
            if tmp <> '' then
            begin
               if(AnsiContainsStr(tmp,'-')) then
                  tmp := StringReplace(tmp, ' - ', '',[rfReplaceAll, rfIgnoreCase]) + '-';
               TL := TL +'22'+ AgregarCaracter(tmp,'0')+ tmp;
            end
            else
            begin
               memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' EL CAMPO SALDO ACTUAL ESTA VACIO');
               exit;
            end;

            //SALDO VENCIDO
            tmp := inttostr(trunc(SaldoVencido(edclave.text)));
            if tmp <>'' then
               TL := TL + '24'+ AgregarCaracter(tmp,'0')+ tmp
            else
            begin
               memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' EL CAMPO SALDO VENCIDO ESTA VACIO');
               exit;
            end;

            // FORMA DE PAGO ACTUAL
            TMP :=  FormaDePago(NumeroPagos);
            if tmp<>'' then
               TL := TL + '26'+AgregarCaracter(tmp,'0')+tmp
            else
            begin
               memolog.Lines.Add('CUENTA : '+edclave.Text+#9+' EL CAMPO FORMA DE PAGO ESTA VACIO');
               Exit;
            end;

            TL := TL + '9903END';

            if todos then
            begin
               cadenaFisicas:=cadenaFisicas+PN+PA+TL;
               memofis.Lines.Append(PN+PA+TL);
            end;
      end
      else
      begin
         application.MessageBox('La cuenta tecleada no existe , verifique por favor!','Atención',MB_OK);
         edclave.SetFocus;
      end;
   end;
end;

function TfrmBuroCredito.FechaBuroCredito(cadena:string):string;
var tmp : string;
begin
   tmp := COPY(cadena,9,2);//FECHA
   tmp := tmp + COPY(cadena,6,2);
   tmp := tmp + COPY(cadena,0,4);

  result := tmp;
end;

function TfrmBuroCredito.VerificarLong_Numeros(cadena,campo:string;longitud:integer):bool;
var entro:bool;
begin
   entro := false;
   entro := BuscarLetrasNoValidas(cadena);
   if (entro) then
      //application.MessageBox(pchar('CONTIENE UN CARACTER NO VALIDO EN EL '+campo+'!,'+#13+' NO PUEDE SER INGRESADO AL ARCHIVO, VERIFIQUE PRIMERO'),'ATENCION',MB_OK);
      memolog.Lines.Add('CUENTA : '+edClave.text+#9+' CONTIENE UN CARACTER NO VALIDO EN EL CAMPO ');
   if(Length(cadena) > longitud) then
   begin
      //application.MessageBox(pchar(campo+' NO PUEDE SER MAYOR A '+inttostr(longitud)+' CARACTERES!,'+#13+' NO PUEDE SER INGRESADO AL ARCHIVO, VERIFIQUE PRIMERO'),'ATENCION',MB_OK);
      memolog.Lines.Add('CUENTA : '+edClave.text+#9+' LA COLONIA ES REQUERIDA ');
      entro := true;
   end;
   result:= entro;
end;


function TfrmBuroCredito.AgregarCaracter(cadena,caractere:string):string;
begin
if(Length(cadena)>9) then
   result := inttostr(Length(cadena))
else
   result :=  caractere + inttostr(Length(cadena));
end;


procedure TfrmBuroCredito.Split
   (const Delimiter: Char;
    Input: string;
    const Strings: TStrings) ;
begin
   Assert(Assigned(Strings)) ;
   Strings.Clear;
   Strings.Delimiter := Delimiter;
   Strings.DelimitedText := Input;
end;


function TfrmBuroCredito.ValidarNumeros(cadena:string):bool;
var c:integer;
begin

try
  c:= strtoint(cadena);
  result := false;
except
  result := true;
end;

end;


function TfrmBuroCredito.FechaUltimoPago(cadena:string):string;
var tmp :string;
begin
   tmp := '';
   querys('select FechaAlta from PagosClientes where idpago =(select max(idpago) from PagosClientes where idcliente='+cadena+' and movimiento in(0,2) and abono > 0)',0,DMREPORTES.sqlgeneral4);
   if(dmreportes.sqlgeneral4.Fields.Fields[0].asstring <> '') then
      tmp := FechaBuroCredito(dmreportes.sqlgeneral4.Fields.Fields[0].asstring);
   result := tmp;
end;


function TfrmBuroCredito.FormaDePago(var NumPagosVenc:string):string;
var forma:string;
begin
   with dmreportes do
   begin
      if querys('SELECT if(to_days("'+datetostr(date)+'") -to_days(pc.FechaVence) > 0,to_days("'+datetostr(date)+'") -to_days(pc.FechaVence),0) as dias'+
      ' from PagosClientes as pc where pc.movimiento=11 and pc.idcliente =3 and tipopago="MOR" and idpedido='+
      ' (select min(idpedido) from PagosClientes where movimiento=11 and idcliente ='+edclave.text+' and tipopago="MOR")',0,sqlgeneral4)>0 then
      begin
         case (sqlgeneral4.FieldByName('dias').AsInteger) of
            1..29 : result := '02';
            30..59 : result := '03';
            60..89 : result := '04';
            90..119 : result := '05';
            120..149 : result := '06';
            150..365 : result := '07';
            366..9999: result := '96';
         end;
      end
      else
         // CUENTA AL CORRIENTE.
         result := '01';
      NumPagosVenc :=inttostr(sqlgeneral4.RecordCount);
   end;
end;

function TfrmBuroCredito.NumeroPagosCuenta(var monto:integer;cuenta:string):integer;
var iva :string;
begin
   iva := floattostr(strtofloat(GetConfiguraciones('IVA'))*100);
   with dmreportes do
   begin
      if querys('select tipocont,idcategoria from clientes where idcliente='+edclave.text,0,sqlgeneral4)>0 then
      begin
         if (sqlgeneral4.FieldByName('tipocont').AsString ='001') or (sqlgeneral4.FieldByName('tipocont').AsString='MOR') then
         begin
            querys('select round((costomensual*1.'+iva+')) as costo from categorias '+
            'where idcategoria="'+sqlgeneral4.fieldbyname('idcategoria').asstring+'" and idcategoria <> ""',0,sqlgeneral4);
            //esto ultimo por si no tiene categoria ------------------------------>^
            monto:=sqlgeneral4.fieldbyname('costo').AsInteger;
            result:=1;
         end
         else
            if sqlgeneral4.FieldByName('tipocont').AsString='006' then
            begin
               querys('select sum(costo) as costo from ( '+
                      ' select sum(round((costomensual*1.'+iva+'))) as costo '+
                      ' from categorias cat left join clientes c on c.idcategoria=cat.idcategoria'+
                      ' left join clientesCompartido cc on cc.idcliente=c.idcliente '+
                      ' where c.idcliente='+ cuenta+
                      ' union select round((costomensual*1.'+iva+')) as costo' +
                      ' from categorias cat left join clientes c on c.idcategoria=cat.idcategoria '+
                      ' where idcliente='+ cuenta+' ) as tab',0,sqlgeneral4);
               monto:=sqlgeneral4.fieldbyname('costo').AsInteger;
               result:=1;
            end;
      end;

   end;
end;

function TfrmBuroCredito.Saldo(cuenta:string):double;
begin
   with dmreportes do
   begin
      if querys('select idcliente from clientes where idcliente='+cuenta+' and tipocont="MOR"',0,sqlgeneral4)>0 then
      begin
         if querys('select sum(abono) as saldo from PagosClientes'+
                ' where idcliente='+cuenta+' and movimiento=11 and tipopago="MOR"',0,sqlgeneral4)>0 then
            result:=sqlgeneral4.fieldbyname('saldo').AsFloat
         else
            result:=0;
      end
      else
      begin
         if querys('select sum(saldo) as saldo from pedidos p left join PagosClientes pc using(idpedido) '+
                ' where p.estatus in (3,4) and saldado=0 and pc.movimiento=0 and p.idcliente='+cuenta,0,sqlgeneral4)>0 then
            result:=sqlgeneral4.fieldbyname('saldo').AsFloat
         else
            result:=0;
      end;
  end;
end;

function TfrmBuroCredito.SaldoVencido(cuenta:string):double;
begin
   with dmreportes do
   begin
      if querys('select idcliente from clientes where idcliente='+cuenta+' and tipocont="MOR"',0,sqlgeneral4)>0 then
      begin
         if querys('select sum(abono) as saldo from PagosClientes'+
                ' where idcliente='+cuenta+' and movimiento=11 and tipopago="MOR"',0,sqlgeneral4)>0 then
            result:=sqlgeneral4.fieldbyname('saldo').AsFloat
         else
            result:=0;
      end
      else
      begin
         if querys('select sum(saldo) as saldo from pedidos p left join PagosClientes pc using(idpedido) '+
                ' where p.estatus in (3,4) and saldado=0 and pc.movimiento=0 and p.idcliente='+cuenta+
                ' and fechavence<curdate()',0,sqlgeneral4)>0 then
            result:=sqlgeneral4.fieldbyname('saldo').AsFloat
         else
            result:=0;

      end;
   end;
end;

procedure TfrmBuroCredito.comprimir;
   // Delphi example code to create a password-protected zip.
var
  recurse: Integer;
  success: Integer;
begin
  {// UnlockComponent should be called once at the beginning of a program.
  ChilkatZip21.UnlockComponent('anything for 30-day trial');

  // Initialize the zip object.
  ChilkatZip21.NewZip('Buro\buroCredito.zip');

  // Add a directory tree to the zip object.  The AppendFiles
  // method recursively descends a directory and adds references to
  // files and directories to the zip object.  When the
  // zip is written (by calling WriteZipAndClose) all referenced files
  // and directories are added.
  recurse := 1;
  //ChilkatZip21.AppendFiles('D:\Oscar\Oscar Proyectos\Proyectos Sysalarm\Sysalarm\Buro\*', recurse);
  ChilkatZip21.AppendFiles(ExtractFilePath(Application.ExeName)+'\Buro\*', recurse);

  // The PasswordProtect property is entirely separate from the Encryption
  // property.  Both should not be set to non-zero values at the same time.
  // Password protection is the older, less-secure method of encrypting zips.
  //
  ChilkatZip21.PasswordProtect := 1;

  // Don't forget to set a password.
  ChilkatZip21.SetPassword('alarmex');
  success := ChilkatZip21.WriteZipAndClose();
  if (success = 0) then begin
      ChilkatZip21.SaveLastError('zipErrorLog.txt');
      ShowMessage(ChilkatZip21.LastErrorText);
  end;                         }
 // ShowMessage('Listo!');
end;

function TfrmBuroCredito.FechaUltimaCompra(cadena:string):string;
begin
   with dmreportes do
   begin
      if querys('select max(pc.fechaalta) as fecha from pedidos p left join PagosClientes pc on pc.idpedido=p.idpedido '+
      ' where p.estatus in (3,4,5) and pc.movimiento in (0) and p.idcliente='+cadena,0,sqlgeneral4)>0 then
         Result:=sqlgeneral4.fieldbyname('fecha').asstring;
   end;
end;


end.



