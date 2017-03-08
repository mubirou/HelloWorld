# Dart（ Linux ）

## Dartについて

* JavaScript の代替を目的として Google が開発したプログラミング言語（2011年登場）
* JavaScript へのコンパイルが可能（AltJS ＝ JavaScript の代替言語）
* Google Chrome への組み込みは実現されていない

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|コンパイラ|[Dart](https://www.dartlang.org/install) 1.22.1|2017年02月|
|エディタ|Visual Studio Code 1.9.1|2017年01月|
|拡張機能|[Dart Code](https://github.com/Dart-Code/Dart-Code/releases) 0.15.1|2017年02月|

1. Dart のインストール（ <b>[Installing Dart on Linux](https://www.dartlang.org/install/linux)</b> 参照）  
    $ sudo apt-get update  
    $ sudo apt-get install apt-transport-https  
    $ sudo sh -c 'curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -'  
    $ sudo sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_stable.list > /etc/apt/sources.list.d/dart_stable.list'  
    $ sudo apt-get update  
    $ sudo sh -c 'curl https://storage.googleapis.com/download.dartlang.org/linux/debian/dart_unstable.list > /etc/apt/sources.list.d/dart_unstable.list'  
    $ sudo apt-get install dart  
    $ sudo apt-get install dart/stable  
    $ dart --version ←Dart のバージョン確認  
    Dart VM version: 1.22.1 (Tue Feb 21 22:22:42 2017) on "linux_x64"

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

1. Visual Studio Code で [表示] → [総合ターミナル] を選択（端末でも可）

1. test.dart ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/Dart

1. 実行  
$ dart test.dart  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年02月27日
