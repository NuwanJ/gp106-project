

% GP106 - COM Project
% Update : 28/08/2017
% Written by : A.J.N.M. Jaliyagoda


%Arduino must me connected before running the code
%a = arduino('COM14');

clf;    %clean plot
clc;    %clean CLI
separator = ['|',  '|', '|']';

debug = 1;                 % Debug should 1 for arduino

%strStatus = ['LOW','HIGH'];
pins = [ 2 3 4; 5 6 7; 8 9 10];

drawBoard();

status = zeros(3,3);       % Resultant input
ply1 = zeros(3,3);         % Player1's input
ply2 = zeros(3,3);         % Player2's input
player = 2;
run = 1;
counter = 0;

if (debug==0)
    for i = 1:9
       % Set all LED pins as OUTPUTs and set as LOW
       pinMode(a, pins(i), 'OUTPUT') ;
       digitalWrite(a, pins(i),0);
    end
end

while run==1
    
    if (player==2)
        in = input('Player 1: ');
        player = 1;
    else 
        in = input('Player 2: ');
        player = 2;
    end
    
   if(in>0 && in<10)        %% check input in valid range
       
       % Player 1's turn
       if (player==1)
          if (ply2(in)==1)
             %If player 2 already marked the position 
             disp(' Player 2 already marked it !!! Try another one.');
             player =2;
          else
              % Updating vectors 
              ply1(in) = 1;
              ply2(in) = -1;
              status(in) = 1;
          end
          
       % Player 2's turn
       else
          if (ply1(in)==1)
             %If player 2 already marked the position 
             disp(' Player 2 already marked it !!! Try another one.');
             player = 1;
          else
              % Updating vectors 
              ply1(in) = -1;
              ply2(in) = 1;
              status(in) = 1;
          end
       end
       
       % Write a code for check win 
        plotGame(ply1, ply2);
        
       % Display Hardware and Software outputs
       if (debug==0) 
           digitalWrite(a, pins(in), status(in));
           disp([num2str(status')  separator num2str(ply1')  separator num2str(ply2')]);
       end
      
        if (winCheck(ply2)==1)
            title('Player 2 Wins !!!','fontsize',20,'color', 'red');
            disp('Player 2 Wins !!!');
            run=0;
        elseif (winCheck(ply1)==1)
            title('Player 1 Wins !!!','fontsize',20,'color', 'red');
            disp('Player 1 Wins !!!');
            run=0;
            
        elseif sum(sum(status))==9
            title('Draw !!!','fontsize',20,'color', 'red');
            run = 0;
            disp('Draw !!!');
        else
            run=1;
            counter = counter +1;
        end
   end
end



