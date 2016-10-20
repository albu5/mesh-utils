function f = plotMeshCompressed(vertices, ptrs)
f = figure;
c = [zeros(size(ptrs,1),1) 0.45*ones(size(ptrs,1),1) 0.20*ones(size(ptrs,1),1) ] + 0.25*rand(size(ptrs,1),3);
for idx = 1:size(ptrs,1)
    trip = ptrs(idx,:);
    fill3(vertices(trip,1), vertices(trip,2), vertices(trip,3), c(idx,:));
    %fill3(trip(1:3:end), trip(2:3:end), trip(3:3:end), c(idx,:)');
    
    hold on
end
xlim([min(vertices(:))-0.01*abs(min(vertices(:))) 1.01*max(vertices(:))])
ylim([min(vertices(:))-0.01*abs(min(vertices(:))) 0.41*max(vertices(:))])
zlim([min(vertices(:))-0.01*abs(min(vertices(:))) 0.81*max(vertices(:))])
%hold
xlabel('x');ylabel('y');zlabel('z');
end
