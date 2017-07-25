# MySQL / MariaDB（ macOS ）

## MySQL / MariaDB について

* MySQL は1995年に登場したオープンソースの [RDBMS](http://bit.ly/2lunAUm) 。商標権･著作権は MySQL AB（〜2008年）→ サン･マイクロシステムズ（2010年にオラクルが買収）に移行している。
* 派生のデータベースに [MariaDB](https://ja.wikipedia.org/wiki/MariaDB) がある（Google の検索システムに採用）。
* MySQL 5.6（2013年2月リリース）で大規模なリファクタリングが行われて以降は、MariaDB と MySQL との間で新機能の取り扱い方などで相違がある。
*  データの操作を行う[問い合わせ言語](http://bit.ly/2mvUUPR)として [SQL](https://ja.wikipedia.org/wiki/SQL) を利用。

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|ソフトウェア|[MAMP](https://www.mamp.info/en/) 4.1.1|ー|
|Web サーバ|Apache 2.2.31|2015年07月|
|データベース|[MySQL](https://ja.wikipedia.org/wiki/MySQL) 5.6.35|2016年12月|
|実行エンジン|PHP 7.1.1|2017年01月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|PHP Debug 1.10.0|ー|
|拡張機能|[vscode-database](http://bit.ly/2mh8nYF) 1.2.0|ー|
|ブラウザ|Safari 10.0.3|2017年01月|

1. [MAMP](https://www.mamp.info/en/) のインストール
    1. https://www.mamp.info/en/ にアクセス
    1. [DOWNLOAD] → [Download] を選び、ダウンロード
    1. ダウンロードした MAMP_MAMP_PRO_4.1.1.pkg ファイルをダブルクリック
    1. 指示に従ってインストール
    1. [移動] → [アプリケーション] → [MAMP] → MAMP をダブルクリックして起動
    1. [Open WebStart page] を選択（Webページが開く）
    1. [phpinfo] を選択してバージョンを確認
        * Apache 2.2.31
        * PHP 7.1.1
    1. ターミナルでバージョン確認  
        $ cd /Applications/MAMP/Library/bin  
        $ ./mysql --version  
        ./mysql  Ver 14.14 Distrib 5.6.35, for osx10.9 (x86_64) using  EditLine wrapper

1. ポートの変更
    1. MAMP を起動
    1. [Preferences...] → [Ports] を選択
    1. ポート番号を次の通りに変更  
        * Apache ポート: 8888 → 80
        * MySQL ポート: 8889 → 3306

1. Web サーバのルートディレクトリの確認  
    1. MAMP を起動
    1. [Preferences...] → [Web Server] を選択  
    初期値は Document Root: MacintoshHD > アプリケーション > MAMP > htdocs  
    （ /Applications/MAMP/htdocs/ と同意）

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から PHP Debug と [vscode-database](http://bit.ly/2mh8nYF) を検索＆インストール
    

## データベースとテーブルの作成

* データベースの作成
```
$ mysql -u root -p ←MAMPインストール直後のパスワードは「root」

mysql> CREATE DATABASE test_db;

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
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
    1. Web サーバのルートディレクトリ（ アプリケーション > MAMP > htdocs ）に index<b>.php</b> という名で保存  

1. コードの記述
```
<?php
    //MySQLに接続
    $dbname = "mysql:host=localhost;dbname=test_db";
    $username = "root";
    $password = "root";
    $con = new PDO($dbname, $username, $password);
    
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

1. Web ブラウザ（Safari）を起動

1. [localhost](https://ja.wikipedia.org/wiki/Localhost)/index.php を開く

1. Hello,world! と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月08日
