# ECMAScript 6（ Windows ）

## ECMAScript 6 について

* 2015年にリリースされた [ECMAScript](https://ja.wikipedia.org/wiki/ECMAScript) 6th Edition
* class ベースのオブジェクト指向プログラミングや[アロー関数](https://mzl.la/2leGv5i)を新たにサポート
* ECMA-262 6th Edition、ECMAScript 2015 とも呼ばれる
* ECMAScript 2015 からは毎年改訂することになった（最新版は [ECMAScript 2016](https://www.ecma-international.org/ecma-262/7.0/) ）
* ECMAScript 6 対応状況（[ECMAScript 6 compatibility table](http://kangax.github.io/compat-table/es6/)）

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|[JavaScript (ES6) code snipets](https://marketplace.visualstudio.com/items?itemName=xabikos.JavaScriptSnippets) 1.4.0|2017年02月|
|ブラウザ|Google Chrome 57.0.2987.98|2017年03月|

* Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から [JavaScript (ES6) code snipets](https://marketplace.visualstudio.com/items?itemName=xabikos.JavaScriptSnippets) を検索＆インストール

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
            class MyClass {
                //コンストラクタ
                constructor() {
                    console.log("Hello,world!");
                }
            }
            _myClass = new MyClass();
        </script>
    </head>
</html>
```

## 実行

1. Web ブラウザ（Google Chrome）を起動 → 右クリック → 検証 → Console を開く

1. [Ctrl] + [o] で上記の index.html を開く

1. Console に Hello,world! と表示されたら成功！

***
作成者: MUBIROU  
作成日: 2017年03月15日
