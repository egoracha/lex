program lexer;
const tab = ^I;
var look: char;









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

function getname:char;
begin
 if not isalpha(look) then expected('Name');
 getname := upcase(look);
 GetChar;
end;

function getnum:char;
begin
 if not isdigit(look) then expected ( 'integer');
 getnum :=look;
 getchar;
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



procedure expression;forward;

procedure factor;
begin
 if look= '(' then begin
  Match('(');
  expression;
  match(')');
  end
 else
  emitln('move#' + getnum + 'D0')
end;

procedure multiply;
begin
 match('*');
 factor;
 emitln('muls(sp)+,d0');
end;


procedure divide;
begin
 match('/');
 factor;
 emitln('move(sp)+,d1');
 emitln('divs d1,d0');
end;

procedure term;
begin

 while look in ['*','/'] do begin
  emitln('move d0,-(sp)');
  case look of
  '*':multiply;
  '/':divide;
  else expected('mulop');
  end;
 end;
end;

procedure Add;
begin
 match ('+');
 term;
 emitln('add (sp) +, D0');
end;

procedure subtract;
begin
 match('-');
 term;
 emitln('sub (sp)+,d0');
 emitln('neg d0');
end;

function isaddop(c: char):boolean;
begin
 isaddop := c in ['+','-'];
end;


procedure expression;
begin
 if IsAddop(look) then
 emitln('clr d0')
 else
 term;
 while look in ['+', '-'] do begin
  emitln ('move d0,-(sp)');
  case look of
  '+':add;
  '-':subtract;
  else expected('addop');
  end;
 end;
end;















begin
 expression;
 init;
end.