#composerアップデート(dockerを起動した時点で最新版が入っています。)
composer:
	docker-compose exec app composer self-update
# アプリケーションに関するコマンド
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

# gitに関するコマンド
branch:
	git branch

main:
	git checkout main

pull:
	git pull origin main

remote:
	git remote -v
# キャッシュクリア
clear:
	git rm -r --cached .