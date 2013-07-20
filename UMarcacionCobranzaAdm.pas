unit UMarcacionCobranzaAdm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzRadChk, StdCtrls, Mask, RzEdit, RzButton, RzLabel, ExtCtrls,
  RzPanel;

type
  TfrmMarcacionCobranzaAdm = class(TForm)
    pnlPrincipal: TRzPanel;
    RzLabel2: TRzLabel;
    btncerrar: TRzBitBtn;
    btnSi: TRzBitBtn;
    btnCancelar: TRzBitBtn;
    dfecha1: TRzDateTimeEdit;
    chkEstatus: TRzCheckBox;
    procedure btnCancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormShow(Sender: TObject);
    procedure btnSiClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMarcacionCobranzaAdm: TfrmMarcacionCobranzaAdm;

implementation

uses Urecursos, Udmrep, Uprincipal;

{$R *.dfm}

procedure TfrmMarcacionCobranzaAdm.btnCancelarClick(Sender: TObject);
begin
close;
end;

procedure TfrmMarcacionCobranzaAdm.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmMarcacionCobranzaAdm.FormShow(Sender: TObject);
begin
with dmreportes do
begin
querys('Select FechaInicio,estatus from MarcacionCobranzaAdm where estatus = 0',0,sqlgeneral2);
 if(sqlgeneral2.RecordCount > 0) then
   begin
      dfecha1.Date := sqlgeneral2.Fields.Fields[0].AsDateTime;
      chkEstatus.Visible := true;
      chkEstatus.SetFocus;

   end
   else
   begin

      dfecha1.Date := now;
      dfecha1.SetFocus;
      chkEstatus.Visible := false;

   end;

end;
end;

procedure TfrmMarcacionCobranzaAdm.btnSiClick(Sender: TObject);
var estatus : string;
begin
if(chkEstatus.Visible = true) then
    begin  //actualizar
      if(chkEstatus.Checked = true) then
         estatus := '1'
      else
         estatus := '0';

       querys('update MarcacionCobranzaAdm set estatus='+estatus+',usuario='+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+',FechaInicio ="'+dfecha1.Text+'" where estatus = 0',1,dmreportes.sqlgeneral2);
       application.MessageBox('Marcacion actualizada!','Aviso',mb_ok);   
       chkEstatus.Visible := false;
       
    end else
      begin //insertar

       querys('insert into MarcacionCobranzaAdm  (FechaInicio,usuario,fecha,hora) values("'+dfecha1.Text+'",'+inttostr(frmprincipal.ucprincipal.CurrentUser.UserID)+',curdate(),curtime())',1,dmreportes.sqlgeneral2);
       application.MessageBox('Marcacion lista!','Aviso',mb_ok);
       dfecha1.Date := now;
       chkEstatus.Visible := true;
       chkEstatus.Checked := false;
       chkEstatus.SetFocus;

      end;

end;

end.
