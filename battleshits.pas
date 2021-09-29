
Program BattleShits;

Uses Crt;

Var 
  player: array [0..10, 0..10] Of integer;
  playerattack: array [0..10, 0..10] Of integer;
  bot: array [0..10, 0..10] Of integer;
  botattack: array [0..10, 0..10] Of integer;
  b,i,j,x,y,k,l,z: integer;
  Letter,Direction: char;
  hit, miss, skip, win: integer;
  Error: integer;
  ch: char;


Procedure Blankstart;
Begin
  //blank dem boards
  For i:=0 To 9 Do
    For j:=0 To 9 Do
      Begin
        player[i,j] := 1;
        playerattack[i,j] := 1;
        bot[i,j] := 1;
        botattack[i,j] := 1;
      End;
End;


Procedure DrawBoard(Title : integer);
//Title 1 = Your Board 2 = Attack Board
Begin
  writeln;
  If Title=1 Then
    Begin
      writeln('                   Your Board');
      writeln('    | a | b | c | d | e | f | g | h | i | j |');
      For j:=0 To 9 Do
        Begin
          write ('| ');
          write(j);
          write(' ');
          For i:=0 To 9 Do
            // 1 = sea 2 = ship 3 = hit 4 = miss
            If player[i,j]=1 Then write('|   ')
            Else If player[i,j]=2 Then
                   //poop is brown
                   Begin
                     write('| ');
                     TextColor(Brown);
                     Write('@ ');
                     TextColor(White);
                   End;
          write ('|');
          writeln;
        End;
    End;

  If Title=2 Then
    Begin
      writeln('                   Attack Board');
      writeln('    | a | b | c | d | e | f | g | h | i | j |');
      For j:=0 To 9 Do
        Begin
          write ('| ');
          write(j);
          write(' ');
          For i:=0 To 9 Do
            // 1 = sea 2 = ship 3 = hit 4 = miss
            If playerattack[i,j]=1 Then write('|   ')
            Else If playerattack[i,j]=2 Then write('| @ ')
            Else If playerattack[i,j]=3 Then
                   Begin
                     write('| ');
                     TextColor(Brown);
                     Write('X ');
                     TextColor(White);
                   End
            Else If playerattack[i,j]=4 Then write('| O ') ;
          write ('|');
          writeln;
        End;
    End;
End;


Procedure Stupid;
Begin
  ClrScr;
  writeln;
  Writeln('you are stupid pick shit that works');
  writeln;
  writeln('press any key to continue');
  Error := 1;
  ch := readkey;
End;

Procedure XLine;
Begin
  X := ord(Letter);
  //correcting for peeps using capital vs lower case
  If (X < 97) Then X := X + 32;
  //making a = 0
  X := ord(letter);
  X := X - 97;
  // check to see if they picked a letter on the board
  If (X > -1) And ( X < 10) Then Error := 0;
End;

Procedure BotTurn;
//at first this bot is just gonna randomly attack, i may make it smarter later
Begin
  //resetting variables
  Miss := 0;
  Hit := 0;
  Skip := 1;
  For b:=0 To 99 Do
    Begin
      If skip = 1 Then
        Begin
          If miss = 0 Then
            Begin
              If hit = 0 Then
                Begin
                  x := Random(10);
                  y := Random(10);
                  // 1 = sea 2 = ship 3 = hit 4 = miss
                  //check to see if bot has already attacked that square
                  If botattack[x,y]>1 Then skip := 1
                  Else
                    Begin
                      If player[x,y]=2 Then
                        Begin
                          hit := 1;
                          botattack[x,y] := 3;
                          player[x,y] := 3;
                          skip := 0;
                          DrawBoard(1);
                          writeln;
                          writeln('Bot hit');
                          ch := readkey;
                        End;
                      If player[x,y]=1 Then
                        Begin
                          miss := 1;
                          botattack[x,y] := 4;
                          skip := 0;
                          DrawBoard(1);
                          writeln;
                          write('Bot miss');
                          ch := readkey;
                        End;
                    End;
                End;
            End;
        End;
    End;
End;


Procedure AddBoat(S : integer);
Begin

  Error := 1;
  For k:= 0 To 9 Do
    ClrScr;
  Begin
    If Error = 1 Then
      Begin
        DrawBoard(1);
        writeln;
        writeln ('Place dis damn shit, shits as big as ', s);
        writeln (





            'Please enter the X coordinate for your shit (use the letter idiot)'
        );
        readln(Letter);
        Xline;
        If Error = 0 Then
          Begin
            writeln (





            'Please enter the Y coordinate for your shit (use the number idiot)'
            );
            readln(y);
            writeln (
                     'Which way this shit go? D for Down, R for right)'
            );
            readln(Direction);
            If Direction='D' Then Direction := 'd';
            If Direction='R' Then direction := 'r';
            If Direction='r' Then
              If x + s < 9 Then
                Begin
                  For L:= 0 To (S) Do
                    Begin
                      //reset error
                      Error := 0;
                      x := x + L;
                      If player[x,y] = 2 Then Stupid
                      Else player[x,y] := 2;
                      x := x - L;
                    End;
                End;
            If Direction='d' Then
              If y + s < 9 Then
                Begin
                  For L:= 0 To (S) Do
                    Begin
                      //reset error
                      Error := 0;
                      y := y + L;
                      If player[x,y] = 2 Then
                        Stupid
                      Else
                        player[x,y] := 2;
                      y := y - L;
                    End;
                End;
          End;
      End;
  End;
  Error := 1;
End;


Procedure BotBoat(S : integer);
Begin
  Error := 1;
  For k:= 0 To 9001 Do
    Begin
      x := Random(10);
      y := Random(10);
      //z is gonna decide right or left
      z := random(2);
      If Error = 1 Then
        Begin
          If z=0 Then
            If x + s < 9 Then
              Begin
                For L:= 0 To (S) Do
                  Begin
                    //reset error
                    Error := 0;
                    x := x + L;
                    If bot[x,y] = 2 Then
                      Begin
                        error := 1;
                      End;
                    bot[x,y] := 2;
                    x := x - L;
                  End;
              End;
          If z=1 Then
            If y + s < 9 Then
              Begin
                For L:= 0 To (S) Do
                  Begin
                    //reset error
                    Error := 0;
                    y := y + L;
                    If bot[x,y] = 2 Then
                      error := 1;
                    bot[x,y] := 2;
                    y := y - L;
                  End;
              End;
        End;
    End;
End;

Procedure Checkwin;
Begin
  //defaulting to win and it will check if you haven't
  win := 1;
  For i:=0 To 9 Do
    For j:=0 To 9 Do
      Begin
        If player[i,j] = 2 Then
          Begin
            win := 0;
            writeln;
            If win = 1 Then writeln('lol u are shit');
          End;
        If bot[i,j] = 2 Then
          Begin
            win := 0;
            writeln;
            If win = 1 Then writeln('lol bot is shit');
          End;
      End;

End;

Procedure PlayerTurn;
Begin

  Miss := 0;
  Hit := 0;
  Skip := 1;
  For b:=0 To 99 Do
    Begin
      If skip = 1 Then
        Begin
          If miss = 0 Then
            Begin
              If hit = 0 Then
                Begin
                  DrawBoard(2);
                  writeln ('lets attack their shit');
                  writeln ('Please enter the X coordinate for your attack');
                  readln(Letter);
                  Xline;
                  If Error = 0 Then
                    Begin
                      writeln ('Please enter the Y coordinate for your attack' )
                      ;

                      readln(y);
                      If playerattack[x,y]>1 Then skip := 1
                      Else
                        Begin
                          If bot[x,y]=2 Then
                            Begin
                              hit := 1;
                              playerattack[x,y] := 3;
                              bot[x,y] := 3;
                              skip := 0;
                              writeln;
                              writeln('You hit');
                              ch := readkey;
                            End;
                          If bot[x,y]=1 Then
                            Begin
                              miss := 1;
                              playerattack[x,y] := 4;
                              skip := 0;
                              writeln;
                              write('You miss');
                              ch := readkey;
                            End;
                        End;
                    End;
                End;
            End;
        End;
    End;
End;

Procedure Drawbotboard;
//this chunk is just for debugging the bot generated shits
Begin
  writeln('                   Bot Board');
  writeln('    | A | B | C | D | E | F | G | H | I | J |');
  For j:=0 To 9 Do
    Begin
      write ('| ');
      write(j);
      write(' ');
      For i:=0 To 9 Do
        Begin
          // 1 = sea 2 = ship 3 = hit 4 = miss
          If bot[i,j]=1 Then write('|   ');
          If bot[i,j]=2 Then write('| @ ');
          If bot[i,j]=3 Then write('| X ');
          If bot[i,j]=4 Then write('| O ');
          write ('|');
        End;
      writeln;
    End;
End;

Procedure DankIntro;
Begin
  ClrScr;
  TextColor(Brown);
  Writeln(' __________         __    __  .__                .__    .__  __');
  Writeln(





      '\______   \_____ _/  |__/  |_|  |   ____   _____|  |__ |__|/  |_  ______'
  );
  Writeln(





      ' |    |  _/\__  \\   __\   __\  | _/ __ \ /  ___/  |  \|  \   __\/  ___/'
  );
  Writeln(





      ' |    |   \ / __ \|  |  |  | |  |_\  ___/ \___ \|   Y  \  ||  |  \___ \ '
  );
  Writeln(





      ' |______  /(____  /__|  |__| |____/\___  >____  >___|  /__||__| /____  >'
  );
  Writeln(





      '        \/      \/                     \/     \/     \/              \/ '
  );
  TextColor(white);
  Writeln;
  Writeln('                                  _______');
  Writeln('                               /        \___');
  Writeln('                               /_________|');
  Writeln('                             /         - |');
  Writeln('                            |____________|');
  Writeln('                            /        /    /');
  Writeln('                           /        /    /');
  Writeln('                          /        /    /');
  Writeln('                         /        /      -----|');
  Writeln('                        /        |____________|');
  Writeln('                 ______/          |');
  Writeln('                (                 |             ');
  Writeln('                (_______       ___|');
  TextColor(Brown);
  Write('                @');
  TextColor(white);
  writeln('       |      /  ');
  TextColor(Brown);
  Write('               @');
  TextColor(white);
  writeln('        /     /');
  TextColor(Brown);
  Write('              @');
  TextColor(white);
  writeln('        /     /');
  TextColor(Brown);
  Write('            @@');
  TextColor(white);
  writeln('        |______|');
  Writeln;
  Writeln;
  writeln (





'Welcome to battleshits, the shit i made in spare time to see if im faster to release than clint. press any key to continue'
  );
  Writeln;
  ch := readkey;
End;



Begin


  Blankstart;
  BotBoat(5);
  BotBoat(4);
  BotBoat(3);
  BotBoat(3);
  BotBoat(2);
  DankIntro;
  writeln;
  writeln ('First things first, we have to set up your board, dumbass');
  writeln;
  //Add all the players boats
  Addboat(5);
  Addboat(4);
  Addboat(3);
  Addboat(3);
  Addboat(2);
  //it's over 9000
  For z := 1 To 9001 Do
    Begin
      If win = 0 Then
        Begin
          PlayerTurn;
          CheckWin;
          BotTurn;
          checkwin;
        End;
    End;


End.
