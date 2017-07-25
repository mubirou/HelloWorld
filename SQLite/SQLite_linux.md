### この項目は編集中です

# SQLite（ Linux ）

## <ruby>SQLite<rt>エスキューライト</rt></ruby> について

* 2000年に登場したオープンソースの軽量コンパクトな [RDBMS](http://bit.ly/2lunAUm)。
* 大規模なシステムには不向きだが、中小規模のデータを扱う限りでは高速に処理（同時書き込みが不可）。
* ファイル単位で処理されるためバックアップが容易。
*  データの操作を行う[問い合わせ言語](http://bit.ly/2mvUUPR)として [SQL](https://ja.wikipedia.org/wiki/SQL) を利用。

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|Web サーバ|[Apache](https://ja.wikipedia.org/wiki/Apache_HTTP_Server) 2.4.18|2016年07月|
|データベース|[SQLite](https://ja.wikipedia.org/wiki/SQLite) 3.11.0|2016年02月|
|実行エンジン|[PHP](https://ja.wikipedia.org/wiki/PHP:_Hypertext_Preprocessor) 7.0.18|2017年04月|
|エディタ|Visual Studio Code 1.14.2|2017年06月|
|拡張機能|PHP Debug 1.11.1|2017年07月|
|ブラウザ|Mozilla Firefox 54.0|2017年06月|

1. [PHP の開発環境の構築](https://github.com/TakashiNishimura/HelloWorld/blob/master/PHP/PHP_linux.md) をする

1. [SQLite](https://ja.wikipedia.org/wiki/SQLite) のインストール（省略可）  
    $ sudo apt install sqlite3  
    $ sqlite3 -version  
    3.11.0 2016-02-15 17:29:24 ...

1. バージョン確認（以下の xxx.php を Web サーバ上で実行）
    ```
    <?php
        $con = new PDO('sqlite::memory:', null, null);
        $statement = $con->prepare('SELECT sqlite_version()');
        $statement->execute();
        echo $statement->fetchColumn();
    ?>
    ```

1. パーミッションの変更（xxx.sqlite3 を置くディレクトリ）
    $ cd /var/www  
    $ ls -l  
    drwxr-xr-x 43 none root 4096 Jul 25 13:59 html ←755（所有者以外は書込不可）  
    $ chmod -R 777 /var/www/html  
    $ ls -l  
    drwxrwxrwx 43 none root 4096  7月 25 13:59 html ←777（所有者以外も書込可能）  

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. Web サーバのルートディレクトリ（ /ver/www/html/ ）に test<b>.php</b> という名で保存 

1. コードの記述（test.php）
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $con = new PDO("sqlite:test.sqlite3"); //慣例的に xxx.sqlite3 とする

    // テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hello_tb(country TEXT, words TEXT)";
    $statement = $con->prepare($sql); //prepare() メソッド
    $statement->execute();

    //データの挿入（今回のサンプルでは実行する度に追加される）
    $sql = "INSERT INTO hello_tb VALUES('english', 'Hello,world!')";
    $statement = $con->prepare($sql);
    $statement->execute();

    //データの抽出
    $sql = "SELECT * FROM hello_tb WHERE country='english'";
    $statement = $con->prepare($sql);
    $statement->execute();
    foreach ($statement as $theRecord) {
        echo $theRecord["words"]."<br>";
    }
?>
```

## 実行

1. Web ブラウザ（Firefox）を起動

1. [localhost](https://ja.wikipedia.org/wiki/Localhost)/test.php を開く

1. Hello,world! と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年07月25日