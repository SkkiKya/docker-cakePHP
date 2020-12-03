composer:
	docker-compose exec app composer self-update


build:
	docker-compose build

up:
	docker-compose up -d

stop:
	docker-compose stop

down:
	docker-compose down

app:
	docker-compose exec app /bin/bash

sql:
	docker-compose exec mysql /bin/bash

root:
	docker-compose exec mysql mysql -u root -p

branch:
	git branch

push:
	git add .
	git commit -m "README.md fixed"
	git push origin CMS

main:
	git checkout main

pull:
	git pull origin main