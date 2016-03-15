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



begin
 init;
end.