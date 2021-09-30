
Program battleshits;

//include my resources fool
{$R sounds.rc}

Uses 
Crt,
MMsystem;


Var 
  player: array [0..10, 0..10] Of integer;
  playerattack: array [0..10, 0..10] Of integer;
  bot: array [0..10, 0..10] Of integer;
  botattack: array [0..10, 0..10] Of integer;
  shitimation: array [0..10, 0..10] Of integer;
  b,i,j,x,y,k,l,z: integer;
  Letter,Direction: char;
  hit, miss, skip, win: integer;
  Error: integer;
  ch: char;

Procedure AnyKey;
Begin
  writeln;
  writeln ('press any key to continue');
  ch := readkey;
End;

Procedure ShitStory;
Begin
  //8|>-<op
  For i:=0 To 10 Do
    For j:=0 To 10 Do
      shitimation[i,j] := 1;
  For j:=0 To 6 Do
    For i:=10 Downto 0 Do
      Begin
        clrscr;
        Writeln('You did not vote so the neighbor is shitting your yard!');
        TextBackground(Green);
        shitimation[i,j] := 2;
        writeln(' ___________________________________________________');
        For k:=0 To 10 Do
          Begin
            write ('| ');
            For l:=0 To 6 Do
              Begin
                //write('       ');
                // 1 = sea 2 = ship 3 = hit 4 = miss
                If shitimation[k,l]=1 Then write('       ')
                Else If shitimation[k,l]=2 Then
                       Begin
                         TextColor(Black);
                         write('8|');
                         TextColor(yellow);
                         write('>-<o');
                         TextColor(Blue);
                         write('p');
                         TextColor(White);
                       End
                Else If shitimation[k,l]=3 Then
                       Begin
                         TextColor(Brown);
                         write('@      ');
                         TextColor(white);
                       End;
              End;
            writeln (' |');
          End;
        writeln('|___________________________________________________|');
        x := Random(2);
        If x=1 Then shitimation[i,j] := 3
        Else shitimation[i,j] := 1;
        delay(500);

      End;
  TextBackground(Black);
  writeln;
  writeln ('time to shit them back!');
  AnyKey;
End;

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
  AnyKey;
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

Procedure Oldbot;
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
                          AnyKey;
                        End;
                      If player[x,y]=1 Then
                        Begin
                          miss := 1;
                          botattack[x,y] := 4;
                          skip := 0;
                          DrawBoard(1);
                          writeln;
                          write('Bot miss');
                          AnyKey;
                        End;
                    End;
                End;
            End;
        End;
    End;
End;

Procedure BotHitCheck;
Begin
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
          AnyKey;
        End;
      If player[x,y]=1 Then
        Begin
          miss := 1;
          botattack[x,y] := 4;
          skip := 0;
          DrawBoard(1);
          writeln;
          write('Bot miss');
          AnyKey;
        End;
    End;
End;


Procedure Smartbot;
//this bot should check to see if it already has a hit and hit the squares around that first before it goes back to normal attack pattern
Begin
  //resetting variables
  Miss := 0;
  Hit := 0;
  Skip := 1;
  For b:=0 To 9000 Do
    Begin
      For j:=0 To 9 Do
        For i:=0 To 9 Do
          // 1 = sea 2 = ship 3 = hit 4 = miss
          //this may break by looking for negative in the array
          If player[i,j]=2 Then
            If player[i,(j-1)]=2 Then BotHitcheck
          Else If player[i,(j+1)]=2 Then BotHitcheck
          Else If player[(i-1),j]=2 Then BotHitcheck
          Else If player[(i+1),j]=2 Then BotHitcheck;
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
                  BotHitcheck;
                End;
            End;
        End;
    End;
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
        writeln ('Please enter the X coordinate for your shit (use the letter idiot)');
        readln(Letter);
        Xline;
        If Error = 0 Then
          Begin
            writeln ('Please enter the Y coordinate for your shit (use the number idiot)');
            readln(y);
            writeln ('Which way this shit go? D for Down, R for right)');
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
  BotBoat(s);
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
                      writeln ('Please enter the Y coordinate for your attack' );
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
  writeln;
  Writeln('__________         __    __  .__                .__    .__  __');
  Writeln('\______   \_____ _/  |__/  |_|  |   ____   _____|  |__ |__|/  |_  ______');
  Writeln(' |    |  _/\__  \\   __\   __\  | _/ __ \ /  ___/  |  \|  \   __\/  ___/');
  Writeln(' |    |   \ / __ \|  |  |  | |  |_\  ___/ \___ \|   Y  \  ||  |  \___ \ ');
  Writeln(' |______  /(____  /__|  |__| |____/\___  >____  >___|  /__||__| /____  >');
  Writeln('        \/      \/                     \/     \/     \/              \/ ');
  TextColor(white);
  Writeln;
  TextColor(Blue);
  Writeln('                                  _______');
  Writeln('                                /        \___');
  Writeln('                               /_________|');
  TextColor(Yellow);
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
  TextColor(Yellow);
  writeln('       |      /  ');
  TextColor(Brown);
  Write('               @');
  TextColor(Yellow);
  writeln('        /     /');
  TextColor(Brown);
  Write('              @');
  TextColor(Yellow);
  writeln('        /     /');
  TextColor(Brown);
  Write('            @@');
 TextColor(Yellow);
  writeln('        |______|');
  TextColor(White);
  Writeln;
  Writeln;
  writeln ('Welcome to battleshits, the shit i made in spare time to see if im faster to release than clint. ');
  AnyKey;
End;

Procedure DankerIntro;
Begin
  sndPlaySound(PChar('intro'), snd_Async or snd_NoDefault);
  For i:=0 To 33 Do
    Begin
      clrscr;
      TextColor(Brown);
      writeln;
      Writeln('__________         __    __  .__                .__    .__  __');
      Writeln('\______   \_____ _/  |__/  |_|  |   ____   _____|  |__ |__|/  |_  ______');
      Writeln(' |    |  _/\__  \\   __\   __\  | _/ __ \ /  ___/  |  \|  \   __\/  ___/');
      Writeln(' |    |   \ / __ \|  |  |  | |  |_\  ___/ \___ \|   Y  \  ||  |  \___ \ ');
      Writeln(' |______  /(____  /__|  |__| |____/\___  >____  >___|  /__||__| /____  >');
      Writeln('        \/      \/                     \/     \/     \/              \/ ');           
      TextColor(Blue);
      For j:=0 To i Do
        write(' ');
      Writeln('                       _______');
      For j:=0 To i Do
        write(' ');
      Writeln('                      /        \___');
      For j:=0 To i Do
        write(' ');
      Writeln('                     /_________|');
      For j:=0 To i Do
        write(' ');
      TextColor(Yellow);
      Writeln('                    /         - |');
      For j:=0 To i Do
        write(' ');
      Writeln('                   |____________|');
      For j:=0 To i Do
        write(' ');
      Writeln('                  /        /    /');
      For j:=0 To i Do
        write(' ');
      Writeln('                 /        /    /');
      For j:=0 To i Do
        write(' ');
      Writeln('                /        /    /');
      For j:=0 To i Do
        write(' ');
      Writeln('               /        /      -----|');
      For j:=0 To i Do
        write(' ');
      Writeln('              /        |____________|');
      For j:=0 To i Do
        write(' ');
      Writeln('       ______/          |');
      For j:=0 To i Do
        write(' ');
      Writeln('      (                 |             ');
      For j:=0 To i Do
        write(' ');
      Writeln('      (_______       ___|');
      For j:=0 To i Do
        write(' ');
      TextColor(Brown);
      Write('     @');
      TextColor(Yellow);
      writeln('        |      /  ');
      For j:=0 To i Do
        write(' ');
      TextColor(Brown);
      Write('    @');

      TextColor(Yellow);
      writeln('      ___/     /__');
      For j:=0 To i Do
        write(' ');
      TextColor(Brown);
      Write('   @');
      TextColor(Yellow);
      writeln('     O/  /     /  /O');
      For j:=0 To i Do
        write(' ');
      TextColor(Brown);
      Write('  @');
      TextColor(Yellow);
      writeln('      /  |______| /');
      TextColor(Brown);
      For j:=0 To i Do
        write(' ');
      Write(' @');
      TextColor(Yellow);
      writeln('      /           /');
      TextColor(Brown);
      For j:=0 To i Do
        Begin
          TextColor(Brown);
          write('@');
        End;
      Write('@');
      TextColor(Yellow);
      writeln('     O/___________/O');
      TextColor(White);
      delay(40-i);
    End;
  TextColor(White);
  Writeln;
  Writeln;
  writeln ('Welcome to battleshits, the shit i made in spare time to see if im faster to release than kira. ');
  AnyKey;
End;

Begin
  Blankstart;
  DankerIntro;
  ShitStory;
  writeln;
  writeln ('First things first, we have to set up your board, dumbass');
  writeln;
  //Add all the player shits
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
          Smartbot;
          checkwin;
        End;
    End;
End.
