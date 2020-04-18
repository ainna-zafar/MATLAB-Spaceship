function [ myhandles ] = make_spaceship(trf_root, transparency)
% Makes a space-ship with the root transform as the given transform.
% The surfaces are drawn with the given transparency in [0,1]
% A vector of handles to all the surfaces is returned.

dish= 2*sin(linspace(0, pi, 15));
[Xc, Yc, Zc]= cylinder(dish);

% Top 
top_face= hgtransform('Parent', trf_root);
set(top_face, 'Matrix', makehgtform('translate', [0, 0, -0.2]));
set(top_face, 'Matrix', makehgtform('scale', [1, 1, 1.5]));
colourtop= [0, 0, 0];
myhandles(1)= surface(Xc, Yc, Zc, 'Parent', top_face, 'FaceColor', colourtop, 'FaceAlpha', 1, 'EdgeColor', [0,0,1], 'EdgeAlpha', 1);



% used twice to model the two tails of the ship.
[Xt, Yt, Zt]= cylinder([0, 0.4, 0.5, 0.5, 0.4, 0]);  

% Left tail
tailleftroot= hgtransform('Parent', trf_root);
scale= makehgtform('scale', [0.5,0.5,4]);
Roty= makehgtform('yrotate', -pi/2);
T1= makehgtform('translate', [-2, 1, 1.5]);
% Interpret the order as BFT (left to right)
set(tailleftroot, 'Matrix', T1*Roty*scale);
colourtail1= [0.4 , 0 , 0.4]; % reddish
myhandles(3)= surface(Xt, Yt, Zt, 'Parent', tailleftroot, 'FaceColor', colourtail1, 'FaceAlpha', 1, 'EdgeColor', 0.5*colourtail1, 'EdgeAlpha', 1);

% Right tail
trf_tailright_root= hgtransform('Parent', trf_root);
scale= makehgtform('scale', [0.5,0.5,4]);
Roty= makehgtform('yrotate', -pi/2);
T1= makehgtform('translate', [-2, -1, 1.5]);
set(trf_tailright_root, 'Matrix', T1*Roty*scale);
color2tail2= [0.4 0 0.4]; % drab olive
myhandles(4)= surface(Xt, Yt, Zt, 'Parent', trf_tailright_root, 'FaceColor', color2tail2, 'FaceAlpha', 1, 'EdgeColor', 0.5*color2tail2, 'EdgeAlpha', 1);

% Nexus1
nexus1= hgtransform('Parent', trf_root);
scale= makehgtform('scale', [0.5,0.5,4]);
Roty= makehgtform('yrotate', -pi/2);
T1= makehgtform('translate', [-0.2, 0, 0.5]);
set(nexus1, 'Matrix', T1*Roty*scale);
colournexus1= [0.7 0 0.7]; % drab olive
myhandles(4)= surface(Xt, Yt, Zt, 'Parent', nexus1, 'FaceColor', colournexus1, 'FaceAlpha', 1, 'EdgeColor', 0.5*colournexus1, 'EdgeAlpha', 1);

% nexus2
nexus2= hgtransform('Parent', trf_root);
scale= makehgtform('scale', [0.2,0.2,1.5]);
Roty= makehgtform('yrotate', 0);
Roty= makehgtform('xrotate', pi/4);
T1= makehgtform('translate', [-3, 0, 0.5]);
set(nexus2, 'Matrix', T1*Roty*scale);
colournexus2= [0.4940, 0.1840, 0.5560]; % drab olive
myhandles(4)= surface(Xt, Yt, Zt, 'Parent', nexus2, 'FaceColor', colournexus2, 'FaceAlpha', 1, 'EdgeColor', 0.5*colournexus2, 'EdgeAlpha', 1);

% nexus3

nexus3= hgtransform('Parent', trf_root);
scale= makehgtform('scale', [0.2,0.2,1.5]);
Roty= makehgtform('yrotate', 0);
Roty= makehgtform('xrotate', -pi/4);
T1= makehgtform('translate', [-3, 0, 0.5]);
set(nexus3, 'Matrix', T1*Roty*scale);
colournexus3= [0.4940, 0.1840, 0.5560]; % drab olive
myhandles(4)= surface(Xt, Yt, Zt, 'Parent', nexus3, 'FaceColor', colournexus3, 'FaceAlpha', 1, 'EdgeColor', 0.5*colournexus3, 'EdgeAlpha', 1);

% nexus4
nexus4= hgtransform('Parent', trf_root);
scale= makehgtform('scale', [1.75,1.75,1.75]);
Roty= makehgtform('yrotate', 0);
T1= makehgtform('translate', [0, 0, 0]);
set(nexus4, 'Matrix', T1*Roty*scale);
colournexus4= [0.3010, 0.7450, 0.9330]; % drab olive
myhandles(4)= surface(Xt, Yt, Zt, 'Parent', nexus4, 'FaceColor', colournexus4, 'FaceAlpha', 1, 'EdgeColor', 0.5*colournexus4, 'EdgeAlpha', 1);

end