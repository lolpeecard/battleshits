
Program battleshits;

//include my resources fool
{$R sounds.rc}

Uses 
Crt,
MMsystem,
sysutils;

Var 
  player: array [0..10, 0..10] Of integer;
  playerattack: array [0..10, 0..10] Of integer;
  bot: array [0..10, 0..10] Of integer;
  botattack: array [0..10, 0..10] Of integer;
  shitimation: array [0..10, 0..10] Of integer;
  b,i,j,x,y,k,l,z,m: integer;
  Letter,Direction: char;
  hit, miss, skip, wincheck, botwin, playerwin: integer;
  Error: integer;
  ch: char;

Procedure AnyKey;
Begin
  writeln;
  writeln ('press any key to continue');
  ch := readkey;
End;

Procedure ShitHit(playerorbot : integer);
Begin
  //Player = 1 Bot = 2
  For m:= 1 To 7 Do
    Begin
      Clrscr;
      If playerorbot=1 Then write('You')
      Else write('Bot');
      writeln(' hit a shit!');
      writeln;
      TextColor(Brown);
      If (m < 2) Then writeln('     (   )')
      Else writeln;
      If (m < 3) Then writeln('  (   ) (')
      Else writeln;
      If (m < 4) Then writeln('   ) _   )')
      Else writeln;
      If (m < 5) Then writeln('    ( \_')
      Else writeln;
      If (m < 6) Then writeln('  _(_\ \)__')
      Else writeln;
      If (m < 7) Then writeln(' (____\___))')
      Else writeln;
      TextColor(white);
      writeln;
      writeln('It is wiped out!');
      sleep(150);
    End;
End;

Procedure ShitMiss(playerorbot : integer);
Begin
  //Player = 1 Bot = 2
  For m:= 1 To 10 Do
    Begin
      Clrscr;
      If playerorbot=1 Then write('You')
      Else write('Bot');
      writeln(' misssed the shit!');
      writeln;
      TextColor(Brown);
      If (m mod 2 = 0) Then writeln('     (   )')
      Else writeln('   (   )');
      If (m mod 2 = 0 ) Then writeln('  (   ) (')
      Else writeln('(   ) (');
      If (m mod 2 = 0 ) Then writeln('   ) _   )')
      Else writeln(' )   _ )');
      writeln('    ( \_');
      writeln('  _(_\ \)__');
      writeln(' (____\___))');
      TextColor(white);
      writeln;
      writeln('It is still there stinking up the yard!');
      sleep(150);
    End;
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
        sleep(250);

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
                   End
            Else If player[i,j]=3 Then write('| X ');
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
  Error := 1;
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
  If (X > -1) And ( X < 10) Then Error := 0
  Else Stupid;
End;

Procedure BotHitCheck;
Begin
  If botattack[x,y]>1 Then skip := 1
  Else
    Begin
      //bot hit
      If player[x,y]=2 Then
        Begin
          hit := 1;
          botattack[x,y] := 3;
          player[x,y] := 3;
          skip := 0;
          writeln;
          ShitHit(2);
        End;
      //bot miss
      If player[x,y]=1 Then
        Begin
          miss := 1;
          botattack[x,y] := 4;
          skip := 0;
          writeln;
          ShitMiss(2);
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
anykey;
clrscr; 
drawboard(1);
anykey;
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
            If x + s < 11 Then
              Begin
                s:= s - 1;
                For L:= 0 To (S) Do
                  Begin
                    //reset error
                    Error := 0;
                    x := x + L;
                    If bot[x,y] = 2 Then
                      Begin
                        error := 1;
                      End
                    else bot[x,y] := 2;
                    x := x - L;
                  End;
              End;
          If z=1 Then
            If y + s < 10 Then
              Begin
                s:= s - 1;
                For L:= 0 To (S) Do
                  Begin
                    //reset error
                    Error := 0;
                    y := y + L;
                    If bot[x,y] = 2 Then
                      error := 1
                    else bot[x,y] := 2;
                    y := y - L;
                  End;
              End;
        End;
    End;
End;
Procedure YInput;
Begin
  Repeat
    writeln ('Please enter the Y coordinate(use the number idiot)');
          {$I-}
    Readln(y);
          {$I+}
  Until IOResult = 0;
End;


Procedure AddBoat(S : integer);
Begin
  Error := 1;
  For k:= 0 To 9 Do
    Begin
      ClrScr;
      If Error = 1 Then
        Begin
          DrawBoard(1);
          writeln;
          writeln ('Place dis damn shit, shits as big as ', s);
          writeln (
                   'Please enter the X coordinate (use the letter idiot)'
          );
          readln(Letter);
          Xline;
          If Error = 0 Then
            yinput;
          If Error = 0 Then
            Begin
              writeln ('Which way this shit go? D for Down, R for right)');
              readln(Direction);
            End;
          If Direction='D' Then Direction := 'd';
          If Direction='R' Then direction := 'r';
          If Direction='r' Then
          begin
            If x + s < 11 Then
              Begin
                Error := 0;
                s:= s - 1;
                For L:= 0 To (S) Do
                  Begin
                    //reset error
                    x := x + L;
                    If player[x,y] = 2 Then Stupid;
                    x := x - L;
                  End;
                If error = 0 then For L:= 0 To (S) Do 
                  begin
                      x := x + L;
                      player[x,y] := 2;
                      x := x - L;
                  end;
              End;
          end  
          
          else If Direction='d' Then
          begin
            If y + s < 11 Then
              Begin
                Error := 0;
                s:= s - 1;
                For L:= 0 To (S) Do
                  Begin
                    //reset error
                      y := y + L;
                      If player[x,y] = 2 Then Stupid;
                      y := y - L;
                  End;
                If error = 0 then For L:= 0 To (S) Do 
                begin
                    y := y + L;
                  player[x,y] := 2;
                    y := y - L;
                end;
              End;
          end 
          else stupid; 
        End;
    End;
  s:= s + 1;
  BotBoat(s);
End;

Procedure Checkwin;
Begin
  //defaulting to win and it will check if you haven't
  botwin := 1;
  playerwin := 1;
  For i:=0 To 9 Do
    For j:=0 To 9 Do
      If player[i,j] = 2 Then
        Begin
          botwin := 0;
          writeln;
        End;

  For i:=0 To 9 Do
    For j:=0 To 9 Do
      If bot[i,j] = 2 Then
        Begin
          playerwin := 0;
          writeln;
        End;
  ClrScr;
  If botwin = 1 Then writeln('lol u are shit');
  If playerwin = 1 Then writeln('lol bot is shit');
  If botwin =1 Then wincheck := 1;
  If playerwin =1 Then wincheck := 1;
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
                      yinput;
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
                              ShitHit(1);
                              anykey;
                            End;
                          If bot[x,y]=1 Then
                            Begin
                              miss := 1;
                              playerattack[x,y] := 4;
                              skip := 0;
                              writeln;
                              ShitMiss(1);
                              anykey;
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

Procedure DankerIntro;
Begin
  sndPlaySound(PChar('intro'), snd_Async or snd_NoDefault);
  For i:=0 To 33 Do
    Begin
      clrscr;
      TextColor(Brown);
      writeln;
      Writeln('__________         __    __  .__                .__    .__  __');
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
      sleep(40-i);
    End;
  TextColor(White);
  Writeln;
  Writeln;
  writeln (


'Welcome to battleshits, the shit i made in spare time to see if im faster to release than kira. '
  );
  AnyKey;
End;

Begin
  cursoroff;
  Blankstart;
  If FileExists('debug.txt') = false Then
    begin
    DankerIntro;
    ShitStory;
    end;
  writeln;
  writeln ('First things first, lets shit back your neighbor, dumbass');
  writeln;
  //Add all the player shits
  Addboat(5);
  Addboat(4);
  Addboat(3);
  Addboat(3);
  Addboat(2);
  writeln ('ngl, thats some really good looking turds you got there');
  DrawBoard(1);
  AnyKey;
  //it's over 9000
  Repeat
    //Drawbotboard;
    Clrscr;
    PlayerTurn;
    CheckWin;
    Smartbot;
    checkwin;
  Until wincheck = 1;
End.
