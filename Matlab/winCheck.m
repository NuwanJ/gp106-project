

function w = winCheck(ply)
    p = ply;
    w = 0;
    
    s = sum(p);         % |
    pt = p';
    st = sum(pt);       % _
    
    for i = 1:3 
        w = w + (s(i)==3);
        w = w + (st(i)==3);    
    end
    
    w = w + (trace(p)==3);
    w = w + (trace(pt)==3);
    
    w = (w==1);
return