{///////////////////////////////////////////////////////////////////////////////
Creado por Dalila
}///////////////////////////////////////////////////////////////////////////////

unit UTCPComCliente;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, MemDS, DBAccess, MyAccess, IdBaseComponent, IdComponent,
  IdTCPConnection, IdTCPClient, StdCtrls, Clipbrd, StrUtils;

type
  TCommBlock = record   // the Communication Block used in both parts (Server+Client)
                 Command,
                 Msg: string[100];
               end;

type TClientHandleThread = class(TThread)
                       private
                         CB: TCommBlock;
                         procedure HandleInput;
                         procedure MensajeLlamada(procedencia, idtel:string; notabla:boolean);
                         procedure PantOportunidades(idoportunidad:string);
                       protected
                         procedure Execute; override;
                       end;

 var
    ClientHandleThread: TClientHandleThread;   // variable (type see above)
    sqlgeneral: TMyQuery;


function ConectarConmutador:Boolean;

implementation

uses Udm, Urecursos, Uclientes, Uprincipal, Uasig_eve_vend,
  Uasig_eve_vend_admin, Uprospectos, UExClientes, UAgendaVendedor;

procedure TClientHandleThread.HandleInput;
var telefono, mensaje:string; sqlgeneral:TMyQuery; poss:integer;
begin
sqlgeneral := Tmyquery.Create(nil);
sqlgeneral.Connection := dmaccesos.conexion;

  if CB.Command = 'MESSAGE' then
    begin
    mensaje := cb.msg;
    //cb.msg '9Comunicando Telefono: *'+telefono+' A Extension:'+Extension;
    //'9Comunicando Telefono: *6865568146 A Extension:2073'
    case strtoint(AnsiLeftStr (mensaje, 1)) of
      9:  begin
          Delete(mensaje, 1, 24);  //27
          poss := ansipos(' A', mensaje);
          telefono := trim(telefono + AnsiLeftStr (mensaje, poss));
          telefono := AnsiReplaceStr(telefono, '-', '');
          telefono := AnsiReplaceStr(telefono, '*', '');
          {if length(telefono) = 7 then
            telefono := AnsiLeftStr(telefono, 3)+'-'+AnsirightStr(telefono,4)
          else
            telefono := AnsiLeftStr(telefono, 3)+'-'+AnsirightStr(telefono,7);}
          if querys('Select idtel, procedencia from telefonos where replace(replace(telefono, "-", ""), "*", "") like "%'+telefono+'%" order by procedencia', 0, sqlgeneral) > 0 then
            MensajeLlamada(sqlgeneral.fieldbyname('procedencia').asstring, sqlgeneral.fieldbyname('idtel').asstring, false)
          else
            if querys('Select idtel, procedencia from NoTelefonos where replace(replace(telefono, "-", ""), "*", "") like "%'+telefono+'%" order by procedencia', 0, sqlgeneral) > 0 then
              MensajeLlamada(sqlgeneral.fieldbyname('procedencia').asstring, sqlgeneral.fieldbyname('idtel').asstring, true);
          end;
      end;
    end
  else
    begin
    if CB.Command = 'DIALOG' then
      MessageDlg ('"Server" sends you this message:'+#13+CB.Msg, mtInformation, [mbOk], 0)
    else  // unknown command
      MessageDlg('Unknown command "'+CB.Command+'" containing this message:'+#13+CB.Msg, mtError, [mbOk], 0);
    end;
end;

procedure TClientHandleThread.Execute;
begin
  while not Terminated do
  begin
    if not dmaccesos.Client.Connected then
      Terminate
    else
    try
      dmaccesos.Client.ReadBuffer(CB, SizeOf (CB));
      Synchronize(HandleInput);
    except
    end;
  end;
end;

procedure TClientHandleThread.MensajeLlamada(procedencia, idtel:string; notabla:boolean);
var frmcli:tfrmclientes; frmncli:tfrmExClientes; sqlgeneral:TMyQuery;
begin
sqlgeneral := Tmyquery.Create(nil);
sqlgeneral.Connection := dmaccesos.conexion;
if notabla = true then
  begin
  //CLIENTES
  if procedencia = 'clientes' then
     begin
     if querys('Select '+ClienteNombre('c')+' as nombre, idcliente from NoClientes as c where idtel ='+idtel, 0, sqlgeneral) > 0 then
       begin
       if application.MessageBox(pchar('Usted tiene una llamada del Ex-Cliente: #'+sqlgeneral.fieldbyname('idcliente').asstring+'  "'+sqlgeneral.fieldbyname('nombre').asstring+'"'+char(13)+'Desea ver la pantalla de EX-Clientes?'), 'Llamada Telefonica', MB_ICONINFORMATION+MB_YESNO) = idyes then
         begin
         frmncli:=tfrmExClientes.Create(nil);
         frmprincipal.ucprincipal.Log('Acceso a la Pantalla de Ex-Clientes',0);
         frmncli.inicializa(sqlgeneral.fieldbyname('idcliente').asstring);
         frmncli.Show;
         end;
       end;
     end;
  end
else
  begin
    //ABOGADOS
  if procedencia = 'abogados' then
    begin
    querys('Select '+UsuarioNombre('a')+' as nombre  from abogados as a where idtel ='+sqlgeneral.fieldbyname('idtel').asstring, 0, sqlgeneral);
    showMessage('Usted tiene una llamada del Abogado: "'+sqlgeneral.fieldbyname('nombre').asstring+'"');
    application.MessageBox(pchar('Usted tiene una llamada del Abogado: "'+sqlgeneral.fieldbyname('nombre').asstring+'"'), 'Llamada Telefonica', MB_ICONINFORMATION);
    end;

  //CLIENTES
  if procedencia = 'clientes' then
     begin
     if querys('Select '+ClienteNombre('c')+' as nombre, idcliente from clientes as c where idtel ='+idtel, 0, sqlgeneral) > 0 then
       begin
       if application.MessageBox(pchar('Usted tiene una llamada del cliente: #'+sqlgeneral.fieldbyname('idcliente').asstring+'  "'+sqlgeneral.fieldbyname('nombre').asstring+'"'+char(13)+'Desea ver la pantalla de clientes?'), 'Llamada Telefonica', MB_ICONINFORMATION+MB_YESNO) = idyes then
         begin
         frmcli:=tfrmclientes.Create(nil);
         frmprincipal.ucprincipal.Log('Acceso a la Pantalla de clientes',0);
         frmcli.inicializa(sqlgeneral.fieldbyname('idcliente').asstring);
         frmcli.Show;
         end;
       end;
     end;
  //CLIENTES/REFERENCIAS

  //OPORTUNIDADES
  if procedencia = 'oportunidades' then
     begin
     if querys('Select '+ClienteNombre('o')+' as nombre, idoportunidad from oportunidades as o where idtel ='+idtel, 0, sqlgeneral) > 0 then
       begin
       if application.MessageBox(pchar('Usted tiene una llamada del prospecto: #'+sqlgeneral.fieldbyname('idoportunidad').asstring+'  "'+
                                 sqlgeneral.fieldbyname('nombre').asstring+'"'+char(13)+'Desea ver los datos de la oportunidad?'), 'Llamada Telefonica', MB_ICONINFORMATION+MB_YESNO) = idyes then
         PantOportunidades(sqlgeneral.fieldbyname('idoportunidad').asstring);
       end;
     end;

  //PROVEEDORES
  if lowercase(procedencia) = 'proveedores' then
     begin
     if querys('Select '+ClienteNombre('p')+' as nombre, idprov from proveedores as p where idtel ='+idtel, 0, sqlgeneral) > 0 then
       application.MessageBox(pchar('Usted tiene una llamada del Proveedor: #'+sqlgeneral.fieldbyname('idprov').asstring+'  "'+sqlgeneral.fieldbyname('nombre').asstring+'"'), 'Llamada Telefonica', MB_ICONINFORMATION);
     end;
  
  //USUARIOS
  if procedencia = 'usuarios' then
     begin
     if querys('Select '+UsuarioNombre('u')+' as nombre, p.nombre as puesto, if(estatus=1, "ACTIVO", "INACTIVO")'+
               'as estatus from usuarios as u left join puestos as p on p.idpuesto=u.idpuesto where idtel ='+idtel, 0, sqlgeneral) > 0 then
       application.MessageBox(pchar('Usted tiene una llamada del Usuario Sysalarm: #  "'+sqlgeneral.fieldbyname('nombre').asstring+'" '+
                              chr(13)+'con el puesto "'+sqlgeneral.fieldbyname('puesto').asstring+'" y es un usuario "'+
                              sqlgeneral.fieldbyname('estatus').asstring+'"'), 'Llamada Telefonica', MB_ICONINFORMATION);
     end;
  

  //CONTACTOS
  if procedencia = 'contactos' then
     begin
     if querys('select idcontacto, '+UsuarioNombre('c')+' as nombre, procedencia from contactos as c where idtel='+idtel, 0, sqlgeneral) > 0 then
       begin
       //CONT CLIENTES  clientes/referencias, clientes/usuarios,
       if (sqlgeneral.fieldbyname('procedencia').asstring = 'clientes') or (sqlgeneral.fieldbyname('procedencia').asstring = 'clientes/referencias') or (sqlgeneral.fieldbyname('procedencia').asstring = 'clientes/usuarios') then
         begin
         querys('Select '+ClienteNombre('c')+' as nombre, idcliente, "'+sqlgeneral.fieldbyname('nombre').asstring+'" as contacto from clientes as c where idcontacto ='+sqlgeneral.fieldbyname('idcontacto').asstring, 0, sqlgeneral);
         if application.MessageBox(pchar('Usted tiene una llamada del contacto: "'+sqlgeneral.fieldbyname('contacto').asstring+'"'+chr(13)+
                                      'de la cuenta #'+sqlgeneral.fieldbyname('idcliente').asstring+'  "'+
                                      sqlgeneral.fieldbyname('nombre').asstring+'"'+char(13)+'Desea ver la informacion del cliente?'), 'Llamada Telefonica', MB_ICONINFORMATION+MB_YESNO) = idyes then
           begin
           frmcli:=tfrmclientes.Create(nil);
           frmprincipal.ucprincipal.Log('Acceso a la Pantalla de clientes',0);
           frmcli.inicializa(sqlgeneral.fieldbyname('idcliente').asstring);
           frmcli.Show;
           end;
         end;

       //CONT OPORTUNIDADES      oportunidades/usuarios
       if (sqlgeneral.fieldbyname('procedencia').asstring = 'oportunidades') or (sqlgeneral.fieldbyname('procedencia').asstring = 'oportunidades/usuarios') then
         begin
         querys('Select '+ClienteNombre(procedencia)+' as nombre, idoportunidad, "'+sqlgeneral.fieldbyname('nombre').asstring+'" as contacto from oportunidades where idcontacto ='+sqlgeneral.fieldbyname('idcontacto').asstring, 0, sqlgeneral);
         //showMessage('Usted tiene una llamada del contacto: "'+sqlgeneral.fieldbyname('contacto').asstring+'"  del prospecto #'+sqlgeneral.fieldbyname('idoportunidad').asstring+'  "'+sqlgeneral.fieldbyname('nombre').asstring+'"');
         if application.MessageBox(pchar('Usted tiene una llamada del contacto: "'+sqlgeneral.fieldbyname('contacto').asstring+'"  '+chr(13)+'del prospecto #'+sqlgeneral.fieldbyname('idoportunidad').asstring+'  "'+sqlgeneral.fieldbyname('nombre').asstring+'"'), 'Llamada Telefonica', MB_ICONINFORMATION) = idyes then
           PantOportunidades(sqlgeneral.fieldbyname('idoportunidad').asstring);
         end;

       //PROVEEDORES
       if sqlgeneral.fieldbyname('procedencia').asstring = 'PROVEEDORES' then
         begin
         querys('Select '+ClienteNombre(procedencia)+' as nombre, idprov, "'+sqlgeneral.fieldbyname('nombre').asstring+'" as contacto from proveedores where idcontacto ='+sqlgeneral.fieldbyname('idcontacto').asstring, 0, sqlgeneral);
         application.MessageBox(pchar('Usted tiene una llamada del contacto: "'+sqlgeneral.fieldbyname('contacto').asstring+'"  '+chr(13)+'del proveedor #'+sqlgeneral.fieldbyname('idprov').asstring+'  "'+sqlgeneral.fieldbyname('nombre').asstring+'"'), 'Llamada Telefonica', MB_ICONINFORMATION);
         end;
       end;
    end;
  end;
end;

procedure TClientHandleThread.PantOportunidades(idoportunidad:string);
var frmagadm:TfrmagendaVendedor;   frmag:TfrmagendaVendedor;
    frmopor: Tfrmprospectos;
    sqlgeneral:TMyQuery;      
begin
sqlgeneral := Tmyquery.Create(nil);
sqlgeneral.Connection := dmaccesos.conexion;

if frmprincipal.AreaUsuario = 'VENTAS' then
  begin
  if (frmprincipal.PuestoUsuario <> 'GERENTE') and (frmprincipal.PuestoUsuario <> 'COORDINADOR') then
    begin // vendedor
    if querys('select idvendedor, '+UsuarioNombre('u')+' as nombre from agenda_vendedores as a left join usuarios as u on u.idusuario=a.idvendedor where idoportunidad = '+idoportunidad, 0, sqlgeneral) > 0 then
      begin
      if sqlgeneral.FieldByName('idvendedor').AsString <> inttostr(frmprincipal.ucprincipal.CurrentUser.UserID) then
        begin
        application.MessageBox(pchar('Esta oportunidad es del vendedor "'+sqlgeneral.FieldByName('nombre').AsString+'"'), 'Aviso', MB_ICONINFORMATION);
        frmopor:=Tfrmprospectos.Create(nil);
        frmprincipal.ucprincipal.Log('Acceso la Pantalla de Oportunidades',0);
        frmopor.inicializa(idoportunidad);
        frmopor.Show;
        end
      else
        begin
        frmag:=TfrmagendaVendedor.Create(nil);
        frmprincipal.ucprincipal.Log('Acceso a la Pantalla de Agenda de Administradores',0);
        frmag.inicializa(idoportunidad, 2, false);
        frmag.Show;
        end;
      end
    else
      application.MessageBox(pchar('ke pex '+inttostr(sqlgeneral.RecordCount)), 'Aviso', MB_ICONINFORMATION);
    end
  else
    begin  //Ventas Gerente o coord
    frmagadm:=TfrmagendaVendedor.Create(nil);
    frmprincipal.ucprincipal.Log('Acceso a la Pantalla de Agenda de Vendedor',0);
    frmagadm.inicializa(idoportunidad, 2, false);
    frmagadm.Show;
    end;
  end
else
  begin  //fuera de ventas
  frmopor:=Tfrmprospectos.Create(nil);
  frmprincipal.ucprincipal.Log('Acceso la Pantalla de Oportunidades',0);
  frmopor.inicializa(idoportunidad);
  frmopor.Show;
  end;
end;

function ConectarConmutador:Boolean;
var prob:string;
begin
result := false;
try
    //Cliente que Recibe de ComReader
    prob := 'Error al intentar conectarse al puerto TCP del Ruteador Telefonico. ';
    dmaccesos.Client.Disconnect;
    dmaccesos.Client.Host := GetConfiguraciones('CallRouterIPMaq', true);
    dmaccesos.Client.Port := strtoint(GetConfiguraciones('CallRouterPort', true));
    dmaccesos.Client.Connect(10000);

    prob := 'Puertos ya conectados. Error al crear el ClientHandleThread. ';
    ClientHandleThread := TClientHandleThread.Create(True);
    ClientHandleThread.FreeOnTerminate:=True;
    ClientHandleThread.Resume;
    result := true;

   except
     on E: Exception do MessageDlg (prob+#13+E.Message, mtError, [mbOk], 0);
   end;
end;



End.
