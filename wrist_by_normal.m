function [pos_s]=wrist_by_normal(path,normal,w2fl)
[~,game]=size(path);
pos_s=zeros(3,game);
for v=1:game
    pos_s(:,l)=path(:,l)+w2fl*normal(:,l);
end
end