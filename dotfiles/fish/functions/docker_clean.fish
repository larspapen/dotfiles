function docker_clean
	docker kill $(docker ps -aq)
	docker rm $(docker ps -aq)
	docker rmi $(docker images -q)
	docker system prune --volumes
end

