# JavaScript（ Linux ）

## JavaScriptについて

* 1995年に登場した[プロトタイプベース](http://bit.ly/2l76Rew)のオブジェクト指向言語
* 狭義には [Mozilla Foundation](https://ja.wikipedia.org/wiki/Mozilla_Foundation) を仕様を策定している[スクリプト言語](http://bit.ly/2aNqaBR)を指すが、ここでは [ECMAScript](https://ja.wikipedia.org/wiki/ECMAScript)
 6 以前のバージョンである [ECMA-262 5.1 Edition](https://www.ecma-international.org/ecma-262/5.1/) を指す

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|エディタ|Visual Studio Code 1.9.1|2017年01月|
|ブラウザ|Mozilla Firefox 51.0.1|2017年01月|

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

1. Web ブラウザ（Firefox）を起動 → 右クリック → 要素を調査 → コンソール を開く

1. [ファイル] → [ファイルを開く] で上記の index.html を開く

1. Web ブラウザのコンソールに Hello,world! と表示されたら成功！

***
作成者: 夢寐郎  
作成日: 2017年02月28日