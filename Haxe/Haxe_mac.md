# Haxe（ macOS ）

## <ruby>Haxe<rt>ヘックス</rt></ruby>について

* 2005年に登場した [ActionScript](https://ja.wikipedia.org/wiki/ActionScript) 3.0 に似た構文のプログラミング言語
* JavaScript、ActionScript、C++、C#、Java、PHP、Python への変換が可能

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|コンパイラ|[Haxe](https://haxe.org/download/list/) 3.4.0|2017年01月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|Haxe（nadako）1.3.3|ー|
|ブラウザ|Safari 10.0.3|2017年01月|

1. http://haxe.org/download/ にアクセス
    1. [OS X Installer] を選択、ダウンロード開始
    1. ダウンロードした haxe-3.4.0-osx-installer.pkg をダブルクリック
    1. 指示に従ってインストール
    1. 端末でバージョン確認  
    $ haxe -version  
    3.4.0

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [機能拡張] から Haxe（nadako）を検索＆インストール

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
$ cd /Users/（ユーザー名）/Desktop/Haxe

1. コンパイル（.hx → .js）  
$ haxe compile.hxml

1. Main.hx、compile.hxml ファイルと同階層に main.js ファイルが生成されたのを確認

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
作成日: 2017年03月07日
