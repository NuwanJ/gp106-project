
function inPins = readPins(a)

    analogRange = linspace(0,1023,7);
    inPins =0;

    for readBtn = 1:3
        reading = analogRead(a, 6 - readBtn);
        
        if (reading>=analogRange(1) && reading<analogRange(2))
            inPins = 3*(readBtn-1) + 1;
        elseif (reading>=analogRange(2) && reading<analogRange(4))
            inPins = 3*(readBtn-1) + 2;
        elseif (reading>=analogRange(4) && reading<analogRange(6))
            inPins = 3*(readBtn-1) + 3;
        else
            % Nothing yet
        end
    end
    
    % Return corresponding button value 1 to 9
return



%{

analogRange = linspace(0,1023,7);
oldReading  = 0;

while 1==1
   b = analogRead(a, 0);
   s = 0;

   if (b>=analogRange(1) && b<analogRange(2))
       s=1;
   elseif (b>=analogRange(2) && b<analogRange(4))
       s=2;
   elseif (b>=analogRange(4) && b<analogRange(6))
       s=3; 
   else
       s=0; 
   end
   
   if (b~= oldReading)
      fprintf('%d --> %d \n', b, s)
      oldReading = b;
   else 
        pause(.001);
   end
end



%}