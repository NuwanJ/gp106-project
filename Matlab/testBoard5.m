clc
pinG = 10;
pinB = 11;
pinR = 13;
pins = [4,3,2,7,6,5,12,9,8];

for i=2:13
    pinMode(a, i, 'OUTPUT');
    digitalWrite(a, i , 1);
end

pinMode(a, pinR, 'OUTPUT');
pinMode(a, pinG, 'OUTPUT');
pinMode(a, pinB, 'OUTPUT');

digitalWrite(a, pinR , 0);
digitalWrite(a, pinG , 1);
digitalWrite(a, pinB, 0);

while 1
    p = randi(9,1);
    digitalWrite(a, pins(p), 0);
    pause(.2);
    digitalWrite(a, pins(p), 1);
    
    b = randi(10,1);
    
    if rem(b,2)==1
        digitalWrite(a, pinG , 1);
        digitalWrite(a, pinB, 0);
    else
        digitalWrite(a, pinG , 0);
        digitalWrite(a, pinB, 1);
    end
end
