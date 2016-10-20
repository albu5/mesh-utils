function f = plotMesh(M)
f = figure;
c = [zeros(size(M,1),1) 0.45*ones(size(M,1),1) 0.20*ones(size(M,1),1) ] + 0.25*rand(size(M,1),3);
idx = 1;
for idx = 1:size(M,1)
    trip = M(idx,:);
 fill3(trip(1:3:end), trip(2:3:end), trip(3:3:end), c(idx,:));
    %fill3(trip(1:3:end), trip(2:3:end), trip(3:3:end), c(idx,:)');
    
    hold on
end
xlim([min(M(:))-0.01*abs(min(M(:))) 1.01*max(M(:))])
ylim([min(M(:))-0.01*abs(min(M(:))) 0.41*max(M(:))])
zlim([min(M(:))-0.01*abs(min(M(:))) 0.81*max(M(:))])
%hold 
xlabel('x');ylabel('y');zlabel('z');
end
