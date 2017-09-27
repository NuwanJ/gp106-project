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

pattern1 = [6 9 8 7 4 1 2 3];


digitalWrite(a, pins(5), 0);

for i=1:length(pattern1)
   digitalWrite(a, pins(pattern1(i)), 0);
   pause(.2);
   digitalWrite(a, pins(pattern1(i)), 1);
end


digitalWrite(a, pinG , 0);
digitalWrite(a, pinB, 1);

digitalWrite(a, pins(5), 0);

for i=1:length(pattern1)
   digitalWrite(a, pins(pattern1(i)), 0);
   pause(.2);
   digitalWrite(a, pins(pattern1(i)), 1);
end



