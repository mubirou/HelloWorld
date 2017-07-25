### この項目は編集中です

# SQLite（ Windows ）

## <ruby>SQLite<rt>エスキューライト</rt></ruby> について

* 2000年に登場したオープンソースの軽量コンパクトな [RDBMS](http://bit.ly/2lunAUm)。
* 大規模なシステムには不向きだが、中小規模のデータを扱う限りでは高速に処理（同時書き込みが不可）。
* ファイル単位で処理されるためバックアップが容易。
*  データの操作を行う[問い合わせ言語](http://bit.ly/2mvUUPR)として [SQL](https://ja.wikipedia.org/wiki/SQL) を利用。

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|ソフトウェア|[XAMPP](https://ja.wikipedia.org/wiki/XAMPP) 7.1.1|2017年2月|
|Web サーバ|Apache 2.4.25|2016年12月|
|データベース|[MariaDB](https://ja.wikipedia.org/wiki/MariaDB) 10.1.21|2017年1月|
|実行エンジン|PHP 7.1.1|2017年01月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|PHP Debug 1.10.0|ー|
|拡張機能|[vscode-database](http://bit.ly/2mh8nYF) 1.2.0|ー|
|ブラウザ|Google Chrome 57.0.2987.98|2017年03月|

1. [XAMPP](https://ja.wikipedia.org/wiki/XAMPP) のインストール
    1. https://www.apachefriends.org/download.html にアクセス
    1. [XAMPP for Windows 5.6.30, 7.0.15 & 7.1.1] の [7.1.1 / PHP 7.1.1] の [Download（32bit）] をクリック、ダウンロード
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
    477行目 display_errors=On  
    ```

1. [環境変数](http://bit.ly/2lCIAgK)の設定  
    1. タスクバーのスタートボタンを右クリック → [コントロールパネル] → [システムとセキュリティ] → [システム] → [システムの詳細設定] → [環境変数] を開く
    1. [システム環境変数] で変数 "Path" を探して選択 → [編集] ボタンをクリック
    1. 変数値の最後に ;C:\xampp\mysql\bin を追加（mysql.exeが存在）
    1. Windows を再起動
    1. コマンドプロンプトでバージョン確認  
        \>mysql --version  
        mysql  Ver 15.1 Distrib 10.1.21-MariaDB, for Win32 (AMD64)

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
    | test_db            |
    +--------------------+
    ```

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
        $dbname = "mysql:host=localhost;dbname=test_db";
        $username = "root";
        $password = "";
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

1. Web ブラウザ（Google Chrome）を起動

1. [localhost](https://ja.wikipedia.org/wiki/Localhost)/index.php を開く

1. Hello,world! と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月16日