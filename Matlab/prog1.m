

%a = arduino('COM14');
separator = ['|',  '|', '|']';
debug = 0;
strStatus = ['LOW','HIGH'];
pins = [ 2 3 4; 5 6 7; 8 9 10];
status = zeros(3,3);
ply1 = zeros(3,3);
ply2 = zeros(3,3);

player = 2;

if (debug==0)
    for i = 1:9
       pinMode(a, pins(i), 'OUTPUT') ;
       digitalWrite(a, pins(i),0);
    end
end

while 1==1
    
    if (player==2)
        in = input('Player 1: ');
        player = 1;
    else 
        in = input('Player 2: ');
        player = 2;
    end
    
   if(in>0 && in<10)
      

       if (player==1)
          if (ply2(in)==1)
             %If player 2 already marked the position 
             disp(' Player 2 already marked it !!!');
          else
              ply1(in) = 1;
              ply2(in) = -1;
              status(in) = 1- status(in);
          end
          
       else
          if (ply1(in)==1)
             %If player 2 already marked the position 
             disp(' Player 2 already marked it !!!');
          else
              ply1(in) = -1;
              ply2(in) = 1;
              status(in) = 1- status(in);
          end
       end

       if (debug==0) digitalWrite(a, pins(in), status(in));end
       disp([num2str(status')  separator num2str(ply1')  separator num2str(ply2')]);
   end
end





