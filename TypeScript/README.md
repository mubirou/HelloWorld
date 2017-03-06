# TypeScript

## TypeScriptについて

* [Microsoft](https://github.com/Microsoft/TypeScript) によって開発され、2012年に登場した AltJS（JavaScript の代替言語）
* [クラスベース](http://bit.ly/2lBXgbE)のオブジェクト指向プログラミング言語

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|コンパイラ|[TypeScript](https://www.typescriptlang.org/index.html) 2.2.1|2017年02月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|ブラウザ|Mozilla Firefox 51.0.1|2017年01月|
|その他|[Node.js](https://ja.wikipedia.org/wiki/Node.js) 4.2.6|2016年01月|

1. [Node.js](https://ja.wikipedia.org/wiki/Node.js) のインストール  
    $ sudo apt-get update  
    $ sudo apt-get install nodejs-legacy  
    $ nodejs -v  
    v4.2.6  

1. npm のインストール  
    $ sudo apt-get install npm  
    $ npm -v  
    3.5.2  

1. [TypeScript](https://www.typescriptlang.org/index.html) のインストール  
    $ sudo npm install -g typescript  
    /usr/local/bin/tsserver -> /usr/local/lib/node_modules/typescript/bin/tsserver  
    /usr/local/bin/tsc -> /usr/local/lib/node_modules/typescript/bin/tsc  
    /usr/local/lib  
    └── typescript@2.2.1  
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

1. Visual Studio Code で [表示] → [総合ターミナル] を選択（端末でも可）

1. main.ts ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/TypeScript

1. コンパイル（.ts → .js）  
$ tsc main.ts

1. main.ts ファイルと同階層に main.js ファイルが生成されたのを確認

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

1. Web ブラウザ（Firefox）を起動 → 右クリック → 要素を調査 → コンソール を開く

1. [ファイル]→[ファイルを開く] で上記の index.html を開く

1. Web ブラウザのコンソールに Hello,world! と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月02日
