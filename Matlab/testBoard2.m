%{

in = [0 0 0];

while 1
    
    for i = 1:3
       in(i) = analogRead(a, 2+i); 
    end

    disp(in);
    pause(.5);
    
end

%}
while 1
 analogRange = linspace(0,1023,7);
    inPins =0;

    for readBtn = 1:3
        reading = analogRead(a, 2+readBtn);
        
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
    
    disp(inPins);
    pause(.5);
    
end