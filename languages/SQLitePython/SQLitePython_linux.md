### <font color="Red"><b>この項目は編集中です</b></font>

# SQLite with Python（ Linux ）

## <ruby>SQLite<rt>エスキューライト</rt></ruby> について

* 2000年に登場したオープンソースの軽量コンパクトな [RDBMS](http://bit.ly/2lunAUm)。
* 大規模なシステムには不向きだが、中小規模のデータを扱う限りでは高速に処理（同時書き込みが不可）。
* ファイル単位で処理されるためバックアップが容易。
* データベースユーザーの概念が無いため、パスワードの設定は不可。
* [.htacess](http://www.weblio.jp/content/Htaccess) を使い .sqlite3 ファイルに対してアクセス制限を設定しないとファイル（xxx.sqlite3）を直接ダウンロード出来てしまう。
* データの操作を行う[問い合わせ言語](http://bit.ly/2mvUUPR)として [SQL](https://ja.wikipedia.org/wiki/SQL) を利用。

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 20.04.2 LTS|2021年02月|
|Web サーバ|[Apache](https://ja.wikipedia.org/wiki/Apache_HTTP_Server) 2.4.41|2019年08月|
|データベース|[SQLite](https://ja.wikipedia.org/wiki/SQLite) 3.31.1|2020年01月|
|実行エンジン|[PHP](https://ja.wikipedia.org/wiki/PHP:_Hypertext_Preprocessor) 7.4.3|2020年02月|
|エディタ|Visual Studio Code 1.56.2|2021年05月|
|拡張機能|PHP Debug 1.15.1|ー|
|ブラウザ|Google Chrome 91.0|2021年05月|

1. [PHP の開発環境の構築](https://github.com/mubirou/HelloWorld/blob/master/languages/PHP/PHP_linux.md) をする

1. [SQLite](https://ja.wikipedia.org/wiki/SQLite) のインストール  
    $ sudo apt install sqlite3  
    $ sqlite3 -version  
    3.31.1 ...

## コードの記述（その１）

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. Web サーバのルートディレクトリ（ /ver/www/html/ ）に test<b>.php</b> という名で保存 

1. コードの記述（test.php）
```
<?php
    $con = new PDO('sqlite::memory:', null, null);
    $statement = $con->prepare('SELECT sqlite_version()');
    $statement->execute();
    echo $statement->fetchColumn(); //=> 3.31.1
?>
```

## 実行（その１）

1. Web ブラウザ（Google Chrome）を起動

1. [localhost](https://ja.wikipedia.org/wiki/Localhost)/test.php を開く

1. PHPのバージョンが表示されたらOK

## コードの記述（その２）
上記の test.php を書き換える

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

## 実行（その２）

1. Web ブラウザ（Google Chrome）を起動

1. [localhost](https://ja.wikipedia.org/wiki/Localhost)/test.php を開く

1. Hello,world! と表示されたら成功！

***
作成者: 夢寐郎  
作成日: 2017年07月25日  
更新日: 2021年05月27日