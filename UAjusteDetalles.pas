unit UAjusteDetalles;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, Buttons, ExtCtrls, DBCtrls;

type
  TAjusteDetalles = class(TForm)
    Shape1: TShape;
    Label14: TLabel;
    BUSCAR: TEdit;
    Label15: TLabel;
    TIPO: TComboBox;
    Bbuscar: TBitBtn;
    DBGrid1: TDBGrid;
    PanAjusteDetalles: TPanel;
    Label1: TLabel;
    DBGTrafico: TDBGrid;
    Label2: TLabel;
    DBGcomentarios: TDBGrid;
    DBMdetalles: TDBMemo;
    BBmodificar: TBitBtn;
    BBsalir: TBitBtn;
    S2: TShape;
    S3: TShape;
    S1: TShape;
    procedure BbuscarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure DBGTraficoDblClick(Sender: TObject);
    procedure BbuscarEnter(Sender: TObject);
    procedure BbuscarExit(Sender: TObject);
    procedure BBmodificarEnter(Sender: TObject);
    procedure BBmodificarExit(Sender: TObject);
    procedure BBsalirEnter(Sender: TObject);
    procedure BBsalirExit(Sender: TObject);
    procedure BUSCAREnter(Sender: TObject);
    procedure BUSCARExit(Sender: TObject);
    procedure TIPOEnter(Sender: TObject);
    procedure TIPOExit(Sender: TObject);
    procedure BBsalirClick(Sender: TObject);
    procedure BBmodificarClick(Sender: TObject);
    procedure DBMdetallesEnter(Sender: TObject);
    procedure DBMdetallesExit(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AjusteDetalles: TAjusteDetalles;

implementation

uses UDM, UDM2;

{$R *.dfm}

procedure TAjusteDetalles.BbuscarClick(Sender: TObject);
begin
dm.QCLIENTES.Active:=true;
                    DM.Qclientes.SQL.Clear;
                      DM.Qclientes.Sql.Add('Select *');
                        DM.Qclientes.sql.add('From clientes');
                          DM.Qclientes.SQL.Add('WHERE' );

                                // BUSCA POR EL TIPO
                                IF(TIPO.ItemIndex=0)THEN
                                BEGIN
                            DM.Qclientes.SQL.Add('account ='+''''+BUSCAR.Text +'''');
                                END;
                                IF(TIPO.ItemIndex=1)THEN
                                BEGIN
                            DM.Qclientes.SQL.Add('name LIKE'+''''+BUSCAR.Text +'%''');
                                END;
                                IF(TIPO.ItemIndex=2)THEN
                                BEGIN
                            DM.Qclientes.SQL.Add('dir LIKE'+'''%'+BUSCAR.Text +'%''');
                                END;
                                IF(TIPO.ItemIndex=3)THEN
                                BEGIN
                            DM.Qclientes.SQL.Add('phone1 like'+'''%'+BUSCAR.Text +'%''');
                                END;
                                IF(TIPO.ItemIndex=4)THEN
                                BEGIN
                                DM.QCLIENTES_PHONES.Active:=TRUE;
                                 DM.QCLIENTES_PHONES.SQL.Clear;
                                  DM.QCLIENTES_PHONES.SQL.Add('select *');
                                   DM.QCLIENTES_PHONES.SQL.Add('from clientes_phones');
                                    DM.QCLIENTES_PHONES.SQL.Add('where');
                                     DM.QCLIENTES_PHONES.SQL.Add('phone like'+'''%'+BUSCAR.Text+'%''');
                                      DM.QCLIENTES_PHONES.ExecSQL;
                                        DM.QCLIENTES_PHONES.Open;
                                DM.Qclientes.SQL.Add('account ='+''''+DM.QCLIENTES_PHONESaccount.AsString+'''');
                                 END;
                                DM.QCLIENTES.Open;
                                
                                 if(dm.QCLIENTES.RecordCount>0)then begin PanAjusteDetalles.Visible:=true;
  dm.QHISTORIAL_ALARMAS.Active:=true;
    DM.QHISTORIAL_alarmas.SQL.Clear;
      DM.QHISTORIAL_alarmas.Sql.Add('Select *');
        DM.QHISTORIAL_alarmas.sql.add('From sk_alarmas');
          DM.QHISTORIAL_alarmas.SQL.Add('WHERE ' );
            DM.QHISTORIAL_alarmas.SQL.Add('cuenta ='+''''+DM.QCLIENTESaccount.AsString+'''');
              DM.QHISTORIAL_alarmas.SQL.Add('order by fecha_pc desc');
                DM.QHISTORIAL_alarmas.ExecSQL;
                  DM.QHISTORIAL_alarmas.Open;

                                  end;
                                 if(dm.QCLIENTES.RecordCount=0)then  begin showmessage('NO SE ENCONTRO CLIENTE'); PanAjusteDetalles.Visible:=false; end;

end;

procedure TAjusteDetalles.FormShow(Sender: TObject);
begin
                              DM.QCLIENTES.Active:=false; 

PanAjusteDetalles.Visible:=false;
end;

procedure TAjusteDetalles.DBGTraficoDblClick(Sender: TObject);
begin
          DM.QALARMAS_DETALLE.Active:=TRUE;
           DM.QALARMAS_DETALLE.SQL.Clear;
            DM.QALARMAS_DETALLE.Sql.Add('Select *');
              DM.QALARMAS_DETALLE.sql.add('From alarmas_detalle');
                DM.QALARMAS_DETALLE.sql.add('WHERE');
                  DM.QALARMAS_DETALLE.SQL.Add('aid ='+''''+DM.QHISTORIAL_ALARMAS.FIELDBYNAME('id').AsString+'''and tipo<6');
                   DM.QALARMAS_DETALLE.OPEN;
end;

procedure TAjusteDetalles.BbuscarEnter(Sender: TObject);
begin
S1.Visible:=TRUE;
S1.Brush.Color:=clGradientActiveCaption;
end;

procedure TAjusteDetalles.BbuscarExit(Sender: TObject);
begin
S1.Visible:=FALSE;
end;

procedure TAjusteDetalles.BBmodificarEnter(Sender: TObject);
begin
S2.Visible:=TRUE;
S2.Brush.Color:=clGradientActiveCaption;
end;

procedure TAjusteDetalles.BBmodificarExit(Sender: TObject);
begin
S2.Visible:=FALSE;
end;

procedure TAjusteDetalles.BBsalirEnter(Sender: TObject);
begin
S3.Visible:=TRUE;
S3.Brush.Color:=clGradientActiveCaption;
end;

procedure TAjusteDetalles.BBsalirExit(Sender: TObject);
begin
S3.Visible:=FALSE;
end;

procedure TAjusteDetalles.BUSCAREnter(Sender: TObject);
begin
BUSCAR.Color:=clGradientActiveCaption;
end;

procedure TAjusteDetalles.BUSCARExit(Sender: TObject);
begin
BUSCAR.Color:=clWindow;
end;

procedure TAjusteDetalles.TIPOEnter(Sender: TObject);
begin
TIPO.Color:=clGradientActiveCaption;
end;

procedure TAjusteDetalles.TIPOExit(Sender: TObject);
begin
TIPO.Color:=clWindow;
end;

procedure TAjusteDetalles.BBsalirClick(Sender: TObject);
begin
CLOSE;
end;

procedure TAjusteDetalles.BBmodificarClick(Sender: TObject);
begin
if MessageDlg('Desea Guardar la modificacion?',
mtConfirmation, [mbYes, mbNo], 0) = mrYes then
begin
DM.QALARMAS_DETALLE.Edit;
DM.QALARMAS_DETALLEdetalle.AsString:=DBMdetalles.Text;
DM.QALARMAS_DETALLE.Post;
end;

end;

procedure TAjusteDetalles.DBMdetallesEnter(Sender: TObject);
begin
dbmdetalles.Color:=clGradientActiveCaption;
end;

procedure TAjusteDetalles.DBMdetallesExit(Sender: TObject);
begin
dbmdetalles.Color:=clWindow;
end;

end.
