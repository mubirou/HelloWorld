# Dart（ macOS ）

## Dartについて

* JavaScript の代替を目的として Google が開発したプログラミング言語（2011年登場）
* JavaScript へのコンパイルが可能（AltJS ＝ JavaScript の代替言語）
* Google Chrome への組み込みは実現されていない

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|パッケージ管理システム|[Homebrew](http://bit.ly/2mr4lzk) 1.1.10|2016年11月|
|コンパイラ|[Dart](https://www.dartlang.org/install) 1.22.1|2017年02月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|[Dart Code](https://github.com/Dart-Code/Dart-Code/releases) 1.0.1|2017年03月|

1. [Homebrew](https://brew.sh/index_ja.html) にアクセス
1. 指示に従ってターミナルでインストール  
    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
    $ brew --version ←バージョン確認  
    Homebrew 1.1.10

1. Dart のインストール（ [Installing Dart on Mac](https://www.dartlang.org/install/mac) 参照）  
    $ brew tap dart-lang/dart  
    $ brew install dart  
    $ dart --version ←バージョン確認  
    Dart VM version: 1.22.1 (Tue Feb 21 14:24:37 2017) on "macos_x64"

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から Dart Code を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に Dart フォルダを作成）に test<b>.dart</b> という名で保存

1. コードの記述
```
//test.dart
class MyClass {
  //コンストラクタ
  MyClass() {
    print("Hello,world!");
  }
}

main() {
  var _myClass = new MyClass();
}
```

## 実行

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. test.dart ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/Dart

1. 実行  
$ dart test.dart  
Hello,world! ←と表示されたら成功！（何も生成されない）

***
作成者: Takashi Nishimura  
作成日: 2017年03月06日
