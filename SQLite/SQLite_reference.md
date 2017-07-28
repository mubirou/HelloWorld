### この項目は書きかけです

# <b>SQLite 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/TakashiNishimura/HelloWorld/blob/master/SQLite/SQLite_linux.md) / [macOS](https://github.com/TakashiNishimura/HelloWorld/blob/master/SQLite/SQLite_mac.md) / [Windows](https://github.com/TakashiNishimura/HelloWorld/blob/master/SQLite/SQLite_win.md)）
* [データベースの作成](#データベースの作成)
* [データベースの削除](#データベースの削除)
* [テーブルの作成](#テーブルの作成)
* [テーブルの削除](#テーブルの削除)
* [データ型](#データ型)
***
* [XXX](#XXX)


<a name="データベースの作成"></a>
# <b>データベースの作成</b>

### コマンドラインの場合
```
$ cd /var/www/html <= 作成したいディレクトリに移動
$ sqlite3 test.sqlite3 <= 既存の場合はファイルを開く（慣例的に xxx.sqlite3 とする）
sqlite> .databases <= ここで実際に.sqlite3 ファイルが生成される
sqlite> .exit <= 終了（間違えてコマンドを打ってしまった場合「;」を入力）
```

### PHP の場合
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $con = new PDO("sqlite:test.sqlite3");
    var_dump($con) //=> object(PDO)#1 (0) { }
?>
```

実行環境：Ubuntu 16.04 LTS、SQLite 3.11、PHP 7.0、Chromium 59  
作成者：Takashi Nishimura  
作成日：2017年07月27日


<a name="データベースの削除"></a>
# <b>データベースの削除</b>

特別なコマンドはありません（手動で「ゴミ箱へ移動する」方法でも可能）
```
$ ls -l /var/www/html/test.sqlite3 <= 確認
-rw-r--r-- ... /var/www/html/test.sqlite3
$ rm -f /var/www/html/test.sqlite3 <= 実際に削除
```

実行環境：Ubuntu 16.04 LTS、SQLite 3.11、PHP 7.0、Chromium 59  
作成者：Takashi Nishimura  
作成日：2017年07月27日


<a name="テーブルの作成"></a>
# <b>テーブルの作成</b>

### 構文
```
CREATE TABLE テーブル名 (カラム名 型 [列フラグ オプション], カラム名 型  [列フラグ オプション], ...)
```

### コマンドラインの場合

* テーブルの作成
    ```
    $ sqlite3 /var/www/html/test.sqlite3 <= データベースの作成（開く）
    sqlite> CREATE TABLE book_tb (
        isbn VARCHAR(13),
        title VARCHAR(100),
        author VARCHAR(100),
        date VARCHAR(10),
        price INTEGER,
        amazon REAL
    );
    ```

* テーブルの確認
    ```
    $ sqlite3 /var/www/html/test.sqlite3 <= データベースの作成（開く）
    sqlite> .schema book_tb <= テーブルスキーマ（構造）の確認
    CREATE TABLE book_tb (
        isbn VARCHAR(13),
        title VARCHAR(100),
        author VARCHAR(100),
        date VARCHAR(10),
        price INTEGER,
        amazon REAL
    );
    ```

### PHP の場合
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $con = new PDO("sqlite:test.sqlite3");

    //============================================
    // テーブルの作成（xxx_tb が無い場合のみ作成）
    //============================================
    $sql = "CREATE TABLE IF NOT EXISTS book_tb (
        isbn VARCHAR(13),
        title VARCHAR(100),
        author VARCHAR(100),
        price INTEGER,
        amazon REAL
    )";
    $statement = $con->prepare($sql);
    $statement->execute();

    //=================================
    // 以下は検証（ダミーデータを挿入）
    //=================================
    $sql = "INSERT INTO book_tb VALUES (0, 'test', 'test', 0, 0)";
    $statement = $con->prepare($sql);
    $statement->execute();

    $statement = $con->prepare("SELECT * FROM book_tb"); //全データを選択
    $statement->execute();

    $result = $statement->fetch(PDO::FETCH_ASSOC);
    print_r($result);
    //=> Array ( [isbn] => 0 [title] => test [author] => test [price] => 0 [amazon] => 0.0 )
?>
```

実行環境：Ubuntu 16.04 LTS、SQLite 3.11、PHP 7.0、Chromium 59  
作成者：Takashi Nishimura  
作成日：2017年07月27日


<a name="テーブルの削除"></a>
# <b>テーブルの削除</b>

### 構文
```
DROP TABLE テーブル名
```

### コマンドラインの場合
```
$ sqlite3 /var/www/html/test.sqlite3 <= データベースを開く
sqlite> .tables <= 既存のテーブルの確認
book_tb
sqlite> DROP TABLE book_tb; <= テーブルの削除
sqlite> .tables <= 再確認
sqlite>   <= 何も表示されない
```

### PHP の場合
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $con = new PDO("sqlite:test.sqlite3");

    // テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS book_tb (isbn VARCHAR(13), title VARCHAR(100))";
    $statement = $con->prepare($sql);
    $statement->execute();

    // テーブルの削除
    $sql = "DROP TABLE IF EXISTS book_tb"; //"IF EXISTS"はテーブルが存在すれば...の意
    $statement = $con->prepare($sql);
    $statement->execute();
?>
```

実行環境：Ubuntu 16.04 LTS、SQLite 3.11、PHP 7.0、Chromium 59  
作成者：Takashi Nishimura  
作成日：2017年07月27日


<a name="データ型"></a>
# <b>データ型</b>

### 概要
SQLite の場合、テーブル作成時にデータ型を指定してもあまり意味がなく、どんな値を挿入してもエラーが発生せずに格納できてしまいます（作成時に型指定を省略することも可能）。

### データ型の種類
1. <b>INTEGER</b> 型: 整数（-9223372036854775808 〜 9223372036854775807）
1. <b>REAL</b> 型: 浮動小数点数（小数点第14位）
1. NUMERIC 型: 数値は INTEGER / REAL に振り分けられる
1. <b>TEXT</b> 型: 文字列
1. VARCHAR 型: 最大文字数を指定する文字列（TEXT 型扱い）
1. BLOB 型: 入力データをそのまま格納
1. <b>NULL</b> 型: 値が何もない状態

### 検証
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $con = new PDO("sqlite:test.sqlite3");

    // テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS book_tb (
        column1 INTEGER,
        column2 REAL,
        column3 NUMERIC,
        column4 TEXT,
        column5 VARCHAR(2)
    )";
    $statement = $con->prepare($sql);
    $statement->execute();

    // DEBUG用（既存の場合は削除）
    $sql = "DELETE FROM book_tb WHERE column1 = 1";
    $statement = $con->prepare($sql); //全データを選択
    $statement->execute();

    // データの挿入
    $sql = "INSERT INTO book_tb VALUES (
        1,
        3.14159265358979323846264338327,
        9223372036854775807,
        'あいうえお',
        '01'
    )";
    $statement = $con->prepare($sql);
    $statement->execute();

    // データの取得
    $sql = "SELECT * FROM book_tb WHERE column1 = 1";
    $statement = $con->prepare($sql); 
    $statement->execute();

    while($theRecord = $statement->fetch()) {
        echo $theRecord["column1"]."<br>"; //=> 1
        echo $theRecord["column2"]."<br>"; //=> 3.14159265358979
        echo $theRecord["column3"]."<br>"; //=> 9223372036854775807（900京余）
        echo $theRecord["column4"]."<br>"; //=> あいうえお
        echo $theRecord["column5"]."<br>"; //=> 1.0（要注意）
    }
?>
```

実行環境：Ubuntu 16.04 LTS、SQLite 3.11、PHP 7.0、Chromium 59  
作成者：Takashi Nishimura  
作成日：2017年07月28日


<a name="XXX"></a>
# <b>XXX</b>

### XXXX
1. XXX
1. XXX

### XXX
```
XXX
XXX
```

実行環境：Ubuntu 16.04 LTS、SQLite 3.11、PHP 7.0、Chromium 59  
作成者：Takashi Nishimura  
作成日：2017年0X月XX日