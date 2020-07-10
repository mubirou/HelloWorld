# C#（ Linux ）

## C#について

* 2000年にアルファ版が登場、2002年に Ver.1.0 がリリース（現在 Ver.8.0）
* C/C++ から構文・キーワード・演算子を譲り受けつつ、文法は Java に大きな影響を受けている
* [.NET Framework](https://ja.wikipedia.org/wiki/.NET_Framework) 、[Mono](http://bit.ly/2l5Mzx1) 等のライブラリを使うことで最大限の力を発揮する
* [Ecma インターナショナル](http://bit.ly/2lLMUZZ)、[ISO](http://bit.ly/1VLZ5lB) により標準化され、[JIS](http://bit.ly/2lQk5vD) で標準プログラミング言語として制定されている
* [Unity](http://bit.ly/2l5GJMb) でも採用
* バージョンアップ履歴: アルファ版（2000年）→ 1.0（2002年）→ 2.0（2005年）→3.0（2008年）→ 4.0（2010年）→5.0（2012年）→ 6.0（2015年）→ 7.0（2017年）→ 8.0（2019年）
* [Unity](http://bit.ly/2l5GJMb) の開発言語して採用


## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 20.04 LTS|2020年04月|
|コンパイラ| mcs 6.8.0.105（[Mono](http://bit.ly/2l5Mzx1) C# compiler）|ー|
|エディタ|Visual Studio Code 1.46.1|2020年06月|
|拡張機能|C#（Microsoft） 1.22.1|ー|

1. 端末でコンパイラのインストール  
    $ sudo apt-get update  
    $ <b>sudo apt-get install mono-mcs</b>  
    $ <b>mcs --version</b> ←バージョン確認  
    Mono C# compiler version 6.8.0.105

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能]（Ctrl+Shift+X）から C#（Microsoft）を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に作成）に test<b>.cs</b> という名で保存

1. コードの記述  sudo
    ```
    //test.cs
    using System; //Console.WriteLine() に必要

    class HelloWorld { //Mainは不可
        static void Main() { //自動的に最初に実行される
            Console.WriteLine("Hello,world!");
        }
    }
    ```

## コンパイル〜実行

1. Visual Studio Code で [表示] → [ターミナル] を選択（端末でも可）

1. test.cs ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ

1. コンパイル（.cs → .exe）  
$ <b>mcs</b> test<b>.cs</b>

1. test.cs ファイルと同階層に test.exe ファイルが生成されたのを確認

1. 実行  
$ ./test<b>.exe</b>  
Hello,world! ←と表示されたら成功！

***
作成者: 夢寐郎  
作成日: 2017年02月24日
更新日：2020年07月07日 Ubuntu 20.04 LTS 対応