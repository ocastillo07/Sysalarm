//2008/09/18 dalyla desmaracar marcacion y agregar codigo para no generar errores
//2008/04/24 dalyla cliente cambios
//2008/02/28 dalyla zona horaria ok
unit UMarcacionCobranza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, ComCtrls, RzButton, StdCtrls, Mask, RzEdit,
  RzLabel, RzRadChk, RzRadGrp, DB, MemDS, DBAccess, MyAccess;

type

  TfrmMarcacionCobranza = class(TForm)
    pnlPrincipal: TRzPanel;
    gbdias: TRzGroupBox;
    RzLabel9: TRzLabel;
    RzLabel10: TRzLabel;
    eddias1: TRzNumericEdit;
    eddias2: TRzNumericEdit;
    edSector: TRzNumericEdit;
    RzLabel1: TRzLabel;
    btnbuscar: TRzBitBtn;
    gbincluir: TRzGroupBox;
    ckbnormales: TRzCheckBox;
    ckbforzosos: TRzCheckBox;
    ckbbloqueados: TRzCheckBox;
    chkSinEnlace: TRzCheckBox;
    btnMarcar: TRzBitBtn;
    lblCuentasVencidas: TRzLabel;
    lblCuentasAMarcar: TRzLabel;
    btncerrar: TRzBitBtn;
    lsVencido: TListView;
    lsMarcar: TListView;
    pnlMarcando: TRzPanel;
    RzLabel4: TRzLabel;
    lblTelefono: TRzLabel;
    RzLabel5: TRzLabel;
    lblCuenta: TRzLabel;
    lblCliente: TRzLabel;
    RzLabel6: TRzLabel;
    RzLabel8: TRzLabel;
    lblSaldo: TRzLabel;
    Bevel1: TBevel;
    btnCancelar: TRzBitBtn;
    btnSi: TRzBitBtn;
    btnNo: TRzBitBtn;
    Panel1: TPanel;
    btnMarcarTodos: TRzBitBtn;
    RzLabel11: TRzLabel;
    lblTipoTel: TRzLabel;
    lsTelefonos: TListView;
    btnCliente: TRzBitBtn;
    btncobros: TRzBitBtn;
    Panel2: TPanel;
    chkSeComunico: TRzCheckBox;
    memoNotas: TRzMemo;
    btnguardar: TRzBitBtn;
    RzBitBtn3: TRzBitBtn;
    Bevel2: TBevel;
    rgTipoBusqueda: TRzRadioGroup;
    lblTotalSaldo: TRzLabel;
    RzLabel2: TRzLabel;
    MyQuery1: TMyQuery;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnbuscarClick(Sender: TObject);
    procedure lsVencidoKeyPress(Sender: TObject; var Key: Char);
    procedure lsMarcarDblClick(Sender: TObject);
    procedure lsMarcarKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure eddias1KeyPress(Sender: TObject; var Key: Char);
    procedure eddias2KeyPress(Sender: TObject; var Key: Char);
    procedure edSectorKeyPress(Sender: TObject; var Key: Char);
    procedure btncerrarClick(Sender: TObject);
    procedure lsVencidoDblClick(Sender: TObject);
    procedure btnMarcarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnNoClick(Sender: TObject);
    procedure btnSiClick(Sender: TObject);
    procedure RzBitBtn3Click(Sender: TObject);
    procedure btnguardarClick(Sender: TObject);
    procedure lsVencidoCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
    procedure chkSeComunicoKeyPress(Sender: TObject; var Key: Char);
    procedure lsMarcarKeyPress(Sender: TObject; var Key: Char);
    procedure btnMarcarTodosClick(Sender: TObject);
    procedure btnClienteClick(Sender: TObject);
    procedure btncobrosClick(Sender: TObject);
    procedure lsTelefonosCustomDrawItem(Sender: TCustomListView;
      Item: TListItem; State: TCustomDrawState; var DefaultDraw: Boolean);
  private
    { Private declarations }

       procedure BuscarSaldos;
       procedure AgregarItem;
       procedure MarcarATelefono;
       procedure MarcandoLista;
       procedure PantallaClientes(cuenta :string);
       procedure PantallaPagosDebe(cuenta :string);
       procedure CargarTelefonos;
       procedure MostrarDatosMarcacion;
       procedure MarcacionCiclo;
       function BuscarNota:integer;
  public
    { Public declarations }
  end;

var
  frmMarcacionCobranza: TfrmMarcacionCobranza;
  index,indexTelefono:integer;
  MarcandoTodos :boolean;

implementation

uses Urecursos, Uprincipal, Udmrep, Udm, Uclientes, Math, UfrmPagosDebe;

{$R *.dfm}

function TfrmMarcacionCobranza.BuscarNota:integer;
begin
with dmreportes do
begin
  if ((lsmarcar.Items[index].SubItems[6] = '') or (lsmarcar.Items[index].SubItems[6] = '0')) then
    begin
           querys('select max(idnota) as id from notas',0,sqlgeneral);

           //actualiza el idnota de la tabla que invoco esta pantalla
           querys('update clientes set idnota='+inttostr(sqlgeneral.fieldbyname('id').AsInteger+1)+ ' where idcliente='+lsmarcar.Items[index].Caption,1,sqlgeneral);
           result :=  sqlgeneral.fieldbyname('id').AsInteger+1;

    end
    else
       result :=  strtoint(lsmarcar.Items[index].SubItems[6]);
end;
end;

procedure  TfrmMarcacionCobranza.MostrarDatosMarcacion;
begin
lblCuenta.Caption := '';
lblCliente.Caption := '';
lblSaldo.Caption := '';

             pnlPrincipal.Enabled := false;
             pnlMarcando.Visible := true;
             lblCuenta.Caption := lsmarcar.Items[index].Caption;
             lblCliente.Caption := lsMarcar.Items[index].SubItems[0];
             lblSaldo.Caption := lsMarcar.Items[index].SubItems[1];

end;


procedure  TfrmMarcacionCobranza.CargarTelefonos;
var
newitem :TListItem;
begin
lsTelefonos.Items.Clear;
indexTelefono := 0;
with dmreportes do
 begin
 querys('select nivel,concat(if (nombre is null or nombre ="","",nombre)," ",if (apaterno is null or apaterno ="","",apaterno), " ",if (amaterno  is null or amaterno =""," ",amaterno)) as nombre,relacion,telefono,tipo_tel '+
        ' from telefonos as t left join contactos as con on(t.idtel=con.idtel) where con.idcontacto = '+lsMarcar.Items[index].SubItems[5]+' and con.procedencia="clientes" and tipo_tel in("ALARMA","CONVENCIONAL","CASA","NEGOCIO","OFICINA") order by nivel ',0,sqlgeneral4);


//    querys('Select telefono,tipo_tel from telefonos where idtel='+lsMarcar.Items[index].SubItems[5]+' and tipo_tel in("ALARMA","CONVENCIONAL","CASA","NEGOCIO","OFICINA") order by tipo_tel asc ',0,sqlgeneral4);
     if(sqlgeneral4.RecordCount > 0 ) then
       begin
           while not sqlgeneral4.Eof do
             begin
                if(sqlgeneral4.Fields.Fields[0].AsString <> '') then
                  begin

                   newitem := nil;
                   newitem := lsTelefonos.Items.Add;
                   newitem.Caption :=  sqlgeneral4.FieldByName('nivel').AsString;
                   newitem.ImageIndex := 0;
                   newitem.SubItems.Add(sqlgeneral4.FieldByName('nombre').AsString);
                   newitem.SubItems.Add(sqlgeneral4.FieldByName('relacion').AsString);
                   newitem.SubItems.Add(sqlgeneral4.FieldByName('telefono').AsString);
                   newitem.SubItems.Add(sqlgeneral4.FieldByName('tipo_tel').AsString);
                   newitem.SubItems.Add('');
                   newitem.SubItems.Add('');

                  end;
                sqlgeneral4.Next;
             end;
              lsTelefonos.Items[0].Selected := true;
       end
        else
           application.MessageBox('La cuenta no tiene responsables ','Atención',mb_ok);
  end;
end;


procedure  TfrmMarcacionCobranza.PantallaClientes(cuenta :string);
var forma:tfrmclientes;
begin
forma:=tfrmclientes.Create(self);
frmprincipal.ucprincipal.Log('Acceso a la Pantalla de clientes',0);
forma.inicializa(cuenta);
forma.Show;
forma := nil;
forma.Free;
end;

procedure  TfrmMarcacionCobranza.PantallaPagosDebe(cuenta :string);
var hija:TfrmPagosDebe;
begin
     hija:=TfrmPagosDebe.Create(self);
     hija.inicializa(cuenta);
     hija.Show;

end;

procedure TfrmMarcacionCobranza.MarcandoLista;
begin
  if(MarcandoTodos = true) then
    begin
       if((lsMarcar.Items.Count) >  index) then
          MarcacionCiclo
        else begin
             MarcandoTodos := false;
             pnlMarcando.Visible := false;
             pnlPrincipal.Enabled := true;
             end;
    end;
end;

procedure TfrmMarcacionCobranza.BuscarSaldos;
var
newitem :TListItem;
_saldo:Double;
begin
_saldo := 0;
Screen.Cursor := crHourglass;
lsVencido.Items.Clear;
lsMarcar.Items.Clear;

BusquedaSectoresVencidos(rgTipoBusqueda.ItemIndex,'if(flcargo = 1, "SI","") as flcargo,c.idcontacto as contacto,c.idnota as nota, '+
                         '(select contesto from MarcacionCobranza as mar2 where mar2.fecha >= "'+(formatdatetime('yyyy"/"mm"/"',NOW) + '01')+'" '+
                         'and mar2.idusuario= '+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+' and mar2.idcliente = pc.idcliente '+
                         'order by id desc limit 0,1) as Contesto,'+
                         '(select SeComunico from MarcacionCobranza as mar2 where mar2.fecha >= "'+(formatdatetime('yyyy"/"mm"/"',NOW) + '01')+'" '+
                         'and mar2.idusuario= '+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+' and mar2.idcliente = pc.idcliente '+
                         'order by id desc limit 0,1) as SeComunico, ','N','DETCLIENTES','',vartostr(edSector.Value) ,vartostr(edSector.Value),'1',
                         '1000',vartostr(eddias1.Value),vartostr(eddias2.value),false,ckbforzosos.Checked,ckbnormales.checked,chkSinEnlace.Checked,
                         ckbbloqueados.Checked,false);
with dmreportes do
 begin
while not sqlgeneral.Eof do
 begin
  newitem := nil;
  newitem := lsVencido.Items.Add;
  newitem.Caption :=  sqlgeneral.fieldbyname('cuenta').AsString;
  newitem.ImageIndex := 0;
  newitem.SubItems.Add(sqlgeneral.fieldbyname('nombre').AsString);
  newitem.SubItems.Add(CurrToStrF(sqlgeneral.fieldbyname('saldo').AsFloat,ffCurrency, 2));
  newitem.SubItems.Add(sqlgeneral.fieldbyname('flcargo').AsString);
  newitem.SubItems.Add(sqlgeneral.fieldbyname('EstatusInstalacion').AsString);
  newitem.SubItems.Add(sqlgeneral.fieldbyname('tipo').AsString);
  newitem.SubItems.Add(sqlgeneral.fieldbyname('contacto').AsString);
  newitem.SubItems.Add(sqlgeneral.fieldbyname('nota').AsString);
  newitem.SubItems.Add(sqlgeneral.fieldbyname('Contesto').AsString);
  newitem.SubItems.Add(sqlgeneral.fieldbyname('SeComunico').AsString);
  newitem.SubItems.Add(sqlgeneral.fieldbyname('dias').AsString);

  _saldo := _saldo + sqlgeneral.fieldbyname('saldo').AsFloat;
  sqlgeneral.Next;
 end;
 if lsvencido.Items.Count > 0 then
   begin
         lsVencido.Items.Item[0].Selected := true;
         lsVencido.setfocus;
         lblCuentasVencidas.Caption := 'Cuentas Vencidas. TOTAL : '+ inttostr(sqlgeneral.RecordCount);
         lblTotalSaldo.Caption := CurrToStrF(_saldo,ffCurrency, 2);

   end
     else
   begin
          lblTotalSaldo.Caption := '0';
          lblCuentasVencidas.Caption := 'Cuentas Vencidas';

   end;
 end;
Screen.Cursor := crDefault;
end;


procedure TfrmMarcacionCobranza.FormShow(Sender: TObject);
begin

MarcandoTodos := false;
     {
if(InicializarModems= false) then
  begin
     Application.MessageBox('Este Equipo no esta configurado para marcar telefonicamente!,'+#13+'por tal no podra utilizar esta caracteristica del sistema','Atencion',MB_OK);
     close();
  end;
        }
  with dmreportes do
     begin
        querys('select idsector from usuarios where idusuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID),0,sqlgeneral);
        edSector.Text := sqlgeneral.fields.Fields[0].AsString;
     end;
     
 eddias2.SetFocus;

end;

procedure TfrmMarcacionCobranza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
if(lsVencido.Items.Count > 0) then
begin
        if application.MessageBox('Deseas Salir de Marcación?','Confirmación',mb_yesno+mb_iconwarning) = idyes then
           Action:=cafree
        else
          action :=caNone;
end else
 Action:=cafree;

end;

procedure TfrmMarcacionCobranza.btnbuscarClick(Sender: TObject);
begin
  BuscarSaldos;
end;

procedure TfrmMarcacionCobranza.AgregarItem;
var newitem :TListItem;
c:integer;
begin
//  lsMarcar.Items.f
for c:= 0 to lsMarcar.Items.Count -1 do
 if(lsMarcar.Items[c].Caption = lsVencido.Selected.Caption) then
    exit;

  newitem := nil;
  newitem := lsMarcar.Items.Add;
  newitem.Caption :=  lsVencido.Selected.Caption;
  newitem.ImageIndex := 0;
  newitem.SubItems.Add(lsVencido.Selected.SubItems[0]);
  newitem.SubItems.Add(lsVencido.Selected.SubItems[1]);
  newitem.SubItems.Add(lsVencido.Selected.SubItems[2]);
  newitem.SubItems.Add(lsVencido.Selected.SubItems[3]);
  newitem.SubItems.Add(lsVencido.Selected.SubItems[4]);
  newitem.SubItems.Add(lsVencido.Selected.SubItems[5]);
  newitem.SubItems.Add(lsVencido.Selected.SubItems[6]);
  newitem.SubItems.Add(lsVencido.Selected.SubItems[9]);
  lblCuentasAMarcar.Caption := 'Cuentas a Marcar : '+ inttostr(lsMarcar.Items.Count);
end;


procedure TfrmMarcacionCobranza.lsVencidoKeyPress(Sender: TObject;
  var Key: Char);
begin
 if(key = #13) then
  begin
    key:=#0;
    AgregarItem;
  end;
end;

procedure TfrmMarcacionCobranza.lsMarcarDblClick(Sender: TObject);
begin
  PantallaClientes(lsMarcar.Selected.Caption);
end;

procedure TfrmMarcacionCobranza.lsMarcarKeyUp(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
if (char(key) in ['b','B']) then
 begin
    if(lsmarcar.Selected <> nil) then
      begin
          lsmarcar.Items.Delete(lsmarcar.Selected.Index);
          if(lsMarcar.Items.Count >0) then
            lblCuentasAMarcar.Caption := 'Cuentas a Marcar : '+ inttostr(lsMarcar.Items.Count)
          else
            lblCuentasAMarcar.Caption := 'Cuentas a Marcar ';
      end;
 end;
end;

procedure TfrmMarcacionCobranza.eddias1KeyPress(Sender: TObject;
  var Key: Char);
begin
 if(key = #13) then
    begin
     key := #0;
     eddias2.SetFocus;

    end;
end;

procedure TfrmMarcacionCobranza.eddias2KeyPress(Sender: TObject;
  var Key: Char);
begin
    if(key = #13) then
       begin
           key := #0;
           btnbuscar.OnClick(self);
       end;
end;

procedure TfrmMarcacionCobranza.edSectorKeyPress(Sender: TObject;
  var Key: Char);
begin
       if(key = #13) then
       begin
           key := #0;
           eddias1.SetFocus;
       end;
end;

procedure TfrmMarcacionCobranza.btncerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmMarcacionCobranza.lsVencidoDblClick(Sender: TObject);
begin
  PantallaClientes(lsVencido.Selected.Caption);
end;


procedure TfrmMarcacionCobranza.MarcarATelefono;
begin
lblTelefono.Caption := lsTelefonos.Items[indexTelefono].SubItems[2];
lblTipoTel.Caption := lsTelefonos.Items[indexTelefono].SubItems[0];
MarcarTelefono(lsTelefonos.Items[indexTelefono].SubItems[2]);

btnSi.SetFocus;
end;

procedure TfrmMarcacionCobranza.btnMarcarClick(Sender: TObject);
begin
if(lsMarcar.Items.Count > 0) then
  begin
      if(lsmarcar.Selected <> nil ) then
         begin
             index := lsmarcar.Selected.Index;
            CargarTelefonos;
             if(lsTelefonos.Items.Count > 0) then
               begin
                   MostrarDatosMarcacion;
                   MarcarATelefono;
               end;
           end
         else
           begin

             application.MessageBox('Seleccione primero una cuenta por favor!','Aviso',mb_ok);
             lsmarcar.Items[0].Selected := true;
             lsmarcar.SetFocus;
           end;

  end;
end;

procedure TfrmMarcacionCobranza.btnCancelarClick(Sender: TObject);
begin
 ColgarTelefono;
 pnlPrincipal.Enabled := true;
 pnlMarcando.Visible := false;
 if lsMarcar.Items.Count > 0 then
   lsmarcar.Items[0].Selected := true;
 lsmarcar.setfocus;
 index := 0;
 indexTelefono := 0;
 MarcandoTodos := false;
 btnSi.Enabled := true;
 btnNo.Enabled := true;
end;

procedure TfrmMarcacionCobranza.btnNoClick(Sender: TObject);
var c:integer;
entro:bool;
begin
ColgarTelefono;
lsTelefonos.Items[indexTelefono].SubItems[5] := 'N';
indexTelefono := indexTelefono +1;
 querys('insert into MarcacionCobranza (idusuario,idcliente,contesto,SeComunico,fecha,hora) values('+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+','+lblCuenta.Caption+',0,0,"'+datetostr(date)+'","'+timetostr(time)+'")',1,dmreportes.sqlgeneral2);
 if(indexTelefono < lsTelefonos.Items.Count) then
   begin
      lsTelefonos.Items[indexTelefono].Selected := true;
      MarcarATelefono;
    end
   else
    begin
     entro := false;
      for c:=0 to lsTelefonos.Items.Count-1 do
        if(lsTelefonos.Items[c].SubItems[5] <> 'N') then
           entro := true;

      if(entro = false) then
        begin
            memoNotas.Lines.Add('No contesto ningun telefono.(MARCACION POR SISTEMA)');
            memoNotas.Lines.Add('Comentado por '+frmprincipal.ucprincipal.CurrentUser.LoginName+' de '+frmprincipal.AreaUsuario+' con el puesto '+frmprincipal.PuestoUsuario+' el '+datetostr(now)+' a las '+timetostr(time));
            //ahora a guardar la nota.
            querys('insert into notas (idnota,TipoNota,nota,desplegable,idusuario,hora,fecha,procedencia,iddoc) values ('+inttostr(BuscarNota)+',"LLAMADA",'+quotedstr(uppercase(memoNotas.Text))+',0,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+',"'+timetostr(time)+'","'+datetostr(date)+'","clientes",'+lsmarcar.Items[index].Caption+')',1,dmreportes.sqlgeneral4);
            memoNotas.Lines.Clear;
        end;

      index := index + 1;
      pnlMarcando.Visible := false;
      pnlPrincipal.Enabled := true;
      lsmarcar.Items[0].Selected := true;
      MarcandoLista;
    end;
end;

procedure TfrmMarcacionCobranza.btnSiClick(Sender: TObject);
begin
ColgarTelefono;
lsTelefonos.Items[indexTelefono].SubItems[4] := '1';
lsTelefonos.Refresh;
lsTelefonos.Items[indexTelefono].Selected := true;
chkSeComunico.SetFocus;
btnguardar.Enabled := true;
btnSi.Enabled := false;
btnNo.Enabled := false;
end;

procedure TfrmMarcacionCobranza.RzBitBtn3Click(Sender: TObject);
begin
pnlprincipal.Enabled := true;
lsmarcar.Items[0].Selected := true;
lsmarcar.setfocus;
MarcandoLista;
end;

procedure TfrmMarcacionCobranza.btnguardarClick(Sender: TObject);
var idnota,c:integer;
si:string;
begin

if(memoNotas.Text <>  '') then
begin

with dmreportes do
 begin

//buscar si no tiene idnota.
    idnota := BuscarNota;

    memoNotas.Lines.Add('Comentado por '+frmprincipal.ucprincipal.CurrentUser.LoginName+' de '+frmprincipal.AreaUsuario+' con el puesto '+frmprincipal.PuestoUsuario+' el '+datetostr(now)+' a las '+timetostr(time));
//ahora a guardar la nota.
     querys('insert into notas (idnota,TipoNota,nota,desplegable,idusuario,hora,fecha,procedencia,iddoc) values ('+inttostr(idNota)+',"LLAMADA",'+quotedstr(uppercase(memoNotas.Text))+',0,'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+',"'+timetostr(time)+'","'+datetostr(date)+'","clientes",'+lsmarcar.Items[index].Caption+')',1,sqlgeneral);

     if(chkSeComunico.Checked)
        then  begin si := '1'; indexTelefono := 1000;  end
        else  si := '0';
//ahora a guardar en tabla de marccion
    querys('insert into MarcacionCobranza (idusuario,idcliente,contesto,SeComunico,fecha,hora) values('+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+','+lsmarcar.Items[index].Caption+',1,"'+si+'","'+datetostr(date)+'","'+timetostr(time)+'")',1,sqlgeneral2);


          for c:= 0 to lsvencido.Items.Count -1 do
             if(lsVencido.Items[c].Caption = lsmarcar.Items[index].Caption) then
                  begin
                    lsVencido.Items[c].SubItems[7] := '1';
                     if(chkSeComunico.Checked = true)
                        then  lsVencido.Items[c].SubItems[8] := '1';

                    lsvencido.Refresh;
                    break;
                  end;

        lsmarcar.Items.Delete(index);
        lsmarcar.Refresh;
        if(lsMarcar.Items.Count > 0) then
           lblCuentasAMarcar.Caption :=  'CUENTAS A MARCAR. TOTAL : ' +inttostr(lsMarcar.Items.Count)
        else
           lblCuentasAMarcar.Caption :=  'CUENTAS A MARCAR';

  end;

  memoNotas.Text := '';
  chkSeComunico.Checked := false;

  {
  if(indexTelefono >= lsTelefonos.Items.Count) then
    begin
        pnlPrincipal.Enabled := true;
        pnlMarcando.Visible := false;
        lsmarcar.setfocus;
    end;
   }
  btnSi.Enabled := true;
  btnNo.Enabled := true;

  indexTelefono := indexTelefono +1;
  if(indexTelefono < lsTelefonos.Items.Count) then
   begin
      lsTelefonos.Items[indexTelefono].Selected := true;
      MarcarATelefono;
  end
     else
      MarcandoLista;

  btnguardar.Enabled := false;

end else
 begin
   application.MessageBox('Se necesita minimo un mensaje para guardar la nota!','Aviso',mb_ok);
   memoNotas.SetFocus;
 end;

end;

procedure TfrmMarcacionCobranza.lsVencidoCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
    if(item.SubItems[7] = '1' ) then
       if(item.SubItems[8] = '1') then
           lsvencido.Canvas.Brush.Color := clred   // $CCFFCC;
       else
           lsvencido.Canvas.Brush.Color := clYellow;

end;

procedure TfrmMarcacionCobranza.chkSeComunicoKeyPress(Sender: TObject;
  var Key: Char);
begin
if(key = #13) then
  begin
      key := #0;
      memoNotas.SetFocus;

  end;
end;

procedure TfrmMarcacionCobranza.lsMarcarKeyPress(Sender: TObject;
  var Key: Char);
begin
     if(key = #13) then
       begin
           key := #0;
           btnMarcar.OnClick(self);
       end;
end;

procedure TfrmMarcacionCobranza.MarcacionCiclo;
begin
   CargarTelefonos;
    if(lsTelefonos.Items.Count > 0) then
     begin
         MostrarDatosMarcacion;
         MarcarATelefono;
     end
      else
         begin
             index := index +1;
             if((lsMarcar.Items.Count-1) >= index ) then
               begin
                 MarcacionCiclo;

               end;
         end;
end;

procedure TfrmMarcacionCobranza.btnMarcarTodosClick(Sender: TObject);
begin
if(lsMarcar.Items.Count > 0) then
begin
   index := 0;
   MarcandoTodos := true;
   MarcacionCiclo;

end
  else
   application.MessageBox('No hay cuentas en la lista de marcar!','Aviso',mb_ok);

end;

procedure TfrmMarcacionCobranza.btnClienteClick(Sender: TObject);
begin
  PantallaClientes(lsMarcar.Items[index].Caption);
end;

procedure TfrmMarcacionCobranza.btncobrosClick(Sender: TObject);
begin
  PantallaPagosDebe(lsmarcar.Items[index].Caption);
end;

procedure TfrmMarcacionCobranza.lsTelefonosCustomDrawItem(
  Sender: TCustomListView; Item: TListItem; State: TCustomDrawState;
  var DefaultDraw: Boolean);
begin
    if(item.SubItems[2] = '1' ) then
       lsTelefonos.Canvas.Brush.Color := clYellow;
end;

end.
