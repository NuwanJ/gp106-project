
% GP106 - COM Project
% Update : 18/10/2017
% Written by : 
%     Jaliyagoda A.J.N.M. (E/15/140)
%     Irfan M.M.M. (E/15/138)
%     Ishanthi S. (E/15/139)

% Latest version of the source code will be  available at 
% https://github.com/NuwanJ/gp106-project

% ----- SPECIAL NOTICE ---------------------------------------------- 
% This code will be only works with the special firmware exist in
% ../ArduinoIO/ folder. And also need to flash arduino firmware to the board,
% that will be found on ../ArduinoIO/adio_blink/ folder
% -------------------------------------------------------------------

% Arduino must be connected before running the code
% a = arduino('COM14');

clf;    %clean plot
clc;    %clean CLI
debug = 1;                 % 1 = no need arduino
drawP = 1;                   % 1 = visual enable
playWithCom = 1;

%pins = [8 9 10; 5 6 7; 2 3 4]; 
pins = [4,3,2,7,6,5,12,9,8]; 
pinG = 10;
pinB = 11;
pinR = 13;

if drawP
    drawBoard();                %draw the playing area
end

status = zeros(3,3);       % Resultant input
ply1 = zeros(3,3);         % Player1's input
ply2 = zeros(3,3);         % Player2's input

player = 2;run = 1;counter = 0;

if (debug==0)
    for i = 1:9             % Set all LED pins as OUTPUTs and set as LOW
       pinMode(a, pins(i), 'OUTPUT') ;
       digitalWrite(a, pins(i),1);
    end
    
    pinMode(a, pinR, 'OUTPUT');
    pinMode(a, pinG, 'OUTPUT');
    pinMode(a, pinB, 'OUTPUT');

    digitalWrite(a, pinR , 0);
    digitalWrite(a, pinG , 0);
    digitalWrite(a, pinB , 0);
    digitalWrite(a, pinG , 1);
end

while run==1
   
   if(debug==0)
       if playWithCom ==1 && player==1
           in = computeNext(ply1, ply2);
       else
           in = readPins(a);
       end
               
   else
       if (player==2)
            in = input('Player 1: ');
       else 
           if playWithCom ==1
               in = computeNext(ply1, ply2);
           else
               in = input('Player 2: ');
           end
       end
   end
   
   if (in == 0)
       % Wait 250ms until a vaild input and check again 
       pause(.25);
   else 
       player = 1 + (1- (player-1));   % Switch between player 1 & 2

       if(in>0 && in<10)            %% check input in valid range

           % Player 1's turn
           if (player==1)
              if (ply2(in)==1 || ply1(in)==1)      %If player 1/2 already marked the position 
                 disp(' Player 1/2 already marked it !!! Try another one.');
                 player =2;
              else                  % Updating vectors 
                  ply1(in) = 1;
                  ply2(in) = -1;
                  status(in) = 1;
              end

           % Player 2's turn
           else
               
              if (ply2(in)==1 || ply1(in)==1)      %If player 1/2 already marked the position 
                 disp(' Player 1/2 already marked it !!! Try another one.');
                 player = 1;
              else                  % Updating vectors 
                  ply1(in) = -1;
                  ply2(in) = 1;
                  status(in) = 1;
              end
           end

           % Write a code for check win 
           if(drawP) 
               plotGame(ply1, ply2); 
           end

           % Display Hardware and Software outputs
           if (debug==0) 
               for i = 1:9
                   if (ply1(i)==1)
                       digitalWrite(a, pins(i), 0);
                   elseif (ply2(i)==1)
                       digitalWrite(a, pins(i), 2); % Special patch to blink this.
                   else
                       digitalWrite(a, pins(i), 1);
                   end
               end
           end

           [ply1w,ply1m] = winCheck(ply1);
           [ply2w,ply2m] = winCheck(ply2);
           
           if (ply1w==1)
                if(drawP)
                    title('Player 1 Wins !!!','fontsize',20,'color', 'red');
                end
                
                disp('Player 1 Wins !!!');
                run=0;
            elseif (ply2w==1)
                if(drawP)
                    title('Player 2 Wins !!!','fontsize',20,'color', 'red');
                end
                
                disp('Player 2 Wins !!!');
                run=0;

            elseif sum(sum(status))==9
                if(drawP)
                    title('Draw !!!','fontsize',20,'color', 'red');
                end
                run = 0;
                disp('Draw !!!');
            else
                run=1;
                counter = counter +1;
           end
           
       end
       pause(.5);
   end
end