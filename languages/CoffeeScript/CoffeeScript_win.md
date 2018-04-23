# CoffeeScript（ Windows ）

## CoffeeScriptについて

* 2009年にリリースされた [Ruby](https://ja.wikipedia.org/wiki/Ruby) に似た AltJS（JavaScript の代替言語）
* JavaScript と比較すると簡潔に記述が可能であり、出力される JavaScript も綺麗である
* 単行のコメントはコンパイル時に削除される（ブロックコメントは残される）

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|JavaScript環境|[Node.js](https://nodejs.org/ja/) 6.10.0|2017年02月|
|Nodeパッケージ管理|npm 3.10.10|2016年11月|
|コンパイラ|[CofeeScript](https://ja.wikipedia.org/wiki/CoffeeScript) 1.12.4|2017年02月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|[coffeescript snippets](http://bit.ly/1S3eVUH) 0.0.2|2016年04月|
|ブラウザ|Google Chrome 57.0.2987.98|2017年03月|

1. [Node.js](https://nodejs.org/ja/) のインストール  
    1. https://nodejs.org/ja/ にアクセス
    1. [v6.10.0 LTS 推奨版] をクリックしダウンロード
    1. ダウンロードされた node-v6.10.0-x64.msi をダブルクリックしインストール

1. [環境変数](http://bit.ly/2lCIAgK)の修正  
    1. タスクバーのスタートボタンを右クリック → [コントロールパネル] → [システムとセキュリティ] → [システム] → [システムの詳細設定] → [環境変数] を開く
    1. [システム環境変数] で変数 "Path" を探して選択 → [編集] ボタンをクリック
    1. 変数値の最後を以下の通りに修正
        * 誤： C:\Program Files\nodejs\
        * 正： C:\Program Files\nodejs
    1. コマンドプロンプトでバージョン確認  
        \>node -v  
        v6.10.0  
        \>npm -v  
        3.10.10

1. [CofeeScript](https://ja.wikipedia.org/wiki/CoffeeScript) コンパイラのインストール  
    \>npm install -g coffee-script  
    \>coffee -v  
    CoffeeScript version 1.12.4

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から coffeescript snippets を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
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

1. コマンドプロンプトを起動

1. main.coffee ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\CoffeeScript

1. コンパイル（.coffee → .js）  
\>coffee -c main.coffee

1. main.coffee ファイルと同階層に main.js ファイルが生成されたのを確認

## HTMLファイルの記述

1. Visual Studio Code を起動

1. main.js ファイルと同階層に index.html ファイルを作成

```
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <script src="main.js"></script>
    </head>
</html>
```

## 実行

1. Web ブラウザ（Google Chrome）を起動 → 右クリック → 検証 → Console を開く

1. [Ctrl] + [o] で上記の index.html を開く

1. Console に Hello,world! と表示されたら成功！

***
作成者: vvestvillage  
作成日: 2017年03月14日