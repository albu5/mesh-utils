%% To Do : Remove redundancy ; detect edges

clear all
M=csvread('surface.csv'); % import object
 f=plotMesh(M);        % plot object
P1=M(:,1:3);P2=M(:,4:6);P3=M(:,7:9);
%% Calculate properties
%% Center of gravity
cog=[sum(M(:,1:3:end),2),sum(M(:,2:3:end),2),sum(M(:,3:3:end),2)];
x=cog(:,1)/3;y=cog(:,2)/3;z=cog(:,3)/3;
g=[sum(x)  sum(y)  sum(z)]; %  
v=g/size(x,1); % center of gravity of object
scatter3(x,y,z,10,'y','fill') % plot centers of gravity of facets
%% Perimeter
p  =   norm(P2-P1)   + norm(P2-P3)     +    norm(P3-P1) ;
%% Area
CP = (cross(P2-P1,P3-P1,2)); % cross product of each facet
area = 0.5*sqrt(diag(CP*CP')); % area of facets
% g2=[x'*area  y'*area z'*area]/sum(area);  weighted cg with area of facet

%% Process unique vertices
%[V,indm,indn] = unique(M,'rows');
%F = indn(F);
%% Find a surface
%hist(z)
%k=find(z>20);
%M2=M(k,:);
%clf;
%f2=plotMesh(M);        % plot object
%hold on
%plot3([32.55 -71.27 ],[-52.42 -457.3],[25.4  25.4],'Color','r','LineWidth',2);

%% Shared vertex data-structure
mymatoftri = [];
for tri = M'
tri = reshape(tri,3,3)';
mymatoftri = vertcat(mymatoftri,tri);
end
[vert,indm,indn] = unique(mymatoftri,'rows');
% from indn get triangle number 




%% Detect unshared edges (those at the boundary)
mymatoftri = [];
for tri = M2'
tri = reshape(tri,3,3)';
mymatoftri = vertcat(mymatoftri,tri);
end     % Reshape M to mymatoftri (each row consists of a vertex)
[vert,indm,indn] = unique(mymatoftri,'rows');
nedges=3*size(vert,1)
%for i=1:nedges
    %edge(i) =  [vert(i,:),vert()];

%  if 2>3  % edge not shared 
%     % store edge in dataset
%     % plot edge
%     plot3([32.55 -71.27 ],[-52.42 -457.3],[25.4  25.4],'Color','r','LineWidth',2);
%     hold on
%  end
%  
%end

%%  PDE Meshing
%model = createpde(1);
%importGeometry(model, 'shape_hexagon.stl');
%mesh = generateMesh(model);
%pdeplot3D(model)