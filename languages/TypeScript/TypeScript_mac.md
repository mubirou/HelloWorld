# TypeScript（ macOS ）

## TypeScriptについて

* [Microsoft](https://github.com/Microsoft/TypeScript) によって開発され、2012年に登場した AltJS（JavaScript の代替言語）
* [クラスベース](http://bit.ly/2lBXgbE)のオブジェクト指向プログラミング言語
* JavaScript の上位互換

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|JavaScript環境|[Node.js](https://nodejs.org/ja/) 6.10.0|2017年02月|
|Nodeパッケージ管理|npm 3.10.10|2016年11月|
|コンパイラ|[TypeScript](https://www.typescriptlang.org/index.html) 2.2.1|2017年02月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|ブラウザ|Safari 10.0.3|2017年01月|

1. [Node.js](https://nodejs.org/ja/) のインストール  
    1. https://nodejs.org/ja/ にアクセス
    1. [v6.10.0 LTS 推奨版] をクリックしダウンロード
    1. ダウンロードされた node-v6.10.0.pkg をダブルクリックしインストール
    1. ターミナルでバージョン確認  
    $ node -v  
    v6.10.0    
    $ npm -v  
    3.10.10  

1. [TypeScript](https://www.typescriptlang.org/index.html) のインストール  
    $ sudo npm install -g typescript  
    $ tsc -v  
    Version 2.2.1

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に TypeScript フォルダを作成）に main<b>.ts</b> という名で保存

1. コードの記述
```
//main.ts
class MyClass {
    //コンストラクタ
    constructor() {
        console.log("Hello,world!");
    }
}
var _myClass = new MyClass();
```

## コンパイル

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. main.ts ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/TypeScript

1. コンパイル（.ts → .js）  
$ tsc main.ts  
（必要に応じて tsc xxx.ts --target es5 とする）

1. main.ts ファイルと同階層に main.js ファイルが生成されたのを確認

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

1. Web ブラウザ（Safari）を起動

1. [Safari] → [環境設定] → [詳細] → [メニューバーに"開発"メニューを表示] にチェック

1. [ファイル] → [ファイルを開く] で上記の index.html を開く

1. [開発] → [エラーコンソールを表示]

1. コンソールに Hello,world! と表示されたら成功！

***
作成者: vvestvillage  
作成日: 2017年03月08日