

function [w,winner] = winCheck(ply)
    w = 0;
    p = ply;
    s = sum(p);         % |
    pt = transpose(p);
    st = sum(pt);       % _
    winner = zeros(3);
    
    for i = 1:3 
        if (s(i)==3) % | 
            w = 1;
            winner(3*(i-1)+1) = 1;
            winner(3*(i-1)+2) = 1;
            winner(3*(i-1)+3) = 1;
            
        elseif (st(i)==3) % _
            w = 1;
            winner(i) = 1;
            winner(i+3) = 1;
            winner(i+6) = 1;
        end
    end
   
    if (trace(p)==3)
        winner  = [1 0 0 ; 0 1 0; 0 0 1];
        w =w +1; 
    end
    
    if (trace(fliplr(p))==3)
        winner  = [0 0 1; 0 1 0; 1 0 0];
        w =w +1; 
    end
    
    if (w >0)
        w = 1;
    else 
        w = 0;
    end
    
return