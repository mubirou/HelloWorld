# MySQL / MariaDB（ Linux ）

## MySQL / <ruby>MariaDB<rt>マリアディービー</rt></ruby> について

* MySQL は1995年に登場したオープンソースの [RDBMS](http://bit.ly/2lunAUm) 。商標権･著作権は MySQL AB（〜2008年）→ サン･マイクロシステムズ（2010年にオラクルが買収）に移行している。
* 派生のデータベースに [MariaDB](https://ja.wikipedia.org/wiki/MariaDB) がある（Google の検索システムに採用）。
* MySQL 5.6（2013年2月リリース）で大規模なリファクタリングが行われて以降は、MariaDB と MySQL との間で新機能の取り扱い方などで相違がある。
* MySQL 5.7.8（2015年8月リリース）以降、複雑なパスワードを要求するようになっている。
*  データの操作を行う[問い合わせ言語](http://bit.ly/2mvUUPR)として [SQL](https://ja.wikipedia.org/wiki/SQL) を利用。

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 20.04.2 LTS|2021年02月|
|Web サーバ|[Apache](https://ja.wikipedia.org/wiki/Apache_HTTP_Server) 2.4.41|2019年08月|
|データベース|[MySQL](https://ja.wikipedia.org/wiki/MySQL) 8.0.25|2021年05月|
|実行エンジン|[PHP](https://ja.wikipedia.org/wiki/PHP:_Hypertext_Preprocessor) 7.4.3|2020年02月|
|エディタ|Visual Studio Code 1.56.2|2021年05月|
|拡張機能|PHP Debug 1.15.1|ー|
|ブラウザ|Google Chrome 91.0|2021年05月|

1. [PHP の開発環境の構築](https://github.com/mubirou/HelloWorld/blob/master/languages/PHP/PHP_linux.md) をする

1. [MySQL](https://ja.wikipedia.org/wiki/MySQL) のインストール  
    $ sudo apt-get update  
    $ sudo apt-get install mysql-server  
    $ mysql --version  
    mysql  Ver 8.0.25-0ubuntu0.20.04.1 for Linux on x86_64 ((Ubuntu))

## ユーザの作成

```
$ sudo mysql -u root -p ←Linuxのパスワードでログイン

mysql> SELECT host, user FROM mysql.user; ←ユーザ一覧確認
+-----------+------------------+
| host      | user             |
+-----------+------------------+
| localhost | debian-sys-maint |
| localhost | mysql.infoschema |
| localhost | mysql.session    |
| localhost | mysql.sys        |
| localhost | root             |
+-----------+------------------+
5 rows in set (0.00 sec)

mysql> CREATE USER 'mubirou'@'%' IDENTIFIED BY 'vC/6Jy2U'; ←ユーザ名とパスワード設定
mysql> GRANT ALL PRIVILEGES ON *.* TO 'mubirou'@'%' WITH GRANT OPTION; ←権限設定
mysql> FLUSH PRIVILEGES; ←権限の反映（不要説有り）

mysql> SELECT host, user FROM mysql.user; ←ユーザ一覧再確認
+-----------+------------------+
| host      | user             |
+-----------+------------------+
| %         | mubirou          | ←新しく作成できた
| localhost | debian-sys-maint |
| localhost | mysql.infoschema |
| localhost | mysql.session    |
| localhost | mysql.sys        |
| localhost | root             |
+-----------+------------------+
6 rows in set (0.00 sec)

mysql> exit; ←いち度ログアウト
```

## データベースとテーブルの作成

* データベースの作成
```
$ mysql -u mubirou -p ←上記のパスワードでログイン

mysql> CREATE DATABASE test_db;

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test_db            |
+--------------------+
```

* データベースの削除（参考）
```
mysql> DROP DATABASE test_db;
```

* テーブルの作成
```
mysql> USE test_db;

mysql> CREATE TABLE hello_tb(country TEXT, words TEXT);

mysql> SHOW FIELDS FROM hello_tb;
+---------+------+------+-----+---------+-------+
| Field   | Type | Null | Key | Default | Extra |
+---------+------+------+-----+---------+-------+
| country | text | YES  |     | NULL    |       |
| words   | text | YES  |     | NULL    |       |
+---------+------+------+-----+---------+-------+
```

* テーブルの削除（参考）
```
mysql> DROP TABLE hello_tb;
```

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. Web サーバのルートディレクトリ（ /ver/www/html/ ）に index<b>.php</b> という名で保存  

1. コードの記述
```
<?php
    try {
        $dbname = "mysql:host=localhost;dbname=test_db";
        $username = "mubirou"; //上記で設定したユーザ
        $password = "vC/6Jy2U"; //上記で設定したパスワード
        $con = new PDO($dbname, $username, $password);
      } catch (PDOException $e) {
        echo 'DB接続エラー: ' . $e->getMessage();
      }
    
    //データの挿入
    $sql = "INSERT INTO hello_tb VALUES('english', 'Hello,world!')";
    $statement = $con -> prepare($sql);
    $statement -> execute();

    //データの抽出
    $sql = "SELECT * FROM hello_tb WHERE country='english'";
    $statement = $con -> prepare($sql);
    $statement -> execute();
    foreach ($statement as $theRecord) {
        echo $theRecord["words"]."<br>";
    }
?>
```

## 実行

1. Web ブラウザ（Google Chrome）を起動

1. [localhost](https://ja.wikipedia.org/wiki/Localhost)/index.php を開く

1. Hello,world! と表示されたら成功！

***
作成者: 夢寐郎  
作成日: 2017年03月02日  
更新日: 2021年05月28日