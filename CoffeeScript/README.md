# CoffeeScript

## CoffeeScriptについて

* 2009年にリリースされた [Ruby](https://ja.wikipedia.org/wiki/Ruby) に似た AltJS（JavaScript の代替言語）
* JavaScript と比較すると簡潔に記述が可能であり、出力される JavaScript も綺麗である
* 単行のコメントはコンパイル時に削除される（ブロックコメントは残される）

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|コンパイラ|[CofeeScript](https://ja.wikipedia.org/wiki/CoffeeScript) 1.12.4|2017年02月|
|エディタ|Visual Studio Code 1.9.1|2017年01月|
|拡張機能|[coffeescript snippets](http://bit.ly/1S3eVUH) 0.0.2|2016年04月|
|ブラウザ|Mozilla Firefox 51.0.1|2017年01月|
|その他|[Node.js](https://ja.wikipedia.org/wiki/Node.js) 4.2.6|2016年01月|

1. 端末で Node.js のインストール（CoffeeScript に必要）  
    $ sudo apt-get update ←インストール済みパッケージのアップデート  
    $ sudo apt-get install nodejs npm ←Node.js のインストール  
    $ sudo apt install nodejs-legacy  ←node -v が無効なので指示に従ってインストール  
    $ node -v ←Node.js のバージョン確認  
    v4.2.6

1. CoffeeScript コンパイラのインストール  
    $ sudo apt-get update ←インストール済みパッケージのアップデート  
    $ sudo npm install -g coffee-script ←CoffeeScript コンパイラのインストール  
    $ coffee -v ←CofeeScript のバージョン確認  
    CoffeeScript version 1.12.4

1. Visual Studio Codeに拡張機能の追加  
    [表示]→[機能拡張] から coffeescript snippets を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル]→[新規ファイル] を選択
    1. [ファイル]→[保存] を選択
    1. 任意の場所（今回はデスクトップ上に CoffeeScript フォルダを作成）に main<b>.coffee</b> という名で保存

1. コードの記述
```
#main.coffee
class Main
    #コンストラクタ
    constructor: () ->
        console.log("Hello,world!")

_main = new Main()
```

## コンパイル〜実行

1. Visual Studio Code で [表示]→[総合ターミナル] を選択（端末でも可）

1. main.coffee ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/CoffeeScript

1. コンパイル（.coffee → .js）  
$ coffee -c main.coffee

1. main.coffee ファイルと同階層に main.js ファイルが生成されたのを確認

## HTMLファイルの記述

1. Visual Studio Code を起動

1. Main.coffee ファイルと同階層に index.html ファイルを作成

```
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <script src="main.js"></script>
    </head>
</html>
```

## 実行

1. Web ブラウザ（Firefox）を起動 → 右クリック → 要素を調査 → コンソール を開く

1. [ファイル]→[ファイルを開く] で上記の index.html を開く

1. Web ブラウザのコンソールに Hello,world! と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年02月26日