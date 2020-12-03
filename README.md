# cakephp4.*_tutorial
【学習用】Dockerでcakephp4.*のチュートリアル環境を構築

# LAMP環境の構成
  - Linux: CentOS7
  - Apache: Apache
  - MySQL: 5.7
  - PHP:  7.4

[LAMP+CakePHP3開発環境をVSCodeRemote+Dockerで構築① -Docker編-](https://qiita.com/goodkei/items/24143d5fa129890d2a7f)を参考に作成した環境です。

makefileに短縮コマンドを設定しております。(windowsだと拡張が必要)  

例) 
起動:
* `$ make up ` or `$ docker-compose up -d`
+ `$make build`
+ `$make up`

アプリケーション: http://localhost:8765/ 

phpmyadmin: http://localhost:8764/ 

初めは，Apacheの画面が出てきます。 

cakePHPをダウンロードするためのコマンドを実行します。 
※このコマンドは，コンテナ内のcake_appフォルダで使ってください。 
具体的には，docker-compose.ymlが存在するディレクトリに合わせて，  

`$ make app` or `$ docker-compose exec app bin/bash`
`# cd cake_app`
`# composer create-project --prefer-dist cakephp/app:3.9 .`

これでcakePHPがダウンロードされて，ホスト側のdata/cake_appにもcakePHPがコピーされております。

docker/app/httpd.conf において, 
125行目の
`DocumentRoot "/var/www/html"` 
をコメントアウトして， 
126行目の 
`# DocumentRoot "/cake_app/webroot"` 
をコメントインします。
 
次に大体138行目の
`<DocumentRoot "/var/www/html">` 
をコメントアウトして， 
139行目の 
`# <DocumentRoot "/cake_app/webroot">` 
をコメントインします。

ここで，コンテナを立て直すと,cakePHPのホーム画面がでます。 
具体的には, 
`# exit` 
`$ make down` or `docker-compose down` 
`$ make up` or `docker-compose up -d` 
です。  

cakePHP: http://localhost:8765/ 

phpmyadminコンテナでは，
mysqlコンテナと接続してあるphpmyadminを使えます。(http://localhost:8764/ ) 


このままではDB接続ができていないので，DB接続をします。 
app_local.php でlocal環境でのDB接続が，設定できます。 
[dockerでCakePHPの環境構築をした時に、データベースに接続できない](https://qiita.com/nagimaruxxx/items/7880e4077d24255aac5d)を見て，localのコンテナのアドレスやらユーザーネームやらをapp_local.phpの内容を変更して，DB接続ができました。
