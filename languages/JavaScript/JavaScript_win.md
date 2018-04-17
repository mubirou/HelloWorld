# JavaScript（ Windows ）

## JavaScriptについて

* 1995年に登場した[プロトタイプベース](http://bit.ly/2l76Rew)のオブジェクト指向言語
* 狭義には [Mozilla Foundation](https://ja.wikipedia.org/wiki/Mozilla_Foundation) を仕様を策定している[スクリプト言語](http://bit.ly/2aNqaBR)を指すが、ここでは [ECMAScript](https://ja.wikipedia.org/wiki/ECMAScript)
 6 以前のバージョンである [ECMA-262 5.1 Edition](https://www.ecma-international.org/ecma-262/5.1/) を指す

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|ブラウザ|Google Chrome 57.0.2987.98|2017年03月|

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
作成者: Takashi Nishimura  
作成日: 2017年03月15日