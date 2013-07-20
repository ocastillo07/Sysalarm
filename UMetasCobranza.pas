//2008/02/28 dalyla zona horaria ok
unit UMetasCobranza;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzCmboBx, RzButton, Mask, RzEdit, ExtCtrls, RzPanel,
  ComCtrls;

type
  TfrmMetasCobranza = class(TForm)
    RzGroupBox1: TRzGroupBox;
    edMeta: TRzEdit;
    edSector: TRzEdit;
    Label1: TLabel;
    Label2: TLabel;
    btncancelar: TRzBitBtn;
    btnalta: TRzBitBtn;
    cbomeses: TRzComboBox;
    Label4: TLabel;
    Label5: TLabel;
    cboano: TRzComboBox;
    lsMetas: TListView;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btncancelarClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure edMetaKeyPress(Sender: TObject; var Key: Char);
    procedure cbomesesChange(Sender: TObject);
    procedure cboanoChange(Sender: TObject);
    procedure CargarRejilla;
    procedure btnaltaClick(Sender: TObject);
    procedure edSectorKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMetasCobranza: TfrmMetasCobranza;

implementation

uses Urecursos, Udmrep, Math, Uprincipal;

{$R *.dfm}

procedure TfrmMetasCobranza.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:= cafree;
end;

procedure TfrmMetasCobranza.btncancelarClick(Sender: TObject);
begin
close;
end;

procedure TfrmMetasCobranza.FormCreate(Sender: TObject);
begin
 cboano.Text := formatdatetime('yyyy',now);
 cbomeses.ItemIndex := strtoint(formatdatetime('m',now))-1;
 CargarRejilla;
end;

procedure TfrmMetasCobranza.edMetaKeyPress(Sender: TObject; var Key: Char);
begin
key:=ValidaNumeros(key,false);
key:=ValidaPunto(edMeta.Text,key);
if (key=#13)then
  begin
     key:=#0;
     btnalta.OnClick(Self);
    // sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmMetasCobranza.CargarRejilla;
var
newitem :TListItem;
begin
lsMetas.Items.Clear;

with dmreportes do
  begin
      querys('SELECT sector,meta FROM MetasCobranza WHERE ano='+cboano.text+' and mes ='+IntToStr(cbomeses.ItemIndex+1)+'  ',0,sqlgeneral2);

      while not sqlgeneral2.eof do
        begin                
                   newitem := nil;
                   newitem := lsMetas.Items.Add;
                   newitem.Caption :=  inttostr(sqlgeneral2.RecNo);
                   newitem.ImageIndex := 0;
                   newitem.SubItems.Add(sqlgeneral2.FieldByName('sector').AsString);
                   newitem.SubItems.Add(CurrToStrF(sqlgeneral2.fieldbyname('meta').AsFloat,ffCurrency, 2));

          sqlgeneral2.next;
        end;
  end;
end;
procedure TfrmMetasCobranza.cbomesesChange(Sender: TObject);
begin
    CargarRejilla;
    edSector.Text := '';  edSector.Text := ''; edMeta .Text := ''
end;

procedure TfrmMetasCobranza.cboanoChange(Sender: TObject);
begin
   CargarRejilla;
   edSector.Text := ''; edMeta .Text := ''
end;

procedure TfrmMetasCobranza.btnaltaClick(Sender: TObject);
begin

 if(edSector.text <> '' ) then
 begin
   if(edMeta.text <> '') then
   begin
      with dmreportes do
        begin

             querys('SELECT sector FROM MetasCobranza where ano='+cboano.Text+' and mes='+inttostr(cbomeses.ItemIndex+1)+' and sector ='+edSector.Text ,0,sqlgeneral2);
                if(sqlgeneral2.RecordCount = 0) then
                  querys('INSERT INTO MetasCobranza (ano,mes,sector,meta,fecha,usuario) values('+cboano.Text+','+inttostr(cbomeses.ItemIndex+1)+','+edSector.Text+','+edMeta.Text+',"'+datetostr(date)+'","'+frmprincipal.ucprincipal.CurrentUser.Username+'" )',1,sqlgeneral2)
                else
                  querys('UPDATE MetasCobranza SET  meta = '+edMeta.Text+' , fecha= "'+datetostr(date)+'",usuario = "'+frmprincipal.ucprincipal.CurrentUser.Username+'" where  ano='+cboano.Text+' and mes='+inttostr(cbomeses.ItemIndex+1)+' and sector ='+edSector.Text,1,sqlgeneral2);

        end;

       CargarRejilla;
   end
     else
   begin
      Application.MessageBox('Falta el Sector!','Atención',MB_OK);
      edSector.SetFocus;
   end;

   end else
     begin
        Application.MessageBox('Falta la meta a cobrar!','Atención',MB_OK);
        edMeta.SetFocus;
     end;
end;

procedure TfrmMetasCobranza.edSectorKeyPress(Sender: TObject;
  var Key: Char);
begin
key:=ValidaNumeros(key,false);
if (key=#13)then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

end.
