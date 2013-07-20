//2009-02-13 Oscar correccion en el inicializa del chkanualidad


unit Umesesremision;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, StdCtrls, ExtCtrls, RzPanel, RzRadChk, Mask, RzEdit,
  RzSpnEdt;

type
  Tfrmmesesremision = class(TForm)
    chenero: TRzCheckBox;
    chfebrero: TRzCheckBox;
    chmarzo: TRzCheckBox;
    chabril: TRzCheckBox;
    chmayo: TRzCheckBox;
    chjunio: TRzCheckBox;
    chjulio: TRzCheckBox;
    chagosto: TRzCheckBox;
    chseptiembre: TRzCheckBox;
    choctubre: TRzCheckBox;
    chnoviembre: TRzCheckBox;
    chdiciembre: TRzCheckBox;
    RzPanel1: TRzPanel;
    //ltitulo: TLabel;
    btnaceptar: TRzBitBtn;
    edano: TRzSpinEdit;
    Label2: TLabel;
    btntodos: TRzBitBtn;
    chAnualidad: TRzCheckBox;
    procedure btnaceptarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btntodosClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ltitulo: TLabel;
    meses, anualidad:string;
    anio:integer;
    m1,m2,m3,m4,m5,m6,m7,m8,m9,m10,m11,m12,cont:integer;
    mesesmon : array [1..12] of integer;
    procedure inicializa;
  end;

var
  frmmesesremision: Tfrmmesesremision;

implementation

{$R *.dfm}

procedure Tfrmmesesremision.btnaceptarClick(Sender: TObject);
var
   primero:boolean;    i:integer;
begin
   for i:=1 to 12 do
     begin
     mesesmon[i] := 0;
     end;
   meses:= '';
   cont:= 0;
   primero:= true;
   if chanualidad.checked then
     anualidad := 'ANUALIDAD '+edano.Text
   else
     anualidad := 'MENSUALIDAD '+edano.Text;

   if chenero.Checked then
   begin
      m1:=1;
      cont:= cont+1;
      mesesmon[1] := 1;
      if not primero then meses:= meses+', '
      else primero:=false;
      meses:= meses+'ENERO';
   end;
   if chfebrero.Checked then
   begin
      m2:=1;
      cont:= cont+1;
      mesesmon[2] := 1;
      if not primero then meses:= meses+', '
      else primero:=false;
      meses:= meses+'FEBRERO';
   end;
   if chmarzo.Checked then
   begin
      m3:=1;
      cont:= cont+1;
      mesesmon[3] := 1;
      if not primero then meses:= meses+', '
      else primero:=false;
      meses:= meses+'MARZO';
   end;
   if chabril.Checked then
   begin
      m4:=1;
      cont:= cont+1;
      mesesmon[4] := 1;
      if not primero then meses:= meses+', '
      else primero:=false;
      meses:= meses+'ABRIL';
   end;
   if chmayo.Checked then
   begin
      m5:=1;
      cont:= cont+1;
      mesesmon[5] := 1;
      if not primero then meses:= meses+', '
      else primero:=false;
      meses:= meses+'MAYO';
   end;
   if chjunio.Checked then
   begin
      m6:=1;
      cont:= cont+1;
      mesesmon[6] := 1;
      if not primero then meses:= meses+', '
      else primero:=false;
      meses:= meses+'JUNIO';
   end;
   if chjulio.Checked then
   begin
      m7:=1;
      cont:= cont+1;
      mesesmon[7] := 1;
      if not primero then meses:= meses+', '
      else primero:=false;
      meses:= meses+'JULIO';
   end;
   if chagosto.Checked then
   begin
      m8:=1;
      cont:= cont+1;
      mesesmon[8] := 1;
      if not primero then meses:= meses+', '
      else primero:=false;
      meses:= meses+'AGOSTO';
   end;
   if chseptiembre.Checked then
   begin
      m9:=1;
      cont:= cont+1;
      mesesmon[9] := 1;
      if not primero then meses:= meses+', '
      else primero:=false;
      meses:= meses+'SEPTIEMBRE';
   end;
   if choctubre.Checked then
   begin
      m10:=1;
      cont:= cont+1;
      mesesmon[10] := 1;
      if not primero then meses:= meses+', '
      else primero:=false;
      meses:= meses+'OCTUBRE';
   end;
   if chnoviembre.Checked then
   begin
      m11:=1;
      cont:= cont+1;
      mesesmon[11] := 1;
      if not primero then meses:= meses+', '
      else primero:=false;
      meses:= meses+'NOVIEMBRE';
   end;
   if chdiciembre.Checked then
   begin
      m12:=1;
      cont:= cont+1;
      mesesmon[12] := 1;
      if not primero then meses:= meses+', '
      else primero:=false;
      meses:= meses+'DICIEMBRE';
   end;
   
   anio:= strtoint(edano.Text);
   if not primero then
   begin
      meses:= meses + ' ' + edano.Text;
      close;
   end
   else
      application.MessageBox('Debe seleccionar por lo menos un mes','Aviso',MB_OK+MB_ICONASTERISK);
end;

procedure Tfrmmesesremision.FormShow(Sender: TObject);
begin
   Height:= 246;
   Width:= 279;
end;

procedure Tfrmmesesremision.inicializa;
begin
   chanualidad.Checked:= false;
   chenero.Checked:= false;
   chfebrero.Checked:= false;
   chmarzo.Checked:= false;
   chabril.Checked:= false;
   chmayo.Checked:= false;
   chjunio.Checked:= false;
   chjulio.Checked:= false;
   chagosto.Checked:= false;
   chseptiembre.Checked:= false;
   choctubre.Checked:= false;
   chnoviembre.Checked:= false;
   chdiciembre.Checked:= false;
   meses:= '';
   cont:=0;
   edano.Text:= FormatDateTime('yyyy',now);
   m1:=0;m2:=0;m3:=0;m4:=0;m5:=0;m6:=0;m7:=0;m8:=0;m9:=0;m10:=0;m11:=0;m12:=0;
end;

procedure Tfrmmesesremision.btntodosClick(Sender: TObject);
begin
   chenero.Checked:= not chenero.Checked;
   chfebrero.Checked:= not chfebrero.Checked;
   chmarzo.Checked:= not chmarzo.Checked;
   chabril.Checked:= not chabril.Checked;
   chmayo.Checked:= not chmayo.Checked;
   chjunio.Checked:= not chjunio.Checked;
   chjulio.Checked:= not chjulio.Checked;
   chagosto.Checked:= not chagosto.Checked;
   chseptiembre.Checked:= not chseptiembre.Checked;
   choctubre.Checked:= not choctubre.Checked;
   chnoviembre.Checked:= not chnoviembre.Checked;
   chdiciembre.Checked:= not chdiciembre.Checked;
end;

end.
