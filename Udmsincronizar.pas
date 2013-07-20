{//
2009-04-22 actualizar exe
2009-04-14 union en un solo exe
2008-06-10 Oscar procedure para respaldar tablas
Creada 2008-03-15 Oscar Castillo
//}

unit Udmsincronizar;

interface

uses
  SysUtils, StrUtils, Classes, DB, Dialogs, Forms, MemDS, DBAccess, MyAccess,
  LMDCustomComponent, LMDIniCtrl,Windows,clipbrd,math, RzLaunch;

type
  TDMSincronizar = class(TDataModule)
    ConexionLocal: TMyConnection;
    sqlgeneral: TMyQuery;
    sqlorigen: TMyQuery;
    sqldestino: TMyQuery;
    iniFile: TLMDIniCtrl;
    sqldestino1: TMyQuery;
    sqlorigen1: TMyQuery;
    sqlgeneral1: TMyQuery;
    sqlorigen2: TMyQuery;
    sqlorigen3: TMyQuery;
    sqlorigen4: TMyQuery;
    Lanzador: TRzLauncher;

  private
    { Private declarations }

  public
    //procedures
    procedure importartablas;
    procedure sincronizar;
    procedure insertaralservidor;
    procedure insertar(query,tabla,campo,id:string);
    procedure insertaTelefono(idorigen,iddestino:string);
    procedure insertaFact(idorigen,iddestino:string);
    procedure insertaContacto(idorigen,iddestino:string);
    procedure insertaAgenda(idorigen,iddestino:string);
    procedure insertaActividad(idorigen,iddestino:string);
    procedure insertaPresupuesto(idorigen,idpre,idopo:string);
    procedure insertaDetpre(idorigen,iddestino:string);
    procedure insertaPed(idorigen,idpre,idopo:string);
    procedure insertaDetped(idorigen,iddestino:string);
    procedure agregararticulo(idorigen,idpedido,articulo,cantidad,piezas:string);
    procedure VendeConBackOrder(idpedido,art:string;cant,pzs:integer);
    procedure InsertaArticulo(idorigen,idpedido,tabla,campo,valor,cod_cve:string;cantidad,requisicion,idCardexArt:integer);
    procedure apartarcuentas;
    procedure actualizarlaptop;
    procedure InsertaLog(idlocal, idservidor,tabla:string);
    procedure createmporales;
    procedure borratemporales;
    procedure insertaroportunidades;
    procedure insertarclientes;
    procedure insertarotros;
    procedure insertarnota(idorigen,iddestino:string);
    procedure agregarimagenes;
    procedure copiar(path,destino,fecha:string);
    procedure cargarmanuales;
    //functions
    function ValidaExistencias(CodCve:string;cantidad,piezas:integer):integer;
    function querysyn(const consulta:string;const actualizacion:integer;Query:TMyQuery):integer;
    function quitarC(cadena:string):string;

  end;

  myexception = class(Exception)
  end;


var
  DMSincronizar: TDMSincronizar;

implementation

uses Udm, Urecursos, Udmrep, Uprincipal, Variants, Upedidos, UCBase,
  UProgreso;


{$R *.dfm}

procedure TDMSincronizar.sincronizar;
var ban:boolean; contador,x:integer;
const grupo:array[1..12] of string =('articulos','clientes','ClientesFact','contactos','telefonos','PresupuestoDefault','actividades_vendedores',
                                     'agenda_vendedores','oportunidades','OportunidadesFact','presupuestos2','DetPresupuestos2');
begin
   contador:=0;                                       
   try
      with ConexionLocal do
        begin
        Server   := IniFile.ReadString('CONEXION_LOCAL', 'ipadd', '');
        Database := IniFile.ReadString('CONEXION_LOCAL', 'bd', '');
        Username := IniFile.ReadString('CONEXION_LOCAL', 'usuario', '');
        Password := IniFile.ReadString('CONEXION_LOCAL', 'pass', '');
        Connect;
        end;
   except
      On e:Exception do
         MessageDlg('"Ocurrio un error al tratar de conectarse a la Base de Datos Local" '+#13+#13+e.Message,mtError,[mbOK],0);
   end;
   ban:=false;
   repeat
      try

         querysyn('begin',1,sqlorigen);
         {querysyn('begin',1,sqlorigen1);
         querysyn('begin',1,sqlorigen2);
         querysyn('begin',1,sqlorigen3);
         querysyn('begin',1,sqlorigen4);
         querysyn('begin',1,sqlgeneral);
         querysyn('begin',1,sqlgeneral1);}
         querysyn('begin',1,sqldestino);
         querysyn('begin',1,sqldestino1);
         frmprogreso:=Tfrmprogreso.Create(self);
         frmprogreso.Height:=84;
         frmprogreso.Width:=441;
         frmprogreso.top:=500;
         frmprogreso.left:=350;
         frmprogreso.Show;
         //createmporales;
         cargarmanuales;
         insertaralservidor;
         agregarimagenes;
         querysyn('Commit',1,sqlorigen);
         querysyn('Commit',1,sqldestino);
         querysyn('Commit',1,sqldestino1);
         /////////////////////////////////////////////////////
         //////////////////segunda parte de sincronizar///////
         /////////////////////////////////////////////////////
         querysyn('begin',1,sqlorigen);
         querysyn('begin',1,sqldestino);
         querysyn('begin',1,sqldestino1);
         frmprogreso.barra.Percent:=20;
         apartarcuentas;
         frmprogreso.barra.Percent:=30;
         importartablas;
         frmprogreso.barra.Percent:=100;
         frmprogreso.Close;
         querysyn('Commit',1,sqlorigen);
         {querysyn('Commit',1,sqlorigen1);
         querysyn('Commit',1,sqlorigen2);
         querysyn('Commit',1,sqlorigen3);
         querysyn('Commit',1,sqlorigen4);
         querysyn('Commit',1,sqlgeneral);
         querysyn('Commit',1,sqlgeneral1);}
         querysyn('Commit',1,sqldestino);
         querysyn('Commit',1,sqldestino1);
         frmprincipal.ucprincipal.Log('Realizo Sincronizacion',3);
         Application.MessageBox('Sincronizacion Completada','Aviso',MB_OK+MB_ICONINFORMATION);
         ban:=false;
      except
         On e:Exception do
         begin
            if OcurrenciaWord(e.message,'#23000Duplicate entry')>0 then
            begin
               ban:=true;
               inc(contador);
            end
            else if OcurrenciaWord(e.message,'No se copio')>0 then
            begin
               MessageDlg('"Error!...'+#13+#13+e.Message+#13+#13+
               ' Favor de dar click en OK para intentar SINCRONIZAR de nuevo....',mtError,[mbOK],0);
               ban:=true;
               inc(contador);
            end
            else if OcurrenciaWord(e.message,'El Archivo ya existe')>0 then
            begin
               MessageDlg('"Error!!'+#13+#13+e.Message+#13+#13+
               ' Favor de dar click en OK para intentar SINCRONIZAR de nuevo....',mtError,[mbOK],0);
               ban:=true;
               inc(contador);
            end
            else
               MessageDlg('"Ocurrio un error al tratar de Sincronizar"   '+#13+#13+e.Message+#13+#13+
               ' Favor de Intentar SINCRONIZAR de nuevo....',mtError,[mbOK],0);
            if contador=3 then
               ban:=false;
            frmprogreso.Close;
            querysyn('Rollback',1,sqlorigen);
            {querysyn('Rollback',1,sqlorigen1);
            querysyn('Rollback',1,sqlorigen2);
            querysyn('Rollback',1,sqlorigen3);
            querysyn('Rollback',1,sqlorigen4);
            querysyn('Rollback',1,sqlgeneral);
            querysyn('Rollback',1,sqlgeneral1); }
            querysyn('Rollback',1,sqldestino);
            querysyn('Rollback',1,sqldestino1);
            for x:=1  to 12 do
            begin
                if FileExists(GetConfiguraciones('pathserver',true)+grupo[x]+frmprincipal.idmaq+'.txt') then
                  DeleteFile(pchar(GetConfiguraciones('pathserver',true)+grupo[x]+frmprincipal.idmaq+'.txt'));
            end;
         end
      end;
   until ban=false;
   conexionlocal.Disconnect;
end;

procedure TDMSincronizar.insertaralservidor;
begin
   sqldestino.Connection:=DMAccesos.conexion;
   sqlorigen.Connection:=conexionlocal;
   sqldestino1.Connection:=DMAccesos.conexion;
   sqlorigen1.Connection:=conexionlocal;
   sqlgeneral.Connection:=conexionlocal;
   sqlgeneral1.Connection:=conexionlocal;
   sqlorigen2.Connection:=conexionlocal;
   // 5%
   insertaroportunidades;
   // 10%
   insertarclientes;
   // 20%
   insertarotros;
end;

procedure TDMSincronizar.insertaroportunidades;
var idtel,idfact,idcontacto,idusuario,idoportunidad,temp,idpre,idnota,cadena:string;
begin
   querysyn('select * from oportunidades where Sincronizado=1',0,sqlorigen);
   sqlorigen.First;
   while not sqlorigen.Eof do
   begin
      //busca el estatus de la oportunidad para saber si es oportunidad o cliente
      if sqlorigen.FieldByName('estatus').asstring='CLIENTE' then
      begin
         idtel:=sqlorigen.fieldbyname('idtel').AsString;
         idfact:=sqlorigen.fieldbyname('idfact').AsString;
         idcontacto:=sqlorigen.fieldbyname('idcontacto').AsString;
         idusuario:=sqlorigen.fieldbyname('idusuario').AsString;
      end;
      //se inserta el registro de la tabla local a la tabla del servidor
      querysyn('select max(idoportunidad)+1 as idoportunidad from oportunidades',0,sqldestino);
      idoportunidad:=sqldestino.fieldbyname('idoportunidad').AsString;
      cadena:='insert into oportunidades (idoportunidad,idgiro,idcol,estatus,idorigen,idfuente,idtipo,idcategoria,ciudad,'+
      'nombre,apaterno,amaterno,rsocial,dir,estado,alta,cp,entre,numero,Observacion,NotaUbicacion,Seguimiento,sexo,cumpleanos,usuario,'+
      'fecha,hora,cuenta,AltaAdmin,ModificarDatos,EsCliente,AceptaModificacion,idreferencia,deducible,Sincronizado,codvendedor) '+
      'values ("'+idoportunidad+'","'+sqlorigen.Fields.Fields[2].AsString+'","'+sqlorigen.Fields.Fields[3].AsString+'","'+
      sqlorigen.Fields.Fields[4].AsString+'","'+sqlorigen.Fields.Fields[5].AsString+'","'+sqlorigen.Fields.Fields[6].AsString+'","'+
      sqlorigen.Fields.Fields[7].AsString+'","'+sqlorigen.Fields.Fields[8].AsString+'","'+quitarc(sqlorigen.Fields.Fields[10].AsString)+
      '","'+quitarc(sqlorigen.Fields.Fields[11].AsString)+'","'+quitarc(sqlorigen.Fields.Fields[12].AsString)+'","'+quitarc(sqlorigen.Fields.Fields[13].AsString)+
      '","'+quitarc(sqlorigen.Fields.Fields[14].AsString)+'","'+quitarc(sqlorigen.Fields.Fields[15].AsString)+'","'+quitarc(sqlorigen.Fields.Fields[16].AsString)+
      '","'+sqlorigen.Fields.Fields[17].AsString+'","'+sqlorigen.Fields.Fields[18].AsString+'","'+quitarc(sqlorigen.Fields.Fields[19].AsString)+
      '","'+sqlorigen.Fields.Fields[20].AsString+'","'+quitarc(sqlorigen.Fields.Fields[21].AsString)+'","'+quitarc(sqlorigen.Fields.Fields[22].AsString)+
      '","'+quitarc(sqlorigen.Fields.Fields[23].AsString)+'","'+quitarc(sqlorigen.Fields.Fields[24].AsString)+'","'+quitarc(sqlorigen.Fields.Fields[25].AsString)+
      '","'+quitarc(sqlorigen.Fields.Fields[26].AsString)+'","'+sqlorigen.Fields.Fields[27].AsString+'","'+sqlorigen.Fields.Fields[28].AsString+
      '","'+sqlorigen.Fields.Fields[29].AsString+'","'+sqlorigen.Fields.Fields[30].AsString+'","'+sqlorigen.Fields.Fields[31].AsString+
      '","'+sqlorigen.Fields.Fields[33].AsString+'","'+sqlorigen.Fields.Fields[34].AsString+'","'+sqlorigen.Fields.Fields[36].AsString+
      '","'+sqlorigen.Fields.Fields[41].AsString+'",0,"'+sqlorigen.Fields.Fields[43].AsString+'")';
      InsertaLog(sqlorigen.Fields.Fields[0].AsString, idoportunidad,'Oportunidades');
      querysyn(cadena,1,sqldestino);
      if not (sqlorigen.FieldByName('idtel').IsNull) and (sqlorigen.FieldByName('estatus').asstring<>'CLIENTE') and (sqlorigen.FieldByName('idtel').AsInteger>0) then
      begin
         querysyn('select max(idtel)+1 as idtel from telefonos',0,sqldestino);
         idtel:=sqldestino.fieldbyname('idtel').AsString;
         insertaTelefono(sqlorigen.FieldByName('idtel').AsString,idtel);
         querysyn('update oportunidades set idtel='+idtel+' where idoportunidad='+idoportunidad,1,sqldestino);
         InsertaLog(sqlorigen.FieldByName('idtel').AsString,idtel,'Telefonos');
      end;
      if sqlorigen.FieldByName('estatus').asstring='CLIENTE' then
      begin
         querysyn('update oportunidades set idtel='+idtel+' where idoportunidad='+idoportunidad,1,sqldestino);
         if querysyn('select idtel from telefonos where idtel='+idtel+' and sincronizado=1',0,sqlorigen2)>0 then
         begin
            insertatelefono(sqlorigen2.fieldbyname('idtel').asstring,idtel);
            InsertaLog(sqlorigen.FieldByName('idtel').AsString,idtel,'Telefonos');
            querysyn('update telefonos set sincronizado=0 where idtel='+idtel+' and sincronizado=1',1,sqlorigen2);
         end;
      end;

      if not sqlorigen.fieldbyname('idfact').IsNull and (sqlorigen.FieldByName('estatus').asstring<>'CLIENTE') and (sqlorigen.FieldByName('idfact').AsInteger>0) then
      begin
         querysyn('select max(idfact)+1 as idfact from OportunidadesFact',0,sqldestino);
         idfact:=sqldestino.fieldbyname('idfact').AsString;
         insertaFact(sqlorigen.fieldbyname('idfact').AsString,idfact);
         querysyn('update oportunidades set idfact='+idfact+' where idoportunidad='+idoportunidad,1,sqldestino);
         InsertaLog(sqlorigen.fieldbyname('idfact').AsString,idfact,'Oportunidades Facturacion');
      end;
      if sqlorigen.FieldByName('estatus').asstring='CLIENTE' then
      begin
         querysyn('update oportunidades set idfact='+idfact+' where idoportunidad='+idoportunidad,1,sqldestino);
         if querysyn('select idfact from OportunidadesFact where idfact='+idfact+' and sincronizado=1',0,sqlorigen2)>0 then
            querysyn('update OportunidadesFact set sincronizado=0 where idfact='+idfact+' and sincronizado=1',1,sqlorigen2);
      end;

      if not sqlorigen.fieldbyname('idcontacto').IsNull and (sqlorigen.FieldByName('estatus').asstring<>'CLIENTE') and (sqlorigen.FieldByName('idcontacto').AsInteger>0) then
      begin
         querysyn('select max(idcontacto)+1 as idcontacto from contactos',0,sqldestino);
         idcontacto:=sqldestino.fieldbyname('idcontacto').AsString;
         insertaContacto(sqlorigen.fieldbyname('idcontacto').AsString,idcontacto);
         querysyn('update oportunidades set idcontacto='+idcontacto+' where idoportunidad='+idoportunidad,1,sqldestino);
         if querysyn('select idtel from contactos where idcontacto='+sqlorigen.fieldbyname('idcontacto').asstring+' and idtel<>0',0,sqlorigen4)>0 then
         begin
            sqlorigen4.First;
            while not sqlorigen4.Eof do
            begin
               temp:=sqlorigen4.fieldbyname('idtel').asstring;
               querysyn('select max(idtel)+1 as idtel from telefonos',0,sqldestino);
               idtel:=sqldestino.fieldbyname('idtel').AsString;
               insertaTelefono(temp,idtel);
               querysyn('update contactos set idtel='+idtel+' where idcontacto='+idcontacto+' and idtel='+temp,1,sqldestino);
               InsertaLog(temp,idtel,'Telefonos');
               sqlorigen4.Next;
            end;
         end;
         InsertaLog(sqlorigen.fieldbyname('idcontacto').AsString,idcontacto,'contactos');
      end;
      if sqlorigen.FieldByName('estatus').asstring='CLIENTE' then
      begin
         querysyn('update oportunidades set idcontacto='+idcontacto+' where idoportunidad='+idoportunidad,1,sqldestino);
         if querysyn('select idcontacto,procedencia from contactos where idcontacto='+idcontacto+' and sincronizado=1',0,sqlorigen2)>0 then
         begin
            if sqlorigen2.fieldbyname('procedencia').asstring='oportunidades' then
               insertaContacto(idcontacto,idcontacto);
            querysyn('update contactos set sincronizado=0 where idcontacto='+idcontacto+' and sincronizado=1',1,sqlorigen2);
         end;
      end;

      if not sqlorigen.fieldbyname('idusuario').IsNull and (sqlorigen.FieldByName('estatus').asstring<>'CLIENTE') and (sqlorigen.FieldByName('idusuario').AsInteger>0) then
      begin
         querysyn('select max(idcontacto)+1 as idcontacto from contactos',0,sqldestino);
         idusuario:=sqldestino.fieldbyname('idcontacto').AsString;
         insertaContacto(sqlorigen.fieldbyname('idusuario').AsString,idusuario);
         querysyn('update oportunidades set idusuario='+idusuario+' where idoportunidad='+idoportunidad,1,sqldestino);
         if querysyn('select idtel from contactos where idcontacto='+sqlorigen.fieldbyname('idusuario').asstring+' and idtel<>0',0,sqlorigen4)>0 then
         begin
            sqlorigen4.First;
            while not sqlorigen4.Eof do
            begin
               temp:=sqlorigen4.fieldbyname('idtel').asstring;
               querysyn('select max(idtel)+1 as idtel from telefonos',0,sqldestino);
               idtel:=sqldestino.fieldbyname('idtel').AsString;
               insertaTelefono(temp,idtel);
               querysyn('update contactos set idtel='+idtel+' where idcontacto='+idusuario+' and idtel='+temp,1,sqldestino);
               InsertaLog(temp,idtel,'Telefonos');
               sqlorigen4.Next;
            end;
         end;
         InsertaLog(sqlorigen.fieldbyname('idusuario').AsString,idusuario,'Contactos');
      end;
      if sqlorigen.FieldByName('estatus').asstring='CLIENTE' then
      begin
         querysyn('update oportunidades set idusuario='+idusuario+' where idoportunidad='+idoportunidad,1,sqldestino);
         if querysyn('select idcontacto,procedencia from contactos where idcontacto='+idusuario+' and sincronizado=1',0,sqlorigen2)>0 then
         begin
            if sqlorigen2.fieldbyname('procedencia').asstring='oportunidades' then
               insertaContacto(idusuario,idusuario);
            querysyn('update contactos set sincronizado=0 where idcontacto='+idusuario+' and sincronizado=1',1,sqlorigen2);
         end;
      end;

      if querysyn('select * from agenda_vendedores where idoportunidad='+
      sqlorigen.fieldbyname('idoportunidad').AsString+' and (Sincronizado=1 or Sincronizado=2)',0,sqlgeneral)>0 then
      begin
         temp:=sqlgeneral.fieldbyname('idnota').asstring;
         insertaAgenda(sqlorigen.fieldbyname('idoportunidad').AsString,idoportunidad);
         if temp>'0' then
         begin
            if querysyn('select idnota from notasseg where sincronizado=1 and idnota='+temp,0,sqlorigen2)>0 then
            begin
               querysyn('select max(idnota)+1 as idnota from notasseg',0,sqldestino);
               idnota:=sqldestino.fieldbyname('idnota').asstring;
               temp:=sqlorigen2.fieldbyname('idnota').AsString;
               insertarnota(temp,idnota);
               InsertaLog(temp,idnota,'Notas');
               querysyn('update agenda_vendedores set idnota='+idnota+' where idoportunidad='+idoportunidad,1,sqldestino);
            end;
         end;
      end;

      if querysyn('select * from presupuestos2 where idoportunidad='+sqlorigen.fieldbyname('idoportunidad').AsString+
                  ' and Sincronizado=1',0,sqlgeneral)>0 then
      begin
         querysyn('select max(idpresupuesto)+1 as idpre from presupuestos2',0,sqldestino);
         idpre:=sqldestino.fieldbyname('idpre').AsString;
         InsertaLog(sqlgeneral.fieldbyname('idpresupuesto').AsString,idpre,'presupuestos2');
         insertaPresupuesto(sqlorigen.fieldbyname('idoportunidad').AsString,idpre,idoportunidad);
      end;
      sqlorigen.Next;
   end;
   frmprogreso.barra.Percent:=frmprogreso.barra.Percent+5;
end;

procedure TDMSincronizar.insertarclientes;
var idtel,idfact,idcontacto,idusuario,temp:string;
begin
   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   //////////////////////////////////// CLIENTES //////////////////////////////////////////////////////////////////
   ////////////////////////////////////////////////////////////////////////////////////////////////////////////////
   querysyn('select * from clientes where sincronizado=1',0,sqlorigen);
   sqlorigen.First;
   while not sqlorigen.Eof do
   begin
      //CAMBIOS CLIENTES
      bpcambios('clientes', sqlorigen.fieldbyname('idcliente').asstring, 'idcliente');
      querysyn('update clientes set rfc='+quotedstr(quitarc(sqlorigen.fieldbyname('rfc').asstring))+',rsocial='+quotedstr(quitarc(sqlorigen.fieldbyname('rsocial').asstring))+
      ',nombre='+quotedstr(quitarc(sqlorigen.fieldbyname('nombre').asstring))+',apaterno='+quotedstr(quitarc(sqlorigen.fieldbyname('apaterno').asstring))+
      ',amaterno='+quotedstr(quitarc(sqlorigen.fieldbyname('amaterno').asstring))+','+'dir='+quotedstr(quitarc(sqlorigen.fieldbyname('dir').asstring))+
      ',numero='+quotedstr(sqlorigen.fieldbyname('numero').asstring)+',ciudad='+quotedstr(quitarc(sqlorigen.fieldbyname('ciudad').asstring))+
      ',estado='+quotedstr(quitarc(sqlorigen.fieldbyname('estado').asstring))+',cp='+quotedstr(sqlorigen.fieldbyname('cp').asstring)+',sector='+
      quotedstr(sqlorigen.fieldbyname('sector').asstring)+',refs='+quotedstr(quitarc(sqlorigen.fieldbyname('refs').asstring))+',idtipo='+
      quotedstr(sqlorigen.fieldbyname('idtipo').asstring)+',email='+quotedstr(quitarc(sqlorigen.fieldbyname('email').asstring))+',idcol='+
      quotedstr(sqlorigen.fieldbyname('idcol').asstring)+',st_date='+quotedstr(sqlorigen.fieldbyname('st_date').asstring)+',idgiro='+
      quotedstr(sqlorigen.fieldbyname('idgiro').asstring)+',idcategoria='+quotedstr(sqlorigen.fieldbyname('idcategoria').asstring)+
      ',password='+quotedstr(quitarc(sqlorigen.fieldbyname('password').asstring))+',comentario='+quotedstr(quitarc(sqlorigen.fieldbyname('comentario').asstring))+
      ',idvendedor='+quotedstr(sqlorigen.fieldbyname('idvendedor').asstring)+',idorigen='+quotedstr(sqlorigen.fieldbyname('idorigen').asstring)+
      ',idfuente='+quotedstr(sqlorigen.fieldbyname('idfuente').asstring)+',usuario='+quotedstr(quitarc(frmprincipal.ucprincipal.CurrentUser.LoginName))+
      ',fecha='+quotedstr(datetostr(date))+',hora='+quotedstr(timetostr(Time))+',idreferencia='+quotedstr(sqlorigen.fieldbyname('idreferencia').asstring)+
      ',estatus='+quotedstr(sqlorigen.fieldbyname('estatus').asstring)+',idnota='+quotedstr(sqlorigen.fieldbyname('idnota').asstring)+
      ',PruebaSema='+quotedstr(sqlorigen.fieldbyname('PruebaSema').asstring)+',NoPatrulla='+quotedstr(sqlorigen.fieldbyname('NoPatrulla').asstring)+
      ',idmotivo='+quotedstr(sqlorigen.fieldbyname('idmotivo').asstring)+',deducible='+quotedstr(sqlorigen.fieldbyname('deducible').asstring)+
      ',NotaUbicacion='+quotedstr(quitarc(sqlorigen.fieldbyname('NotaUbicacion').asstring))+',usuarioweb='+quotedstr(quitarc(sqlorigen.fieldbyname('usuarioweb').asstring))+
      ',passwordweb='+quotedstr(quitarc(sqlorigen.fieldbyname('passwordweb').asstring))+' where idcliente='+quotedstr(sqlorigen.fieldbyname('idcliente').asstring),1,sqldestino);
      //CAMBIOS
      apcambios('idcliente', sqlorigen.fieldbyname('idcliente').asstring, 'clientes', 'Sincronizacion');
      if not sqlorigen.FieldByName('idtel').IsNull then
      begin
         querysyn('select max(idtel)+1 as idtel from telefonos',0,sqldestino);
         idtel:=sqldestino.fieldbyname('idtel').AsString;
         insertaTelefono(sqlorigen.FieldByName('idtel').AsString,idtel);
         bpcambios('clientes', sqlorigen.fieldbyname('idcliente').asstring, 'idcliente');
         querysyn('update clientes set idtel='+idtel+' where idcliente='+sqlorigen.fieldbyname('idcliente').asstring,1,sqldestino);
         apcambios('idcliente', sqlorigen.fieldbyname('idcliente').asstring, 'clientes', 'Sincronizacion');
         querysyn('update telefonos set Sincronizado=0 where idtel='+sqlorigen.FieldByName('idtel').AsString,1,sqlorigen2);
         InsertaLog(sqlorigen.fieldbyname('idtel').AsString,idtel,'telefonos');
      end;
      if not sqlorigen.fieldbyname('idfact').IsNull then
      begin
         querysyn('select max(idfact)+1 as idfact from ClientesFact',0,sqldestino);
         idfact:=sqldestino.fieldbyname('idfact').AsString;
         insertar('select * from ClientesFact where idfact='+sqlorigen.fieldbyname('idfact').AsString,'ClientesFact','idfact',idfact);
         bpcambios('clientes', sqlorigen.fieldbyname('idcliente').asstring, 'idcliente');
         querysyn('update clientes set idfact='+idfact+' where idcliente='+sqlorigen.fieldbyname('idcliente').asstring,1,sqldestino);
         apcambios('idcliente', sqlorigen.fieldbyname('idcliente').asstring, 'clientes', 'Sincronizacion');
         InsertaLog(sqlorigen.fieldbyname('idfact').AsString,idfact,'ClientesFact');
      end;
      if not sqlorigen.fieldbyname('idcontacto').IsNull then
      begin
         querysyn('select max(idcontacto)+1 as idcontacto from contactos',0,sqldestino);
         idcontacto:=sqldestino.fieldbyname('idcontacto').AsString;
         insertaContacto(sqlorigen.fieldbyname('idcontacto').AsString,idcontacto);
         bpcambios('clientes', sqlorigen.fieldbyname('idcliente').asstring, 'idcliente');
         querysyn('update clientes set idcontacto='+idcontacto+' where idcliente='+sqlorigen.fieldbyname('idcliente').asstring,1,sqldestino);
         apcambios('idcliente', sqlorigen.fieldbyname('idcliente').asstring, 'clientes', 'Sincronizacion');
         querysyn('update contactos set Sincronizado=0 where idcontacto='+sqlorigen.fieldbyname('idcontacto').AsString,1,sqlorigen2);
         InsertaLog(sqlorigen.fieldbyname('idcontacto').AsString,idcontacto,'contactos');
         if querysyn('select idtel from contactos where idcontacto='+sqlorigen.fieldbyname('idcontacto').asstring+' and idtel<>0',0,sqlorigen4)>0 then
         begin
            sqlorigen4.First;
            while not sqlorigen4.Eof do
            begin
               temp:=sqlorigen4.fieldbyname('idtel').asstring;
               querysyn('select max(idtel)+1 as idtel from telefonos',0,sqldestino);
               idtel:=sqldestino.fieldbyname('idtel').AsString;
               insertaTelefono(temp,idtel);
               querysyn('update contactos set idtel='+idtel+' where idcontacto='+idcontacto+' and idtel='+temp,1,sqldestino);
               querysyn('update telefonos set sincronizado=0 where idtel='+sqlorigen4.fieldbyname('idtel').asstring,1,sqlorigen3);
               InsertaLog(temp,idtel,'telefonos');
               sqlorigen4.Next;
            end;
         end;
      end;

      if not sqlorigen.fieldbyname('idusuario').IsNull then
      begin
         querysyn('select max(idcontacto)+1 as idcontacto from contactos',0,sqldestino);
         idusuario:=sqldestino.fieldbyname('idcontacto').AsString;
         insertacontacto(sqlorigen.fieldbyname('idusuario').AsString,idusuario);
         bpcambios('clientes', sqlorigen.fieldbyname('idcliente').asstring, 'idcliente');
         querysyn('update clientes set idusuario='+idusuario+' where idcliente='+sqlorigen.fieldbyname('idcliente').asstring,1,sqldestino);
         apcambios('idcliente', sqlorigen.fieldbyname('idcliente').asstring, 'clientes', 'Sincronizacion');
         InsertaLog(sqlorigen.fieldbyname('idusuario').AsString,idusuario,'contactos');
      end;

      //Actualizo la oportunidad con la nueva cuenta
      querysyn('select max(idoportunidad) as id from oportunidades where cuenta='+sqlorigen.fieldbyname('idcliente').asstring,0,sqlorigen2);
      querysyn('update oportunidades set cuenta='+sqlorigen.fieldbyname('idcliente').asstring+
      ' where idoportunidad='+sqlorigen2.fieldbyname('id').asstring,1,sqldestino);
      sqlorigen.Next;
   end;
   frmprogreso.barra.Percent:=frmprogreso.barra.Percent+5;
end;

procedure TDMSincronizar.insertarotros;
var idtel,idfact,idcontacto,temp,idpre,idped:string;
begin
   //############################### OTROS ######################################
   //############################################################################
   //Oportunidades
   if querysyn('select idoportunidad,nombre,apaterno,amaterno,rsocial,dir,'+
    'numero,ciudad,estado,idcol,entre,idcategoria,idgiro from oportunidades where sincronizado=2',0,sqlorigen)>0 then
   begin
      sqlorigen.first;
      while not sqlorigen.eof do
      begin
         querysyn('update oportunidades set nombre="'+sqlorigen.fieldbyname('nombre').asstring+'",'+
         ' apaterno="'+sqlorigen.fieldbyname('apaterno').asstring+'",'+
         ' amaterno="'+sqlorigen.fieldbyname('amaterno').asstring+'",'+
         ' rsocial="'+sqlorigen.fieldbyname('rsocial').asstring+'",'+
         ' dir="'+sqlorigen.fieldbyname('dir').asstring+'",'+
         ' numero="'+sqlorigen.fieldbyname('numero').asstring+'",'+
         ' ciudad="'+sqlorigen.fieldbyname('ciudad').asstring+'",'+
         ' estado="'+sqlorigen.fieldbyname('estado').asstring+'",'+
         ' idcol="'+sqlorigen.fieldbyname('idcol').asstring+'",'+
         ' entre="'+sqlorigen.fieldbyname('entre').asstring+'",'+
         ' idcategoria="'+sqlorigen.fieldbyname('idcategoria').asstring+'",'+
         ' idgiro="'+sqlorigen.fieldbyname('idgiro').asstring+
         '" where idoportunidad='+sqlorigen.fieldbyname('idoportunidad').asstring,1,sqldestino);
         sqlorigen.next;
      end;
   end;
   frmprogreso.barra.Percent:=frmprogreso.barra.Percent+1;

   //Agenda Vendedores
   if querysyn('select * from agenda_vendedores where Sincronizado=2',0,sqlorigen)>0 then
   begin
      sqlorigen.first;
      while not sqlorigen.eof do
      begin
         querysyn('update agenda_vendedores set idvendedor='+sqlorigen.fieldbyname('idvendedor').asstring+
         ',fecha_creacion='+QuotedStr(sqlorigen.fieldbyname('fecha_creacion').asstring)+
         ',hora_creacion='+QuotedStr(sqlorigen.fieldbyname('hora_creacion').asstring)+',idtipo_oportunidad='+
         sqlorigen.fieldbyname('idtipo_oportunidad').asstring+',observaciones='+QuotedStr(sqlorigen.fieldbyname('observaciones').asstring)+
         ',idestatus='+sqlorigen.fieldbyname('idestatus').asstring+',idoportunidad='+sqlorigen.fieldbyname('idoportunidad').asstring+
         ',prox_llama='+QuotedStr(sqlorigen.fieldbyname('prox_llama').asstring)+',ult_llamad='+QuotedStr(sqlorigen.fieldbyname('ult_llamad').asstring)+
         ',fecha_cierre='+QuotedStr(sqlorigen.fieldbyname('fecha_cierre').asstring)+
         ',Sincronizado=0 where idevento='+sqlorigen.fieldbyname('idevento').asstring,1,sqldestino);
         sqlorigen.next;
      end;
   end;
   frmprogreso.barra.Percent:=frmprogreso.barra.Percent+1;

   //NOTAS SEGUIMIENTO
   if querysyn('select idnota from notasseg where sincronizado=1',0,sqlorigen)>0 then
   begin
      sqlorigen.first;
      while not sqlorigen.eof do
      begin
         //trae idevento de local
         querysyn('select idevento from agenda_vendedores where idnota='+sqlorigen.fieldbyname('idnota').asstring,0,sqlorigen2);
         //trae idnota de la tabla agenda_vend del server
         if querysyn('select idnota from agenda_vendedores where idevento='+sqlorigen2.fieldbyname('idevento').asstring,0,sqldestino)>0 then
         begin
            if sqldestino.FieldByName('idnota').AsInteger>0 then
            begin
               insertarnota(sqlorigen.fieldbyname('idnota').asstring,sqlorigen.fieldbyname('idnota').asstring);
               InsertaLog(sqlorigen.fieldbyname('idnota').asstring,sqlorigen.fieldbyname('idnota').asstring,'Notas');
            end
            else
            begin
               querysyn('select max(idnota)+1 as idnota from notasseg',0,sqldestino);
               temp:=sqldestino.fieldbyname('idnota').asstring;
               insertarnota(sqlorigen.fieldbyname('idnota').asstring,temp);
               InsertaLog(sqlorigen.fieldbyname('idnota').asstring,temp,'Notas');
               querysyn('update agenda_vendedores set idnota='+temp+
               ' where idevento='+sqlorigen2.fieldbyname('idevento').asstring,1,sqldestino);
            end;
         end;
         sqlorigen.Next;
      end;
   end;

   //Actividades Vendedores
   if querysyn('select idevento,idactividades from actividades_vendedores where Sincronizado=1',0,sqlorigen)>0 then
   begin
      sqlorigen.First;
      temp:='';
      while not sqlorigen.Eof do
      begin
         if temp<>sqlorigen.fieldbyname('idevento').AsString then
         begin
            insertaactividad(sqlorigen.fieldbyname('idevento').asstring,sqlorigen.fieldbyname('idevento').asstring);
            InsertaLog(sqlorigen.fieldbyname('idevento').asstring,sqlorigen.fieldbyname('idevento').asstring,'actividades_vendedores');
         end;
         temp:=sqlorigen.fieldbyname('idevento').AsString;
         sqlorigen.Next;
      end;
      //querysyn('delete from actividades_vendedores where Sincronizado=1',1,sqlorigen2);
   end;
   frmprogreso.barra.Percent:=frmprogreso.barra.Percent+1;
   
   if querysyn('select * from actividades_vendedores where Sincronizado=2',0,sqlorigen2)>0 then
   begin
      sqlorigen2.first;
      while not sqlorigen2.eof do
      begin
         querysyn('update actividades_vendedores set idevento='+sqlorigen2.fieldbyname('idevento').asstring+
         ',idtipo_actividad='+sqlorigen2.fieldbyname('idtipo_actividad').asstring+
         ',observaciones='+QuotedStr(sqlorigen2.fieldbyname('observaciones').asstring)+',realizada='+sqlorigen2.fieldbyname('realizada').asstring+
         ',idvendedor='+sqlorigen2.fieldbyname('idvendedor').asstring+',fecha='+QuotedStr(sqlorigen2.fieldbyname('fecha').asstring)+
         ',hora='+QuotedStr(sqlorigen2.fieldbyname('hora').asstring)+',fecha_cierre='+QuotedStr(sqlorigen2.fieldbyname('fecha_cierre').asstring)+
         ',hora_cierre='+QuotedStr(sqlorigen2.fieldbyname('hora_cierre').asstring)+',Sincronizado=0 where idevento='+
         sqlorigen2.fieldbyname('idevento').asstring+' and idactividades='+sqlorigen2.fieldbyname('idactividades').asstring,1,sqldestino);
         sqlorigen2.next;
      end;
   end;
   frmprogreso.barra.Percent:=frmprogreso.barra.Percent+1;

   //presupuestos
   querysyn('select max(idpresupuesto)+1 as m from presupuestos2',0,sqldestino);
   idpre:=sqldestino.fieldbyname('m').asstring;
   if querysyn('select idpresupuesto,idoportunidad from presupuestos2 where Sincronizado=1',0,sqlorigen)>0 then
   begin
      sqlorigen.First;
      while not sqlorigen.Eof do
      begin
         insertaPresupuesto(sqlorigen.fieldbyname('idoportunidad').asstring,idpre,sqlorigen.fieldbyname('idoportunidad').asstring);
         InsertaLog(sqlorigen.fieldbyname('idpresupuesto').asstring,idpre,'presupuestos2');
         idpre:=inttostr(strtoint(idpre)+1);
         sqlorigen.Next;
      end;
   end;
   //actualizar las modificaciones
   if querysyn('select idpresupuesto,idoportunidad from presupuestos2 where Sincronizado=2',0,sqlorigen)>0 then
   begin
      sqlorigen.First;
      while not sqlorigen.Eof do
      begin
         //insertaDetpre(sqlorigen.fieldbyname(idpresupuesto).asstring,sqlorigen.fieldbyname(idpresupuesto).asstring);
         querysyn('select * from DetPresupuestos2 where idpresupuesto='+sqlorigen.fieldbyname('idpresupuesto').asstring,0,sqlorigen2);
         sqlorigen2.First;
         while not sqlorigen2.Eof do
         begin
            querysyn('insert into DetPresupuestos2 (idpresupuesto,cant,cod_cve,idopcion,costo,idconcepto,tiempo,Costohrs,usuario,'+
            ' fecha,hora,sincronizado) values('+sqlorigen2.fieldbyname('idpresupuesto').asstring+','+
            sqlorigen2.fieldbyname('cant').asstring+',"'+sqlorigen2.fieldbyname('cod_cve').asstring+'",'+
            sqlorigen2.fieldbyname('idopcion').asstring+','+sqlorigen2.fieldbyname('costo').asstring+','+
            sqlorigen2.fieldbyname('idconcepto').asstring+','+sqlorigen2.fieldbyname('tiempo').asstring+','+
            sqlorigen2.fieldbyname('Costohrs').asstring+',"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'","'+
            sqlorigen2.fieldbyname('fecha').asstring+'","'+FormatDateTime('HH:mm:ss',sqlorigen2.fieldbyname('hora').AsDateTime)+'",1)',1,sqldestino);
            sqlorigen2.Next;
         end;
         querysyn('delete from DetPresupuestos2 where idpresupuesto='+sqlorigen.fieldbyname('idpresupuesto').asstring+' and sincronizado=0',1,sqldestino);
         sqlorigen.Next;
      end;
   end;

   frmprogreso.barra.Percent:=frmprogreso.barra.Percent+1;

   //pedidos
   querysyn('select max(idpedido)+1 as m from pedidos',0,sqldestino);
   idped:=sqldestino.fieldbyname('m').asstring;
   if querysyn('select idpedido,idpresupuesto from pedidos where Sincronizado=1',0,sqlorigen)>0 then
   begin
      sqlorigen.First;
      while not sqlorigen.Eof do
      begin
         insertar('select * from pedidos where idpedido='+sqlorigen.fieldbyname('idpedido').asstring+
         ' and sincronizado=1','pedidos','idpedido',idped);
         querysyn('update presupuestos2 set estatus=1 where idpresupuesto='+sqlorigen.fieldbyname('idpresupuesto').asstring,1,sqldestino);
         insertar('select * from DetPedido where idpedido='+sqlorigen.fieldbyname('idpedido').asstring+
         ' and sincronizado=1','DetPedido','idpedido',idped);
         querysyn('update pedidos set Sincronizado=0 where idpedido='+sqlorigen.fieldbyname('idpedido').asstring,1,sqlorigen2);
         InsertaLog(sqlorigen.fieldbyname('idpedido').asstring,idped,'pedidos');
         idped:=inttostr(strtoint(idped)+1);
         sqlorigen.Next;
      end;
   end;
   frmprogreso.barra.Percent:=frmprogreso.barra.Percent+1;

   //datos facturacion
   querysyn('select max(idfact)+1 as m from OportunidadesFact',0,sqldestino);
   idfact:=sqldestino.fieldbyname('m').asstring;
   if querysyn('select idfact from OportunidadesFact where Sincronizado=1',0,sqlorigen)>0 then
   begin
      sqlorigen.First;
      while not sqlorigen.Eof do
      begin
         insertaFact(sqlorigen.fieldbyname('idfact').asstring,idfact);
         if querysyn('select idoportunidad from oportunidades where idfact='+sqlorigen.fieldbyname('idfact').asstring,0,sqlorigen2)>0 then
            querysyn('update oportunidades set idfact='+idfact+' where idoportunidad='+
            sqlorigen2.fieldbyname('idoportunidad').asstring,1,sqldestino);
         InsertaLog(sqlorigen.fieldbyname('idfact').asstring,idfact,'OportunidadesFact');
         idfact:=inttostr(strtoint(idfact)+1);
         sqlorigen.Next;
      end;
   end;
   frmprogreso.barra.Percent:=frmprogreso.barra.Percent+1;

   //telefonos
   querysyn('select max(idtel)+1 as m from telefonos',0,sqldestino);
   idtel:=sqldestino.fieldbyname('m').asstring;
   if querysyn('select idtel from telefonos where Sincronizado=1 and procedencia="oportunidades"',0,sqlorigen)>0 then
   begin
      sqlorigen.First;
      while not sqlorigen.Eof do
      begin
         temp:=sqlorigen.fieldbyname('idtel').asstring;
         insertaTelefono(sqlorigen.fieldbyname('idtel').asstring,idtel);
         InsertaLog(sqlorigen.fieldbyname('idtel').asstring,idtel,'telefonos');
         querysyn('select max(idoportunidad) as idoportunidad from oportunidades where idtel='+
         sqlorigen.fieldbyname('idtel').asstring,0,sqlorigen2);
         if sqlorigen2.fieldbyname('idoportunidad').AsInteger>0 then
            querysyn('update oportunidades set idtel='+idtel+' where idoportunidad='+
            sqlorigen2.fieldbyname('idoportunidad').asstring,1,sqldestino);
         sqlorigen.Next;
         if temp<>sqlorigen.fieldbyname('idtel').asstring then
            idtel:=inttostr(strtoint(idtel)+1);
      end;
   end;
   frmprogreso.barra.Percent:=frmprogreso.barra.Percent+1;

   //contactos
   querysyn('select max(idcontacto)+1 as m from contactos',0,sqldestino);
   idcontacto:=sqldestino.fieldbyname('m').asstring;
   if querysyn('select * from contactos where Sincronizado=1',0,sqlorigen)>0 then
   begin
      sqlorigen.First;
      while not sqlorigen.Eof do
      begin
         temp:=sqlorigen.fieldbyname('idcontacto').AsString;
         insertaContacto(sqlorigen.fieldbyname('idcontacto').asstring,idcontacto);
         InsertaLog(sqlorigen.fieldbyname('idcontacto').asstring,idcontacto,'contactos');
         if sqlorigen.fieldbyname('procedencia').asstring='oportunidades' then
         begin
            querysyn('select idoportunidad,idcontacto from oportunidades where idcontacto='+
            sqlorigen.fieldbyname('idcontacto').asstring,0,sqlorigen2);
            if sqlorigen2.fieldbyname('idoportunidad').AsInteger>0 then
               querysyn('update oportunidades set idcontacto='+idcontacto+' where idoportunidad='+
               sqlorigen2.fieldbyname('idoportunidad').asstring,1,sqldestino);
            querysyn('select max(idtel)+1 as idtel from telefonos',0,sqldestino);
            idtel:=sqldestino.fieldbyname('idtel').AsString;
            insertaTelefono(sqlorigen.fieldbyname('idtel').asstring,idtel);
            insertalog(sqlorigen.fieldbyname('idtel').asstring,idtel,'telefonos');
            querysyn('update contactos set idtel='+idtel+' where idcontacto ="'+sqlorigen.fieldbyname('idcontacto').AsString+'" and nombre="'+sqlorigen.fieldbyname('nombre').asstring+'"',1,sqldestino);
         end;
         if sqlorigen.fieldbyname('procedencia').asstring='oportunidades/usuarios' then
         begin
            if querysyn('select idoportunidad from oportunidades where idusuario='+sqlorigen.fieldbyname('idcontacto').asstring,0,sqlorigen2)>0 then
               querysyn('update oportunidades set idusuario='+idcontacto+' where idoportunidad='+sqlorigen2.fieldbyname('idoportunidad').asstring,1,sqldestino);
         end;
         sqlorigen.Next;
         if temp<>sqlorigen.FieldByName('idcontacto').AsString then
            idcontacto:=inttostr(strtoint(idcontacto)+1);
      end;
   end;
      frmprogreso.barra.Percent:=frmprogreso.barra.Percent+1;
end;

procedure TDMSincronizar.insertar(query,tabla,campo,id:string);
var cadena,campos,valores,temporal:string; x:integer;
begin
    cadena:=''; campos:=''; valores:='';
    temporal:='';
    // Nombre de los campos  de la tabla origen ///
    querysyn('describe '+tabla,0,sqlgeneral);
    // Valores de los campos de la tabla origen///
    querysyn(query,0,sqlorigen3);
    sqlorigen3.First;
    // ciclo para el recorrido de los registros
    while not sqlorigen3.Eof do
    begin
       cadena:=''; campos:=''; valores:='';  x:=0;
       sqlgeneral.First;
       //ciclo para el recorrido de los campos
       while not sqlgeneral.Eof do
       begin
          if not (sqlorigen3.Fields.Fields[x].IsNull) and (sqlgeneral.fieldbyname('Field').AsString<>'Sincronizado') then
          begin
             if (sqlgeneral.fieldbyname('Key').AsString<>'PRI') or (sqlgeneral.fieldbyname('Extra').AsString<>'auto_increment') then
               campos:=campos+','+sqlgeneral.fieldbyname('Field').AsString;
             if (campo=sqlgeneral.fieldbyname('Field').AsString) or (sqlgeneral.fieldbyname('Key').AsString='PRI') then
             begin
               if (sqlgeneral.fieldbyname('Key').AsString<>'PRI') or (sqlgeneral.fieldbyname('Extra').AsString<>'auto_increment') then
                  valores:=valores+','+id;
             end
             else if sqlgeneral.FieldByName('Type').AsString='time' then
             begin
                temporal:=HoraLarga(strtotime(sqlorigen3.Fields.Fields[x].AsString));
                valores:=valores+','+QuotedStr(temporal);
             end
             else if (sqlgeneral.FieldByName('Type').AsString='date') and (sqlorigen3.Fields.Fields[x].AsString='0') then
                  valores:=valores+',"0000-00-00"'
             else if sqlgeneral.FieldByName('Type').AsString='tinyint(1)' then
             begin
               temporal:=inttostr(BooltoInt(sqlorigen3.Fields.Fields[x].AsBoolean));
               valores:=valores+','+QuotedStr(temporal);
             end
             else
             begin
               valores:=valores+','+QuotedStr(quitarC(sqlorigen3.Fields.Fields[x].AsString));
             end;
          end;
          sqlgeneral.Next;
          inc(x);
       end;
       Delete(campos,1,1);
       delete(valores,1,1);
       cadena:='insert into '+tabla+' ('+campos+') values ('+valores+')';
       querysyn(cadena,1,sqldestino);
       sqlorigen3.Next;
       //inc(llave);
    end;
end;

procedure TDMSincronizar.insertaTelefono(idorigen,iddestino:string);
begin
   if querysyn('select idtel from telefonos where idtel='+idorigen+' and Sincronizado=1',0,sqlorigen1)>0 then
   begin
       insertar('select * from telefonos where idtel='+sqlorigen1.fieldbyname('idtel').asstring+
                ' and Sincronizado=1','telefonos','idtel',iddestino);
       querysyn('update telefonos set Sincronizado=0 where idtel='+idorigen,1,sqlgeneral);
   end;
end;

procedure TDMSincronizar.insertaFact(idorigen,iddestino:string);
begin
   if querysyn('select idfact from OportunidadesFact where idfact='+idorigen+' and Sincronizado=1',0,sqlorigen1)>0 then
   begin
      insertar('select * from OportunidadesFact where idfact='+sqlorigen1.fieldbyname('idfact').AsString,'OportunidadesFact','idfact',iddestino);
      querysyn('update OportunidadesFact set Sincronizado=0 where idfact='+idorigen,1,sqlgeneral);
   end;
end;

procedure TDMSincronizar.insertaContacto(idorigen,iddestino:string);
begin
   if querysyn('select idcontacto from contactos where idcontacto='+idorigen+' and Sincronizado=1',0,sqlorigen1)>0 then
      begin
         insertar('select * from contactos where idcontacto='+sqlorigen1.fieldbyname('idcontacto').AsString+' and Sincronizado=1','contactos','idcontacto',iddestino);
         querysyn('update contactos set Sincronizado=0 where idcontacto='+idorigen,1,sqlgeneral);
   end;
end;

procedure TDMSincronizar.insertaAgenda(idorigen,iddestino:string);
var temp:string;
begin
   if querysyn('select idevento,idoportunidad from agenda_vendedores where idoportunidad='+idorigen+
   ' and (Sincronizado=1 or Sincronizado=2)',0,sqlorigen1)>0 then
   begin
      sqlorigen1.First;
      while not sqlorigen1.eof do
      begin
         insertar('select * from agenda_vendedores where idoportunidad='+
         sqlorigen1.fieldbyname('idoportunidad').asstring,'agenda_vendedores','idoportunidad',iddestino);
         querysyn('delete from agenda_vendedores where idoportunidad='+idorigen+' and idevento='+
         sqlorigen1.fieldbyname('idevento').asstring,1,sqlgeneral);
         if querysyn('select idevento from actividades_vendedores where idevento='+
         sqlorigen1.fieldbyname('idevento').asstring+' and Sincronizado=1',0,sqlorigen2)>0 then
         begin
            querysyn('select max(idevento) as m from agenda_vendedores',0,sqldestino);
            temp:=sqldestino.fieldbyname('m').AsString;
            insertaActividad(sqlorigen1.fieldbyname('idevento').asstring,temp);
            InsertaLog(sqlorigen1.fieldbyname('idevento').AsString,temp,'agenda_vendedores');
         end;
         iddestino:=inttostr(strtoint(iddestino)+1);
         sqlorigen1.Next;
      end;
   end;
end;

procedure TDMSincronizar.insertaActividad(idorigen,iddestino:string);
var temp:string;
begin
   if querysyn('select idactividades from actividades_vendedores where idevento='+idorigen+' and Sincronizado=1',0,sqlorigen2)>0 then
   begin
      sqlorigen2.first;
      while not sqlorigen2.eof do
      begin
         querysyn('select max(idactividades)+1 as id from actividades_vendedores',0,sqldestino1);
         temp:=sqldestino1.fieldbyname('id').asstring;
         insertar('select * from actividades_vendedores where idactividades='+
         sqlorigen2.fieldbyname('idactividades').asstring+' and Sincronizado=1','actividades_vendedores','idactividades',temp);
         insertalog(sqlorigen2.fieldbyname('idactividades').asstring,temp,'Actividades Vendedores');
         //actualizar el idevento en el server
         querysyn('update actividades_vendedores set idevento='+iddestino+' where idactividades='+temp,1,sqldestino1);
         querysyn('delete from actividades_vendedores where idactividades='+
         sqlorigen2.fieldbyname('idactividades').asstring,1,sqlorigen3);
         sqlorigen2.next;
      end;
      //querysyn('update actividades_vendedores set Sincronizado=0 where idevento='+idorigen,1,sqlgeneral);
   end;
end;

procedure TDMSincronizar.insertarnota(idorigen,iddestino:string);
begin
   insertar('select * from notasseg where idnota='+idorigen+' and sincronizado=1','notasseg','idnota',iddestino);
   querysyn('update notasseg set sincronizado=0 where idnota='+idorigen,1,sqlgeneral);
end;

procedure TDMSincronizar.insertaPresupuesto(idorigen,idpre,idopo:string);
begin
   if querysyn('select idoportunidad,idpresupuesto from presupuestos2 where idoportunidad='+idorigen+' and Sincronizado=1',0,sqlorigen1)>0 then
   begin
      sqlorigen1.First;
      while not sqlorigen1.Eof do
      begin
         insertar('select * from presupuestos2 where idpresupuesto='+
         sqlorigen1.fieldbyname('idpresupuesto').asstring,'presupuestos2','idpresupuesto',idpre);
         //querysyn('update presupuestos2 set idoportunidad='+idopo+' where idpresupuesto='+idpre,1,sqldestino);
         querysyn('delete from presupuestos2 where idpresupuesto='+sqlorigen1.fieldbyname('idpresupuesto').asstring,1,sqlgeneral);
         insertaDetpre(sqlorigen1.fieldbyname('idpresupuesto').AsString,idpre);
         insertaPed(sqlorigen1.fieldbyname('idpresupuesto').AsString,idpre,idopo);
         querysyn('update presupuestos2 set idoportunidad='+idopo+' where idpresupuesto='+idpre,1,sqldestino);
         sqlorigen1.Next;
      end;
   end;
end;

procedure TDMSincronizar.insertaDetpre(idorigen,iddestino:string);
begin
   if querysyn('select idpresupuesto from DetPresupuestos2 where idpresupuesto='+idorigen+' and Sincronizado=1',0,sqlorigen2)>0 then
   begin
      insertar('select * from DetPresupuestos2 where idpresupuesto='+sqlorigen2.fieldbyname('idpresupuesto').asstring,'DetPresupuestos2','idpresupuesto',iddestino);
      querysyn('update DetPresupuestos2 set Sincronizado=0 where idpresupuesto='+idorigen,1,sqlgeneral);
   end;
end;

procedure TDMSincronizar.insertaPed(idorigen,idpre,idopo:string);
var idped:string;
begin
   if querysyn('select idpedido from pedidos where idpresupuesto='+idorigen+' and Sincronizado=1',0,sqlorigen2)>0 then
   begin
      sqlorigen2.first;
      while not sqlorigen2.eof do
      begin
         querysyn('select max(idpedido)+1 as idpedido from pedidos',0,sqldestino);
         idped:=sqldestino.fieldbyname('idpedido').asstring;
         insertar('select * from pedidos where idpedido='+sqlorigen2.fieldbyname('idpedido').asstring,'pedidos','idpedido',idped);
         querysyn('update pedidos set Sincronizado=2 where idpedido='+sqlorigen2.fieldbyname('idpedido').asstring,1,sqlorigen3);
         querysyn('update pedidos set idpresupuesto='+idpre+', idoportunidad='+idopo+' where idpedido='+idped,1,sqldestino);
         insertaDetped(sqlorigen2.fieldbyname('idpedido').AsString,idped);
         sqlorigen2.Next;
      end;
   end;
end;

procedure TDMSincronizar.insertaDetped(idorigen,iddestino:string);
begin
   if querysyn('select idpedido,cod_cve,cant,piezas from DetPedido where idpedido='+idorigen+' and Sincronizado=1',0,sqlorigen4)>0 then
   begin
      sqlorigen4.First;
      querysyn('delete from DetPedidoTemp where idmaq='+frmprincipal.idmaq,1,dmreportes.sqlgeneral);
      while not sqlorigen4.Eof do
      begin
         agregararticulo(idorigen,iddestino,sqlorigen4.fieldbyname('cod_cve').AsString,sqlorigen4.fieldbyname('cant').AsString,sqlorigen4.fieldbyname('piezas').AsString);
         sqlorigen4.Next;
      end;
      querysyn('insert into DetPedido(cant,piezas,cod_cve,utilidad,idpedido,paquete,surtido,idrequisicion,'+
             'idCardexArt,costo,tc,usuario,fecha,hora) select cant,piezas,cod_cve,utilidad,idpedido,paquete,'+
             'surtido,idrequisicion,idCardexArt,costo,tc,usuario,fecha,hora from DetPedidoTemp where idmaq='+frmprincipal.idmaq,1,sqldestino);
   end;
end;

procedure TDMSincronizar.importartablas;
var cadena,usuario,idvendedor,codigo:string; x:integer;p:double;
      grupo2,inicio:array of string;
begin
   idvendedor:=inttostr(frmprincipal.ucprincipal.CurrentUser.UserID);
   querysyn('select codigo from usuarios where idusuario='+idvendedor,0,dmreportes.sqlgeneral);
   codigo:=dmreportes.sqlgeneral.fieldbyname('codigo').asstring;
   usuario:=frmprincipal.ucprincipal.CurrentUser.LoginName;
   querysyn('select * from tablaslaptop where importar=1',0,sqldestino1);
   SetLength(grupo2,sqldestino1.RecordCount);
   SetLength(inicio,sqldestino1.RecordCount);
   p:=25/sqldestino1.RecordCount;
   for x:=1  to sqldestino1.RecordCount do
   begin
      case x of
         1,2,3,4,5,6,10:
         begin
            inicio[x-1]:='select * from ';
            grupo2[x-1]:='';
         end;
         7,8,11:
         begin
            inicio[x-1]:='select * from ';
            grupo2[x-1]:=' where idvendedor='+QuotedStr(idvendedor);
         end;
         9:
         begin
            inicio[x-1]:='select o.* from ';
            grupo2[x-1]:=' o left join agenda_vendedores ag using(idoportunidad) where o.codvendedor='+QuotedStr(codigo)+
                         ' or ag.idvendedor='+QuotedStr(idvendedor);
         end;
         12:
         begin
            inicio[x-1]:='select det.* from ';
            grupo2[x-1]:=' det inner join presupuestos2 p using(idpresupuesto) where p.idvendedor='+QuotedStr(idvendedor);
         end;
         13:
         begin
            inicio[x-1]:='select * from ';
            grupo2[x-1]:=' where idusuario='+QuotedStr(idvendedor);
         end
         else
         begin
            inicio[x-1]:='select * from ';
            grupo2[x-1]:='';
         end;
      end;
   end;
   x:=1;
   while not sqldestino1.Eof do
   begin
      if FileExists(GetConfiguraciones('pathserver',true)+sqldestino1.fieldbyname('tabla').asstring+frmprincipal.idmaq+'.txt') then
      //if FileExists('\\10.0.0.200\sistemas\'+sqldestino1.fieldbyname('tabla').asstring+frmprincipal.idmaq+'.txt') then
         DeleteFile(pchar(GetConfiguraciones('pathserver',true)+sqldestino1.fieldbyname('tabla').asstring+frmprincipal.idmaq+'.txt'));
      //cadena
      if (sqldestino1.fieldbyname('tabla').asstring<>'telefonos') or (sqldestino1.fieldbyname('tabla').asstring<>'contactos') then
         cadena:= inicio[x-1]+sqldestino1.fieldbyname('tabla').asstring+grupo2[x-1]+' INTO OUTFILE "/home/sistemas/'+
                  sqldestino1.fieldbyname('tabla').asstring+frmprincipal.idmaq+'.txt" FIELDS TERMINATED BY ";" '+
                  'OPTIONALLY ENCLOSED BY "\'+#39+'" LINES TERMINATED BY "\n\r"'
      else if (sqldestino1.fieldbyname('tabla').asstring='telefonos') then
         cadena:= 'select t.* from telefonos t left join clientes c on c.idtel=t.idtel left join oportunidades o on o.idtel=t.idtel'+
                  ' left join agenda_vendedores ag on o.idoportunidad=ag.idoportunidad left join estatus_eventos ev on ev.idestatus=ag.idestatus'+
                  ' where c.estatus=1 and ev.finaliza="NO" union select t.* from telefonos t left join contactos con on con.idtel=t.idtel'+
                  ' left join clientes c on c.idcontacto=con.idcontacto where c.estatus=1 INTO OUTFILE "/home/sistemas/'+
                  sqldestino1.fieldbyname('tabla').asstring+frmprincipal.idmaq+'.txt" FIELDS TERMINATED BY ";" '+
                  'OPTIONALLY ENCLOSED BY "\'+#39+'" LINES TERMINATED BY "\n\r"'
      else
         cadena:= 'select * from contactos con left join clientes c using(idcontacto) left join oportunidades o on o.idcontacto=con.idcontacto'+
                  ' left join agenda_vendedores ag on o.idoportunidad=ag.idoportunidad left join estatus_eventos ev on ev.idestatus=ag.idestatus'+
                  ' where c.estatus=1 and ev.finaliza="NO" INTO OUTFILE "/home/sistemas/'+sqldestino1.fieldbyname('tabla').asstring+frmprincipal.idmaq+'.txt" FIELDS TERMINATED BY ";" '+
                  'OPTIONALLY ENCLOSED BY "\'+#39+'" LINES TERMINATED BY "\n\r"';
      sqldestino.Close;
      sqldestino.SQL.Clear;
      sqldestino.SQL.Add(cadena);
      ClipBoard.SetTextBuf(PChar(cadena));
      try
         sqldestino.execute;
      except
         raise myexception.Create('El Archivo '+sqldestino1.fieldbyname('tabla').asstring+'.txt ya existe en el servidor...');
      end;
      if DirectoryExists(ExtractFilePath(Application.ExeName)+'/Tablas') then
      begin
         //copiar el archivo del server al localhost
        { if NOT CopyFile(PChar(GetConfiguraciones('pathserver',true)+sqldestino1.fieldbyname('tabla').asstring+frmprincipal.idmaq+
         '.txt'),PChar(GetConfiguraciones('pathlocal',true)+'Tablas/'+sqldestino1.fieldbyname('tabla').asstring+
         AnsiReplaceStr(datetostr(date),'/','')+'.txt'),FALSE) then
         begin
            raise myexception.Create('No se copio el Archivo '+sqldestino1.fieldbyname('tabla').asstring+'.txt');
         end;}
         CopiaTodo(GetConfiguraciones('pathserver',true)+sqldestino1.fieldbyname('tabla').asstring+frmprincipal.idmaq+'.txt',
         ExtractFilePath(Application.ExeName)+'/Tablas/'+sqldestino1.fieldbyname('tabla').asstring+AnsiReplaceStr(datetostr(date),'/','')+'.txt');
         //borrar archivo del server
         if FileExists(GetConfiguraciones('pathserver',true)+sqldestino1.fieldbyname('tabla').asstring+frmprincipal.idmaq+'.txt') then
            DeleteFile(pchar(GetConfiguraciones('pathserver',true)+sqldestino1.fieldbyname('tabla').asstring+frmprincipal.idmaq+'.txt'));
      end
      else
      begin
         CreateDir(ExtractFilePath(Application.ExeName)+'/Tablas');
         if DirectoryExists(ExtractFilePath(Application.ExeName)+'/Tablas') then
            if NOT CopyFile(PChar(GetConfiguraciones('pathserver',true)+sqldestino1.fieldbyname('tabla').asstring+
            frmprincipal.idmaq+'.txt'),PChar(ExtractFilePath(Application.ExeName)+'/Tablas/'+sqldestino1.fieldbyname('tabla').asstring+
            AnsiReplaceStr(datetostr(date),'/','')+'.txt'),FALSE) then
            begin
               raise myexception.Create('No se Creo el folder TABLAS....');
            end;
      end;
      frmprogreso.barra.Percent:=frmprogreso.barra.Percent+ceil(p);
      sqldestino1.Next;
      inc(x);
   end;
   p:=45/sqldestino1.RecordCount;
   sqldestino1.First;
   while not sqldestino1.Eof do
   begin
      querysyn('delete from '+sqldestino1.fieldbyname('tabla').asstring,1,sqlorigen);
      if DirectoryExists(ExtractFilePath(Application.ExeName)+'/Tablas') then
      begin
         cadena:='LOAD DATA INFILE "'+ExtractFilePath(Application.ExeName)+'Tablas/'+sqldestino1.fieldbyname('tabla').asstring+
         AnsiReplaceStr(datetostr(date),'/','')+'.txt" INTO TABLE '+sqldestino1.fieldbyname('tabla').asstring+' FIELDS TERMINATED BY ";" ';
         cadena:=AnsiReplaceStr(cadena,'\','/');
         cadena:=cadena+' OPTIONALLY ENCLOSED BY "\'+#39+'" LINES TERMINATED BY "\n\r"';
      end
      else
      begin
         raise myexception.Create('No se Creo el folder TABLAS....');
      end;
         //MessageDlg('No se Creo el folder TABLAS', mtWarning, [mbOk], 0);
      sqlorigen.Close;
      sqlorigen.SQL.Clear;
      sqlorigen.SQL.Add(cadena);
      ClipBoard.SetTextBuf(PChar(cadena));
      sqlorigen.execute;
      if FileExists(GetConfiguraciones('pathserver',true)+sqldestino1.fieldbyname('tabla').asstring+frmprincipal.idmaq+'.txt') then
         DeleteFile(pchar(GetConfiguraciones('pathserver',true)+sqldestino1.fieldbyname('tabla').asstring+frmprincipal.idmaq+'.txt'));
      frmprogreso.barra.Percent:=frmprogreso.barra.Percent+Floor(p);
      sqldestino1.Next;
   end;
end;

procedure TDMSincronizar.agregararticulo(idorigen,idpedido,articulo,cantidad,piezas:string);
var cant,pzs,pzsxunidad,temp,valor,idcardexart,idrequi:integer;      //unipzs
    servicio, inventariable : boolean;
begin
   inventariable := false;
   if articulo<> '' then
   begin
      cant:=0;pzs:=0;temp:=0;idcardexart:=0;servicio := false; idrequi := 0;
      querysyn('select articulos.*,usuarios.PrecioCapturable as pc from articulos,usuarios where cod_cve='+
      quotedstr(articulo)+' and usuarios.idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,dmreportes.sqlgeneral);
      pzsxunidad:=dmreportes.sqlgeneral.fieldbyname('piezasxunidad').AsInteger;
      if dmreportes.sqlgeneral.FieldByName('servicio').AsInteger = 1 then
         servicio := true;
      if dmreportes.sqlgeneral.FieldByName('inventariable').AsInteger = 1 then
         inventariable := true;
      //valor := 0;
      if servicio then
         valor := 0
      else
         valor := ValidaExistencias(articulo,strtoint(cantidad),strtoint(piezas));
      if strtoint(piezas)>0 then
      begin
         pzs:=strtoint(piezas);
         //unipzs:=1;
      end
      else
      begin
         cant:=strtoint(cantidad);
         //unipzs:=0;
      end;
      if valor <> 0  then
      begin
         if (valor < 0) and (pzsxunidad>1) and ((cant div pzsxunidad)=0) and (temp=0) then//MOVIDO dalila
         begin
            pzs:=abs(valor); cant:=0;
         end;
         if temp = 0 then
            VendeConBackOrder(idpedido,articulo,cant,pzs);
         InsertaArticulo(idorigen,idpedido,'DetPedidoTemp','idmaq',frmprincipal.idmaq,articulo,strtoint(cantidad),idrequi,idCardexArt);
         querysyn('insert into CardexArt(cod_cve,movimiento,idmovi,FechaMov,iddoc,cant,piezas,usuario,HoraMov, descripcion) values ("'+
                articulo+'", "S",14,"'+datetostr(date)+'", '+idpedido+','+inttostr(cant)+','+inttostr(pzs)+
                ',"'+frmprincipal.ucprincipal.CurrentUser.LoginName+'","'+FormatDateTime('HH:mm:ss',Time)+
                '", "Apartado por Venta")',1,dmreportes.sqlgeneral);
      end
      else
      begin
         if (inventariable=true) and (servicio=false) then
         begin
            //trae el indice del concepto VENTAS para insertar la cancelacion de los articulos
            querysyn('select idmovi from TipoMov where nombre="VENTAS"',0,dmreportes.sqlgeneral);
            idcardexart:=dmreportes.sqlgeneral.Fields.Fields[0].Asinteger;
         end;
         if (servicio = false) then
         begin
            //inserta en el cardex la salida
            querysyn('select costo from articulos where cod_cve="'+articulo+'"',0,dmreportes.sqlgeneral7);                                                                                                                                                                                                   //inttostr(pzs+(cant * pzsxunidad))
            querysyn('insert into CardexArt(cod_cve,movimiento,idmovi,FechaMov,iddoc,cant,piezas,usuario,HoraMov, descripcion) values ("'+
                   articulo+'", "S",'+inttostr(idcardexart)+',"'+datetostr(date)+'",'+
                   idpedido+','+inttostr(cant)+','+inttostr(pzs)+',"'+frmprincipal.ucprincipal.CurrentUser.LoginName+
                   '","'+FormatDateTime('HH:mm:ss',Time)+'", "Apartado por Venta")',1,dmreportes.sqlgeneral);
         end;
         InsertaArticulo(idorigen,idpedido,'DetPedidoTemp','idmaq',frmprincipal.idmaq,articulo,strtoint(cantidad),0,0)
      end;
   end;
end;

function TDMSincronizar.ValidaExistencias(CodCve:string;cantidad,piezas:integer):integer;
var
c,p,pxu,ex,dif:integer;
begin
   result := 0;
   p:=0; c:=0;
   if piezas>0 then
      p:=piezas
   else
      c:=cantidad;
   //aqui busca el articulo por codigo de barras o por clave
   querysyn('select cod_cve, existencia, servicio, '+
       // 'nombre, precio'+lowercase(cboutilidad.Text)+', desc_esp, tinstalacion, '
       'paquete, piezasxunidad from articulos where cod_cve= "'+CodCve+ '" or cod_barras="'+CodCve+'"',0,dmreportes.sqlgeneral);
   //Si no es servicio ni paquete
   if (dmreportes.sqlgeneral.FieldByName('servicio').AsInteger = 0) and
      (dmreportes.sqlgeneral.FieldByName('paquete').AsInteger = 0) then
   begin
      ex := dmreportes.sqlgeneral.FieldByName('existencia').AsInteger;
      pxu:= dmreportes.sqlgeneral.FieldByName('piezasxunidad').AsInteger;
      if ex <> 0 then
      begin
         if piezas>0 then
         begin
            if dmreportes.sqlgeneral.FieldByName('piezasxunidad').AsInteger = 1 then
            begin
               result := ex - p ;
               exit;
            end;
         end;
         dif := ( ex - p - ( c * pxu ) );
         if dif < 0 then
         begin
            if pxu > 1 then
               result:=dif*pxu
            else
               result:=(dif div pxu);
         end
         else
         begin
            if dif >= 0 then
            begin
               result:=0;
               exit;
            end
            else
               if piezas>0 then
                  result:=cantidad*(-1)
               else
                  result:=cantidad*(-1)*pxu;
         end;
      end
      else
         if piezas>0 then
            result:=p*(-1)
         else
            result:=c*(-1)*pxu;
   end;
end;


procedure TDMSincronizar.VendeConBackOrder(idpedido,art:string;cant,pzs:integer);
  var unipzs,dif,existencias,pzsxunidad,id:integer;  idrequi,idmovi:string;
begin
   querysyn('select id from DetPedidoTemp where idpedido='+idpedido+' and cod_cve='+QuotedStr(art),0,dmreportes.sqlgeneral);
   id:=dmreportes.sqlgeneral.fieldbyname('id').AsInteger;
   if pzs > 0 then
      unipzs := 1
   else
      unipzs := 0;
   querysyn('select apartado,ordenados,existencia,piezasxunidad,backorder from articulos where cod_cve='+quotedstr(art),0,dmreportes.sqlgeneral);
   existencias := dmreportes.sqlgeneral.fieldbyname('existencia').AsInteger;
   pzsxunidad := dmreportes.sqlgeneral.fieldbyname('piezasXunidad').AsInteger;
   dif := existencias - ((cant*pzsxunidad) + pzs);
   if dif < 0 then
   begin
      querysyn('update pedidos set NotaInst=concat(if(NotaInst is null,"",NotaInst),'+
      '" Vendio con BackOrder el articulo: '+art+'") where idpedido='+idpedido,1,dmreportes.sqlgeneral);
      querysyn('select max(idrequisicion) from requisiciones',0,dmreportes.sqlgeneral);
      idrequi:=inttostr(dmreportes.sqlgeneral.Fields.Fields[0].Asinteger+1);
      //Trae el idmovi de TipoMov
      querysyn('select idmovi from TipoMov where nombre = "PEDIDOS"',0,dmreportes.sqlgeneral);
      idmovi := inttostr(dmreportes.sqlgeneral.Fields.Fields[0].Asinteger);
      if existencias = 0 then
      begin
         //inserta en la tabla de requisiciones
         querysyn('insert into requisiciones (idrequisicion,fecha,hora,usuario,cod_cve,cantidad,idmovi,idmaq,piezas) values ('+
                 idrequi+',"'+datetostr(date)+'","'+FormatDateTime('HH:mm:ss',Time)+'","'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+
                '","'+art+'",'+inttostr(((cant*pzsxunidad)+pzs)-existencias)+','+idmovi+','+frmprincipal.idmaq+','+floattostr(unipzs)+')',1,dmreportes.sqlgeneral);
         querysyn('update articulos set backorder=backorder+'+inttostr((cant*pzsxunidad)+pzs)+' where cod_cve='+quotedstr(art),1,dmreportes.sqlgeneral);
         querysyn('delete from DetPedidoTemp where id='+inttostr(id),1,dmreportes.sqlgeneral);
      end
      else
      begin
         querysyn('update articulos set existencia=0, backorder=backorder+('+inttostr(abs(dif))+') where cod_cve='+quotedstr(art),1,dmreportes.sqlgeneral);
         //inserta en la tabla de requisiciones
         querysyn('insert into requisiciones (idrequisicion,fecha,hora,usuario,cod_cve,cantidad,idmaq,idmovi,piezas) values ('+
               idrequi+',"'+datetostr(date)+'","'+FormatDateTime('HH:mm:ss',Time)+'","'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+
               '",'+quotedstr(art)+','+inttostr(((cant*pzsxunidad)+pzs)-existencias)+','+frmprincipal.idmaq+','+idmovi+','+floattostr(unipzs)+')',1,dmreportes.sqlgeneral);
         //actualiza el articulo actual de DetPedidoTemp pone la cantidad que tenemos en existencia
         if cant>0 then
            querysyn('update DetPedidoTemp set cant='+inttostr(existencias div pzsxunidad)+',surtido=1 where id='+inttostr(id),1,dmreportes.sqlgeneral)
         else
            querysyn('update DetPedidoTemp set piezas='+inttostr(existencias)+',surtido=1 where id='+inttostr(id),1,dmreportes.sqlgeneral)
      end;
   end;
   querysyn('select idmovi from TipoMov where nombre = "VTA/SIN/EXIST"',0,dmreportes.sqlgeneral);
   idmovi:=dmreportes.sqlgeneral.Fields.Fields[0].AsString;
   querysyn('insert into CardexArt (cod_cve,movimiento,idmovi,FechaMov,iddoc,cant,costo,usuario,HoraMov, descripcion) '+
          'values ("'+art+'","E",'+idmovi+',"'+datetostr(date)+'",'+idpedido+','+inttostr(abs(dif))+',0, "'+frmprincipal.ucprincipal.CurrentUser.LoginName+
          '","'+FormatDateTime('HH:mm:ss',Time)+'", "Backorder por venta sin existencia")',1,dmreportes.sqlgeneral);
end;

procedure TDMSincronizar.InsertaArticulo(idorigen,idpedido,tabla,campo,valor,cod_cve:string;cantidad,requisicion,idCardexArt:integer);
var descu,costo,tc,utilidad,pzs:string; pzsxunidad,cant,piezas, cant2:integer;
begin
   cant:=0;
   piezas:=0;
   if cantidad=0 then
      piezas:=cantidad
   else
      cant:=cantidad;
   descu:='0';
   querysyn('select articulos.inventariable,articulos.piezasxunidad,articulos.PrecioCapturable,'+
   'articulos.servicio,articulos.moneda,usuarios.PrecioCapturable as pc from articulos,usuarios where cod_cve='+
   quotedstr(cod_cve)+' and usuarios.idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,dmreportes.sqlgeneral);
   pzsxunidad := dmreportes.sqlgeneral.fieldbyname('piezasxunidad').AsInteger;
   //esto es por si son pesos se ocupa que el tc sea 1
   if dmreportes.sqlgeneral.fieldbyname('moneda').asstring = 'P' then
      tc := '1'
   else
   begin
      querysyn('select tipocambio from pedidos where idpedido='+idpedido,0,dmreportes.sqlgeneral2);
      tc := dmreportes.sqlgeneral2.fieldbyname('tipocambio').asstring;
   end;
   //trae el costo,piezas y utilidad del articulo en Detpedido local
   querysyn('select costo,utilidad,piezas from DetPedido where cod_cve="'+cod_cve+'" and idpedido='+idorigen,0,sqlgeneral);
   costo := sqlgeneral.fieldbyname('costo').asstring;
   utilidad:=sqlgeneral.fieldbyname('utilidad').asstring;
   pzs:=sqlgeneral.fieldbyname('piezas').asstring;
   //inserta los datos del articulo en DetPedidoTemp
   querysyn('insert into '+tabla+'(idpedido,cant,piezas,cod_cve,utilidad,'+campo+',idrequisicion,idCardexArt,costo,tc,'+
          'usuario,fecha,hora, estatus) values ('+idpedido+','+floattostr(cant)+','+floattostr(piezas)+','+
          quotedstr(cod_cve)+','+quotedstr(utilidad)+','+valor+','+inttostr(requisicion)+','+
          inttostr(idCardexArt)+','+costo+','+tc+','+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+
          ','+quotedstr(datetostr(date))+','+quotedstr(FormatDateTime('HH:mm:ss',Time))+', 1)',1,dmreportes.sqlgeneral);
   querysyn('delete from '+tabla+' where cant<=0 and piezas<=0',1,dmreportes.sqlgeneral);
   cant2 := ValidaExistencias(cod_cve, cant,strtoint(pzs));
   if cant2 = 0 then
      querysyn('update articulos set apartado=apartado+'+inttostr((cant*pzsxunidad)+piezas)+', existencia = existencia-'+inttostr((cant*pzsxunidad)+piezas)+' where cod_cve="'+cod_cve+'"',1,dmreportes.sqlgeneral)
   else
      querysyn('update articulos set apartado=apartado+'+inttostr((cant*pzsxunidad)+piezas)+', existencia = 0 where cod_cve="'+cod_cve+'"',1,dmreportes.sqlgeneral);
end;

procedure TDMSincronizar.apartarcuentas;
var idvendedor,apartadas,cont,cta:integer; p:double;
begin
   querysyn('select valor from configuraciones where concepto="CuentasApartadas"',0,dmreportes.sqlgeneral);
   apartadas:=dmreportes.sqlgeneral.fieldbyname('valor').AsInteger;
   idvendedor:= frmprincipal.ucprincipal.CurrentUser.UserID;
   if querysyn('select count(*) as cant from clientes where estatus=3 and idvendedor='+inttostr(idvendedor),0,dmreportes.sqlgeneral)>0 then
      apartadas:= apartadas - dmreportes.sqlgeneral.fieldbyname('cant').AsInteger;
   //showmessage('Faltan: '+inttostr(faltan));
   if apartadas>0 then
   begin
      p:=10/apartadas;
      for cont:=1 to apartadas do
      begin
         cta:= CuentaLibre;
         frmprogreso.barra.Percent:=frmprogreso.barra.Percent+ceil(p);
         querysyn('insert into clientes (idcliente,idvendedor,estatus,Sincronizado) VALUES ('+inttostr(cta)+
             ','+inttostr(idvendedor)+',3,0)',1,dmreportes.sqlgeneral);
      end;
   end;
end;

procedure TDMSincronizar.InsertaLog(idlocal, idservidor,tabla:string);
var sqlgeneral :TMyQuery;
begin
sqlgeneral := TMyQuery.Create(nil);
sqlgeneral.Connection := dmaccesos.conexion;
querysyn('Insert into LogSincronizacion (idvendedor, tabla, idlocal, idservidor, fecha, hora) values '+
       '('+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+', "'+tabla+'", '+idlocal+', '+idservidor+
       ', "'+datetostr(date)+'", "'+FormatDateTime('HH:mm:ss',Time)+'")', 1, sqlgeneral);
sqlgeneral.Free;
end;

function TDMSincronizar.querysyn(const consulta:string;const actualizacion:integer;Query:TMyQuery):integer;
var c : string;
begin
   c:=AnsiReplaceStr(consulta,'\','');
   ClipBoard.SetTextBuf(PChar(c));
   with query do
   begin
      //trae todos los nombres de la tabla especificada
      close;
      sql.Clear;
      sql.Add(c);
      if actualizacion = 0 then
      begin
        open;
        result := recordcount;
      end
      else
      begin
        execute;
        result := RowsAffected;
      end;
   end;
end;

function TDMSincronizar.quitarC(cadena:string):string;
//var temp:string;
begin
   cadena:=AnsiReplaceStr(cadena,#39,'');
   cadena:=AnsiReplaceStr(cadena,#34,'');
   result:=AnsiReplaceStr(cadena,'\','');
end;

procedure TDMSincronizar.actualizarlaptop;
begin
   lanzador.StartDir:=GetConfiguraciones('PathActualizar',true);
   lanzador.FileName:='Actualizasys.exe';
   lanzador.Launch;
   Sleep(60000);
end;

procedure TDMSincronizar.createmporales;
var x:integer;
{const grupo:array[1..10] of string =('contactos','telefonos','actividades_vendedores','agenda_vendedores',
'oportunidades','OportunidadesFact','presupuestos2','DetPresupuestos2','DetPedido','pedidos');}
begin
   borratemporales;
   querysyn('select * from tablaslaptop where respaldar=1',0,sqldestino1);
   sqldestino1.First;
   while not sqldestino1.Eof do
   begin
      if querysyn('show tables where tables_in_'+IniFile.ReadString('CONEXION_LOCAL','bd','')+' like "%tmp'+sqldestino1.fieldbyname('tabla').AsString+
         AnsiReplaceStr(datetostr(date),'/','')+'%"',0,sqlorigen)=0 then
      begin
         querysyn('create table tmp'+sqldestino1.fieldbyname('tabla').AsString+AnsiReplaceStr(datetostr(date),'/','')+
         ' like '+sqldestino1.fieldbyname('tabla').AsString,1,sqlorigen);
         {if (sqldestino1.fieldbyname('tabla').AsString='actividades_vendedores') then
            querysyn('create trigger actividadestemp before update on tmp'+sqldestino1.fieldbyname('tabla').AsString+
            AnsiReplaceStr(datetostr(date),'/','')+' FOR EACH ROW begin if '+
            ' old.sincronizado=0 then set new.Sincronizado=2; else set new.sincronizado=1; end if; end;',1,sqlorigen);
         if (sqldestino1.fieldbyname('tabla').AsString='agenda_vendedores') then
            querysyn('create trigger agendatemp before update on tmp'+sqldestino1.fieldbyname('tabla').AsString+
            AnsiReplaceStr(datetostr(date),'/','')+' FOR EACH ROW set new.Sincronizado=2',1,sqlorigen);
         }
         querysyn('insert into tmp'+sqldestino1.fieldbyname('tabla').AsString+AnsiReplaceStr(datetostr(date),'/','')+
                  ' select * from '+sqldestino1.fieldbyname('tabla').AsString,1,sqlorigen);
      end;
      sqldestino1.Next;
   end;
end;

procedure TDMSincronizar.borratemporales;
var x:integer;
{const grupo:array[1..10] of string =('contactos','telefonos','actividades_vendedores','agenda_vendedores',
'oportunidades','OportunidadesFact','presupuestos2','DetPresupuestos2','DetPedido','pedidos');}
begin
   {for x :=0  to 10 do}
   querysyn('select * from tablaslaptop where respaldar=1',0,sqldestino1);
   sqldestino1.first;
   while not sqldestino1.Eof do
   begin
      if querysyn('show tables where tables_in_'+IniFile.ReadString('CONEXION_LOCAL', 'bd', '')+' like "%tmp'+sqldestino1.fieldbyname('tabla').AsString+
         '20%"',0,sqlorigen)>2 then
      begin
         sqlorigen.First;
         querysyn('DROP TABLE IF EXISTS '+sqlorigen.Fields.Fields[0].AsString,1,sqlorigen);
      end;
      sqldestino1.Next;
   end;
end;

procedure TDMSincronizar.agregarimagenes;
var fecha,path,destino:string;
begin
   if not DirectoryExists(ExtractFilePath(Application.ExeName)+'\Imagenes') then
      CreateDir(ExtractFilePath(Application.ExeName)+'\Imagenes');
   //traer la ultima fecha de sincronizacion
   querysyn('select max(fecha) as fecha from LogSincronizacion lg left join UCTabUsers u on lg.idvendedor=u.uciduser'+
   ' where u.uclogin="'+frmprincipal.ucprincipal.CurrentUser.LoginName+'"',0,sqldestino);
   if sqldestino.RecordCount>0 then
      fecha:=sqldestino.fieldbyname('fecha').asstring
   else
      exit;
   path:=ExtractFilePath(Application.ExeName)+'\Imagenes';
   destino:=getconfiguraciones('PathImagen',true);
   copiar(path,destino,fecha);
end;

procedure TDMSincronizar.copiar(path,destino,fecha:string);
var
   SearchRec:TsearchRec;
   Result,x:integer;
   S:String; { Used to hold current directory, GetDir(0,s) }
begin
   try {Exception handler }
      ChDir(Path);
   except
      on EInOutError do
      begin
         MessageDlg('Ocurrio un Error intentado cambiar el Directorio',mtWarning,[mbOK],0);
         Exit;
      end;
   end;
   if length(path)<> 3 then
      path:=path+'\';                           { Checking if path is root, if not add }
   FindFirst(path+'*.*',faAnyFile,SearchRec);   { '\' at the end of the string         }
   Repeat
      if SearchRec.Attr=faDirectory then        { if directory then }
      begin
         if (SearchRec.Name<>'.') and (SearchRec.Name<>'..') then { Ignore '.' and '..' }
         begin
            GetDir(0,s);                        { Get current dir of default drive }
            if length(s)<>3 then
               s:=s+'\';                              { Checking if root }
            CopiaTodo(s+searchrec.Name,destino);      { Adding to list }
            copiar(s+SearchRec.Name,destino,fecha);      { ListDir found directory }
         end;
      end
      else { if not directory }
      begin
         GetDir(0,s);                  { Get current dir of default drive }
         if FormatDateTime('yyyy/MM/dd',FileDateToDateTime(searchrec.Time))>fecha then
         if length(s)<>3 then
             { Checking if root }
            CopiaTodo(s+'\'+searchrec.Name,destino)
         else
            { Adding to list }
            CopiaTodo(s+searchrec.Name,destino);
      end;
      Result:=FindNext(SearchRec);
      Application.ProcessMessages;
   until result<>0; { Found all files, go out }
   GetDir(0,s);
   if length(s)<>3 then
      ChDir('..'); { if not root then go back one level }
end;

procedure TDMSincronizar.cargarmanuales;
begin
   if not DirectoryExists(ExtractFilePath(Application.ExeName)+'\Manuales') then
      CreateDir(ExtractFilePath(Application.ExeName)+'\Manuales');
   if not DirectoryExists(ExtractFilePath(Application.ExeName)+'\Manuales\DEPTO DE VENTAS') then
      CreateDir(ExtractFilePath(Application.ExeName)+'\Manuales\DEPTO DE VENTAS');

      copiar(GetConfiguraciones('DireccionManuales',true)+'DEPTO DE VENTAS',ExtractFilePath(Application.ExeName)+'\Manuales\DEPTO DE VENTAS',datetostr(date));


   //traer la fecha de cada archivo
   {querysyn('select max(fecha) as fecha from LogSincronizacion lg left join UCTabUsers u on lg.idvendedor=u.uciduser'+
   ' where u.uclogin="'+frmprincipal.ucprincipal.CurrentUser.LoginName+'"',0,sqldestino);
   if sqldestino.RecordCount>0 then
      fecha:=sqldestino.fieldbyname('fecha').asstring
   else
      exit;
   path:=ExtractFilePath(Application.ExeName)+'\Imagenes';
   destino:=getconfiguraciones('PathImagen',true);
   copiar(path,destino,fecha);
   }

end;


end.

