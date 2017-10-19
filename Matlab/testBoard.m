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
digitalWrite(a, pinG , 0);
digitalWrite(a, pinB , 0);

%{
pattern1 = [1 2 3 6 9 8 7 4 5];
digitalWrite(a, pinG, 1);

for i=1:9
    digitalWrite(a, pins(pattern1(i)),0);
    pause(.25);
end

ptn2 = [1 3 5 7 9];
ptn3 = [2 4 6 8];



while 1
    
   digitalWrite(a, pinG, 1);
   digitalWrite(a, pinB, 0);
   for i=1:length(ptn2)
        digitalWrite(a, pins(ptn2(i)),0);
   end
   pause(.001)
   for i=1:length(ptn2)
        digitalWrite(a, pins(ptn2(i)),1);
   end
   
   digitalWrite(a, pinB, 1);   
   digitalWrite(a, pinG, 0);   
   
   for i=1:length(ptn3)
        digitalWrite(a, pins(ptn3(i)),0);
   end
   pause(.001)
   for i=1:length(ptn3)
        digitalWrite(a, pins(ptn3(i)),1);
   end  

end

%}

   digitalWrite(a, pinG, 0);
   digitalWrite(a, pinB, 1);

for i=1:9
    if (ply1m(i)==1)digitalWrite(a, pins(i),0);end
end