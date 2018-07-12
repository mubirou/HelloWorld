# TypeScript（ Windows ）

## TypeScriptについて

* [Microsoft](https://github.com/Microsoft/TypeScript) によって開発され、2012年に登場した AltJS（JavaScript の代替言語）
* [クラスベース](http://bit.ly/2lBXgbE)のオブジェクト指向プログラミング言語
* JavaScript の上位互換

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|JavaScript環境|[Node.js](https://nodejs.org/ja/) 6.10.0|2017年02月|
|Nodeパッケージ管理|npm 3.10.10|2016年11月|
|コンパイラ|[TypeScript](https://www.typescriptlang.org/index.html) 2.2.1|2017年02月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
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

1. [TypeScript](https://www.typescriptlang.org/index.html) のインストール  
    \>npm install -g typescript  
    \>\Users\none\AppData\Roaming\npm\tsc -v  
    Version 2.2.1

1. [環境変数](http://bit.ly/2lCIAgK)の設定  
    1. タスクバーのスタートボタンを右クリック → [コントロールパネル] → [システムとセキュリティ] → [システム] → [システムの詳細設定] → [環境変数] を開く
    1. [システム環境変数] で変数 "Path" を探して選択 → [編集] ボタンをクリック
    1. 変数値の最後に ;C:\Users\none\AppData\Roaming\npm を追加  
    （古いTypeScriptのパスがある場合は削除しておく）
    1. Windows を再起動
    1. コマンドプロンプトでバージョン確認  
        \>>tsc -v  
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

1. コマンドプロンプトを起動

1. main.ts ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\TypeScript

1. コンパイル（.ts → .js）  
\>tsc main.ts  
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

1. Web ブラウザ（Google Chrome）を起動 → 右クリック → 検証 → Console を開く

1. [Ctrl] + [o] で上記の index.html を開く

1. Console に Hello,world! と表示されたら成功！

***
作成者: mubirou  
作成日: 2017年03月15日
