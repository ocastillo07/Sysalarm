unit URemisionesAnuales;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, RzEdit, RzCmboBx, Mask, RzSpnEdt,DateUtils;

type
  Tfrmremisionesanuales = class(TForm)
    btniniciar: TRzBitBtn;
    Label1: TLabel;
    memo: TRzMemo;
    cbmes: TRzComboBox;
    btnbuscar: TRzBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    seanio: TRzSpinEdit;
    procedure btniniciarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnbuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmremisionesanuales: Tfrmremisionesanuales;

implementation

uses Udmrep, Urecursos;

{$R *.dfm}

procedure Tfrmremisionesanuales.btniniciarClick(Sender: TObject);
var
   cadena:string;
   m:integer;
begin
   cadena:= 'select idpedido,idcliente '+
            'from pedidos '+
            'where year(FechaCreacion) > 2006 '+
            'and Anualidad = 0 '+
            'and concepto like "MONITOREO CORRESPONDIENTE A '+cbmes.Text+' '+seanio.Text+'" '+
            'and saldado = 0 '+
            'and estatus in (3,4) '+
            'and idcliente in( '+
            'select p.idcliente '+
            'from pedidos as p '+
            'left join clientes as c on p.idcliente=c.idcliente '+
            'where anualidad = '+seanio.Text+' '+
            'and c.TipoCont in(012, 025, 010, 15))';

   querys(cadena,0,dmreportes.sqlgeneral4);

   for m:=1 to dmreportes.sqlgeneral4.RecordCount do
   begin
      RegresarAPedido(dmreportes.sqlgeneral4.fieldbyname('idpedido').AsString,dmreportes.sqlgeneral4.fieldbyname('idcliente').AsString);
      memo.Lines.Add(dmreportes.sqlgeneral4.fieldbyname('idpedido').AsString);
      dmreportes.sqlgeneral4.Next;
   end;
end;

procedure Tfrmremisionesanuales.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
Action:= caFree;
end;

procedure Tfrmremisionesanuales.btnbuscarClick(Sender: TObject);
var
   cadena:string;
   m:integer;
begin
   memo.Clear;
   cadena:= 'select idpedido,idcliente '+
            'from pedidos '+
            'where year(FechaCreacion) > 2006 '+
            'and Anualidad = 0 '+
            'and concepto like "MONITOREO CORRESPONDIENTE A '+cbmes.Text+' '+seanio.Text+'" '+
            'and saldado = 0 '+
            'and estatus in (3,4) '+
            'and idcliente in( '+
            'select p.idcliente '+
            'from pedidos as p '+
            'left join clientes as c on p.idcliente=c.idcliente '+
            'where anualidad = '+seanio.Text+' '+
            'and c.TipoCont in(012, 025, 010, 15))';

   querys(cadena,0,dmreportes.sqlgeneral4);
   application.MessageBox(pchar('Se encontraron: '+inttostr(dmreportes.sqlgeneral4.RecordCount)),'Aviso',MB_OK+MB_ICONASTERISK);

   for m:=1 to dmreportes.sqlgeneral4.RecordCount do
   begin
      memo.Lines.Add(dmreportes.sqlgeneral4.fieldbyname('idpedido').AsString);
      dmreportes.sqlgeneral4.Next;
   end;
end;

procedure Tfrmremisionesanuales.FormShow(Sender: TObject);
begin
   seanio.Text:= inttostr(yearof(date));
end;

end.



