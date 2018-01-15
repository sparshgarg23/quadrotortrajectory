xmax=1000;
ymax=1000;
obstacle=[400,175,250,250];
EPS=20;
num_nodes=3000;
qstart.coord=[0 0];
qstart.cost=0;
qstart.parent=0;
qgoal.coord=[999 999];
qgoal.cost=0;
nodes(1) = q_start;
figure(1)
axis([0 x_max 0 y_max])
rectangle('Position',obstacle,'FaceColor',[0 .5 .5])
hold on
for i = 1:1:numNodes
    q_rand = [floor(rand(1)*x_max) floor(rand(1)*y_max)];
    plot(q_rand(1), q_rand(2), 'x', 'Color',  [0 0.4470 0.7410])
    
    % Break if goal node is already reached
    for j = 1:1:length(nodes)
        if nodes(j).coord == q_goal.coord
            break
        end
    end
    %Choose the closest node
    ndist=[];
    for j = 1:1:length(nodes)
        n = nodes(j);
        tmp=sqrt((n.coord(1)-q_rand(1))^2+(n.coord(2)-q_rand(2))^2);
        ndist=[ndist tmp];
    end
    [val,idx]=min(ndist);
    q_near=nodes(idx);
    q_new.coord = steer(q_rand, q_near.coord, val, EPS);
    
        