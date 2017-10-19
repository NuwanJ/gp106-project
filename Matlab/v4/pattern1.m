
function k = pattern1()

k = 0;

pinG = 10;
pinB = 11;
pinR = 13;
pins = [4,3,2,7,6,5,12,9,8];

digitalWrite(a, pinR , 0);
digitalWrite(a, pinG , 1);
digitalWrite(a, pinB, 0);

pat1 = [6 9 8 7 4 1 2 3 6 9 8 7 4 1 2 3];

for i=1:length(pat1)
   digitalWrite(a, pins(pat1(i)), 0);
   pause(.4 - (0.02*i));
   digitalWrite(a, pins(pat1(i)), 1);
end

digitalWrite(a, pinG , 0);
digitalWrite(a, pinB, 1);

for i=1:length(pat1)
   digitalWrite(a, pins(pat1(i)), 0);
   pause(.1);
   digitalWrite(a, pins(pat1(i)), 1);
end


return
