{///////////////////////////////////////////////////////////////////////////////
2008/11/25 oscar comunicadores
2008/07/23 dalyla derechossys
2008/04/24 dalyla cliente cambios
2008/04/07 dalyla el estatus de cambiar cotnratos grababa al reves en Cambios
2008/03/25 dalyla grabar sin importar el estatus en cambios
2008/02/28 dalyla zona horaria ok
}///////////////////////////////////////////////////////////////////////////////
unit UCambiaContratos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, DB, MemDS, DBAccess, MyAccess, StdCtrls, RzLabel,
  RzCmboBx, Mask, RzEdit, RzPanel, ExtCtrls, RzRadGrp, RzBtnEdt, cxStyles,
  cxCustomData, cxGraphics, cxFilter, cxData, cxDataStorage, cxEdit,
  cxDBData, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGridLevel, cxClasses, cxControls, cxGridCustomView, cxGrid;

type
  TfrmCambiaContrato = class(TForm)
    Sqlgeneral: TMyQuery;
    DScontratos: TDataSource;
    sqlcontrato: TMyQuery;
    RGPorContratos: TRzGroupBox;
    RGRango: TRzRadioGroup;
    RGCuentas: TRzGroupBox;
    Eddesde: TRzEdit;
    Edhasta: TRzEdit;
    RGContratos: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    Edconde: TRzButtonEdit;
    Edcona: TRzButtonEdit;
    RzGroupBox2: TRzGroupBox;
    cxGrid1: TcxGrid;
    cxGrid1DBTableView1: TcxGridDBTableView;
    colcuenta: TcxGridDBColumn;
    colNombre: TcxGridDBColumn;
    cxGrid1Level1: TcxGridLevel;
    btnCambiar: TRzBitBtn;
    btnCerrar: TRzBitBtn;
    RzLabel3: TRzLabel;
    RGSeleccion: TRzRadioGroup;
    RzLabel4: TRzLabel;
    RzLabel5: TRzLabel;
    edven1: TRzButtonEdit;
    edven2: TRzButtonEdit;
    edvena: TRzButtonEdit;
    RzLabel6: TRzLabel;
    RzLabel7: TRzLabel;
    sqlcambio: TMyQuery;
    sqlins: TMyQuery;
    procedure btnCerrarClick(Sender: TObject);
    procedure RGRangoClick(Sender: TObject);
    procedure btnCambiarClick(Sender: TObject);
    procedure EdcondeButtonClick(Sender: TObject);
    procedure EdconaButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure EddesdeKeyPress(Sender: TObject; var Key: Char);
    procedure EdhastaKeyPress(Sender: TObject; var Key: Char);
    procedure EdcondeKeyPress(Sender: TObject; var Key: Char);
    procedure EdconaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
    procedure RGSeleccionClick(Sender: TObject);
  private
    { Private declarations }
    procedure CambiaTipos;
    procedure CambiaVencidos;
  public
    { Public declarations }
  end;

var
  frmCambiaContrato: TfrmCambiaContrato;

implementation

uses Udm, Urecursos, Ubusquedas, Uprincipal;

{$R *.dfm}

procedure TfrmCambiaContrato.btnCerrarClick(Sender: TObject);
begin
release;
end;

procedure TfrmCambiaContrato.RGRangoClick(Sender: TObject);
begin
if RGRango.ItemIndex = 0 then
  RGCuentas.Enabled :=false
else
  RGCuentas.Enabled :=true;
end;

procedure TfrmCambiaContrato.btnCambiarClick(Sender: TObject);
begin
if RGSeleccion.ItemIndex = 0 then
  begin
  if (edconde.text = '') or (edcona.text='') then
    application.MessageBox('Faltan Campos por llenar', 'Aviso', MB_ICONERROR)
  else
    CambiaTipos;
  end
else
  begin
  if (edven1.text='') or (edven2.text='') or (edvena.Text='') then
    application.MessageBox('Faltan Campos por llenar', 'Aviso', MB_ICONERROR)
  else
    CambiaVencidos;
  end;
end;

procedure TfrmCambiaContrato.EdcondeButtonClick(Sender: TObject);
begin
   with frmbusquedas do
        begin
        query:='Select TipoCont, nombre from contratos';
        campo_retorno:='TipoCont';
        campo_busqueda:='nombre';
        tblorigen := 'contratos';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if resultado <> '' then
           begin
           edconde.Text := resultado;
           end;
        end;
end;

procedure TfrmCambiaContrato.EdconaButtonClick(Sender: TObject);
begin
with frmbusquedas do
        begin
        query:='Select TipoCont, nombre from contratos';
        campo_retorno:='TipoCont';
        campo_busqueda:='nombre';
        tblorigen := 'contratos';
        lbldesc.Caption:='Busqueda por Nombre:';
        ShowModal;
        if resultado <> '' then
           begin
           edcona.Text := resultado;
           end;
        end;
end;

procedure TfrmCambiaContrato.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmCambiaContrato.EddesdeKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
   if key='.' then
      key:=#0;
if (key=#13)and(eddesde.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCambiaContrato.EdhastaKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
   if key='.' then
      key:=#0;
if (key=#13)and(edhasta.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCambiaContrato.EdcondeKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(edconde.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCambiaContrato.EdconaKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)and(edcona.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCambiaContrato.FormShow(Sender: TObject);
begin
eddesde.setfocus;
if DerechosSys('Modifica Contratos') <> true then
  begin
  application.MessageBox('Usted no tiene derechos para modificar contratos', 'Atencion', MB_ICONEXCLAMATION);
  close;
  end;
end;

procedure TfrmCambiaContrato.CambiaTipos;
var
  cadena, status, estatus:string;
  bangenerar,baneliminar:boolean;
  sqlanterior, sqlcontrato: TmyQuery;
begin
if RGRango.ItemIndex = 1 then
  if strtoint(eddesde.text) > strtoint(edhasta.text) then
    begin
    application.MessageBox('Los rangos estan mal definidos', 'Aviso', MB_ICONERROR);
    exit;
    end;

  //############ Comunicador ########
   bangenerar:=false;
   baneliminar:=false;
   if (edconde.text<>'17') and (edcona.text='17') then
      if application.MessageBox('Deseas generar los pedidos correspondientes a la renta de Comunicador?','Aviso',MB_YESNO+MB_ICONQUESTION)=idyes then
         bangenerar:=true;
   if (edconde.Text='17') and (edcona.text<>'17') then
      if application.MessageBox('Se eliminaran los pedidos pendientes de la Renta de Comunicador, Deseas Continuar?','Aviso',MB_YESNO+MB_ICONQUESTION)=idyes then
         baneliminar:=true;

    //busca si el estatus cambia
      querys('Select estatus from contratos where TipoCont='+quotedstr(edconde.text), 0, sqlgeneral);
      status:= sqlgeneral.fieldbyname('estatus').AsString;

      //busca el estatus del nuevo contrato
      querys('Select estatus from contratos where TipoCont='+quotedstr(edcona.text), 0, sqlgeneral);
      estatus:= sqlgeneral.fieldbyname('estatus').AsString;

    // Selecciona el idcliente y el tipo de contrato para referencia
    cadena:= 'Select idcliente, if(clientes.rsocial is NULL or clientes.rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', '+
             ' concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre from clientes where TipoCont = '+quotedstr(edconDE.Text);
    if RGRango.ItemIndex = 1 then
      cadena := cadena + ' and idcliente between '+quotedstr(eddesde.Text)+' and '+quotedstr(edhasta.Text);
    querys(cadena, 0, sqlgeneral);

    if sqlgeneral.recordcount > 0 then
      begin

      sqlanterior:=tmyquery.Create(self);
      sqlanterior.Connection := dmaccesos.conexion;
      sqlcontrato:=tmyquery.Create(self);
      sqlcontrato.Connection := dmaccesos.conexion;

      //Cambia el Tipo de Contrato  y estatus
      cadena := 'Update clientes set TipoCont='+quotedstr(edcona.Text)+', estatus='+quotedstr(estatus)+' where TipoCont='+quotedstr(edconDE.Text);
      if RGRango.ItemIndex = 1 then
        cadena := cadena + ' and idcliente between '+quotedstr(eddesde.Text)+' and '+quotedstr(edhasta.Text);
      querys(cadena, 1, sqlcontrato);

      //Actualiza la Tabla de Cambios en los Clientes
      //  for i:=0 to sqlgeneral.recordcount-1 do
      sqlgeneral.first;
      while not sqlgeneral.Eof = true do
        begin
        querys('Select max(idcambio) as total from Cambios', 0, sqlcambio);
        querys('Insert into Cambios set idcambio='+quotedstr(inttostr(sqlcambio.fieldbyname('total').asinteger+1))+', idprimario='+quotedstr(sqlgeneral.fieldbyname('idcliente').asstring)+', tabla=''clientes'''+
              ', anterior='+quotedstr(edconDE.Text)+', nuevo='+quotedstr(edcona.Text)+', usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+', fecha='+quotedstr(datetostr(date))+
              ',hora='+quotedstr(timetostr(time))+', campo=''TipoCont'', pantalla=''CambiaContratos''',1,sqlins);

        {if status <> estatus then
          begin}
          querys('Select max(idcambio) as total from Cambios', 0, sqlcambio);
          querys('Insert into Cambios set idcambio='+quotedstr(inttostr(sqlcambio.fieldbyname('total').asinteger+1))+', idprimario='+quotedstr(sqlgeneral.fieldbyname('idcliente').asstring)+', tabla=''clientes'''+
                 ', anterior='+quotedstr(status)+', nuevo='+quotedstr(estatus)+', usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+', fecha='+quotedstr(datetostr(date))+
                 ',hora='+quotedstr(timetostr(time))+', campo=''estatus'', pantalla=''CambiaContratos''',1,sqlins);

          querys('Select idcliente from ClientesCambios where idcliente='+quotedstr(sqlgeneral.fieldbyname('idcliente').asstring), 0, sqlins);
          if sqlins.recordcount > 0 then
           querys('Update ClientesCambios set idcliente='+quotedstr(sqlgeneral.fieldbyname('idcliente').asstring)+', estatus='+quotedstr(estatus)+', usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+', fecha='+quotedstr(datetostr(date))+
                  ',hora='+quotedstr(timetostr(time))+' where idcliente='+quotedstr(sqlgeneral.fieldbyname('idcliente').asstring),1, sqlins)
          else
            querys('Insert into ClientesCambios set idcliente='+quotedstr(sqlgeneral.fieldbyname('idcliente').asstring)+', estatus='+quotedstr(estatus)+', usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+', fecha='+quotedstr(datetostr(date))+
                   ',hora='+quotedstr(timetostr(time)),1, sqlins);
          //end;
        sqlgeneral.Next;
        end;//for
      application.messagebox('A terminado el cambio de contratos de la lista de clientes mostrados en la lista', 'Aviso', MB_ICONINFORMATION);
      end
    else
      application.messagebox('No existen cuentas en el rango a cambiar', 'Aviso', MB_ICONINFORMATION);
end;

procedure TfrmCambiaContrato.CambiaVencidos;
begin       //VenceContrato

  querys('select idcliente, if(clientes.rsocial is NULL or clientes.rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', '+
             ' concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre, TipoCont '+
             'from clientes where (TipoCont = '+quotedstr(edven1.text)+' or TipoCont = '+quotedstr(edven2.text)+') and HastaCont<='+quotedstr(datetostr(FechaServidor)), 0, sqlgeneral);
  if sqlgeneral.RecordCount > 0 then
    begin
    querys('Update clientes set TipoCont='+quotedstr(edvena.text)+', VenceContrato = 0  where  (TipoCont = '+quotedstr(edven1.text)+' or TipoCont = '+quotedstr(edven2.text)+')', 1, sqlcontrato);

    sqlgeneral.first;
    while not sqlgeneral.Eof = true do
        begin
          querys('Select max(idcambio) as total from Cambios', 0, sqlcambio);
          querys('Insert into Cambios set idcambio='+quotedstr(inttostr(sqlcambio.fieldbyname('total').asinteger+1))+', idprimario='+quotedstr(sqlgeneral.fieldbyname('idcliente').asstring)+', tabla=''clientes'''+
                ', anterior='+quotedstr(sqlgeneral.fieldbyname('TipoCont').asstring)+', nuevo='+quotedstr(edvena.Text)+', usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+', fecha='+quotedstr(datetostr(date))+
                ',hora='+quotedstr(timetostr(time))+', campo=''TipoCont'', pantalla=''CambiaContratos''',1,sqlins);

          querys('Select max(idcambio) as total from Cambios', 0, sqlcambio);
          querys('Insert into Cambios set idcambio='+quotedstr(inttostr(sqlcambio.fieldbyname('total').asinteger+1))+', idprimario='+quotedstr(sqlgeneral.fieldbyname('idcliente').asstring)+', tabla=''clientes'''+
                ', anterior=1, nuevo=0, usuario='+quotedstr(frmprincipal.ucprincipal.CurrentUser.loginname)+', fecha='+quotedstr(datetostr(date))+
                ',hora='+quotedstr(timetostr(time))+', campo=''VenceContrato'', pantalla=''CambiaContratos''',1,sqlins);

          sqlgeneral.Next;
          end;//for
    application.messagebox('A terminado el cambio de contratos de la lista de clientes mostrados en la lista', 'Aviso', MB_ICONINFORMATION);
    end
  else
    application.messagebox('No existen cuentas en el rango a cambiar', 'Aviso', MB_ICONINFORMATION);
end;

procedure TfrmCambiaContrato.RGSeleccionClick(Sender: TObject);
begin
if RGSeleccion.ItemIndex = 0 then
  RGPorContratos.Enabled := true
else
  RGPorContratos.Enabled := false;
end;

end.
