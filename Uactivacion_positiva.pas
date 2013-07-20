{///////////////////////////////////////////////////////////////////////////////
2008/04/14 dalyla eventos positivos
}///////////////////////////////////////////////////////////////////////////////

unit Uactivacion_positiva;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Spin, RzButton, RzRadChk, RzPanel, RzRadGrp;

type
  Tfrmdetalles_pos = class(TForm)
    spdetenidos: TSpinEdit;
    Panel1: TPanel;
    Label1: TLabel;
    chdanos: TCheckBox;
    Panel_clave: TPanel;
    btnguardar: TRzBitBtn;
    chkmasdedos: TRzCheckBox;
    rgactivacion: TRzRadioGroup;
    procedure btnguardarClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure rgactivacionClick(Sender: TObject);
  private
    { Private declarations }
    procedure nomover(var m: TWMWINDOWPOSCHANGED); message
   WM_WINDOWPOSCHANGING ;
  public
    { Public declarations }
    clave:string;
    constructor inicializa(const idclave:string);
  end;

var
  frmdetalles_pos: Tfrmdetalles_pos;

implementation

uses  Urecursos, Udm, Udmrep, UMediaFiliacion;

{$R *.dfm}

constructor tfrmdetalles_pos.inicializa(const idclave:string);
begin
clave:=idclave;
Panel_clave.caption:='Detalles Activación Positiva. Clave: '+clave;

end;


procedure Tfrmdetalles_pos.nomover(var m : TWMWINDOWPOSCHANGED);
begin
//if frmdetalles_pos.Showing then begin
        m.windowpos.x :=round((screen.Width - self.Width) div 2);;  {Left/Posicion X}
        m.windowpos.y :=round((screen.Height - self.Height) div 2);;  {Left/Posicion X}

//end;
end;


procedure Tfrmdetalles_pos.btnguardarClick(Sender: TObject);
  var danos, merc, pers:integer;
  hija: TfrmMediaFiliacion;
begin
  if rgactivacion.ItemIndex > -1 then
    begin
    if chdanos.Checked then
      danos:=1
    else
      danos:=0;

    if chkmasdedos.Checked then
      pers:=1
    else
      pers:=0;      
                  {
    if chmercancia.Checked then
      merc:=1
    else
      merc:=0;

    if chmercancia.Checked = true then
      if (rgactivacion.ItemIndex <> 1) and (rgactivacion.ItemIndex <> 2) then
        begin
        application.messagebox('Debes de seleccionar Robo o Asalto para poder seleccionar Mercancia', 'Atencion', mb_iconinformation);
        exit;
        end;     }
    merc:=0;  

  querys('select * from ActivPos where idsk='+clave,0,dmreportes.sqlgeneral);
  if dmreportes.sqlgeneral.RecordCount = 0 then
    querys('INSERT INTO ActivPos (activacion,detenidos,danos,mercancia, masdedospers, idsk,fecha) values('+inttostr(rgactivacion.ItemIndex)+','+inttostr(spdetenidos.value)+','+inttostr(danos)+','+inttostr(merc)+','+inttostr(pers)+','+quotedstr(clave)+','+quotedstr(datetostr(FechaServidor))+')',1,dmaccesos.sqlgeneral);

  TotalAlarmas('det','+',spdetenidos.Value,dmaccesos.sqlgeneral);

  if rgactivacion.ItemIndex = 0 then
    TotalAlarmas('IntRobo','+',1,dmaccesos.sqlgeneral);

  if rgactivacion.ItemIndex = 1 then
    TotalAlarmas('robo','+',1,dmaccesos.sqlgeneral);

  if rgactivacion.ItemIndex = 2 then
    TotalAlarmas('asalto','+',1,dmaccesos.sqlgeneral);

  if rgactivacion.ItemIndex = 3 then
    TotalAlarmas('fuego','+',1,dmaccesos.sqlgeneral);

  if rgactivacion.ItemIndex = 4 then
    TotalAlarmas('medica','+',1,dmaccesos.sqlgeneral);

  if rgactivacion.ItemIndex = 5 then
    TotalAlarmas('mercancia','+',1,dmaccesos.sqlgeneral);

  if rgactivacion.ItemIndex = 2 then
    begin
    close;
    hija := TfrmMediaFiliacion.Create(self);
    hija.idalarma :=  clave;
    hija.ShowModal;
    end;
  close;
  end
else
  begin
  showmessage('PRIMERO SELECCIONA EL TIPO DE ACTIVACION');
  end;

end;


procedure Tfrmdetalles_pos.FormActivate(Sender: TObject);
begin
with dmreportes do
  begin
  querys('select * from ActivPos where idsk='+quotedstr(clave),0,sqlgeneral);
  rgactivacion.ItemIndex:=sqlgeneral.fieldbyname('activacion').asinteger;
  spdetenidos.value:=sqlgeneral.fieldbyname('detenidos').asinteger;

  if sqlgeneral.fieldbyname('danos').asinteger=1 then
    chdanos.Checked:=true
  else
    chdanos.Checked:=false;
  end;
end;

procedure Tfrmdetalles_pos.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action:=cafree;
end;

procedure Tfrmdetalles_pos.rgactivacionClick(Sender: TObject);
begin
if rgactivacion.ItemIndex =   2 then
  chkmasdedos.Enabled := true
else
  begin
  chkmasdedos.Enabled := false;
  chkmasdedos.Checked := false;
  end;
end;



end.
