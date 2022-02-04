init:
	USER=$USER USER_ID=$(id -u) GROUP_ID=$(id -g) docker-compose build

up:
	docker-compose up -d

# Run docker a the actual user and mount the the actual folder in docker in /mnt/mydata 
# Run the docker command in  docker folder /mnt/mydata ( not your computer)
# Set external port ( 3006  but can be 80) to internal port (3000 do not change it)
# run yarn start with --host ( if not , there is no access to the app)
upFast:
	docker run --user  $(id -u):$(id -g) -ti  -v `pwd`:/mnt/mydata  -w /mnt/mydata  -p 3006:3000 node:16-alpine  yarn start --host

down:
	docker-compose down

clean:
	docker rm -f $$(docker ps -aq) $$(docker ps -q); docker image rm $$(docker image ls -q) && rm -rf node_modules

clean-hard:
	docker rm -f $$(docker ps -aq) $$(docker ps -q); docker image rm $$(docker image ls -q); docker volume rm $(docker volume ls -q);

dump-autoload:
	docker exec -it phpforum-php-1 compose dump-autoload