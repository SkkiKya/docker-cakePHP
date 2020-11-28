composer:
	docker-compose exec app php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
	docker-compose exec app php -r "if (hash_file('sha384', 'composer-setup.php') === '756890a4488ce9024fc62c56153228907f1545c228516cbf63f885e036d37e9a59d27d63f46af1d4d07ee0f76181c7d3') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
	docker-compose exec app php composer-setup.php
	docker-compose exec app php -r "unlink('composer-setup.php');"
	docker-compose exec app mv composer.phar /usr/local/bin/composer

cake:
	docker-compose exec app composer self-update && docker-compose exec app composer create-project --prefer-dist cakephp/app:4.1.6

build:
	docker-compose build

up:
	docker-compose up -d

stop:
	docker-compose stop

app:
	docker-compose exec app /bin/bash

sql:
	docker-compose exec mysql /bin/bash

root:
	docker-compose exec mysql mysql -u root -p

push:
	git add .
	git commit -m "fixed"
	git push origin CMS

main:
	git checkout main

pull:
	git pull origin main