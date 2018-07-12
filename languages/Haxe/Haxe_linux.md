# Haxe（ Linux ）

## <ruby>Haxe<rt>ヘックス</rt></ruby>について

* 2005年に登場した [ActionScript](https://ja.wikipedia.org/wiki/ActionScript) 3.0 に似た構文のプログラミング言語
* JavaScript、ActionScript、C++、C#、Java、PHP、Python への変換が可能

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|コンパイラ|[Haxe](https://haxe.org/download/list/) 3.2.1|2015年10月|
|エディタ|Visual Studio Code 1.9.1|2017年01月|
|拡張機能|[Legacy Haxe 3.2.1](https://marketplace.visualstudio.com/items?itemName=haxedevs.haxe)|2016年10月|
|ブラウザ|Mozilla Firefox 51.0.1|2017年01月|

1. 端末で Haxe のインストール  
    $ sudo apt-get update  
    $ sudo apt-get install haxe ←Haxeのインストール  
    $ haxe -version ←Haxeのバージョン確認  
    3.2.1

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から [Legacy Haxe 3.2.1](https://marketplace.visualstudio.com/items?itemName=haxedevs.haxe) を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に Haxe フォルダを作成）に Main<b>.hx</b> という名で保存  
    ※<b>作成するクラス名と同じファイル名にする</b>（大文字小文字区別あり）

1. コードの記述
```
//Main.hx
class Main {
    static public function main():Void {
        trace("Hello,world!");
    }
}
```

## Haxe コンパイラ用ファイルの作成

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. Main.hx と同階層に compile<b>.hxml</b> という名で保存（ファイル名は任意）

1. [Haxe コンパイラ](http://old.haxe.org/doc/compiler?lang=jp)のコマンドライン引数の記述
```
-js main.js
-main Main
```

## コンパイル

1. Visual Studio Code で [表示] → [総合ターミナル] を選択（端末でも可）

1. Main.hx、compile.hxml ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/Haxe

1. コンパイル（.hx → .js）  
$ haxe compile.hxml

1. Main.hx、compile.hxml ファイルと同階層に main.js ファイルが生成されたのを確認

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

1. Web ブラウザ（Firefox）を起動 → 右クリック → 要素を調査 → コンソール を開く

1. [ファイル] → [ファイルを開く] で上記の index.html を開く

1. Web ブラウザのコンソールに Hello,world! と表示されたら成功！

***
作成者: mubirou  
作成日: 2017年02月28日
