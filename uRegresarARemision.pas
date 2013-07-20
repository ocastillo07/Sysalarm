{///////////////////////////////////////////////////////////////////////////////
2010/04/28 dalyla se creo
}///////////////////////////////////////////////////////////////////////////////
unit uRegresarARemision;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzRadGrp, StdCtrls, RzEdit, RzLaunch, DB, MemDS, DBAccess,
  MyAccess, RzButton, Mask, RzBtnEdt, RzLabel, ExtCtrls, RzPanel;

type
  TfrmRegresarARemision = class(TForm)
    rgrango: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    eddesde: TRzButtonEdit;
    edhasta: TRzButtonEdit;
    btnregresar: TRzBitBtn;
    btncerrar: TRzBitBtn;
    sqlgeneral: TMyQuery;
    Launcher: TRzLauncher;
    RzLabel3: TRzLabel;
    mfolios: TRzMemo;
    rgSeries: TRzRadioGroup;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncerrarClick(Sender: TObject);
    procedure eddesdeKeyPress(Sender: TObject; var Key: Char);
    procedure edhastaKeyPress(Sender: TObject; var Key: Char);
    procedure btnregresarClick(Sender: TObject);
  private
   procedure RegresarRemision(idpedido, idcliente:string);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmRegresarARemision: TfrmRegresarARemision;

implementation

uses Udmrep, Urecursos, Uprincipal;

{$R *.dfm}

procedure TfrmRegresarARemision.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TfrmRegresarARemision.btncerrarClick(Sender: TObject);
begin
Close;
end;

procedure TfrmRegresarARemision.eddesdeKeyPress(Sender: TObject;
  var Key: Char);
begin
key := ValidaNumeros(key, false);
end;

procedure TfrmRegresarARemision.edhastaKeyPress(Sender: TObject;
  var Key: Char);
begin
key := ValidaNumeros(key, false);
end;

procedure TfrmRegresarARemision.btnregresarClick(Sender: TObject);
var i:integer;  idpedido, idcliente:string;
begin
mfolios.Text := '';
for i:= strtoint(eddesde.text) to strtoint(edhasta.text) do
  begin
  with dmreportes do
    begin
    if querys('Select idpedido, idcliente from pedidos where idfactura ='+
                '"'+rgSeries.Items.Strings[rgSeries.Itemindex]+inttostr(i)+'"', 0, sqlgeneral2) > 0 then
      begin
      idpedido := sqlgeneral2.fieldbyname('idpedido').AsString;
      idcliente := sqlgeneral2.fieldbyname('idcliente').AsString;
      RegresarRemision(idpedido, idcliente);
      end
    else
      mfolios.Lines.Add(rgSeries.Items.Strings[rgSeries.Itemindex]+inttostr(i)+' <--Sin pedido');
    end;
  end;
  Application.MessageBox('Termino el proceso, revisar si ocupa modificar el consecutivo', 'Aviso', MB_ICONINFORMATION);
  frmprincipal.ucprincipal.Log('Regreso a Remision los folios ', 0);
end;

procedure TfrmRegresarARemision.RegresarRemision(idpedido, idcliente:string);
var idfactura, serie, folio:string;
begin
with dmreportes do
  begin
  querys('Select idfactura from RemiFact where idpedido='+idpedido+' and idfactura <> "0"', 0, sqlgeneral3);
  idfactura := sqlgeneral3.fieldbyname('idfactura').AsString;
  SeparaSerieFolio(idfactura, Serie, Folio);
  querys('Update pedidos set estatus=3, idfactura ="0", FechaCierre="" where idpedido='+idpedido,1,sqlgeneral3);
  querys('Update PagosClientes set idfactura = "0" where idpedido ='+idpedido, 1, sqlgeneral5);
  querys('Delete from RemiFact where idpedido = '+idpedido+' and idfactura = "'+idfactura+'"', 1, sqlgeneral3); 
  frmprincipal.ucprincipal.Log('Regreso a remision el Pedido '+idpedido,2);
  end;
end;

End.
