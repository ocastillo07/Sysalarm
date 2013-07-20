unit UCambiaSaldos;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, cxStyles, cxCustomData, cxGraphics, cxFilter, cxData,
  cxDataStorage, cxEdit, DB, cxDBData, StdCtrls, RzLabel, Mask, RzEdit,
  RzBtnEdt, cxGridLevel, cxClasses, cxControls, cxGridCustomView,
  cxGridCustomTableView, cxGridTableView, cxGridDBTableView, cxGrid,
  RzButton, MemDS, DBAccess, MyAccess, ExtCtrls, RzPanel, RzRadGrp;

type
  TfrmCambiaSaldos = class(TForm)
    btnCambiar: TRzBitBtn;
    btnCerrar: TRzBitBtn;
    cxGrid1DBTableView1: TcxGridDBTableView;
    cxGrid1Level1: TcxGridLevel;
    cxGrid1: TcxGrid;
    edcliente: TRzButtonEdit;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    edsaldo: TRzEdit;
    colcuenta: TcxGridDBColumn;
    colsaldo: TcxGridDBColumn;
    colpedido: TcxGridDBColumn;
    sqlgeneral: TMyQuery;
    sqlcambios: TMyQuery;
    DSCambios: TDataSource;
    RGCambiar: TRzRadioGroup;
    procedure edclienteButtonClick(Sender: TObject);
    procedure FormKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edsaldoKeyPress(Sender: TObject; var Key: Char);
    procedure edclienteKeyPress(Sender: TObject; var Key: Char);
    procedure btnCambiarClick(Sender: TObject);
    procedure btnCerrarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RGCambiarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCambiaSaldos: TfrmCambiaSaldos;

implementation

uses Ubusquedas, Udm, Urecursos;

{$R *.dfm}

procedure TfrmCambiaSaldos.edclienteButtonClick(Sender: TObject);
var codigo:word;
begin
codigo:=66;
self.OnKeyUp(self,codigo,[ssCtrl]);
end;

procedure TfrmCambiaSaldos.FormKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if (ssCtrl in Shift) and (chr(Key) in ['B', 'b'])  then
  begin
  with frmbusquedas do
    begin
    query:='Select idcliente, if(clientes.rsocial is NULL or clientes.rsocial='''', if(clientes.apaterno is NULL or clientes.apaterno='''', clientes.nombre, if(clientes.amaterno is NULL or clientes.amaterno='''', '+
           'concat(clientes.nombre, '' '', clientes.apaterno), concat(clientes.nombre, '' '', clientes.apaterno, '' '', clientes.amaterno))), clientes.rsocial) as Nombre from clientes order by idcliente';
    campo_retorno:='idcliente';
    campo_busqueda:='nombre';
    tblorigen := 'clientes';
    lbldesc.Caption:='Busqueda por Nombre:';
    ShowModal;
    if resultado <> '' then
      edcliente.Text := resultado;
    end; //with
  end;
end;

procedure TfrmCambiaSaldos.edsaldoKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
   if key='.' then
      key:=#0;
if (key=#13)and(edsaldo.Text<>'') then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmCambiaSaldos.edclienteKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
if key = #13 then
  begin
  if edcliente.text <> '' then
    begin
    key:=#0;
    sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
    end
  else
    edcliente.OnButtonClick(self);
  end;
end;

procedure TfrmCambiaSaldos.btnCambiarClick(Sender: TObject);
var cadena, cadena2:string;

begin
if strtoint(edsaldo.text) > 5 then
  application.MessageBox('El valor a modificar es mas alto al rango permitido', 'Aviso', MB_ICONINFORMATION)
else
  begin
  cadena2:= 'and idcliente='+quotedstr(edcliente.text);
  cadena:='select idcliente, idpedido, saldo from pedidos where Saldo < '+quotedstr(edsaldo.text)+' and not Saldo = ''0'' and idcliente='+quotedstr(edcliente.text)+' UNION select idcliente, idpedido, restante as saldo from PagosClientes where restante < ''5'' '+
         'and not restante=''0'' and ( movimiento = ''0'' or movimiento = ''1'')';

  if RGCambiar.ItemIndex = 0 then
    querys(cadena, 0, sqlgeneral)
  else
    querys(cadena+cadena2, 0, sqlgeneral);

  if sqlgeneral.RecordCount > 0 then
    begin
    cadena:='Update pedidos set saldo=''0'' where Saldo < '+quotedstr(edsaldo.text)+' and not Saldo = ''0''';
    if RGCambiar.ItemIndex = 0 then
      querys(cadena, 1, sqlcambios)
    else
      querys(cadena+cadena2, 1, sqlcambios);

    cadena:='Update PagosClientes set restante=''0'' where restante < '+quotedstr(edsaldo.text)+'  and not restante=''0'' and ( movimiento = ''0'' or movimiento = ''1'') ';
    if RGCambiar.ItemIndex = 0 then
      querys(cadena, 1, sqlcambios)
    else
      querys(cadena+cadena2, 1, sqlcambios);

    application.messagebox('Se han cambiado los datos mostrados en la lista', 'Aviso', mb_iconinformation);
    end
  else
    application.messagebox('No se encontraron los datos', 'Aviso', mb_iconinformation);
  end
end;

procedure TfrmCambiaSaldos.btnCerrarClick(Sender: TObject);
begin
close;
end;

procedure TfrmCambiaSaldos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure TfrmCambiaSaldos.RGCambiarClick(Sender: TObject);
begin
if RGCambiar.ItemIndex = 0 then
    edcliente.enabled := false
else
    edcliente.enabled := true;
end;

end.
