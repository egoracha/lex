program lexer;
const tab= ^i; CR= ^M;
var look: char;
    token: string;









procedure getChar;
begin
 Read(look);
end;

Procedure Error(s:string);
begin
 writeln;
 writeln(^G, 'Error:', s,'.');
end;

procedure Abort (s:string);
begin
 error(s);
 halt;
end;

procedure expected(s:string);
begin
 Abort(s+'Expected');
end;

procedure match(x:char);
begin
 if look = x then getChar
 else expected('''' + x +'''');
end;


function isalpha ( c: char):boolean;
begin
 isAlpha :=upcase(c) in ['A'..'Z'];
end;


function isdigit(c:char):boolean;
begin
 isdigit := c in ['0'..'9'];
end;





procedure Emit(s: string);
begin
 write(tab,s);
end;


procedure emitln(s:string);
begin
 Emit(s);
 writeln;
end;


procedure init;
begin
 getchar;
end;














{====================LEXER==============}
function iswhite(c:char):boolean;
begin
 iswhite:=c in [' ', TAB];
end;


procedure skipwhite;
begin
 while iswhite(look) do
 getchar;
end;



function IsAlnum(c:char): boolean;
begin
 IsAlnum:= isalpha(c) or isdigit(c);
end;

function GetName: string;
var x:string;
begin x:='';
 if not isalpha(look) then expected ('Name');
 while isAlnum(look) do begin;
  x := x + upcase(look);
  getChar;
 end;
 getname:=x;
end;


function Getnum: string;
var x: string;
begin
 x:='';
 if not isdigit(look) then expected('integer');
 while isdigit(look) do begin
  x:=x+look;
  getchar;
 end;
 getnum:=x;
end;


function scan: string;
begin
 if isalpha(look) then
 scan := getname
 else if isdigit(look) then
  scan :=getnum
 else begin
  scan:=look;
  getchar;
  end;

end;





begin
 init;
 repeat
   token:=scan;
   writeln(token);
   until token = CR;
end.













