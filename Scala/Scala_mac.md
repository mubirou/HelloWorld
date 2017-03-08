# Scala（ macOS ）

## <ruby>Scala<rt>スカラ</rt></ruby>について

* 2003年に登場した[オブジェクト指向](http://bit.ly/2mHlvGq)と[関数型](http://bit.ly/1KTmmNW)の特徴を統合したプログラミング言語
* [JVM](http://bit.ly/2leHp6T) 上で動作し、 [Java](https://ja.wikipedia.org/wiki/Java) のライブラリが利用可能

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|Java|[Java SE Development Kit 8u121](http://bit.ly/1lO1FSV)|2017年01月|
|パッケージ管理システム|[Homebrew](http://bit.ly/2mr4lzk) 1.1.11|2017年03月|
|実行エンジン|[Scala](https://ja.wikipedia.org/wiki/Scala) 2.12|2016年11月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|Scala Syntax （Dalton Jorge） 0.0.4|ー|

1. [Java SE Development Kit](http://bit.ly/1lO1FSV) のインストール（ターミナルで必要）
    1. http://www.oracle.com/technetwork/java/javase/downloads/ にアクセス
    1. [Java DOWNLOAD] → jdk-8u121-macosx-x64.dmg を選択
    1. ダウンロードした .dmg ファイルをダブルクリックして指示に従いインストール
    1. ターミナルでバージョン確認  
    $ java -version  
    java version "1.8.0_121"

1. [Homebrew](https://brew.sh/index_ja.html) にアクセス

1. 指示に従ってターミナルでインストール  
    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
    $ brew --version ←バージョン確認  
    Homebrew 1.1.11

1. ターミナルで Scala のインストール  
    $ brew install scala  
    …  
    🍺  Cellar/scala/2.12.1: 44 files, 20MB

1. 環境変数に追加  
    $ cd  
    $ touch .bash_profile ←ファイルの作成  
    $ [vi](https://ja.wikipedia.org/wiki/Vi) .bash_profile ←以下の2行を追加して保存  
    export JAVA_HOME=$(/usr/libexec/java_home)  
    export PATH="/Users/（ユーザー名）/.scala/bin:$PATH"  

        * [Vi](https://ja.wikipedia.org/wiki/Vi) エディタの使い方（参考）
        * 入力モード: [i]
        * 編集モード: [Esc]
        * 行番号表示: [Esc] → 「:set number」
        * 指定行へジャンプ: [Esc] → 「:行番号」
        * 保存せず終了: [Esc] → 「:q!」
        * 保存して終了: [Esc] → 「ZZ」

1. ターミナルで動作確認  
     $ scala ←起動  
     Welcome to Scala 2.12.1 (Java HotSpot(TM) 64-Bit Server VM, Java 1.8.0_121).  
     ……  
     scala> :quit ←終了  

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から Scala Syntax （Dalton Jorge） を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に Scala フォルダを作成）に test<b>.scala</b> という名で保存  

1. コードの記述
```
//test.scala
class MyClass {
    //ここに初期化等の処理を記述 ≒ コンストラクタ
    printf("Hello,world!\n");
}
var _myClass = new MyClass();
```

## 実行

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. test.scala ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/Scala

1. 実行（ファイルは生成されない）  
$ scala test.scala  
Hello,world! ←…と表示されたら成功！  

***
作成者: Takashi Nishimura  
作成日: 2017年03月08日
