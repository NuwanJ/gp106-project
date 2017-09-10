

function w = winCheck(ply)
    w = 0;
    p = ply;
    s = sum(p);         % |
    pt = transpose(p);
    st = sum(pt);       % _
    
    for i = 1:3 
        w = w + (s(i)==3);
        w = w + (st(i)==3);    
    end
   
    if (trace(p)==3)
        w =w +1; 
    end
    
    if (trace(fliplr(p))==3)
        w =w +1; 
    end
    
    if (w >0)
        w = 1;
    else 
        w = 0;
    end
    
return