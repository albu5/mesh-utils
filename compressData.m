function [vertices, ptrs] = compressData(mydata, tol)
vertices = [];
ptrs = [];

vertices(1,1:3) = mydata(1,1:3);
vertices(2,1:3) = mydata(1,4:6);
vertices(3,1:3) = mydata(1,7:9);

if ~exist('tol', 'var')
    tol = 1e-8;
end

for i = 1:size(mydata,1)
    tri = mydata(i,:);
    ptrs(i,1) = -1;
    ptrs(i,2) = -1;
    ptrs(i,3) = -1;
    
    for j = 1:size(vertices,1)
       if (norm(vertices(j,:)-tri(1:3))<tol)
           ptrs(i,1) = j;
       end
       if (norm(vertices(j,:)-tri(4:6))<tol)
           ptrs(i,2) = j;
       end
       if (norm(vertices(j,:)-tri(7:9))<tol)
           ptrs(i,3) = j;
       end
    end
    
    if (ptrs(i,1) == -1)
       vertices(end+1,:) = tri(1:3);
       ptrs(i,1) = size(vertices,1);
    end
    if (ptrs(i,2) == -1)
       vertices(end+1,:) = tri(4:6);
       ptrs(i,2) = size(vertices,1);
    end
    if (ptrs(i,3) == -1)
       vertices(end+1,:) = tri(7:9);
       ptrs(i,3) = size(vertices,1);
    end
end

ptrs = int16(ptrs);