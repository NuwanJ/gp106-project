function sug = suggestions( player, debug, level)

%debug = 0; % Change this to 1 if you need to view debug outputs

ply = player;

if(debug)
    disp('Data:');
    disp(ply);
end

pos = zeros(1, 8);      % Possibility vector
sug =zeros(1, 8);

colS = sum(ply);
rowS = sum(transpose(ply));

for i=1:8 
    % Check each column
    if i<=3 && colS(i)==level
        pos(i) = 1;
    
    % Check for each row
    elseif i>3 && i<=6 && rowS(i-3)==level
        pos(i) = 1;
    
    %Check for diagonals
    elseif i==7 && trace(ply)==2
        pos(i) = 1;
        
    elseif i==8 && trace(fliplr(ply))==level
        pos(i) = 1; 
    end    
end

if(debug)
    disp('Avalible Chances');
    disp(pos);
end 

if sum(pos)>0
   % Columns
   for i = 1:3
      if pos(i)==1
          for k=1:3
              % i th column, kth row
              ele = (i-1)*3 + k;
              if (ply(ele)==0)
                 sug(i) = ele;
                 break;
              end
          end
      end
   end
   
   % Rows
   for i = 4:6
      if pos(i)==1
          for k=1:3
              % i th row, kth column
              ele = (i-3) + (k-1)*3;
              if (ply(ele)==0)
                 sug(i) = ele;
                 break;
              end
          end
      end
   end
   
   % Trace#1
   i=7;
   if pos(i)==1
       for k=1:3
            if (ply(k,k)==0)
                sug(i) = (k-1)*3 + k;
                break;
            end
       end
   end
   
   % Trace#2
   i=8;
   if pos(i)==1
        if ply(1,3)==0
            sug(i) = 7;
        elseif ply(2,2)==0
            sug(i) = 5;
        elseif ply(3,1)==0
            sug(i) = 3;    
        end
            
       %{
        for k=1:3
            if (ply(k,4-k)==0)
                sug(i) = (k-1)*3 + 4 - k;
                break;
            end
        end
        %}
       
   end
end

if(debug)
    disp('Suggestions:');
    disp(sug);
end

end

