# Haxe（ Windows ）

## <ruby>Haxe<rt>ヘックス</rt></ruby>について

* 2005年に登場した [ActionScript](https://ja.wikipedia.org/wiki/ActionScript) 3.0 に似た構文のプログラミング言語
* JavaScript、ActionScript、C++、C#、Java、PHP、Python への変換が可能

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|コンパイラ|[Haxe](https://haxe.org/download/list/) 3.4.0|2017年01月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|Haxe（nadako）1.4.0|ー|
|ブラウザ|Google Chrome 57.0.2987.98|2017年03月|

1. http://haxe.org/download/ にアクセス
    1. [Windows Installer] を選択、ダウンロード開始
    1. ダウンロードした haxe-3.4.0-win.exe をダブルクリック
    1. 指示に従ってインストール
    1. コマンドプロンプトでバージョン確認  
        \>haxe -version  
        3.4.0

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から Haxe（nadako）を検索＆インストール

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

1. コマンドプロンプトを起動

1. Main.hx、compile.hxml ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\Haxe

1. コンパイル（.hx → .js）  
\>haxe compile.hxml

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

1. Web ブラウザ（Google Chrome）を起動 → 右クリック → 検証 → Console を開く

1. [Ctrl] + [o] で上記の index.html を開く

1. Console に Hello,world! と表示されたら成功！

***
作成者: vvestvillage  
作成日: 2017年03月16日