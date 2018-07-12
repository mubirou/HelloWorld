# JavaScript（ macOS ）

## JavaScriptについて

* 1995年に登場した[プロトタイプベース](http://bit.ly/2l76Rew)のオブジェクト指向言語
* 狭義には [Mozilla Foundation](https://ja.wikipedia.org/wiki/Mozilla_Foundation) を仕様を策定している[スクリプト言語](http://bit.ly/2aNqaBR)を指すが、ここでは [ECMAScript](https://ja.wikipedia.org/wiki/ECMAScript)
 6 以前のバージョンである [ECMA-262 5.1 Edition](https://www.ecma-international.org/ecma-262/5.1/) を指す

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|ブラウザ|Safari 10.0.3|2017年01月|

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所に index.html という名で保存

1. コードの記述
```
<!DOCTYPE html>
<html lang="ja">
    <head>
        <meta charset="UTF-8">
        <script>
            console.log("Hello,world!");
        </script>
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
作成者: 夢寐郎  
作成日: 2017年03月07日