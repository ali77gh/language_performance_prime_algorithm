{$mode delphi}
program count_primes;

uses Math, SysUtils, DateUtils;

function is_prime(n: Integer): Boolean;
var
  i, end_val: Integer;
begin
  Result := False;
  if n <= 1 then
    Exit;
  
  end_val := Trunc(Sqrt(n));
  for i := 2 to end_val do
    if n mod i = 0 then
      Exit;
  Result := True;
end;

var
  start_time, end_time: TDateTime;
  c: Int64;
  i: Integer;
begin
  start_time := Now;
  c := 0;
  for i := 0 to 8999999 do begin
    if is_prime(i) then begin
      Inc(c);
    end;
  end;
  writeln(c);
  end_time := Now;
  writeln(MilliSecondsBetween(end_time, start_time), 'ms');
end.

// compile command: fpc -O3 prime.pas
