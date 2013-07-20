unit UMsn;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, RzButton, Mask, RzEdit, StdCtrls, RzLabel, ExtCtrls, RzPanel,
  ComCtrls, ScktComp, RzStatus, RzCmboBx, RzTreeVw, RzShellCtrls, RzListVw;

type
  Tfrmmsn = class(TForm)
    RzPanel1: TRzPanel;
    statusbar: TRzStatusBar;
    RzClockStatus1: TRzClockStatus;
    statuspane1: TRzStatusPane;
    statuspane2: TRzStatusPane;
    labeluser: TRzLabel;
    RzPanel2: TRzPanel;
    edEnviar: TRzEdit;
    btnenviar: TRzBitBtn;
    memo: TRzMemo;
    listausuarios: TTreeView;
    RzPanel3: TRzPanel;
    RzLabel1: TRzLabel;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure edEnviarKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnenviarClick(Sender: TObject);
    procedure listausuariosDblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private

  public
    procedure lista(mensaje:string);
    procedure agregarusuario(area:string;user:string);
    procedure recibirmensajes(mensaje:string);
    procedure conecto(mensaje:string);
    procedure desconecto(mensaje:string);

  end;

var
  frmmsn: Tfrmmsn;
  destino,usuario:string;
  contestar:boolean;

implementation

uses DB, Urecursos, Udm, Uprincipal, UCBase;

{$R *.dfm}



procedure Tfrmmsn.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  frmmsn.Visible:=false;
  labeluser.Caption:='Conversacion con Usuario:';
  memo.Clear;
end;

procedure Tfrmmsn.edEnviarKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_Return then btnenviar.Click;
end;

procedure Tfrmmsn.btnenviarClick(Sender: TObject);
begin

  if edenviar.text<>'' then
  begin
    if destino<>'' then
    begin
      //frmprincipal.SCliente.Socket.SendText('mensaje~'+destino+'~'+edEnviar.Text);
      memo.Lines.Add(''+lowercase(frmprincipal.ucprincipal.CurrentUser.LoginName)+' Dice: ');
      memo.Lines.Add(edEnviar.Text);
      memo.Lines.add(' ');
      edenviar.text:='';
    end;
  end;
end;

procedure Tfrmmsn.lista(mensaje:String);
var area,user,aux:string; m,x:integer; bu,ba:Boolean;
begin
  for  x:=1 to length(mensaje) do
  begin
    if (mensaje[x]<>'~') then
    begin
      aux:=aux+mensaje[x];
    end
    else
      break;
  end;

  if aux='lista' then
  begin
    ba:= true;
    bu:= false;
    area:= '';
    user:= '';
    for m:=7 to Length(mensaje) do
    begin
    if (mensaje[m] = '~') then
    begin
      if(ba) then
      begin
        ba:= false;
        bu:= true;
      end
      else
      begin
        if(bu) then
        begin
          ba:= true;
          bu:= false;
          agregarusuario(area,user);
          area:= '';
          user:= '';
        end;
      end;
    end//if cadena = '~'
    else
    begin
      if (mensaje[m] = ':') then
      begin
        agregarusuario(area,user);
        user:= '';
      end//if cadena = ':'
      else
      begin
        if(ba) then
          area:= area + mensaje[m];
        if(bu) then
          user:= user + mensaje[m];
      end;
    end;
  end;
  agregarusuario(area,user);
  end;//fin de lista

end;

procedure Tfrmmsn.agregarusuario(area:string;user:string);
var x:integer;
begin
    for x :=0  to listausuarios.Items.Count-1 do
    begin
      if Lowercase(listausuarios.Items[x].Text)=area then
        listausuarios.items.AddChild(listausuarios.Items[x],user);

    end;
end;


procedure Tfrmmsn.recibirmensajes(mensaje:string);
var entrou:boolean; user,msn:string; x:integer;
begin
  frmmsn.SetFocus;
  entrou:=false;
  user:='';
  msn:='';
  for x := 9  to length(mensaje) do
    begin
      if (mensaje[x]='~') and (entrou=false) then
        entrou:=true;
      if entrou=false then
        begin
          user:=user+mensaje[x];
        end;
      if entrou then
      begin
        if mensaje[x]<>'~' then
          msn:=msn+mensaje[x];
      end;
    end;
    if contestar=false then
    begin
      destino:=lowercase(user);
      labeluser.Caption:='Conversacion con Usuario: '+destino;
    end;
   memo.Lines.Add(lowercase(user)+' Dice: ');
   memo.lines.Add(msn);
   memo.Lines.add(' ');
   statuspane2.Caption:='Ultimo Mensaje Recibido a las '+TimeToStr(Time);
end;

procedure Tfrmmsn.conecto(mensaje:string);
var entrou,ban:boolean; user,area:string; x,y:integer;
begin
  entrou:=false;
  ban:=false;
  user:='';
  area:='';
  for x := 9  to length(mensaje) do
    begin
      if (mensaje[x]='~') and (entrou=false) then
        entrou:=true;
      if entrou=false then
        begin
          area:=area+mensaje[x];
        end;
      if entrou then
      begin
        if mensaje[x]<>'~' then
          user:=user+mensaje[x];
      end;
    end;

    for x :=0  to listausuarios.Items.Count-1 do
    begin
      if lowercase(listausuarios.Items[x].text)=lowercase(area) then
      begin
        for y :=0  to listausuarios.Items[x].Count-1 do
        begin
          if listausuarios.Items[x].Item[y].Text=user then
            ban:=true;
        end;
        if ban=false then
          listausuarios.Items.AddChildFirst(listausuarios.Items[x],user);
      end;
    end;
end;

procedure tfrmmsn.desconecto(mensaje:string);
var user:string; x,y:integer;  ban:Boolean;
begin
  for x:=12 to length(mensaje) do
  begin
     user:=user+mensaje[x];
  end;
  ban:=false;
  for x :=0  to listausuarios.Items.Count-1 do
  begin
    for y :=0  to listausuarios.Items[x].Count-1 do
    begin
      if listausuarios.Items[x].Item[y].Text=user then
      begin
        if user=destino then
            application.MessageBox(pchar('El usuario '+user+' se desconecto'),'Aviso',MB_OK+MB_ICONWARNING);
        listausuarios.Items[x].Item[y].delete;
        destino:='';
        ban:=true;
        break;
      end;
    end;
      if ban then
        break;
  end;
end;


procedure Tfrmmsn.listausuariosDblClick(Sender: TObject);
var asel:string;
begin
    contestar:=true;
    asel:=lowercase(listausuarios.Selected.Text);
    if (asel='administracion') or (asel='caja') or (asel='central') or (asel='cobranza') or (asel='contabilidad') or (asel='contabilidad') or (asel='direccion')
        or (asel='instalaciones') or (asel='servicios') or (asel='sistemas') or (asel='ventas') then
    begin
        listausuarios.Selected.Selected:=false;
    end
    else
    begin
      if listausuarios.Selected.SelectedIndex>-1 then
      begin
        destino:=listausuarios.Selected.Text;
        labeluser.Caption:='Conversacion con Usuario: '+destino;
        edEnviar.SetFocus;
      end;
    end;


end;

procedure Tfrmmsn.FormCreate(Sender: TObject);
begin
  contestar:=false;
end;

end.


