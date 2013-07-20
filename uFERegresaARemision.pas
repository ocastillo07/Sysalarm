unit uFERegresaARemision;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, RzRadGrp, StdCtrls, Mask, RzEdit, RzLabel, ExtCtrls,
  RzPanel, DB, MemDS, DBAccess, MyAccess, RzBtnEdt, RzLstBox, StrUtils,
  RzLaunch;

type
  TfrmFERegresarARemision = class(TForm)
    rgrango: TRzGroupBox;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    rgSeries: TRzRadioGroup;
    RzBitBtn1: TRzBitBtn;
    RzBitBtn2: TRzBitBtn;
    sqlgeneral: TMyQuery;
    eddesde: TRzButtonEdit;
    edhasta: TRzButtonEdit;
    RzLabel3: TRzLabel;
    mfolios: TRzMemo;
    Launcher: TRzLauncher;
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn2Click(Sender: TObject);
    procedure RzBitBtn1Click(Sender: TObject);
    procedure eddesdeKeyPress(Sender: TObject; var Key: Char);
    procedure edhastaKeyPress(Sender: TObject; var Key: Char);
    procedure mfoliosDblClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmFERegresarARemision: TfrmFERegresarARemision;

implementation

uses Udm, Urecursos, Uprincipal, Udmrep;

{$R *.dfm}

procedure TfrmFERegresarARemision.FormShow(Sender: TObject);
begin
CargaGrupo('Select letras as nombre from FoliosFE','', rgSeries, nil, sqlgeneral);

end;

procedure TfrmFERegresarARemision.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action := caFree;
end;

procedure TfrmFERegresarARemision.RzBitBtn2Click(Sender: TObject);
begin
if FileExists(my_path+'\FE_'+frmprincipal.idmaq+'.txt') then
  DeleteFile(my_path+'\FE_'+frmprincipal.idmaq+'.txt');
close;
end;

procedure TfrmFERegresarARemision.eddesdeKeyPress(Sender: TObject;
  var Key: Char);
begin
key := ValidaNumeros(key, false);
end;

procedure TfrmFERegresarARemision.edhastaKeyPress(Sender: TObject;
  var Key: Char);
begin
key := ValidaNumeros(key, false);
end;

procedure TfrmFERegresarARemision.RzBitBtn1Click(Sender: TObject);
var i:integer;  idpedido, idcliente:string;
begin
mfolios.Text := '';
for i:= strtoint(eddesde.text) to strtoint(edhasta.text) do
  begin
  with dmreportes do
    begin
    if querys('Select Serie_Comprobante, Folio from Tbl_FAK_CFD_Movimiento '+
              'where Serie_Comprobante = '''+rgSeries.Items.Strings[rgSeries.Itemindex]+''' '+
              'and Folio = '+inttostr(i), 0, sqlFE) = 0 then
      begin
      if querys('Select idpedido, idcliente from pedidos where idfactura ='+
                '"'+rgSeries.Items.Strings[rgSeries.Itemindex]+inttostr(i)+'"', 0, sqlgeneral2) > 0 then
        begin
        idpedido := sqlgeneral2.fieldbyname('idpedido').AsString;
        idcliente := sqlgeneral2.fieldbyname('idcliente').AsString;
        RegresarARemision(idpedido, idcliente);
        end
      else
        mfolios.Lines.Add(rgSeries.Items.Strings[rgSeries.Itemindex]+inttostr(i)+' <--Sin pedido');
      end
    else
      mfolios.Lines.Add(rgSeries.Items.Strings[rgSeries.Itemindex]+inttostr(i));
    end;
  end;
  Application.MessageBox('Termino el proceso', 'Aviso', MB_ICONINFORMATION);
end;

procedure TfrmFERegresarARemision.mfoliosDblClick(Sender: TObject);
begin
mfolios.Lines.SaveToFile(my_path+'\FE_'+frmprincipal.idmaq+'.txt');
Launcher.FileName := my_path+'\FE_'+frmprincipal.idmaq+'.txt';
Launcher.Execute;
end;

End.
