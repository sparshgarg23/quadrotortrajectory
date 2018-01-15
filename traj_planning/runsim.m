close all;
clear all;
clc;
addpath(genpath('./'));

%% Plan path 1
disp('Planning ...');
map = load_map('maps/map2.txt', 0.1, 2, 0.25);
start = {[0.0  -4.9 0.2],[1.0 -3.5 0.3]};
stop  = {[10.0  16.0-1 5.0],[8,3.0-1 0.9]};
% stop  = {[6.0  18.0-6 3.0]};
nquad = length(start);
for qn = 1:nquad
    tic
    path{qn} = dijkstra(map, start{qn}, stop{qn}, true);
    toc
end
if nquad == 1
    plot_path(map, path{1});
else
    for i=1:nquad
        plot_path(map,path{i});
    end
    % you could modify your plot_path to handle cell input for multiple robots
end


%% Plan path 3
disp('Planning ...');
map = load_map('maps/map3.txt', 0.2, 0.5, 0.25);
start = {[0.0, 5, 5.0]};
stop  = {[20, 5, 5]};
nquad = length(start);
for qn = 1:nquad
    tic
    path{qn} = dijkstra(map, start{qn}, stop{qn}, true);
    toc
end
if nquad == 1
    plot_path(map, path{1});
else
    % you could modify your plot_path to handle cell input for multiple robots
end


%% Additional init script
init_script;

%% Run trajectory
trajectory = test_trajectory(start, stop, map, path, true); % with visualization
