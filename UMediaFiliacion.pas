unit UMediaFiliacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, RzPanel, RzRadGrp, StdCtrls, Mask, RzEdit, RzCmboBx,
  RzLabel, DB, MemDS, DBAccess, MyAccess, RzButton, RzTabs;

type
  TfrmMediaFiliacion = class(TForm)
    pcmedia: TRzPageControl;
    tsasaltante: TRzTabSheet;
    tsarma: TRzTabSheet;
    tsauto: TRzTabSheet;
    btnalta: TRzBitBtn;
    btncerrar: TRzBitBtn;
    sqlgeneral: TMyQuery;
    dsmedia: TDataSource;
    RzLabel1: TRzLabel;
    RzLabel2: TRzLabel;
    RzLabel3: TRzLabel;
    RzLabel4: TRzLabel;
    cbestatura: TRzComboBox;
    cbcomplexion: TRzComboBox;
    cbtes: TRzComboBox;
    edmarcas: TRzEdit;
    RzLabel5: TRzLabel;
    RzLabel7: TRzLabel;
    rgtipoarma: TRzRadioGroup;
    cbtipoarma: TRzComboBox;
    edotraarma: TRzEdit;
    RzLabel6: TRzLabel;
    RzLabel8: TRzLabel;
    RzLabel9: TRzLabel;
    cbtipoauto: TRzComboBox;
    cbcolor: TRzComboBox;
    edplacas: TRzEdit;
    cbmarca: TRzComboBox;
    RzLabel10: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncerrarClick(Sender: TObject);
    procedure rgtipoarmaChanging(Sender: TObject; NewIndex: Integer;
      var AllowChange: Boolean);
    procedure btnaltaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cbestaturaKeyPress(Sender: TObject; var Key: Char);
    procedure cbcomplexionKeyPress(Sender: TObject; var Key: Char);
    procedure cbtesKeyPress(Sender: TObject; var Key: Char);
    procedure edmarcasKeyPress(Sender: TObject; var Key: Char);
    procedure cbtipoarmaKeyPress(Sender: TObject; var Key: Char);
    procedure cbtipoautoKeyPress(Sender: TObject; var Key: Char);
    procedure cbmarcaKeyPress(Sender: TObject; var Key: Char);
    procedure cbcolorKeyPress(Sender: TObject; var Key: Char);
    procedure edotraarmaKeyPress(Sender: TObject; var Key: Char);
    procedure edplacasKeyPress(Sender: TObject; var Key: Char);
  private
   procedure Limpiar;
   procedure brinco(key:char);
    { Private declarations }
  public
    idalarma:string;
    { Public declarations }
  end;

var
  frmMediaFiliacion: TfrmMediaFiliacion;

implementation

uses Udm, Urecursos;

{$R *.dfm}

procedure TfrmMediaFiliacion.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := caFree;
end;

procedure TfrmMediaFiliacion.btncerrarClick(Sender: TObject);
begin
if querys('select idasaltante as t from asaltantes where idalarma = '+idalarma, 0, sqlgeneral) = 0 then
  begin
  application.MessageBox('Debe capturar los datos de por lo menos un asaltante', 'Atencion', MB_ICONINFORMATION);
  tsasaltante.TabVisible := true;
  exit;
  end;

if querys('select idarma from asaltantearmas where idalarma = '+idalarma, 0, sqlgeneral) = 0 then
  begin
  application.MessageBox('Debe capturar los datos de por lo menos un arma', 'Atencion', MB_ICONINFORMATION);
  tsarma.TabVisible := true;
  exit;
  end;

if querys('select idauto from asaltanteauto where idalarma = '+idalarma, 0, sqlgeneral) = 0 then
  begin
  application.MessageBox('Debe capturar los datos de por lo menos un tipo de movil', 'Atencion', MB_ICONINFORMATION);
  tsauto.TabVisible := true;
  exit;
  end;
close;
end;

procedure TfrmMediaFiliacion.rgtipoarmaChanging(Sender: TObject;
  NewIndex: Integer; var AllowChange: Boolean);
begin
cbtipoarma.ItemIndex := -1;
case NewIndex of
  0: begin
     edotraarma.Enabled := false;
     cbtipoarma.Enabled := true;
     edotraarma.Text := '';
     cbtipoarma.Clear;
     cbtipoarma.Add('CUCHILLO');
     cbtipoarma.Add('NAVAJA');
     cbtipoarma.Add('MACHETE');
     end;
  1: begin
     edotraarma.Enabled := false;
     cbtipoarma.Enabled := true;
     edotraarma.Text := '';
     cbtipoarma.Clear;
     cbtipoarma.Add('ESCUADRA');
     cbtipoarma.Add('REVOLVER');
     cbtipoarma.Add('ALMA DE ALTO PODER');
     end;
  
  2: begin
     edotraarma.Enabled := true;
     cbtipoarma.Enabled := false;
     edotraarma.SetFocus;
     end;
  end;
end;

procedure TfrmMediaFiliacion.btnaltaClick(Sender: TObject);
var ta:string;
begin

if tsasaltante.Showing = true then
  begin
  if cbestatura.ItemIndex  = -1 then
    begin
    application.MessageBox('Falta la estatura del asaltante', 'Atencion', MB_ICONINFORMATION);
    cbestatura.SetFocus;
    exit;
    end;
  if cbcomplexion.ItemIndex  = -1 then
    begin
    application.MessageBox('Falta la complexion del asaltante', 'Atencion', MB_ICONINFORMATION);
    cbcomplexion.SetFocus;
    exit;
    end;
  if cbtes.ItemIndex  = -1 then
    begin
    application.MessageBox('Falta la tes del asaltante', 'Atencion', MB_ICONINFORMATION);
    cbtes.SetFocus;
    exit;
    end;

  querys('select max(idasaltante) as id from asaltantes', 0, sqlgeneral);
  querys('Insert into asaltantes (idasaltante, idalarma, estatura, complexion, tes, marcas) values ("'+
         inttostr(sqlgeneral.fieldbyname('id').asInteger+1)+'", '+idalarma+', "'+cbestatura.Text+'", "'+
         cbcomplexion.Text+'", "'+cbtes.Text+'", "'+edmarcas.Text+'")', 1, sqlgeneral);

  end;

if tsarma.Showing = true then
  begin
  if rgtipoarma.ItemIndex  = -1 then
    begin
    application.MessageBox('Falta el tipo de arma del asaltante', 'Atencion', MB_ICONINFORMATION);
    exit;
    end;

  if (cbtipoarma.ItemIndex  = -1) and ((rgtipoarma.ItemIndex  = 0) or (rgtipoarma.ItemIndex  = 1)) then
    begin
    application.MessageBox('Falta la descripcion del arma del asaltante', 'Atencion', MB_ICONINFORMATION);
    cbtipoarma.SetFocus;
    exit;
    end;

  if (rgtipoarma.ItemIndex  = 2) and (edotraarma.Text = '') then
    begin
    application.MessageBox('Falta la descripcion del arma del asaltante', 'Atencion', MB_ICONINFORMATION);
    edotraarma.SetFocus;
    exit;
    end;
  case rgtipoarma.ItemIndex of
    0: ta:= 'BLANCA';
    1: ta := 'FUEGO';
    3: ta := 'OTRA';
    end;
  querys('select max(idarma) as id from asaltantearmas', 0, sqlgeneral);
  querys('Insert into asaltantearmas (idarma, idalarma, tipo, descripcion, otrotipo) values ("'+
         inttostr(sqlgeneral.fieldbyname('id').asInteger+1)+'", '+idalarma+', "'+ta+'", "'+
         cbtipoarma.text+'", "'+edotraarma.text+'")', 1, sqlgeneral);
  end;

if tsauto.Showing = true then
  begin
  if cbtipoauto.ItemIndex  = -1 then
    begin
    application.MessageBox('Falta el tipo de movil del asaltante', 'Atencion', MB_ICONINFORMATION);
    cbtipoauto.SetFocus;
    exit;
    end;

  querys('select max(idauto) as id from asaltanteauto', 0, sqlgeneral);
  querys('Insert into asaltanteauto (idauto, idalarma, tipo, marca, color, placas) values ("'+
         inttostr(sqlgeneral.fieldbyname('id').asInteger+1)+'", '+idalarma+', "'+cbtipoauto.Text+'", "'+
         cbmarca.text+'", "'+cbcolor.text+'", "'+edplacas.text+'")', 1, sqlgeneral);
  end;

limpiar;
end;

procedure TfrmMediaFiliacion.FormShow(Sender: TObject);
begin
pcmedia.ActivePageIndex := 0;
cbestatura.SetFocus;
end;

procedure TfrmMediaFiliacion.Limpiar;
begin
    cbestatura.text := '';
    cbcomplexion.text := '';
    cbtes.text := '';
    edmarcas.text := '';
    rgtipoarma.itemindex := -1;
    cbtipoarma.text := '';
    edotraarma.text := '';
    cbtipoauto.text := '';
    cbcolor.text := '';
    edplacas.text := '';
    cbmarca.text := '';
end;

procedure TfrmMediaFiliacion.cbestaturaKeyPress(Sender: TObject;
  var Key: Char);
begin
  brinco(key);
end;

procedure TfrmMediaFiliacion.brinco(key:char);
begin
if key = #13 then
  begin
  SendMessage(self.Handle, WM_NEXTDLGCTL, 0, 0);
  end
end;

procedure TfrmMediaFiliacion.cbcomplexionKeyPress(Sender: TObject;
  var Key: Char);
begin
  brinco(key);
end;

procedure TfrmMediaFiliacion.cbtesKeyPress(Sender: TObject; var Key: Char);
begin
brinco(key);
end;

procedure TfrmMediaFiliacion.edmarcasKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  btnalta.OnClick(self);
  end; 
end;

procedure TfrmMediaFiliacion.cbtipoarmaKeyPress(Sender: TObject;
  var Key: Char);
begin
brinco(key);
end;

procedure TfrmMediaFiliacion.cbtipoautoKeyPress(Sender: TObject;
  var Key: Char);
begin
brinco(key);
end;

procedure TfrmMediaFiliacion.cbmarcaKeyPress(Sender: TObject;
  var Key: Char);
begin
brinco(key);
end;

procedure TfrmMediaFiliacion.cbcolorKeyPress(Sender: TObject;
  var Key: Char);
begin
brinco(key);
end;

procedure TfrmMediaFiliacion.edotraarmaKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  btnalta.OnClick(self);
  end;
end;

procedure TfrmMediaFiliacion.edplacasKeyPress(Sender: TObject;
  var Key: Char);
begin
if key = #13 then
  begin
  key:=#0;
  btnalta.OnClick(self);
  end;
end;

End.
