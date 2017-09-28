
% This function draw the basic construction lines on plotting window

function drawBoard()

hold on;

axis([0 6 0 6]);
plot([2 2], [0 6]);
plot([4 4], [0 6]);
plot([0 6], [2 2]);
plot([0 6], [4 4]);

return