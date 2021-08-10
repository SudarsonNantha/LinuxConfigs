figure

n = 14;
s = 3;
l = s*2;
h = s*2;

x = 0;
y = 39;

node = ["A","B","C","D","E","F","G","H","I","J","K","L","M","N","O"];
for i = 1:n

    color = 'b';
    if i == 1
        color = 'g';
    elseif i > 12
        color = 'r';
    end
    rectangle('Position',[x y l h],'EdgeColor',color,'LineWidth',2)
    text (x+l/4, y+3*h/4, {node(i)},
           "horizontalalignment", "center",
           "verticalalignment", "middle");
    x = x+s;
    y = y-s;
endfor
    text (x+l/4, y+3*h/4, {node(length(node))},
           "horizontalalignment", "center",
           "verticalalignment", "middle");
axis([0 50 0 50])
