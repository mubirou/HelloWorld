### <b>この項目は編集中です</b>

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
|実行エンジン|[Python](https://ja.wikipedia.org/wiki/Python) 3.8.5|2020年07月|
|エディタ|Visual Studio Code 1.56.2|2021年05月|
|拡張機能|Python（Microsoft）|2021年05月|
|ブラウザ|Google Chrome 91.0|2021年05月|

1. Web サーバの開発環境の構築をする（[参考](https://github.com/mubirou/HelloWorld/blob/master/languages/PHP/PHP_linux.md)）
1. [SQLite](https://ja.wikipedia.org/wiki/SQLite) のインストール  
    $ sudo apt install sqlite3  
    $ sqlite3 -version  
    3.31.1 ...

1. Apache 上で Python が動作するように設定する
    1. XXXXX

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. Web サーバのルートディレクトリ（ /ver/www/html/ ）に test<b>.py</b> という名で保存 

1. コードの記述
```

```

## 実行

1. Web ブラウザ（Google Chrome）を起動

1. [localhost](https://ja.wikipedia.org/wiki/Localhost)/test.py を開く

1. Hello,world! と表示されたら成功！

***
作成者: 夢寐郎  
作成日: 2021年0X月XX日  