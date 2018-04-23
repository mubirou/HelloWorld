# Scala（ Windows ）

## <ruby>Scala<rt>スカラ</rt></ruby>について

* 2003年に登場した[オブジェクト指向](http://bit.ly/2mHlvGq)と[関数型](http://bit.ly/1KTmmNW)の特徴を統合したプログラミング言語
* [JVM](http://bit.ly/2leHp6T) 上で動作し、 [Java](https://ja.wikipedia.org/wiki/Java) のライブラリが利用可能

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|開発環境|[Java SE Development Kit](http://bit.ly/1lO1FSV) 1.8.0_121|2017年01月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|実行エンジン|[Scala](https://ja.wikipedia.org/wiki/Scala) 2.12.1|ー|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|Scala Syntax （Dalton Jorge） 0.0.4|ー|

1. [Java SE Development Kit](http://bit.ly/1lO1FSV) のインストール
    1. http://www.oracle.com/technetwork/java/javase/downloads/ にアクセスし、[Java DOWNLOAD] を選択
    1. [Accept License Agreement] のラジオボタンを選び、jdk-8u121-windows-x64.exe を選択
    1. ダウンロードした .exe ファイルをダブルクリックして指示に従いインストール

1. [環境変数](http://bit.ly/2lCIAgK)の設定  
    1. タスクバーのスタートボタンを右クリック → [コントロールパネル] → [システムとセキュリティ] → [システム] → [システムの詳細設定] → [環境変数] を開く
    1. [システム環境変数] で変数 "Path" を探して選択 → [編集] ボタンをクリック
    1. 変数値の最後に ;C:\Program Files\Java\jdk1.8.0_121\bin を追加（java.exe、javac.exeが存在）
    1. Windows を再起動
    1. コマンドプロンプトでバージョン確認  
        \>java -version  
        java version "1.8.0_121"  
        \>>javac -version  
        javac 1.8.0_121

1. [Scala](https://ja.wikipedia.org/wiki/Scala) のインストール  
    1. http://www.scala-lang.org/download/ にアクセス
    1. [Scala 2.12.1] → [Download] を選択、ダウンロード
    1. ダウンロードした scala-2.12.1.msi をダブルクリック、インストール
    1. Windows を再起動
    1. コマンドプロンプトでバージョン確認  
        \>scala -version  
        Scala code runner version 2.12.1 -- Copyright 2002-2016, LAMP/EPFL and Lightbend, Inc.

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

1. コマンドプロンプトを起動

1. test.scala ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\Scala

1. 実行（ファイルは生成されない）  
\>scala test.scala  
Hello,world! ←と表示されたら成功！  

***
作成者: MUBIROU  
作成日: 2017年03月16日