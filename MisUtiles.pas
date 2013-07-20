unit MisUtiles;

interface

uses Classes, SysUtils, Controls, Types, Windows, WinSock, ActnList, Graphics;

type
  TRCompareVersion = (rcvMayor, rcvMenor, rcvIgual);

function GetPassWord(S: string): string;
function GetFileVersion(FName: string): string;
function ComparaVersiones(V1, V2: string): TRCompareVersion;
function FormatoLargo(D: TDate): string;
function IsGoodIPAddress(S: string): boolean;
function getIPs: TStrings;
function SetTextUpperCaseFirstChart(S: string): string;
function GetToken(Cadena, Separador: string; Token: integer): string;
function GetTokenCount(Cadena, Separador: string): integer;

const
  NombreMes: array[1..12] of
  string = ('Enero', 'Febrero', 'Marzo', 'Abril', 'Mayo', 'Junio', 'Julio',
    'Agosto', 'Septiembre', 'Octubre', 'Noviembre', 'Diciembre');
  NombreDias: array[1..7] of
  string = ('Domingo', 'Lunes', 'Martes', 'Miercoles', 'Jueves', 'Viernes',
    'Sabado');

var
  TituloApp: string = 'PC Sistemas';
  ColorControles: TColor = clMoneyGreen;
  UltimaAccion: TAction = nil;

implementation

function GetToken(Cadena, Separador: string; Token: integer): string;
var
  Posicion: integer;
begin
  while Token > 1 do
    begin
      Delete(Cadena, 1, Pos(Separador, Cadena));
      Dec(Token);
    end;
  Posicion := Pos(Separador, Cadena);
  if Posicion = 0 then
    begin
      Result := cadena
    end
  else
    begin
      Result := Copy(Cadena, 1, Posicion - Length(Separador))
    end;
end;

function GetTokenCount(Cadena, Separador: string): integer;
var
  Posicion: integer;
begin
  Posicion := Pos(Separador, Cadena);
  Result := 1;

  if Cadena <> '' then
    begin
      if Posicion <> 0 then
        begin
          while Posicion <> 0 do
            begin
              Delete(Cadena, 1, Posicion);
              Posicion := Pos(Separador, Cadena);
              Inc(Result);
            end
        end;
    end
  else
    begin
      Result := 0
    end;
end;

function getIPs: TStrings;
type
  TaPInAddr = array[0..10] of PInAddr;
  PaPInAddr = ^TaPInAddr;
var
  phe: PHostEnt;
  pptr: PaPInAddr;
  Buffer: array[0..63] of char;
  I: integer;
  GInitData: TWSAData;
begin
  WSAStartup($101, GInitData);
  Result := TStringList.Create;
  Result.Clear;
  GetHostName(Buffer, SizeOf(Buffer));
  phe := GetHostByName(buffer);
  if phe = nil then
    begin
      Exit
    end;
  pPtr := PaPInAddr(phe^.h_addr_list);
  I := 0;
  while pPtr^[I] <> nil do
    begin
      Result.Add(inet_ntoa(pptr^[I]^));
      Inc(I);
    end;
  WSACleanup;
end;

function IsGoodIPAddress(S: string): boolean;
var
  I: integer;
begin
  Result := False;
  if S <> '' then
    begin
      for I := 1 to Length(S) do
        begin
          if not (S[I] in ['0'..'9', '.']) then
            begin
              Exit
            end
        end;
      Result := True;
    end;
end;

function GetPassWord(S: string): string;

  function EncriptarChar(y, i: byte): byte;
  var
    x: integer;
  begin
    x := y * i;
    Result := Round(Sin(X / 60) * 137 / X + X * 791) mod 255;
  end;

var
  i: integer;
begin
  Result := '';
  for i := 1 to Length(S) do
    begin
      Result := Result + IntToHex(EncriptarChar(Ord(S[i]), i), 2)
    end;
end;

function GetFileVersion;
var
  Size, Size2: DWord;
  Pt, Pt2: Pointer;
begin
  Size := GetFileVersionInfoSize(PChar(FName), Size2);
  if Size > 0 then
    begin
      GetMem(Pt, Size);
      try
        GetFileVersionInfo(PChar(FName), 0, Size, Pt);
        VerQueryValue(Pt, '\', Pt2, Size2);
        with TVSFixedFileInfo(Pt2^) do
          begin
            Result := IntToStr(HiWord(dwFileVersionMS)) + '.' +
              IntToStr(LoWord(dwFileVersionMS)) + '.' +
              IntToStr(HiWord(dwFileVersionLS)) + '.' +
              IntToStr(LoWord(dwFileVersionLS));
          end;
      finally
        FreeMem(Pt);
      end;
    end
  else
    begin
      Result := ''
    end;
end;

function ComparaVersiones(V1, V2: string): TRCompareVersion;
var
  i: integer;
begin
  if V1 = V2 then
    begin
      Result := rcvIgual
    end
  else
    begin
      for i := 1 to 4 do
        begin
          if StrToIntDef(GetToken(V1, '.', i), 0) > StrToIntDef(GetToken(V2,
            '.', i), 0) then
            begin
              Result := rcvMayor;
              Exit;
            end
          else
            begin
              if StrToIntDef(GetToken(V1, '.', i), 0) <
                StrToIntDef(GetToken(V2, '.', i), 0) then
                begin
                  Result := rcvMenor;
                  Exit;
                end
              else
                begin
                  Result := rcvIgual
                end
            end;
        end;
    end;
end;

function formatolargo(D: TDate): string;
var
  dia, mes, ano: word;
begin
  DecodeDate(D, ano, mes, dia);
  Result := NombreDias[DayOfWeek(D)];
  Result := Result + ', ' + NombreMes[mes] + ' ' + IntToStr(Dia) +
    ' de ' + IntToStr(ano);
end;

function SetTextUpperCaseFirstChart(S: string): string;
var
  i: integer;
  cad, cad2: string;
begin
  cad := AnsiLowerCase(S);
  for i := 0 to length(cad) do
    begin
      if (i = 1) or (cad[i - 1] in [' ']) then
        begin
          cad2 := cad[i];
          cad[i] := AnsiUpperCase(cad2)[1];
        end;
    end;
  Result := cad;
end;

end.
