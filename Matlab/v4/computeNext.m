function in = computeNext( ply, com)

%com = [0 0 0; 0 0 0; 0 0 0];%[1 0 1; 1 1 0; 0 0 0];
%ply = [0 0 0; 0 0 0; 0 0 0];

%-------------------------------------------------------------
% First check for any possibilities to win the game by player
% Next, available options for the computer

plySug = suggestions(ply, 0, 2);
comSug = suggestions(com, 0, 2);
opt = [];
    
if sum(comSug)>0
    % Player has a possibility to win. Need to avoid it
    for i=1:8
       if comSug(i)~=0
           opt(end + 1) = comSug(i);
       end
    end
    
    if (length(opt)>1)
        reply = opt(randi(length(opt),1));
    else
        reply = opt(1);
    end
    
elseif sum(plySug)>0
    % Player hasn't any possibility to win, COM have chance
    
    for i=1:8
       if plySug(i)~=0
           opt(end + 1) = plySug(i);
       end
    end
    
    if (length(opt)>1)
        reply = opt(randi(length(opt),1));
    else
        reply = opt(1);
    end

else 
    % No one have possibility. Can guess any empty cell, use a random
    % number
    
    %{
    comSug2 = suggestions(com, 0, 1);
    
    if sum(comSug2) >0
        for i=1:8
           if comSug2(i)~=0
               opt(end + 1) = comSug2(i);
           end
        end
        reply = opt(randi(length(opt),1));
        
    else
    %}
        reply = randi(9,1);
        while (abs(ply(reply))==1 || abs(com(reply))==1)
            reply = randi(9,1);
        end
    %end
end

disp('Suggestion');
disp(reply);

in = reply;

end

