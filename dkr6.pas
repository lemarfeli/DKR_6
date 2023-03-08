uses crt;
type
  u = string;
  pitem = ^item;
  item = record
    data: u;
    next: pitem;
  end;

  ul = record
    data: array[1 .. 100] of item;
    first, last: pitem;
    el: integer;
  end;

procedure writemenu;
const
  menu: array[1..4] of string =
('выбор размера списка',
 'ввод элементов списка',
 'визуализация содержимого',
 'выход');
begin
  clrscr;
  println('Меню работы с программой:');
  for var i:= 1 to 4 do
    begin
      println(i,'-',menu[i]);
    end;
end;

procedure list(var v:integer);
begin
 v:=readinteger('Введите количество элементов списка n<=100 : ');
end;

procedure name(var l: ul);
begin
  l.first := nil; 
  l.last := nil; 
  l.el := 1;
end;

procedure add(var l: ul; value: u);
var p: pitem;
begin
  p := @(l.data[l.el]); 
  inc(l.el);
  p^.data := value;
  p^.next := nil;
  if l.first = nil then l.first := p
  else l.last^.next := p;
  l.last := p
end;

procedure it(var sp: ul; v: integer; var s: string);
begin
  println('Заполните список:');
  for var i :=0 to v do begin
    readln(s);
    add(sp, s); 
  end;
  println('Список заполнен');
end;

procedure pr(var l: ul);
var p: pitem;
begin
  p := l.first;
  while (p<>nil) do begin
    println(p^.data);
    p := p^.next
  end;
end;

begin
var sp: ul;
var v: integer;
var s: string;
var d: char;
writemenu;
name(sp);
while true do begin
d:=ReadKey;
clrscr;
 case d of 
   '1': list(v);
   '2': it(sp, v, s);
   '3': pr(sp);
   '4': exit;
   '0': writemenu;
 end; 
if d<>'0' then println('чтобы вернуться в меню нажмите 0');
end;
end.