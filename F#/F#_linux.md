# F\#（ Linux ）

## F#について

* 2005年に登場した Microsoft 社開発のオブジェクト指向および[関数型](http://bit.ly/1KTmmNW)のプログラミング言語
* [.NET Framework](https://ja.wikipedia.org/wiki/.NET_Framework) 、[Mono](http://bit.ly/2l5Mzx1) 上で動作

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|コンパイラ| [F#](https://ja.wikipedia.org/wiki/F_Sharp) Compiler 4.0|2015年07月|
|ランタイム| [Mono](http://bit.ly/2l5Mzx1) JIT compiler 4.2.1|2015年11月|
|エディタ|Visual Studio Code 1.9.1|2017年01月|
|拡張機能|[Ionide](http://ionide.io/)-fsharp 2.23.5|2017年02月|

1. 端末でコンパイラのインストール  
    $ sudo apt-get update ←インストール済みパッケージのアップデート  
    $ sudo apt-get install mono-complete fsharp ←MonoコンパイラとF#をインストール  
    $ mono --version  ←Monoのバージョン確認  
    Mono JIT compiler version 4.2.1 (Debian 4.2.1.102+dfsg2-7ubuntu4)  
    $ fsharpc --help  ←F#のバージョン確認  
    F# Compiler for F# 4.0 (Open Source Edition)  

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [機能拡張] から [Ionide](http://ionide.io/)-fsharp を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に F# フォルダを作成）に test<b>.fs</b> という名で保存

1. コードの記述
```
//test.fs
open System //Consoleに必要

//クラス定義
type MyClass() =
    class
        do
            Console.WriteLine("Hello,world!")
    end

//インスタンスの生成
let _myClass = MyClass()
```

## コンパイル〜実行

1. Visual Studio Code で [表示] → [総合ターミナル] を選択（端末でも可）

1. test.fs ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/F#

1. コンパイル（.fs → .exe）  
$ fsharpc test.fs

1. test.fs ファイルと同階層に test.exe ファイルが生成されたのを確認

1. 実行  
$ mono test.exe  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年02月27日
