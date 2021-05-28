# MySQL / MariaDB（ Windows ）

## MySQL / <ruby>MariaDB<rt>マリアディービー</rt></ruby> について

* MySQL は1995年に登場したオープンソースの [RDBMS](http://bit.ly/2lunAUm) 。商標権･著作権は MySQL AB（〜2008年）→ サン･マイクロシステムズ（2010年にオラクルが買収）に移行している。
* 派生のデータベースに [MariaDB](https://ja.wikipedia.org/wiki/MariaDB) がある（Google の検索システムに採用）。
* MySQL 5.6（2013年2月リリース）で大規模なリファクタリングが行われて以降は、MariaDB と MySQL との間で新機能の取り扱い方などで相違がある。
*  データの操作を行う[問い合わせ言語](http://bit.ly/2mvUUPR)として [SQL](https://ja.wikipedia.org/wiki/SQL) を利用。

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|ソフトウェア|[XAMPP](https://ja.wikipedia.org/wiki/XAMPP) 8.0.6|2021年05月|
|Web サーバ|Apache 2.4.47|2020年04月|
|データベース|[MariaDB](https://ja.wikipedia.org/wiki/MariaDB) 10.1.21|2021年05月|
|実行エンジン|PHP 8.0.6|2021年05月|
|エディタ|Visual Studio Code 1.56.2|2021年05月|
|拡張機能|PHP Debug 1.15.1|ー|
|拡張機能|[vscode-database](http://bit.ly/2mh8nYF) 2.2.3|ー|
|ブラウザ|Google Chrome 91.0|2021年05月|

1. [XAMPP](https://ja.wikipedia.org/wiki/XAMPP) のインストール
    1. https://www.apachefriends.org/download.html にアクセス
    1. [XAMPP for Windows 7.3.28, 7.4.19 & 8.0.6] の [8.0.6 / PHP 8.0.6] の [Download（64bit）] をクリック、ダウンロード
    1. ダウンロードした .exe ファイルをダブルクリック、インストール
    1. XAMPP Control Panel が起動したら以下の Service の [Start] ボタンをクリック
        * Apache
        * MySQL

1. Web サーバのルートディレクトリ（ C:\xampp\htdocs ）に以下の内容の test.php ファイルを置き、Webブラウザで localhost/test.php を開いて各種情報を確認（<b>本番環境ではセキュリティ上削除しておく</b>）
    ```
    <?php phpinfo(); ?>
    ```

1. エディタで C:\xampp\php\php.ini を開いて、エラー表示が有効か確認する（<b>本番環境では Off にする</b>）
    ```
    501行目 display_errors=On  
    ```

1. [環境変数](http://bit.ly/2lCIAgK)の設定  
    1. [ここに入力して検索] → [Windows Power Shell] → [管理者として実行] を選択（要注意）
    1. コマンドを実行
    ```
    > Start C:\Windows\system32\rundll32.exe sysdm.cpl, EditEnvironmentVariables
    ```
    1. [システム環境変数] で変数 "Path" を探して選択 → [編集] ボタンをクリック
    1. 変数値の最後に C:\xampp\mysql\bin を追加（mysql.exeが存在）
    1. Windows を再起動
    1. コマンドプロンプトでバージョン確認  
        \>mysql --version  
        C:\xampp\mysql\bin\mysql.exe  Ver 15.1 Distrib 10.4.19-MariaDB, ...

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から PHP Debug と [vscode-database](http://bit.ly/2mh8nYF) を検索＆インストール
    

## データベースとテーブルの作成

* データベースの起動（Windowsを起動する度に実行）
   1. [Windows スタートメニュー] → [すべてのアプリ] → [XAMPP] → [XAMPP Control Panel] を起動
   2. 以下の Service の [Start] ボタンをクリック
        * Apache
        * MySQL


* データベースの作成
    ```
    >mysql -u  root

    MariaDB [(ユーザー名)]> CREATE DATABASE test_db;

    MariaDB [(ユーザー名)]> show databases;
    +--------------------+
    | Database           |
    +--------------------+
    | information_schema |
    | mysql              |
    | performance_schema |
    | phpmyadmin         |
    | test               |
    | test_db            | ←新しくできた
    +--------------------+
    ```
    * 終了方法は > exit と入力

* データベースの削除（参考）
    ```
    MariaDB [(ユーザー名)]> DROP DATABASE test_db;
    ```

* テーブルの作成
    ```
    MariaDB [(ユーザー名)]> USE test_db;

    MariaDB [(ユーザー名)]> CREATE TABLE hello_tb(country TEXT, words TEXT);

    MariaDB [(ユーザー名)]> SHOW FIELDS FROM hello_tb;
    +---------+------+------+-----+---------+-------+
    | Field   | Type | Null | Key | Default | Extra |
    +---------+------+------+-----+---------+-------+
    | country | text | YES  |     | NULL    |       |
    | words   | text | YES  |     | NULL    |       |
    +---------+------+------+-----+---------+-------+
    ```

* テーブルの削除（参考）
    ```
    MariaDB [(ユーザー名)]> DROP TABLE hello_tb;
    ```

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. Web サーバのルートディレクトリ（ C:\xampp\htdocs ）に index<b>.php</b> という名で保存  

1. コードの記述
    ```
    <?php
        //mariaDBに接続
        try {
            $dbname = "mysql:host=localhost;dbname=test_db";
            $username = "root";
            $password = "";
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
作成日: 2017年03月16日  
更新日: 2021年05月29日