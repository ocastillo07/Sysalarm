unit Uubicacion;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, ExtCtrls, RzPanel, StdCtrls, RzEdit;

type
  Tfrmubicacion = class(TForm)
    memo: TRzMemo;
    RzPanel1: TRzPanel;
    RzBitBtn1: TRzBitBtn;
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
     idoport:string;
     ban:boolean;
     constructor inicializa(oportunidad:string;cuenta:string;condicion:boolean);


  end;

var
  frmubicacion: Tfrmubicacion;


implementation

uses Urecursos, Udmrep;

{$R *.dfm}

constructor Tfrmubicacion.inicializa(oportunidad:string;cuenta:string;condicion:boolean);
begin
   idoport:=oportunidad;
   ban:=condicion;
   querys('select NotaUbicacion from clientes where idcliente='+cuenta,0,dmreportes.sqlgeneral);
   memo.text:=dmreportes.sqlgeneral.fieldbyname('NotaUbicacion').asstring;
end;


procedure Tfrmubicacion.RzBitBtn1Click(Sender: TObject);
var nota:string;
begin
   if ban then
   begin
      nota:='';
      nota:=memo.text;
      if nota='' then
      begin
         if application.MessageBox('No has capturado nada!!, estas seguro que deseas salir?','Pregunta',MB_YESNO+MB_ICONQUESTION)=idno then
            memo.SetFocus
         else
         begin
            querys('update oportunidades set NotaUbicacion="'+nota+'" where idoportunidad='+idoport,1,dmreportes.sqlgeneral);
            close;
         end;
      end
      else
      begin
         close;
         querys('update oportunidades set NotaUbicacion="'+nota+'" where idoportunidad='+idoport,1,dmreportes.sqlgeneral);
      end
   end
   else
   begin
      ubicacion:=memo.Text;
      if ubicacion='' then
      begin
         if application.MessageBox('No has capturado nada!!, estas seguro que deseas salir?','Pregunta',MB_YESNO+MB_ICONQUESTION)=idno then
            memo.SetFocus
         else
            close;
      end
      else
         close;
   end;
end;

end.
