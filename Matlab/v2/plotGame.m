
function plotGame(ply1, ply2)
%ply1, ply2

for i=1:9
    col = 1 + 2*mod(i-1,3);
    row = 1 + 2*floor((i-1)/3);
    
    if (ply1(i)==1)
        %disp([col row]);
        plot(col, row, 'o', 'LineWidth', 30); 
    end
    
    if (ply2(i)==1)
        plot(col, row, 'x', 'LineWidth', 50,'color', 'red'); 
    end
end

return