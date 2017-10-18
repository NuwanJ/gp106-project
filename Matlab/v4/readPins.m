
function inPins = readPins(a)

    analogRange = linspace(0,1023,7);
    inPins =0;
    
    od = [2 3 1];
    
    for readBtn = 1:3
        reading = analogRead(a, 6 - od(readBtn));
        
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
