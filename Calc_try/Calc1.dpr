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
s:='����������� �����������';
writeln(s:(60+length(s) div 2));
s:='��������:  +, -, *, /(div), %(mod), ^(�������) ';
writeln(s:(60+length(s) div 2));
repeat
  try
    writeln('������� a');
    readln(s);
    a:=strtoint(s);
    writeln('������� ����');
    readln(m);
    writeln('������� b');
    readln(s);
    b:=strtoint(s);
    case m of
    '+':c:=a+b;
    '-':c:=a-b;
    '*':c:=a*b;
    '%':c:=a mod b;
    '/':c:=a div b;
    '^':begin
       if b<0 then raise Exception.Create('������������� �������!');
       c:=1;
       for I := 1 to b do
       c:=c*a;
       end;
    else raise Exception.Create('�������� �����������: '+ m);
    end;  //case
    writeln(c);
  except
    on EConvertError do writeln('������ � ������ ��������!');
    on ERangeError do writeln('������������ �����');
    on EDivByZero do writeln('�� 0 �� �����');
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
until false;
end.
