program Project1;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils;
type tsa = array [1..1000] of byte;
var s1,s2 : shortstring;
    s4: string[10];
    s5 :string;
    m1,m2 : tsa;
    m3 :tsa;
    m4,m5 : array of byte;
    m6 : array of array of array of byte;
    i, j, k : int32;
    eq:boolean;
    rec1,rec2 : record
                i,j:byte;
                c:ansichar;
                s:shortstring;
                ar : array [1..4] of byte;
                end;
begin
randomize;
  repeat
  writeln('Enter new string > ');
  readln(s1);
  s2:=s1;
  writeln('Adress shortstrings: ',int32(@s1[1]),' ',int32(@s2[1]),#10,s2);
  s4:=s1;
  for I := 1  to length(s1) do
   if s1[i]<>s4[i] then
   begin
        writeln('s1 <> s4');
        break;
   end;
  //
  for i :=1 to 1000 do
    m1[i]:=random(256);
  m2:=m1;
  writeln('Adress stat arrays: ',int32(@m1[1]),' ',int32(@m2[1]));
  eq:=true;
  for i:=1 to 1000 do
    if m1[i]<>m2[i] then
      begin
      writeln('Not eq!');
      eq:=false;
      break;
      end;
    if eq then writeln('m1 = m2 !') else writeln('m1 <> m2 !');
    //
    m3:=m1;
    writeln('Adress stat arrays: ',int32(@m1[1]),' ',int32(@m3[1]));
  eq:=true;
  for i:=1 to 1000 do
    if m1[i]<>m3[i] then
      begin
      writeln('Not eq!');
      eq:=false;
      break;
      end;
    if eq then writeln('m1 = m3 !') else writeln('m1 <> m3 !');
    //ƒобавл€ем динамический массив
    setlength(m4,1000);
    //m4:=m1; //syntax Error
    setlength(m5,1100);
    for i :=1 to 1000 do
      m4[i]:=random(256);
  writeln('Adress din array (before copy): ',int32(@m4[1]),' ',int32(@m5[1]));
    m5:=m4;
  writeln('Adress din array (after copy): ',int32(@m4[1]),' ',int32(@m5[1]));
  m5[0]:=0;
  writeln('Adress din array (after m5[0]:=0): ',int32(@m4[1]),' ',int32(@m5[1]));
  readln;
  eq:=true;
  for i:=1 to 1000 do
    if m4[i]<>m5[i] then
      begin
      writeln('Not eq!');
      eq:=false;
      break;
      end;
    if eq and (@m4[0]<>@m5[0]) then writeln('m4 = m5 !') else writeln('m4 <> m5 !');
    m4:=nil;
    m5:=nil;
// ћногомерные массивы
setlength(m6,10); // 1 мерный
for i:=0 to 9 do
  setlength(m6[i],10);//setlength(m6,10,10); 2 мерный массив
for i := 0 to 9 do
  for j:=0 to 9 do
    setlength(m6[i,j],20);// 3
with rec1 do
begin
  i:=1;
  j:=2;
  c:='z';
  s:='Hello, world';
  ar[1]:=i; ar[2]:=j; ar[3]:=3;ar[4]:=4;
end;
rec2:=rec1;
writeln('Adress rec1,rec2=',uint32(@rec1),' ',uint32(@rec2));
writeln(rec2.s);
writeln('Size rec=',uint32(@rec2)-uint32(@rec1),'=',sizeof(rec1));
  until false;
end.
