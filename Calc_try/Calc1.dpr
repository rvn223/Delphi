program Calc1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
type mytype=int8;
var i,a,b,c:mytype;
s:string;
m:char;
begin
s:='Неубиваемый калькулятор';
writeln(s:(60+length(s) div 2));
s:='Операции:  +, -, *, /(div), %(mod), ^(степень) ';
writeln(s:(60+length(s) div 2));
repeat
  try
    writeln('Введите a');
    readln(s);
    a:=strtoint(s);
    writeln('Введите знак');
    readln(m);
    writeln('Введите b');
    readln(s);
    b:=strtoint(s);
    case m of
    '+':c:=a+b;
    '-':c:=a-b;
    '*':c:=a*b;
    '%':c:=a mod b;
    '/':c:=a div b;
    '^':begin
       if b<0 then raise Exception.Create('Отрицательная степень!');
       c:=1;
       for I := 1 to b do
       c:=c*a;
       end;
    else raise Exception.Create('Операция отсутствует: '+ m);
    end;  //case
    writeln(c);
  except
    on EConvertError do writeln('Ошибка в записи операнда!');
    on ERangeError do writeln('Переполнение числа');
    on EDivByZero do writeln('на 0 не делим');
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
until false;
end.
