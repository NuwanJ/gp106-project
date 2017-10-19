
buttons =  11:19;
btnNow = zeros(1,9);
    
for i=1:9
   pinMode(a, buttons(i), 'INPUT') ;
end

while 1
    btnNow = zeros(1,9);
    while sum(btnNow) ==0
            for i=1:9
               btnNow(i) = 1-digitalRead(a, buttons(i));
               %disp(btnNow);
                pause(.05);
               if (btnNow(i) ==1)
                  btn = i; 
               end
            end
    end
 disp(btn);
 pause(.5);
 end