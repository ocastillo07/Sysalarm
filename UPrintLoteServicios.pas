{////////////////////////////////////////////////////////////////////////////////
2010/02/12 dalyla Reporte de doble servicio
}///////////////////////////////////////////////////////////////////////////////
unit UPrintLoteServicios;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RpBase, RpSystem, RpDefine, RpRave, StdCtrls, Buttons, ExtCtrls,
  Gauges, RzButton, RzCmboBx, Mask, RzEdit;

type
  TfrmPrintLoteServicios = class(TForm)
    Gau: TGauge;
    Label3: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    cbotipo: TRzComboBox;
    btnimprimirlote: TRzBitBtn;
    btncancelar: TRzBitBtn;
    ede: TRzNumericEdit;
    ehasta: TRzNumericEdit;
    RzBitBtn1: TRzBitBtn;
    procedure btnimprimirloteClick(Sender: TObject);
    procedure cbotipoChange(Sender: TObject);
    procedure edeKeyPress(Sender: TObject; var Key: Char);
    procedure btncancelarClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure RzBitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrintLoteServicios: TfrmPrintLoteServicios;

implementation

uses Udmrep, Uprincipal, Urecursos;

{$R *.dfm}

procedure TfrmPrintLoteServicios.btnimprimirloteClick(Sender: TObject);
var _bloqueado:string;
i:integer;
begin
if cbotipo.itemindex > 0 then
   begin
   with dmreportes do
      begin
      i:=0;
      gau.Progress:=0;

      if cbotipo.itemindex =1 then
         querys('select sid,c.idgiro,c.idcliente from servicios as s inner join clientes as c on(s.idcliente= c.idcliente) left join categorias as cate on(c.idcategoria=cate.idcategoria) where s.status < 4 order by sid',0,sqlgeneral3)
      else
         if cbotipo.itemindex = 2 then
            querys('select sid,c.idgiro,c.idcliente from servicios as s inner join clientes as c on(s.idcliente= c.idcliente) left join categorias as cate on(c.idcategoria=cate.idcategoria) where s.status < 4 and sid between '+vartostr(ede.value)+' and  '+vartostr(ehasta.value)+' order by sid ',0,sqlgeneral3);

      gau.MaxValue:=sqlgeneral3.RecordCount;
      sqlgeneral3.First;
      while sqlgeneral3.Eof=false do
         begin
         _bloqueado := '';
         if(BloqueadoPorSaldoCobranza(sqlgeneral3.Fieldbyname('idcliente').AsString)) then
            _bloqueado := '***ADEUDO***';


         querys('select t.telefono as tele,s.idcliente as cliente,"'+_bloqueado+'" as bloqueado,sid,fecha_creacion,hora_creacion,reportby, if(u2.nombre is null or u2.nombre="", '+
                'nomop, if(u2.apaterno is null or u2.apaterno="", concat(nomop, " ", u2.nombre), concat(nomop, " ", u2.nombre, '+
                '" ", u2.apaterno))) as Genero, if(c.rsocial is null or c.rsocial = '+
                '"",concat(ifnull(c.nombre," ")," ",ifnull(c.apaterno," ")," ",ifnull(c.amaterno," ")),c.rsocial) as Nombre, '+
                'concat( ifnull(c.dir," ")," "," ",  ifnull(c.numero," ")) AS Dir,concat(ifnull(col.idcol," ")," ",'+
                'ifnull(col.nombre," ")," ",ifnull(col.cp," ")) AS colonia,c.alarm,p.protocolo as protocolo,fecha_servicio, '+
                'if(prioridad = 0,"",if(prioridad=1,"URGENTE",if (prioridad=2,"NORMAL", if (prioridad =3, "PREVENTIVO","")))) '+
                'as prioridad, trab_realizado, problema,concat(ifnull(u.nombre," ")," ",'+
                'ifnull(u.apaterno," ")," ",ifnull(u.amaterno," ")) as tecnico,fecha_inicio,hora_inicio, FechaFinUsr, '+
                'HoraFinUsr,s.comentario, if (c.ClienteAlarmex =1,"NO","SI") as garantia, CodTecnico, refs, nsr.dia, '+
                'nsr.fecha,visita1,visita2,visita3 from servicios as s left join clientes as c ON(c.idcliente=s.idcliente) '+
                'left join colonias as col on(col.idcol=c.idcol) left join protocolos as p '+
                'ON(p.idprotocolo=c.idprotocolo) left join usuarios as u ON(u.codigo2=s.CodTecnico) left join usuarios '+
                'as u2 ON(u2.codigo=nomop) LEFT JOIN nsr on(nsr.idcliente=s.idcliente)  left join telefonos as t ON(t.idtel=c.idtel and tipo_tel ="ALARMA") '+
                'where s.sid='+quotedstr(sqlgeneral3.fieldbyname('sid').AsString)+ 'group by sid',0, dmreportes.sqlgeneral);

         OperacionReporte('RepOrdenServicio', '', 'IMPD', 1);

         inc(i);
         gau.Progress:=i;
         sqlgeneral3.Next;
         end;// fin del while
      label3.caption:='Total Impresiones: '+inttostr(sqlgeneral3.RecordCount);

      RVP.Engine:=RvSystem1;
      rvsystem2.DefaultDest:=rdpreview;
      end;//with
   end
else
   begin
   application.MessageBox('Seleccione el tipo de impresion','Aviso',mb_iconinformation);
   cbotipo.SetFocus;
   end;
end;

procedure TfrmPrintLoteServicios.cbotipoChange(Sender: TObject);
begin
if cbotipo.ItemIndex=2 then
begin
panel2.Visible:=true;
end
else
begin
panel2.Visible:=false;
end;
end;

procedure TfrmPrintLoteServicios.edeKeyPress(Sender: TObject;
  var Key: Char);
begin
if (key=#13)then
  begin
     key:=#0;
     sendmessage(self.Handle,WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TfrmPrintLoteServicios.btncancelarClick(Sender: TObject);
begin
close;
end;

procedure TfrmPrintLoteServicios.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
action := cafree;
end;

procedure TfrmPrintLoteServicios.RzBitBtn1Click(Sender: TObject);
var _bloqueado:string;
i:integer;
begin
if cbotipo.itemindex > 0 then
   begin
   with dmreportes do
      begin
      i:=0;
      gau.Progress:=0;

      if cbotipo.itemindex =1 then
         querys('select sid,c.idgiro,c.idcliente from servicios as s inner join clientes as c on(s.idcliente= c.idcliente) left join categorias as cate on(c.idcategoria=cate.idcategoria) where s.status < 4 order by sid',0,sqlgeneral3)
      else
         if cbotipo.itemindex = 2 then
            querys('select sid,c.idgiro,c.idcliente from servicios as s inner join clientes as c on(s.idcliente= c.idcliente) left join categorias as cate on(c.idcategoria=cate.idcategoria) where s.status < 4 and sid between '+vartostr(ede.value)+' and  '+vartostr(ehasta.value)+' order by sid ',0,sqlgeneral3);

      gau.MaxValue:=sqlgeneral3.RecordCount;
      sqlgeneral3.First;
      while sqlgeneral3.Eof=false do
         begin
         _bloqueado := '';
         if(BloqueadoPorSaldoCobranza(sqlgeneral3.Fieldbyname('idcliente').AsString)) then
            _bloqueado := '***ADEUDO***';


         querys('select t.telefono as tele,s.idcliente as cliente,"'+_bloqueado+'" as bloqueado,sid,fecha_creacion,hora_creacion,reportby, if(u2.nombre is null or u2.nombre="", '+
                'nomop, if(u2.apaterno is null or u2.apaterno="", concat(nomop, " ", u2.nombre), concat(nomop, " ", u2.nombre, '+
                '" ", u2.apaterno))) as Genero, if(c.rsocial is null or c.rsocial = '+
                '"",concat(ifnull(c.nombre," ")," ",ifnull(c.apaterno," ")," ",ifnull(c.amaterno," ")),c.rsocial) as Nombre, '+
                'concat( ifnull(c.dir," ")," "," ",  ifnull(c.numero," ")) AS Dir,concat(ifnull(col.idcol," ")," ",'+
                'ifnull(col.nombre," ")," ",ifnull(col.cp," ")) AS colonia,c.alarm,p.protocolo as protocolo,fecha_servicio, '+
                'if(prioridad = 0,"",if(prioridad=1,"URGENTE",if (prioridad=2,"NORMAL", if (prioridad =3, "PREVENTIVO","")))) '+
                'as prioridad, trab_realizado, problema,concat(ifnull(u.nombre," ")," ",'+
                'ifnull(u.apaterno," ")," ",ifnull(u.amaterno," ")) as tecnico,fecha_inicio,hora_inicio, FechaFinUsr, '+
                'HoraFinUsr,s.comentario, if (c.ClienteAlarmex =1,"NO","SI") as garantia, CodTecnico, refs, nsr.dia, '+
                'nsr.fecha,visita1,visita2,visita3 from servicios as s left join clientes as c ON(c.idcliente=s.idcliente) '+
                'left join colonias as col on(col.idcol=c.idcol) left join protocolos as p '+
                'ON(p.idprotocolo=c.idprotocolo) left join usuarios as u ON(u.codigo2=s.CodTecnico) left join usuarios '+
                'as u2 ON(u2.codigo=nomop) LEFT JOIN nsr on(nsr.idcliente=s.idcliente)  left join telefonos as t ON(t.idtel=c.idtel and tipo_tel ="ALARMA") '+
                'where s.sid='+quotedstr(sqlgeneral3.fieldbyname('sid').AsString)+ 'group by sid',0, dmreportes.sqlgeneral);

         OperacionReporte('RepOrdenServicio3', '', 'IMPD', 1);

         inc(i);
         gau.Progress:=i;
         sqlgeneral3.Next;
         end;// fin del while
      label3.caption:='Total Impresiones: '+inttostr(sqlgeneral3.RecordCount);

      RVP.Engine:=RvSystem1;
      rvsystem2.DefaultDest:=rdpreview;
      end;//with
   end
else
   begin
   application.MessageBox('Seleccione el tipo de impresion','Aviso',mb_iconinformation);
   cbotipo.SetFocus;
   end;
end;

end.
