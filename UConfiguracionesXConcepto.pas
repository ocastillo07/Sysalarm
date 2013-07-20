unit UConfiguracionesXConcepto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, RzLabel, Mask, RzEdit, Buttons;

type
  TfrmConfiguracionesXConcepto = class(TForm)
    dfecha: TRzDateTimeEdit;
    lblTitulo: TRzLabel;
    btnActualizar: TBitBtn;
    txtConcepto: TEdit;
    lblMensaje: TRzLabel;
    procedure btnActualizarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);

  private
    { Private declarations }
  public
    { Public declarations }
    _concepto:string;
    constructor inicializa(const concepto,encabezado,titulo,mensaje,tipo:string);
  end;

var
  frmConfiguracionesXConcepto: TfrmConfiguracionesXConcepto;

implementation

uses Udmrep, Math, Urecursos;

{$R *.dfm}


constructor  TfrmConfiguracionesXConcepto.inicializa(const concepto,encabezado,titulo,mensaje,tipo:string);
begin
      if(tipo = 'string') then
      begin
        txtConcepto.Visible := true;
        txtConcepto.SetFocus;
        dfecha.Visible := false;
      end
      else
      begin
        dfecha.Visible := true;
        dfecha.Date := now;
        dfecha.SetFocus;
        txtConcepto.Visible := false;
      end;

      lblTitulo.Caption := titulo;
      lblMensaje.Caption := mensaje;
      self.Caption := encabezado;
      _concepto := concepto;

      with dmreportes do
      begin
         querys('Select valor from configuraciones where concepto = "'+concepto+'" ',0,sqlgeneral3);

          if(sqlgeneral3.recordcount > 0 ) then
          begin
            if(tipo = 'string' ) then
              txtConcepto.Text := sqlgeneral3.fieldbyname('valor').AsString
            else
            begin
              if(Length(sqlgeneral3.fieldbyname('valor').AsString) = 10) then
                dfecha.Date := strtodate(sqlgeneral3.fieldbyname('valor').AsString)
              else dfecha.Date := strtodate('1999/01/01');
            end;
          end;
      end;
end;

procedure TfrmConfiguracionesXConcepto.btnActualizarClick(Sender: TObject);
var _valor:string;
begin

   if(txtConcepto.Visible = true)
   then _valor := txtConcepto.Text  else _valor := dfecha.Text;

   querys('Update configuraciones set valor ="'+_valor+'" where concepto ="'+_concepto+'" ',1,dmreportes.sqlgeneral3);

   Application.MessageBox('Valor Actualizado','Listo!',MB_OK);

   Close();
end;

procedure TfrmConfiguracionesXConcepto.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

end.
