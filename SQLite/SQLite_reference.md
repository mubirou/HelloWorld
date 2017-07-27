### この項目は書きかけです

# <b>SQLite 基礎文法</b>

### <b>INDEX</b>

* Hello,world! （[Linux](https://github.com/TakashiNishimura/HelloWorld/blob/master/SQLite/SQLite_linux.md) / [macOS](https://github.com/TakashiNishimura/HelloWorld/blob/master/SQLite/SQLite_mac.md) / [Windows](https://github.com/TakashiNishimura/HelloWorld/blob/master/SQLite/SQLite_win.md)）
* [データベースの作成](#データベースの作成)
***
* [テーブルの作成](#テーブルの作成)
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


<a name="テーブルの作成"></a>
# <b>テーブルの作成</b>

### 構文
```
CREATE TABLE テーブル名 (カラム名 型 [列フラグ オプション], カラム名 型  [列フラグ オプション], ...)
```

### コマンドラインの場合

作成
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
確認
```
sqlite> .schema book_tb <= テーブル定義の確認
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
XXX
XXX
```

実行環境：Ubuntu 16.04 LTS、SQLite 3.11、PHP 7.0、Chromium 59  
作成者：Takashi Nishimura  
作成日：2017年0X月XX日


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