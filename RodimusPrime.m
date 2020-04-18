% Shows the initial and final pose of a space-ship which undergoes
% roll-pitch-yaw and translation.
clear all
clf
handle_axes= axes('XLim', [-45,45], 'YLim', [-45,45], 'ZLim', [-45,45]);
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');

view(3);
grid on;
axis equal
camlight

% Model Spaceship1
trf_ship1_root= hgtransform('Parent', handle_axes);
%Parent, specified as an Axes, Group, or Transform object.
h_original_ship= make_spaceship(trf_ship1_root, 0.8);

% Model spaceship-2 translated and rotated w.r.t. ship-1
trf_ship2_ship1= hgtransform('Parent',trf_ship1_root);
h_ship2= make_spaceship(trf_ship2_ship1, 0.8);

roll= -pi/210;
pitch= pi/9;
yaw= pi/2;

roll1= makehgtform('xrotate', roll);
pitch1= makehgtform('yrotate', pitch);
yaw1= makehgtform('zrotate', yaw);



movement= yaw1*pitch1*roll1;

translate= [3,2,3]; % 4,2,2
translate1= makehgtform('translate', translate);
animation1= translate1*movement;

set(trf_ship2_ship1, 'Matrix', animation1);
%%
for i= 1:12

    

roll1= makehgtform('xrotate', roll);
pitch1= makehgtform('yrotate', pitch);
yaw1= makehgtform('zrotate', yaw);



movement= yaw1*pitch1*roll1;

translation= [3-i,3,3]; % 4,2,2
translate1= makehgtform('translate', translation);
animation1= translate1*movement;

set(trf_ship2_ship1, 'Matrix', animation1);

pause (0.1)


drawnow;
end

for i= 1:0.5:11.5

  pitch= pi/8*i;

roll1= makehgtform('xrotate', roll);
pitch1= makehgtform('yrotate', pitch);
yaw1= makehgtform('zrotate', yaw);



movement= yaw1*pitch1*roll1;

translation= [-8,3,3]; % 4,2,2
translate1= makehgtform('translate', translation);
animation1= translate1*movement;

set(trf_ship2_ship1, 'Matrix', animation1);

pause (0.1)


drawnow;
end

for i= 1:10



roll1= makehgtform('xrotate', roll);
pitch1= makehgtform('yrotate', pitch);
yaw1= makehgtform('zrotate', yaw);



movement= yaw1*pitch1*roll1;

translation= [-8,3,3+i]; % 4,2,2
translate1= makehgtform('translate', translation);
animation1= translate1*movement;

set(trf_ship2_ship1, 'Matrix', animation1);

pause (0.1)


drawnow;
end