function dibrob(robot,r1,trayectoria)
figure(gcf)
for i=1:size(trayectoria,1)
	modrob(r1,trayectoria(i,:)',robot)
	drawnow
end
end