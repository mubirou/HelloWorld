# Dart（ Windows ）

## Dartについて

* JavaScript の代替を目的として Google が開発したプログラミング言語（2011年登場）
* JavaScript へのコンパイルが可能（AltJS ＝ JavaScript の代替言語）
* Google Chrome への組み込みは実現されていない

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|コンパイラ|[Dart](http://www.gekorm.com/dart-windows/) 1.22.1|2017年02月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|[Dart Code](https://github.com/Dart-Code/Dart-Code/releases) 1.0.1|2017年03月|

1. [Dart](https://ja.wikipedia.org/wiki/Dart) のインストール
    1. http://www.gekorm.com/dart-windows/ にアクセス
    1. [GET DART（64-BIT WINDOWS, STABLE）] ボタンをクリックしダウンロード
    1. ダウンロードした Dart_x64.stable.setup.exe をダブルクリックしインストール
    1. コマンドプロンプトでバージョン確認  
        \>dart --version  
        Dart VM version: 1.22.1 (Tue Feb 21 14:29:45 2017) on "windows_x64"

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

1. コマンドプロンプトを起動

1. test.dart ファイルのあるディレクトリに移動  
  \>cd \Users\（ユーザー名）\Desktop\Dart

1. 実行  
  \>dart test.dart  
  Hello,world! ←と表示されたら成功！（何も生成されない）
  
***
作成者: mubirou  
作成日: 2017年03月15日