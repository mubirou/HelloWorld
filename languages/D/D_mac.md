# D言語（ macOS ）

## D言語について

* C言語をベースにしたオブジェクト指向および[関数型](http://bit.ly/1KTmmNW)のプログラミング言語
* C言語の後継を目指して開発（C言語との互換性はない）
* 2001年に Ver.0.001 が、2006年に Ver.1.0 のコンパイラが登場
* 2013年、Facebook の社内ツール開発に採用

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|パッケージ管理システム|[Homebrew](http://bit.ly/2mr4lzk) 1.1.10|2016年11月|
|コンパイラ|DMD（Digital Mars [D](http://www.kmonos.net/alang/d/)） 2.073.1|2017年02月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|D Programming Language 0.16.1|2017年03月|

1. [Homebrew](https://brew.sh/index_ja.html) にアクセス
1. 指示に従ってターミナルでインストール  
    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
    $ brew --version ←バージョン確認  
    Homebrew 1.1.10

1. [D言語](http://www.kmonos.net/alang/d/)コンパイラのインストール  
    $ brew install dmd  
    $ dmd --version  
    DMD64 D Compiler v2.073.1

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から D Programming Language を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に D フォルダを作成）に test<b>.d</b> という名で保存

1. コードの記述
```
//test.d
import std.stdio; //writeln()に必要

//クラス定義
class MyClass {
    //コンストラクタ
    this() {
        writeln("Hello,world!");
    }
}

//メイン関数
void main() {
    MyClass _myClass = new MyClass();
}
```

## コンパイル〜実行

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. test.d ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/D

1. コンパイル（.d → a.out）  
$ dmd test.d

1. test.d ファイルと同階層に test ファイル（実行ファイル）と test.o ファイルが生成されたのを確認

1. 実行  
$ ./test  
Hello,world! ←と表示されたら成功！

***
作成者: MUBIROU  
作成日: 2017年03月06日