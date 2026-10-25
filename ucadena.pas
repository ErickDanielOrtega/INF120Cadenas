
unit UCadena;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils;

type
  TCadena = class
  private
    FCadena: string;

    function InicioPalabra(NumPalabra: Integer): Integer;
    function FinPalabra(NumPalabra: Integer): Integer;

  public
    constructor Create;

    procedure SetCadena(S: string);
    function GetCadena: string;

    procedure addChar(C: Char);
    procedure insChar(C: Char; Posicion: Integer);
    procedure elimChar(Posicion: Integer);
    procedure interChar(P1, P2: Integer);
    function cantChar: Integer;
    function getChar(Posicion: Integer): Char;
    function busqChar(C: Char): Integer;
    function cantPal: Integer;
    procedure insPal(Palabra: string; Posicion: Integer);
    procedure elimPal(Posicion: Integer);
    procedure cambPal(Posicion: Integer; Nueva: string);
    function buscPal(Palabra: string): Integer;
    procedure addPal(Palabra: string);
    procedure invertir;
    procedure rotar;
    procedure mayusculas;
    procedure minusculas;
    procedure Titulo;
  end;

implementation

constructor TCadena.Create;
begin
  FCadena := '';
end;

procedure TCadena.SetCadena(S: string);
begin
  FCadena := S;
end;

function TCadena.GetCadena: string;
begin
  Result := FCadena;
end;

procedure TCadena.addChar(C: Char);
begin
  FCadena := FCadena + C;
end;


procedure TCadena.insChar(C: Char; Posicion: Integer);
begin
  if (Posicion >= 1) and
     (Posicion <= Length(FCadena) + 1) then
    Insert(C, FCadena, Posicion);
end;


procedure TCadena.elimChar(Posicion: Integer);
begin
  if (Posicion >= 1) and
     (Posicion <= Length(FCadena)) then
    Delete(FCadena, Posicion, 1);
end;


procedure TCadena.interChar(P1, P2: Integer);
var
  Aux: Char;
begin
  if (P1>= 1) and (P1 <= Length(FCadena)) and
     (P2 >= 1) and (P2 <= Length(FCadena)) then
  begin
    Aux := FCadena[P1];
    FCadena[P1]  := FCadena[P2];
    FCadena[P2] := Aux;
  end;
end;


function TCadena.cantChar: Integer;
begin
  Result := Length(FCadena);
end;


function TCadena.getChar(Posicion: Integer): Char;
begin
  Result := #0;

  if (Posicion>= 1) and
     (Posicion <= Length(FCadena)) then
    Result := FCadena[Posicion];
end;


function TCadena.busqChar(C: Char): Integer;
var
  I: Integer;
begin
  Result := 0;

  for I := 1to Length(FCadena) do
  begin
    if FCadena[I] = C then
    begin
      Result := I;
      Exit;
    end;
  end;
end;


function TCadena.cantPal: Integer;
var
  I: Integer;
  Dentro: Boolean;
begin
  Result := 0;
  Dentro := False;

  for I := 1 to Length(FCadena) do
  begin
    if FCadena[I] > ' ' then
    begin
      if not Dentro then
      begin
        Inc(Result);
        Dentro  := True;
      end;
    end
    else
      Dentro := False;
  end;
end;


function TCadena.InicioPalabra(NumPalabra: Integer): Integer;
var
  I, Contador: Integer;
  Dentro: Boolean;
begin
  Result := 0;
  Contador := 0;
  Dentro := False;

  if NumPalabra < 1 then
    Exit;

  for I := 1 to Length(FCadena) do
  begin
    if FCadena[I] > ' ' then
    begin
      if not Dentro then
      begin
        Inc(Contador);
        Dentro := True;

        if Contador = NumPalabra then
        begin
          Result := I;
          Exit;
        end;
      end;
    end
    else
      Dentro := False;
  end;
end;

function TCadena.FinPalabra(NumPalabra: Integer): Integer;
var
  I: Integer;
begin
  Result := 0;
  I := InicioPalabra(NumPalabra);

  if I = 0 then
    Exit;

  while (I <= Length(FCadena)) and
        (FCadena[I] > ' ') do
    Inc(I);

  Result := I - 1;
end;


procedure TCadena.insPal(Palabra: string; Posicion: Integer);
var
  P, Total: Integer;
begin
  if Palabra = '' then
    Exit;

  Total := cantPal;

  if (Posicion < 1) or (Posicion > Total + 1) then
    Exit;

  if Posicion = Total + 1 then
  begin
    addPal(Palabra);
    Exit;
  end;

  P := InicioPalabra(Posicion);
  Insert(Palabra + ' ', FCadena, P);
end;

procedure TCadena.elimPal(Posicion: Integer);
var
  P1, P2: Integer;
begin
  P1 := InicioPalabra(Posicion);
  P2 := FinPalabra(Posicion);

  if P1 = 0 then
    Exit;

  while (P2 < Length(FCadena)) and
        (FCadena[P2 + 1] <= ' ') do
    Inc(P2);

  if P2 = Length(FCadena) then
  begin
    while (P1 > 1) and
          (FCadena[P1 - 1] <= ' ') do
      Dec(P1);
  end;

  Delete(FCadena, P1, P2 - P1 + 1);
end;

procedure TCadena.cambPal(Posicion: Integer; Nueva: string);
var
  P1, P2: Integer;
begin
  P1 := InicioPalabra(Posicion);
  P2 := FinPalabra(Posicion);

  if P1 = 0 then
    Exit;

  Delete(FCadena, P1, P2 - P1 + 1);
  Insert(Nueva, FCadena, P1);
end;

function TCadena.buscPal(Palabra: string): Integer;
var
  I, P1, P2: Integer;
  Aux: string;
begin
  Result := 0;

  for I := 1 to cantPal do
  begin
    P1 := InicioPalabra(I);
    P2 := FinPalabra(I);

    Aux := Copy(FCadena, P1, P2 - P1 + 1);

    if Aux = Palabra then
    begin
      Result := I;
      Exit;
    end;
  end;
end;

procedure TCadena.addPal(Palabra: string);
begin
  if Palabra = '' then
    Exit;

  if FCadena = '' then
    FCadena := Palabra
  else
  begin
    if FCadena[Length(FCadena)] > ' ' then
      FCadena := FCadena + ' ';

    FCadena := FCadena + Palabra;
  end;
end;

procedure TCadena.invertir;
var
  I, J: Integer;
  Aux: Char;
begin
  I := 1;
  J := Length(FCadena);

  while I < J do
  begin
    Aux := FCadena[I];
    FCadena[I] := FCadena[J];
    FCadena[J] := Aux;

    Inc(I);
    Dec(J);
  end;
end;

procedure TCadena.rotar;
var
  Ultimo: Char;
begin
  if Length(FCadena) <= 1 then
    Exit;

  Ultimo := FCadena[Length(FCadena)];

  Delete(FCadena, Length(FCadena), 1);
  Insert(Ultimo, FCadena, 1);
end;

procedure TCadena.mayusculas;
begin
  FCadena := AnsiUpperCase(FCadena);
end;

procedure TCadena.minusculas;
begin
  FCadena := AnsiLowerCase(FCadena);
end;

procedure TCadena.Titulo;
var
  I: Integer;
  Inicio: Boolean;
begin
  FCadena := AnsiLowerCase(FCadena);
  Inicio := True;

  for I := 1 to Length(FCadena) do
  begin
    if FCadena[I] <= ' ' then
      Inicio := True
    else
    begin
      if Inicio then
      begin
        FCadena[I] := UpCase(FCadena[I]);
        Inicio := False;
      end;
    end;
  end;
end;

end.

