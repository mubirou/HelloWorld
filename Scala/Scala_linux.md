# Scala（ Linux ）

## <ruby>Scala<rt>スカラ</rt></ruby>について

* 2003年に登場した[オブジェクト指向](http://bit.ly/2mHlvGq)と[関数型](http://bit.ly/1KTmmNW)の特徴を統合したプログラミング言語
* [JVM](http://bit.ly/2leHp6T) 上で動作し、 [Java](https://ja.wikipedia.org/wiki/Java) のライブラリが利用可能

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|Java|[Java](https://ja.wikipedia.org/wiki/Java) SE 8 Update 121 |2017年01月|
|実行エンジン|[Scala](https://ja.wikipedia.org/wiki/Scala) 2.11.6|2015年03月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|Scala Syntax （Dalton Jorge） 0.0.4|ー|

1. 端末でのインストール  
    $ sudo apt-get update  
    $ sudo apt-get install openjdk-8-jdk  
    $ java -version  
    openjdk version "1.8.0_121" ←[Java](https://ja.wikipedia.org/wiki/Java) Standard Edition 8 Update 121  
    ……  
    $ sudo apt-get install scala  
    $ scala -version  
    Scala code runner version 2.11.6 -- Copyright 2002-2013, LAMP/EPFL  

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

1. Visual Studio Code で [表示] → [総合ターミナル] を選択（端末でも可）

1. test.scala ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/Scala

1. 実行（ファイルは生成されない）  
$ scala test.scala  
Hello,world! ←と表示されたら成功！  

***
作成者: Takashi Nishimura  
作成日: 2017年03月02日