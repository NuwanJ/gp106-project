

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