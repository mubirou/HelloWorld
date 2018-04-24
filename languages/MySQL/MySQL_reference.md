# <b>MySQL / MariaDB 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/vvestvillage/HelloWorld/blob/master/languages/MySQL/MySQL_linux.md) / [macOS](https://github.com/vvestvillage/HelloWorld/blob/master/languages/MySQL/MySQL_mac.md) / [Windows](https://github.com/vvestvillage/HelloWorld/blob/master/languages/MySQL/MySQL_win.md)）
* [データベースの作成](#データベースの作成)
* [データベースの削除](#データベースの削除)
* [データ型](#データ型)
* [主キー](#主キー)（PRIMARY KEY）
* [テーブルの作成](#テーブルの作成)（CREATE TABLE 文）
* [テーブルの削除](#テーブルの削除)（DROP TABLE 文）
* [データの追加](#データの追加)（INSERT 文）
* [データの削除](#データの削除)（DELETE 文）
* [データの更新](#データの更新)（UPDATE 文）
* データの抽出（SELECT 文）
    * [全ての列を抽出](#全ての列を抽出)
    * [特定の列を抽出](#特定の列を抽出)
    * [重複したデータを除いて抽出](#重複したデータを除いて抽出)
    * [条件に合致したデータを抽出](#条件に合致したデータを抽出)
        * [=](#=)（等しい）
        * [<>](#<>)（等しくない）
        * [\>=](#>=)（以上など）
        * [BETWEEN ○ AND ○](#BETWEEN)（...の間）
        * [IN](#IN)（...のいずれか）
        * [LIKE](#LIKE)（あいまい条件）
        * [AND](#AND)（論理積）
        * [OR](#OR)（論理和）
    * [ソートして抽出](#ソートして抽出)
* [SQLite→CSV](#SQLite→CSV)
* [CSV→SQLite](#CSV→SQLite)
***

<a name="データベースの作成"></a>
# <b>データベースの作成</b>

### 書式
```
mysql> CREATE DATABASE データベース名;
```

### 実行例
```
$ mysql -u root -p <= MySQL用のパスワード
mysql> CREATE DATABASE test_db; <= 既存の場合はERROR
Query OK, 1 row affected (0.00 sec)
mysql> show databases; <= 既存のデータベースの確認
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test_db            | <= 上記で作成したデータベース
+--------------------+
mysql> exit <= 終了（間違えてコマンドを打ってしまった場合「;」を入力）
Bye
```

実行環境：Ubuntu 16.04 LTS、MySQL 5.7、PHP 7.0、Chromium 59  
作成者：vvestvillage  
作成日：2017年08月04日


<a name="データベースの削除"></a>
# <b>データベースの削除</b>

### 書式
```
mysql> DROP DATABASE データベース名;
```

```
$ mysql -u root -p
mysql> show databases; <= 既存のデータベースの確認
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
| test_db            | <= 削除したいデータベース
+--------------------+
mysql> DROP DATABASE test_db;
Query OK, 0 rows affected (0.01 sec)

mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| information_schema |
| mysql              |
| performance_schema |
| sys                |
+--------------------+ <= 削除されている
```

実行環境：Ubuntu 16.04 LTS、MySQL 5.7、PHP 7.0、Chromium 59  
作成者：vvestvillage  
作成日：2017年08月04日

***

<a name="データ型"></a>
# <b>データ型</b>

### 主なデータ型
1. <b>INT</b> 型: 整数（-9223372036854775808 〜 9223372036854775807）
1. <b>FLOAT</b> 型: 浮動小数点数（小数点第5位）
1. <b>TEXT</b> 型: 文字列
1. <b>VARCHAR</b> 型: 最大文字数を指定する文字列
1. <b>DATE</b> 型: 日付データ型
1. <b>TIME</b> 型: 時刻データ型
1. <b>NULL</b> 型: 値が何もない状態

### 検証
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    // テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (
        column1 INT,
        column2 FLOAT,
        column3 TEXT,
        column4 VARCHAR(2),
        column5 DATE,
        column6 TIME
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    // データの挿入
    $sql = "INSERT INTO hoge_tb VALUES (
        1,
        3.14159265358979323846264338327,
        'あいうえお',
        '01',
        '2017-08-04',
        '11:45:40'
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    // データの取得
    $sql = "SELECT * FROM hoge_tb WHERE column1 =1";
    $statement = $pdo->prepare($sql); 
    $statement->execute();

    while($theRecord = $statement->fetch()) {
        echo $theRecord["column1"]."<br>"; //=> 1
        echo $theRecord["column2"]."<br>"; //=> 3.14159
        echo $theRecord["column3"]."<br>"; //=> あいうえお
        echo $theRecord["column4"]."<br>"; //=> 01
        echo $theRecord["column5"]."<br>"; //=> 2017-08-04
        echo $theRecord["column6"]."<br>"; //=> 11:45:40
    }
?>
```

実行環境：Ubuntu 16.04 LTS、MySQL 5.7、PHP 7.0、Chromium 59  
作成者：vvestvillage  
作成日：2017年08月04日


<a name="主キー"></a>
# <b>主キー</b>（PRIMARY KEY）

### 概要
* データ（レコード）を特定するために使用するカラム（列）に設定。
* 絶対に重複のない値を持つカラムに対して設定。
* 重複がないので、そのカラムの値を指定することでテーブル内の特定のデータを取得できる。
* 1つのテーブルに1つだけ設定可能。
* 同じ主キーのデータを2回追加しようとすると無視される。

### 書式
```
CREATE TABLE [IF NOT EXISTS] テーブル名 (
        列名 データ型 NOT NULL,
        ...,
        PRIMARY KEY (列名(バイト数))
)
```

### 例文
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    //テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (
        id TEXT NOT NULL,
        name TEXT,
        age INT,
        PRIMARY KEY (id(7))
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの追加
    $statement = $pdo->prepare("INSERT INTO hoge_tb VALUES ('2017001', 'TARO SUZUKI', 30)");
    var_dump($statement->execute()); //bool(true)

    $statement = $pdo->prepare("INSERT INTO hoge_tb VALUES ('2017002', 'HANAKO SATO', 24)");
    var_dump($statement->execute()); //bool(true)

    $statement = $pdo->prepare("INSERT INTO hoge_tb VALUES ('2017003', 'TARO SUZUKI', 32)");
    var_dump($statement->execute()); //bool(true) ←同姓同名でもＯＫ

    $statement = $pdo->prepare("INSERT INTO hoge_tb VALUES ('2017002', 'ICHIRO KATO', 19)");
    var_dump($statement->execute()); //bool(false) ←同じidなので追加されない

    //全データを取得
    $sql = "SELECT * FROM hoge_tb"; //全ての列を抽出
    $statement = $pdo->query($sql);
    foreach ($statement as $tmp) {
        echo $tmp['id'].'|'.$tmp['name'].'|'.$tmp['age'];
        echo "<br>";
    }
    //=> 2017001|TARO SUZUKI|30
    //=> 2017002|HANAKO SATO|24
    //=> 2017003|TARO SUZUKI|32
?>
```

実行環境：Ubuntu 16.04 LTS、MySQL 5.7、PHP 7.0、Chromium 59  
作成者：vvestvillage  
作成日：2017年08月04日


<a name="テーブルの作成"></a>
# <b>テーブルの作成（CREATE TABLE 文）</b>

### 構文
```
CREATE TABLE [IF NOT EXISTS] テーブル名 (列名① 型 [列フラグ], 列名② 型 [列フラグ], ...)
```

### コマンドラインの場合

* テーブルの作成
    ```
    $ mysql -u root -p
    mysql> USE test_db <= 既存のデータベースを開く
    Database changed
    mysql> CREATE TABLE book_tb (
        -> isbn VARCHAR(13),
        -> title VARCHAR(100),
        -> author VARCHAR(100),
        -> date DATE,
        -> price INT,
        -> amazon FLOAT
        -> );
    Query OK, 0 rows affected (0.28 sec)
    ```

* テーブルの確認
    ```
    mysql> SHOW FIELDS FROM book_tb;
    +--------+--------------+------+-----+---------+-------+
    | Field  | Type         | Null | Key | Default | Extra |
    +--------+--------------+------+-----+---------+-------+
    | isbn   | varchar(13)  | YES  |     | NULL    |       |
    | title  | varchar(100) | YES  |     | NULL    |       |
    | author | varchar(100) | YES  |     | NULL    |       |
    | date   | date         | YES  |     | NULL    |       |
    | price  | int(11)      | YES  |     | NULL    |       |
    | amazon | float        | YES  |     | NULL    |       |
    +--------+--------------+------+-----+---------+-------+
    ```

### PHP の場合
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    //============================================
    // テーブルの作成（xxx_tb が無い場合のみ作成）
    //============================================
    $sql = "CREATE TABLE book_tb (
        isbn VARCHAR(13),
        title VARCHAR(100),
        author VARCHAR(100),
        date DATE,
        price INT,
        amazon FLOAT
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //=================================
    // 以下は検証（ダミーデータを挿入）
    //=================================
    $sql = "INSERT INTO book_tb VALUES (NULL, NULL, NULL, NULL, NULL, NULL)";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    $statement = $pdo->prepare("SELECT * FROM book_tb"); //全データを選択
    $statement->execute();

    $result = $statement->fetch(PDO::FETCH_ASSOC);
    print_r($result);
    //=> Array ( [isbn] => [title] => [author] => [date] => [price] => [amazon] => )
?>
```

実行環境：Ubuntu 16.04 LTS、MySQL 5.7、PHP 7.0、Chromium 59  
作成者：vvestvillage  
作成日：2017年08月04日


<a name="テーブルの削除"></a>
# <b>テーブルの削除（DROP TABLE 文）</b>

### 構文
```
DROP TABLE テーブル名
```

### コマンドラインの場合

```
$ mysql -u root -p
mysql> USE test_db <= 既存のデータベースを開く
Database changed
mysql> show tables; <= 既存のテーブルの確認
+-------------------+
| Tables_in_test_db |
+-------------------+
| book_tb           |
+-------------------+

mysql> DROP TABLE book_tb; <= テーブルの削除
mysql> show tables;
Empty set (0.00 sec) <= 削除されている
```

### PHP の場合
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    //テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (
        id TEXT,
        name TEXT,
        age INT
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    // テーブルの削除
    $sql = "DROP TABLE IF EXISTS hoge_tb"; //"IF EXISTS"はテーブルが存在すれば...の意
    $statement = $pdo->prepare($sql);
    $statement->execute();
?>
```

実行環境：Ubuntu 16.04 LTS、MySQL 5.7、PHP 7.0、Chromium 59  
作成者：vvestvillage  
作成日：2017年08月04日


<a name="データの追加"></a>
# <b>データの追加（INSERT 文）</b>

```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    //============================================
    // テーブルの作成（xxx_tb が無い場合のみ作成）
    //============================================
    $sql = "CREATE TABLE IF NOT EXISTS book_tb (
        isbn VARCHAR(13),
        title VARCHAR(100),
        author VARCHAR(100),
        price INT,
        amazon FLOAT
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //=============
    // データの挿入
    //=============
    $sql = "INSERT INTO book_tb VALUES (
        9784061475564,
        '勝海舟',
        '保永貞夫',
        540,
        3.0
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //===============
    // 全データを取得
    //===============
    $sql = "SELECT * FROM book_tb";
    $statement = $pdo->query($sql);
    foreach ($statement as $tmp) {
        echo $tmp['isbn'].'|'.$tmp['title'].'|'.$tmp['author'].'|'.$tmp['price'].'|'.$tmp['amazon'];
        echo "<br>";
    }
    //=> 9784061475564|勝海舟|保永貞夫|540|3
?>
```

実行環境：Ubuntu 16.04 LTS、MySQL 5.7、PHP 7.0、Chromium 59  
作成者：vvestvillage  
作成日：2017年08月04日


<a name="データの削除"></a>
# <b>データの削除（DELETE 文）</b>

```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    // テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (id INT, name TEXT)";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入①
    $sql = "INSERT INTO hoge_tb VALUES (1, 'CHIKASHI')";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入②
    $sql = "INSERT INTO hoge_tb VALUES (2, 'HANAKO')";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //=============
    // データの削除
    //=============
    $sql = "DELETE FROM hoge_tb WHERE id = 1"; //「==」ではない
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //全データを取得
    $sql = "SELECT * FROM hoge_tb";
    $statement = $pdo->query($sql);
    foreach ($statement as $tmp) {
        echo $tmp['id'].'|'.$tmp['name'];
        echo "<br>";
    }
    //=> 2|HANAKO
?>
```

実行環境：Ubuntu 16.04 LTS、MySQL 5.7、PHP 7.0、Chromium 59  
作成者：vvestvillage  
作成日：2017年08月04日


<a name="データの更新"></a>
# <b>データの更新（UPDATE 文）</b>

### 全データの更新
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    // テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (id INT, name TEXT)";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入
    $sql = "INSERT INTO hoge_tb VALUES (1, 'CHIKASHI')";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入
    $sql = "INSERT INTO hoge_tb VALUES (2, 'HANAKO')";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //============================================
    // 全データの更新（あまり使わないでしょう...）
    //============================================
    $sql = "UPDATE hoge_tb SET id = NULL, name = NULL"; //「==」ではない
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //全データを取得
    $sql = "SELECT * FROM hoge_tb";
    $statement = $pdo->query($sql);
    foreach ($statement as $tmp) {
        echo $tmp['id'].'|'.$tmp['name'];
        echo "<br>";
    }
    //=> |
    //=> |
?>
```

### 条件に合致したデータのみ更新
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    // テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (id INT, name TEXT)";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入①
    $sql = "INSERT INTO hoge_tb VALUES (1, 'CHIKASHI')";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入②
    $sql = "INSERT INTO hoge_tb VALUES (2, 'HANAKO')";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //=============================
    // 条件に合致したデータのみ更新
    //=============================
    $sql = "UPDATE hoge_tb SET name = 'たかし' WHERE name = 'CHIKASHI'"; //「==」ではない
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //全データを取得
    $sql = "SELECT * FROM hoge_tb";
    $statement = $pdo->query($sql);
    foreach ($statement as $tmp) {
        echo $tmp['id'].'|'.$tmp['name'];
        echo "<br>";
    }
    //=> 1|たかし
    //=> 2|HANAKO
?>
```

実行環境：Ubuntu 16.04 LTS、MySQL 5.7、PHP 7.0、Chromium 59  
作成者：vvestvillage  
作成日：2017年08月04日


<a name="全ての列を抽出"></a>
# <b>全ての列を抽出（SELECT 文）</b>

### 書式
```
SELECT * FROM テーブル名
```

### 例文
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    // テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (id INT, name TEXT)";
    $statement = $pdo->prepare($sql);
    $statement->execute();


    //データの挿入①
    $sql = "INSERT INTO hoge_tb VALUES (1, 'CHIKASHI')";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入②
    $sql = "INSERT INTO hoge_tb VALUES (2, 'HANAKO')";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //全データを取得
    $sql = "SELECT * FROM hoge_tb"; //全ての列を抽出
    $statement = $pdo->query($sql);
    foreach ($statement as $tmp) {
        echo $tmp['id'].'|'.$tmp['name'];
        echo "<br>";
    }
    //=> 1|CHIKASHI
    //=> 2|HANAKO
?>
```

実行環境：Ubuntu 16.04 LTS、MySQL 5.7、PHP 7.0、Chromium 59  
作成者：vvestvillage  
作成日：2017年08月04日


<a name="特定の列を抽出"></a>
# <b>特定の列を抽出（SELECT 文）</b>

### 書式
```
SELECT 列名①,列名②,... FROM テーブル名
```

### 例文
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    //テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (firstname TEXT, lastname TEXT, sex TEXT)";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('CHIKASHI', 'NISHIMURA', 'man')")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('HANAKO', 'NISHIMURA', 'woman')")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('ICHIRO', 'NISHIMURA', 'man')")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('YOSHIKO', 'NISHIMURA', 'woman')")->execute();

    $sql = "SELECT firstname,lastname FROM hoge_tb"; //特定の列を抽出
    $statement = $pdo->query($sql);

    //該当の全データを取得
    foreach ($statement as $tmp) {
        echo $tmp['firstname'].'|'.$tmp['lastname'];
        echo "<br>";
    }
    //=> CHIKASHI|NISHIMURA
    //=> HANAKO|NISHIMURA
    //=> ICHIRO|NISHIMURA
    //=> YOSHIKO|NISHIMURA
?>
```

実行環境：Ubuntu 16.04 LTS、MySQL 5.7、PHP 7.0、Chromium 59  
作成者：vvestvillage  
作成日：2017年08月04日


<a name="重複したデータを除いて抽出"></a>
# <b>重複したデータを除いて抽出（SELECT 文）</b>

1. 全ての列の値が重複したデータを除いて抽出
    * 書式
    ```
    SELECT DISTINCT * FROM テーブル名
    ```

    * 例文
    ```
    <?php
        // データベースの作成（既存の場合はファイルを開く）
        $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
        $user = 'root';
        $password = 'xxxxxx';
        $pdo = new PDO($dsn, $user, $password);

        //テーブルの作成（xxx_tb が無い場合のみ作成）
        $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (firstname TEXT, lastname TEXT, sex TEXT)";
        $statement = $pdo->prepare($sql);
        $statement->execute();

        //データの挿入
        $pdo->prepare("INSERT INTO hoge_tb VALUES ('良子', '西村', '男')")->execute(); //同じデータ
        $pdo->prepare("INSERT INTO hoge_tb VALUES ('良子', '西村', '女')")->execute();
        $pdo->prepare("INSERT INTO hoge_tb VALUES ('良子', '西村', '男')")->execute(); //同じデータ
        $pdo->prepare("INSERT INTO hoge_tb VALUES ('良子', '鈴木', '男')")->execute();

        $sql = "SELECT DISTINCT * FROM hoge_tb"; //全ての列の値が同じ場合のみ「重複」と判定
        $statement = $pdo->query($sql);

        //該当の全データを取得
        foreach ($statement as $tmp) {
            echo $tmp['lastname'].'|'.$tmp['firstname'].'|'.$tmp['sex'];
            echo "<br>";
        }
        //=> 西村|良子|男
        //=> 西村|良子|女
        //=> 鈴木|良子|男
    ?>
    ```

1. 特定の列の値が重複したデータを除いて抽出
    * 書式
    ```
    SELECT DISTINCT 列名①,列名② FROM テーブル名
    ```

    * 例文
    ```
    <?php
        // データベースの作成（既存の場合はファイルを開く）
        $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
        $user = 'root';
        $password = 'xxxxxx';
        $pdo = new PDO($dsn, $user, $password);

        //テーブルの作成（xxx_tb が無い場合のみ作成）
        $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (
            id INT,
            firstname TEXT,
            lastname TEXT,
            sex TEXT
        )";
        $statement = $pdo->prepare($sql);
        $statement->execute();

        //データの挿入
        $pdo->prepare("INSERT INTO hoge_tb VALUES (1, '良子', '西村', '男')")->execute();
        $pdo->prepare("INSERT INTO hoge_tb VALUES (2, '良子', '西村', '女')")->execute();
        $pdo->prepare("INSERT INTO hoge_tb VALUES (3, '良子', '西村', '男')")->execute();
        $pdo->prepare("INSERT INTO hoge_tb VALUES (4, '良子', '鈴木', '男')")->execute();

        //特定の列の値が同じデータを「重複」と判定
        $sql = "SELECT DISTINCT firstname,lastname FROM hoge_tb";
        $statement = $pdo->query($sql);

        //該当の全データを取得
        foreach ($statement as $tmp) {
            //複数のデータがある列（id,sex)は取得できない（注意）
            echo $tmp['lastname'].'|'.$tmp['firstname'];
            echo "<br>";
        }
        //=> 西村|良子
        //=> 鈴木|良子
    ?>
    ```

実行環境：Ubuntu 16.04 LTS、MySQL 5.7、PHP 7.0、Chromium 59  
作成者：vvestvillage  
作成日：2017年08月04日


<a name="条件に合致したデータを抽出"></a>
# <b>条件に合致したデータを抽出（SELECT 文）</b>

### WHERE 句に利用可能な演算子
* [=](#=)（等しい）
* [<>](#<>)（等しくない）
* [\>=](#>=)（以上など）
* [BETWEEN ○ AND ○](#BETWEEN)（...の間）
* [IN](#IN)（...のいずれか）
* [LIKE](#LIKE)（あいまい条件）
* [AND](#AND)（論理積）
* [OR](#OR)（論理和）

<a name="="></a>

### =（等しい）
* 書式
```
SELECT * FROM テーブル名 WHERE 列名 = 値
```

* 例文
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    //テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (
        id INT,
        firstname TEXT,
        lastname TEXT,
        sex TEXT
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入
    $pdo->prepare("INSERT INTO hoge_tb VALUES (1, '良子', '西村', '男')")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES (2, '良子', '西村', '女')")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES (3, '良子', '鈴木', '男')")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES (4, '良子', '西村', '男')")->execute();

    //条件に合致したデータを抽出
    $sql = "SELECT * FROM hoge_tb WHERE lastname = '西村'";
    $statement = $pdo->query($sql);

    //該当の全データを取得
    foreach ($statement as $tmp) {
        echo $tmp['id'].'|'.$tmp['firstname'].'|'.$tmp['lastname'].'|'.$tmp['sex'];
        echo "<br>";
    }
    //=> 1|良子|西村|男
    //=> 2|良子|西村|女
    //=> 4|良子|西村|男
?>
```

<a name="<>"></a>

### <>（等しくない）
* 書式
```
SELECT * FROM テーブル名 WHERE 列名 <> 値
```

* 例文
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    //テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (
        id INT,
        firstname TEXT,
        lastname TEXT,
        sex TEXT
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入
    $pdo->prepare("INSERT INTO hoge_tb VALUES (1, '良子', '西村', '男')")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES (2, '良子', '西村', '女')")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES (3, '良子', '鈴木', '男')")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES (4, '良子', '西村', '男')")->execute();

    //条件に合致したデータを抽出
    $sql = "SELECT * FROM hoge_tb WHERE lastname <> '西村'";
    $statement = $pdo->query($sql);

    //該当の全データを取得
    foreach ($statement as $tmp) {
        echo $tmp['id'].'|'.$tmp['firstname'].'|'.$tmp['lastname'].'|'.$tmp['sex'];
        echo "<br>";
    }
    //=> 3|良子|鈴木|男
?>
```

<a name=">="></a>

### >=（以上など）
* 書式（他にも <b><=</b>（以下）、<b><</b>（小なり）、<b><</b>（大なり）もあり）
```
SELECT * FROM テーブル名 WHERE 列名 >= 値
```

* 例文
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    //テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (
        name TEXT,
        age INT
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('CHIKASHI', 50)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('HANAKO', 44)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('ICHIRO', 15)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('JIRO', 10)")->execute();

    //条件に合致したデータを抽出
    $sql = "SELECT * FROM hoge_tb WHERE age >= 20";
    $statement = $pdo->query($sql);

    //該当の全データを取得
    foreach ($statement as $tmp) {
        echo $tmp['name'].'|'.$tmp['age'];
        echo "<br>";
    }
    //=> CHIKASHI|50
    //=> HANAKO|44
?>
```

<a name="BETWEEN"></a>

### BETWEEN ○ AND ○（...の間）
* 書式
```
SELECT * FROM テーブル名 WHERE 列名 [NOT] BETWEEN ○ AND ○
```

* 例文
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    //テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (
        name TEXT,
        age INT
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('CHIKASHI', 50)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('HANAKO', 44)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('ICHIRO', 15)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('JIRO', 10)")->execute();

    //条件に合致したデータを抽出
    $sql = "SELECT * FROM hoge_tb WHERE age BETWEEN 12 AND 18";
    $statement = $pdo->query($sql);

    //該当の全データを取得
    foreach ($statement as $tmp) {
        echo $tmp['name'].'|'.$tmp['age'];
        echo "<br>";
    }
    //=> ICHIRO|15
?>
```

<a name="IN"></a>

### IN（...のいずれか）
* 書式
```
SELECT * FROM テーブル名 WHERE 列名 IN (値①, 値②,...)
```

* 例文
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    //テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (
        name TEXT,
        bloodtype TEXT
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('CHIKASHI', 'A')")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('ICHIRO', 'B')")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('JIRO', 'AB')")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('HANAKO', 'B')")->execute();

    //条件に合致したデータを抽出
    $sql = "SELECT * FROM hoge_tb WHERE bloodtype IN ('A','B')";
    $statement = $pdo->query($sql);

    //該当の全データを取得
    foreach ($statement as $tmp) {
        echo $tmp['name'].'|'.$tmp['bloodtype'];
        echo "<br>";
    }
    //=> CHIKASHI|A
    //=> ICHIRO|B
    //=> HANAKO|B
?>
```

<a name="LIKE"></a>

### LIKE（あいまい条件）
* 書式
```
SELECT * FROM テーブル名 WHERE 列名 [NOT] LIKE ('値%') ←値○○ [で始まらないもの]
SELECT * FROM テーブル名 WHERE 列名 [NOT] LIKE ('%値') ←○○値 [で終わらないもの]
SELECT * FROM テーブル名 WHERE 列名 LIKE ('%値%') ←○○値○○
SELECT * FROM テーブル名 WHERE 列名 LIKE ('値_値') ←値○値（_で何か1文字）
```

* 例文
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    //テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (
        id INT,
        name TEXT
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入
    $pdo->prepare("INSERT INTO hoge_tb VALUES (1, '西村一郎')")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES (2, '西村次郎')")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES (2, '鈴木一郎')")->execute();

    //条件に合致したデータを抽出
    $sql = "SELECT * FROM hoge_tb WHERE name LIKE '西村%'";
    $statement = $pdo->query($sql);

    //該当の全データを取得
    foreach ($statement as $tmp) {
        echo $tmp['id'].'|'.$tmp['name'];
        echo "<br>";
    }
    //=> 1|西村一郎
    //=> 2|西村次郎
?>
```

<a name="AND"></a>

### AND（論理積）
* 書式
```
SELECT * FROM テーブル名 WHERE 条件① AND 条件② ←条件①かつ条件②
```

* 例文
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    //テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (
        name TEXT,
        bloodtype TEXT,
        age INT
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('CHIKASHI', 'A', 50)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('ICHIRO', 'B', 25)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('JIRO', 'AB', 20)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('HANAKO', 'B', 15)")->execute();

    //条件に合致したデータを抽出
    $sql = "SELECT * FROM hoge_tb WHERE bloodtype = 'B' AND age >= 20";
    $statement = $pdo->query($sql);

    //該当の全データを取得
    foreach ($statement as $tmp) {
        echo $tmp['name'].'|'.$tmp['bloodtype'].'|'.$tmp['age'];
        echo "<br>";
    }
    //=> ICHIRO|B|25
?>
```

<a name="OR"></a>

### OR（論理和）
* 書式
```
SELECT * FROM テーブル名 WHERE 条件① OR 条件② ←条件①または条件②
```

* 例文
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    //テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (
        name TEXT,
        bloodtype TEXT,
        age INT
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('CHIKASHI', 'A', 50)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('ICHIRO', 'B', 25)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('JIRO', 'AB', 20)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES ('HANAKO', 'B', 15)")->execute();

    //条件に合致したデータを抽出
    $sql = "SELECT * FROM hoge_tb WHERE bloodtype = 'A' OR age < 20";
    $statement = $pdo->query($sql);

    //該当の全データを取得
    foreach ($statement as $tmp) {
        echo $tmp['name'].'|'.$tmp['bloodtype'].'|'.$tmp['age'];
        echo "<br>";
    }
    //=> CHIKASHI|A|50
    //=> HANAKO|B|15
?>
```

実行環境：Ubuntu 16.04 LTS、MySQL 5.7、PHP 7.0、Chromium 59  
作成者：vvestvillage  
作成日：2017年08月04日


<a name="ソートして抽出"></a>
# <b>ソートして抽出（SELECT 文）</b>

### 書式
```
SELECT * FROM テーブル名 ORDER BY 列名 ASC（またはDESC）
```

### 例文
```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    //テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (
        id INT,
        name TEXT,
        age INT
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入
    $pdo->prepare("INSERT INTO hoge_tb VALUES (1, 'JIRO', 20)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES (2, 'ICHIRO', 25)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES (3, 'CHIKASHI', 50)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES (4, 'HANAKO', 15)")->execute();

    //ASC（昇順＝小さい順）または DESC（降順＝大きい順）
    $sql = "SELECT * FROM hoge_tb ORDER BY name ASC";
    $statement = $pdo->query($sql);

    //該当の全データを取得
    foreach ($statement as $tmp) {
        echo $tmp['id'].'|'.$tmp['name'].'|'.$tmp['age'];
        echo "<br>";
    }
    //=> 4|HANAKO|15
    //=> 2|ICHIRO|25
    //=> 1|JIRO|20
    //=> 3|CHIKASHI|50
?>
```

実行環境：Ubuntu 16.04 LTS、MySQL 5.7、PHP 7.0、Chromium 59  
作成者：vvestvillage  
作成日：2017年08月04日


<a name="SQLite→CSV"></a>
# <b>SQLite→CSV</b>

```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    //テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (
        id INT,
        name TEXT,
        age INT
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //データの挿入
    $pdo->prepare("INSERT INTO hoge_tb VALUES (1, 'JIRO', 20)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES (2, 'ICHIRO', 25)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES (3, 'CHIKASHI', 50)")->execute();
    $pdo->prepare("INSERT INTO hoge_tb VALUES (4, 'HANAKO', 15)")->execute();


    //全データを取得
    $sql = "SELECT * FROM hoge_tb"; //全ての列を抽出
    $statement = $pdo->query($sql);

    $array = array(); //空の配列を作成
    
    foreach ($statement as $tmp) {
        $theString = $tmp['id'].','.$tmp['name'].','.$tmp['age'];
        $theArray = explode(",", $theString); //カンマ区切りで配列化
        array_push($array, $theArray); //配列に配列を追加
    }

    //ファイルを生成（既存の場合は開く）
    $csv = fopen("hoge.csv", "w"); //.phpファイルと同階層に生成される
    foreach ($array as $data) {
        fputcsv($csv, $data);
    }
    fclose($csv);
?>
```

表計算ソフトで生成された CSV ファイルを開くと次のようになる。  

|A|B|C|
|:--:|:--:|:--:|
|1|JIRO|20|
|2|ICHIRO|25|
|3|CHIKASHI|50|
|4|HANAKO|15|

実行環境：Ubuntu 16.04 LTS、MySQL 5.7、PHP 7.0、Chromium 59  
作成者：vvestvillage  
作成日：2017年08月04日


<a name="CSV→SQLite"></a>
# <b>CSV→SQLite</b>

表計算ソフトの次のようなデータを CSV ファイルとして保存。  

|A|B|C|
|:--:|:--:|:--:|
|1|JIRO|20|
|2|ICHIRO|25|
|3|CHIKASHI|50|
|4|HANAKO|15|

```
<?php
    // データベースの作成（既存の場合はファイルを開く）
    $dsn = 'mysql:dbname=test_db;host=127.0.0.1';
    $user = 'root';
    $password = 'xxxxxx';
    $pdo = new PDO($dsn, $user, $password);

    //テーブルの作成（xxx_tb が無い場合のみ作成）
    $sql = "CREATE TABLE IF NOT EXISTS hoge_tb (
        id INT,
        name TEXT,
        age INT
    )";
    $statement = $pdo->prepare($sql);
    $statement->execute();

    //外部CSVファイルの読込み＆データの追加
    $csv = fopen("hoge.csv", "r");
    while ($data = fgetcsv($csv)) { //1行ずつ取得
        $id = $data[0];
        $name = $data[1];
        $age = $data[2];

        $sql = "INSERT INTO hoge_tb VALUES (
            '$id',
            '$name', 
            '$age'
        )";
        $pdo->prepare($sql)->execute();
    }

    //全データを取得
    $sql = "SELECT * FROM hoge_tb"; //全ての列を抽出
    $statement = $pdo->query($sql);
    foreach ($statement as $tmp) {
        echo $tmp['id'].'|'.$tmp['name'].'|'.$tmp['age'];
        echo "<br>";
    }
    //=> 1|JIRO|20
    //=> 2|ICHIRO|25
    //=> 3|CHIKASHI|50
    //=> 4|HANAKO|15
?>
```

実行環境：Ubuntu 16.04 LTS、MySQL 5.7、PHP 7.0、Chromium 59  
作成者：vvestvillage  
作成日：2017年08月04日