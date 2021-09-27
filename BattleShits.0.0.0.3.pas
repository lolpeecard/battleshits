program BattleShits;
var
   player: array [0..10, 0..10] of integer;
   playerattack: array [0..10, 0..10] of integer;
   bot: array [0..10, 0..10] of integer;
   botattack: array [0..10, 0..10] of integer;
   b,i,j,x,y,k,l,s,z: integer;
   Letter,Direction: char;
   hit, miss, skip, win: integer;
   Error: integer;

Procedure Blankstart;
    Begin
        //blank dem boards
        for i:=0 to 9 do
            for j:=0 to 9 do
                player[i,j] := 1;
        for i:=0 to 9 do
            for j:=0 to 9 do
                playerattack[i,j] := 1;
        for i:=0 to 9 do
            for j:=0 to 9 do
                bot[i,j] := 1;
        for i:=0 to 9 do
            for j:=0 to 9 do
                botattack[i,j] := 1;
    End;

Procedure BotTurn;
//at first this bot is just gonna randomly attack, i may make it smarter later
    Begin
        //resetting variables
        Miss := 0;
        Hit := 0;
        Skip := 1;
        for b:=0 to 99 do
        begin
            if skip = 1 then
                begin
                    if miss = 0 then
                        begin
                            if hit = 0 then
                                begin
                                    x := Random(10);
                                    y := Random(10);
                                    // 1 = sea 2 = ship 3 = hit 4 = miss
                                    //check to see if bot has already attacked that square
                                    if botattack[x,y]>1 then skip := 1 else
                                       begin 
                                            if player[x,y]=2 then 
                                                begin
                                                    hit := 1;
                                                    botattack[x,y] := 3;
                                                    player[x,y] := 3;
                                                    skip := 0;
                                                    writeln('Bot hit');
                                                end;
                                            if player[x,y]=1 then 
                                                begin
                                                    miss := 1;
                                                    botattack[x,y] := 4;
                                                    skip := 0;
                                                write('Bot miss');
                                                end;
                                        end;
                                end;
                        end;
                end;                            
        end;
    end;

Procedure DrawBoard(Title : integer);
//Title 1 = Your Board 2 = Attack Board
    Begin
    writeln;
    if Title=1 then writeln('                   Your Board')
        else if Title=2 then writeln('                   Attack Board');
        writeln ('    | A | B | C | D | E | F | G | H | I | J |');
        for j:=0 to 9 do
        begin
            write ('| '); write(j); write(' ');
                for i:=0 to 9 do
                // 1 = sea 2 = ship 3 = hit 4 = miss
                    if player[i,j]=1 then write('|   ') 
                        else if player[i,j]=2 then write('| @ ')
                            else if player[i,j]=3 then write('| X ')
                                else if player[i,j]=4 then write('| O ') ;
            write ('|');
            writeln;
        end;
    end;


Procedure Stupid;
    begin
        Writeln('you are stupid pick something that works');
        Error := 1;
    end;

Procedure XLine;
    Begin
        X := ord(Letter);
        //correcting for peeps using capital vs lower case
        if (X < 97) then X := X + 32;
            //making a = 0
            X := ord(letter);
            X := X - 97;
            // check to see if they picked a letter on the board
        if (X > -1) and ( X < 10) then Error := 0;
    End;

Procedure AddBoat(S : integer);
    Begin
        for k:= 0 to 9 do
            begin
                if Error = 1 then
                    begin
                        DrawBoard(1);
                        writeln;
                        writeln ('Place dis damn boat, shits as big as ', s);
                        writeln ('Please enter the X coordinate for your boat (use the letter idiot)');
                        readln(Letter);
                        Xline;
                        If Error = 0 then 
                        begin;
                            writeln ('Please enter the Y coordinate for your boat (use the number idiot)');
                            readln(y);
                            writeln ('Which way this shit go? D for Down, R for right)');
                            readln(Direction);
                            If Direction='D' then Direction:='d';
                            If Direction='R' then direction:='r';
                            If Direction='r' then
                                if x + s < 9 then
                                    begin
                                        for L:= 0 to (S) do
                                        Begin
                                            //reset error
                                            Error := 0;
                                            x := x + L;
                                            if player[x,y] = 2 then
                                                 Stupid;
                                            player[x,y] :=2;
                                            x := x - L;
                                        end;
                                end;
                        If Direction='d' then
                            if y + s < 9 then
                                begin
                                    for L:= 0 to (S) do
                                    Begin
                                        //reset error
                                        Error := 0;
                                        y := y + L;
                                        if player[x,y] = 2 then
                                             Stupid;
                                        player[x,y] :=2;
                                        y := y - L;
                                    end;
                                end;
                        end;
                    end;
            end;
        Error := 1;
    end;

Procedure Checkwin;
    Begin
        //defaulting to win and it will check if you haven't
        win := 1;
        for i:=0 to 9 do
                for j:=0 to 9 do
                    begin
                        if player[i,j] = 2 then 
                            begin
                                win := 0;
                                writeln;
                               
                            end;
                        if bot[i,j] = 2 then 
                            begin
                                win := 0;
                                writeln;
                                
                            end;
                        end;
    End;

begin
    //defaulting error to 1 I really should use boolean but I'm too lazy
    Blankstart;
    writeln ('Welcome to battleshits, the shit i made in spare time to see if im faster to release than clint');
    writeln;
    writeln ('First things first, we have to set up your board, dumbass');
    writeln;
    //Add all the players boats
    Addboat(5);
    Addboat(4);
    Addboat(3);
    Addboat(3);
    Addboat(2);
    DrawBoard(1);


for z := 1 to 99 do
If Win = 1 then writeln('hope you enjoyed the shits') else
begin
    Botturn;
    DrawBoard(1);
    CheckWin;
end;

end.
