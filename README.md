# cakephp4.*_tutorial
【学習用】Dockerでcakephp4.*のチュートリアル環境を構築 

# LAMP環境の構成
  - Linux: CentOS7
  - Apache: Apache
  - MySQL: 5.7
  - PHP:  7.4

[LAMP+CakePHP3開発環境をVSCodeRemote+Dockerで構築① -Docker編-](https://qiita.com/goodkei/items/24143d5fa129890d2a7f)を参考に作成した環境です。 
[公式リファレンス](https://book.cakephp.org/4/en/index.html)も参考にしました。(DB接続あたり)  
makefileに短縮コマンドを設定しております。(windowsだと拡張が必要)  

例)  
起動:  
* `$ make up ` or `$ docker-compose up -d`  
+ `$make build`  
+ `$make up`  

# アプリケーションについて
アプリケーション: http://localhost:8765/  
初めは，Apacheの画面が出てきます。 (灰色で上に，TEST123..となっている)  

phpmyadmin: http://localhost:8764/  

# イントロダクション

## 1.cakePHPをダウンロード
cakePHPをダウンロードするためのコマンドを実行します。  
※このコマンドは，コンテナ内のcake_appフォルダで使ってください。  
具体的には，docker-compose.ymlが存在するディレクトリに合わせて，  

`$ make app` or `$ docker-compose exec app bin/bash`  
`# cd cake_app`  
`# composer create-project --prefer-dist cakephp/app:4.1 .`<-`cakephp/app:***`の「***」を変更することで任意のバージョンに変えることもできます。 
また， `cakephp/app:4.1 .`の4.1と.の間には, 半角スペースを入れてください。.はこの場所に，cakePHPを構成すると言う意味です。  
これでcakePHPがダウンロードされて，ホスト側のdata/cake_appにもcakePHPのコードがコピーされております。  

## 2.Apache側の設定
docker/app/httpd.conf において,  
125行目の  
`DocumentRoot "/var/www/html"`  
をコメントアウトして，  
126行目の  
`# DocumentRoot "/cake_app/webroot"`  
をコメントインします。  
 
次に，138行目の  
`<DocumentRoot "/var/www/html">`  
をコメントアウトして，  
139行目の  
`# <DocumentRoot "/cake_app/webroot">`  
をコメントインします。  

## 3.コンテナを再起動
ここで，コンテナを立ち上げ直すと,cakePHPのホーム画面です。  
具体的には,  
`# exit`  
`$ make down` or `docker-compose down`  
`$ make up` or `docker-compose up -d`  
です。  
cakePHP: http://localhost:8765/  

## 4.DB接続
[cakePHPのホーム画面](http://localhost:8765/)の中央あたりにDATABASEの項目が，赤色になっていると思います。  
このままではDB接続ができていないのでDB接続をします。  
data/cake_app/config/app_local.phpでDB接続が設定できます。  
[dockerでCakePHPの環境構築をした時に、データベースに接続できない](https://qiita.com/nagimaruxxx/items/7880e4077d24255aac5d)を見て，localのコンテナのアドレスやらユーザーネームやらをapp_local.phpの内容を変更してもできますし,以下のやり方でもDB接続ができました。  

data/cake_app/config/app_local.php  
```
    'Datasources' => [
        'default' => [
            'host' => 'mysql_database',   //docker-compose.ymlのcontainer_name
            /*
             * CakePHP will use the default DB port based on the driver selected
             * MySQL on MAMP uses port 8889, MAMP users will want to uncomment
             * the following line and set the port accordingly
             */
            //'port' => 'non_standard_port_number',
            'username' => 'root',         // docker-compose.ymlのMYSQL_USER
            'password' => 'mypassword',   // docker-compose.ymlのMYSQL_PASSWORD
            'database' => 'sampledb',     // docker-compose.ymlのMYSQL_DATABASE
            'log' => true,
            'url' => env('DATABASE_URL', null),
        ],
```  
### [cakePHPのホーム画面](http://localhost:8765/)の中央あたりにDATABASEの項目が，緑色になっていれば成功  
# 補足

## phpmyadminについて
phpmyadminコンテナでは，mysqlコンテナと接続してあるphpmyadminを使えます。(http://localhost:8764/)  

### とはいえ
途中からやり方を変更すれば,Laravelにも設定できるので，ご興味があればご自身でやってみてください  
また，今回のは結構手順が多いので，実際には使いものにならないかもしれません。  