# CoffeeScript（ macOS ）

## CoffeeScriptについて

* 2009年にリリースされた [Ruby](https://ja.wikipedia.org/wiki/Ruby) に似た AltJS（JavaScript の代替言語）
* JavaScript と比較すると簡潔に記述が可能であり、出力される JavaScript も綺麗である
* 単行のコメントはコンパイル時に削除される（ブロックコメントは残される）

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|JavaScript環境|[Node.js](https://nodejs.org/ja/) 6.10.0|2017年02月|
|Nodeパッケージ管理|npm 3.10.10|2016年11月|
|コンパイラ|[CofeeScript](https://ja.wikipedia.org/wiki/CoffeeScript) 1.12.4|2017年02月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|[coffeescript snippets](http://bit.ly/1S3eVUH) 0.0.2|2016年04月|
|ブラウザ|Safari 10.0.3|2017年01月|

1. [Node.js](https://nodejs.org/ja/) のインストール  
    1. https://nodejs.org/ja/ にアクセス
    1. [v6.10.0 LTS 推奨版] をクリックしダウンロード
    1. ダウンロードされた node-v6.10.0.pkg をダブルクリックしインストール
    1. 端末でバージョン確認  
    $ node -v  
    v6.10.0    
    $ npm -v  
    3.10.10  

1. [CofeeScript](https://ja.wikipedia.org/wiki/CoffeeScript) コンパイラのインストール  
    $ sudo npm install -g coffee-script  
    $ coffee -v  
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

## コンパイル

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. main.coffee ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/CoffeeScript

1. コンパイル（.coffee → .js）  
$ coffee -c main.coffee

1. main.coffee ファイルと同階層に main.js ファイルが生成されたのを確認

## HTMLファイルの記述

1. Visual Studio Code を起動

1. main.js ファイルと同階層に index.html ファイルを作成

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

1. Web ブラウザ（Safari）を起動

1. [Safari] → [環境設定] → [詳細] → [メニューバーに"開発"メニューを表示] にチェック

1. [ファイル] → [ファイルを開く] で上記の index.html を開く

1. [開発] → [エラーコンソールを表示]

1. コンソールに Hello,world! と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月06日