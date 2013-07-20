unit Ureporteestadisticas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Mask, RzEdit, RzButton, ComCtrls, RzDTP, ExtCtrls,
  RzLabel;

type
  Tfrmreporteestadisticas = class(TForm)
    Panel1: TPanel;
    btnalta: TRzBitBtn;
    edcuenta: TRzEdit;
    btncerrar: TRzBitBtn;
    RzLabel1: TRzLabel;
    procedure btnaltaClick(Sender: TObject);
    procedure btncerrarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmreporteestadisticas: Tfrmreporteestadisticas;

implementation

uses Udmrep, Umensaje, Urecursos, Umoduloreportes, DateUtils;

{$R *.dfm}

procedure Tfrmreporteestadisticas.btnaltaClick(Sender: TObject);
begin
   with dmreportes do
   begin
        frmmensaje.Show;
        frmmensaje.Update;
        querys('select sum(ser) as ser, sum(spat) as spat from ( (select count(s.idcliente) as ser,0 as spat from clientes as c '+
               ' left join servicios as s on c.idcliente=s.idcliente where s.status=5 and s.idcliente='+edcuenta.text+' and fechafinsys '+
               ' between "'+datetostr(EncodeDate(YearOf(now())-1,Monthof(now()),Dayof(now())))+'" and "'+datetostr(EncodeDate(YearOf(now()),Monthof(now()),Dayof(now())))+'"'+
               ' group by s.idcliente) union (select 0,count(idcliente) from sk_alarmas '+
               ' sk left join tiempo_respuesta t on sk.id=t.aid where sk.idcliente='+edcuenta.text+' and fecha between "'+datetostr(EncodeDate(YearOf(now())-1,Monthof(now()),Dayof(Now())))+'" '+
               ' and "'+datetostr(EncodeDate(YearOf(now()),Monthof(now()),Dayof(now())))+'" group by sk.idcliente)) as tabla',0,sqlgeneral);
        querys('select valor,concepto from configuraciones where concepto="CostoServicoTec"',0,sqlgeneral2);
        querys('select valor,concepto from configuraciones where concepto="CostoservicioPat"',0,sqlgeneral3);
        querys('select s.idcliente,if(c.rsocial is null or c.rsocial = "",concat(ifnull(c.nombre," ")," ", ifnull(c.apaterno," ")," ",ifnull(c.amaterno," ")),c.rsocial)'+
               ' as Cliente,s.problema,s.trab_realizado as realizo,concat(ifnull(u.nombre," ")," ", ifnull(u.apaterno," ")," ",ifnull(u.amaterno," ")) as Tecnico'+
               ' from servicios s left join usuarios u on s.CodTecnico=u.codigo2 left join clientes c on s.idcliente=c.idcliente '+
               ' where s.idcliente='+edcuenta.Text+' and status=5 and s.fechafinsys between "'+datetostr(EncodeDate(YearOf(now())-1,Monthof(now()),Dayof(Now())))+
               '" and "'+datetostr(EncodeDate(YearOf(now()),Monthof(now()),Dayof(Now())))+'" UNION ALL'+
               ' select sk.idcliente,sk.cliente,sk.descripcion,t.mmdesc,t.nombre from sk_alarmas as sk left join tiempo_respuesta t on t.aid=sk.id where sk.idcliente='+edcuenta.text+
               ' and fecha between "'+datetostr(EncodeDate(YearOf(now())-1,Monthof(now()),Dayof(Now())))+'" and "'+datetostr(EncodeDate(YearOf(now()),Monthof(now()),Dayof(Now())))+'"',0,sqlgeneral4);
        frmmensaje.Close;
        OperacionReporte('CostosServicios_1', 'Costos de Servicios por Cuenta', 'IMP', 1);
   end;
end;

procedure Tfrmreporteestadisticas.btncerrarClick(Sender: TObject);
begin
   Release;
end;

end.

