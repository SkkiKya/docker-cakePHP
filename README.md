# cakephp4.*_tutorial
【学習用】Dockerでcakephp4.*のチュートリアル環境を構築

[LAMP+CakePHP3開発環境をVSCodeRemote+Dockerで構築① -Docker編-](https://qiita.com/goodkei/items/24143d5fa129890d2a7f)を参考に作成した環境です。

makefileに短縮コマンドを設定しております。(windowsだと拡張が必要だったような)
例
起動:
  * `$ make up `=`$ docker-compose up -d`
+ `$make build`
+ `$make up`

cakePHP: http://localhost:8765/

phpmyadmin: http://localhost:8764/

appコンテナでは，
  - ./data/cake_php 
  - ./docker/app/httpd.conf 
が当該コンテナ内のディレクトリにコピーされて，それが実行されています。

mysqlコンテナでは，
./data/db 
が当該コンテナ内のディレクトリにコピーされて，それが実行されています。

phpmyadminコンテナでは，
mysqlコンテナと接続してあるphpmyadminを使えます。

LAMP環境の構成
  - Linux: CentOS7
  - Apache: Apache
  - MySQL: 5.7
  - PHP:  7.4

