# F\#（ macOS ）

## F#について

* 2005年に登場した Microsoft 社開発のオブジェクト指向および[関数型](http://bit.ly/1KTmmNW)のプログラミング言語
* [.NET Framework](https://ja.wikipedia.org/wiki/.NET_Framework) 、[Mono](http://bit.ly/2l5Mzx1) 上で動作

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|統合開発環境|[Xcode](https://developer.apple.com/download/) 8.2.1|2016年12月|
|コンパイラ|[Mono](http://www.mono-project.com/) Framework 4.8.0|2017年02月|
|コンパイラ|[F#](https://ja.wikipedia.org/wiki/F_Sharp) Compiler 4.1|2016年07月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|[Ionide](http://ionide.io/)-fsharp 2.23.9|2017年03月|

1. [Xcode](https://ja.wikipedia.org/wiki/Xcode) のインストール  
    1. [Apple ID](https://appleid.apple.com/#!&page=signin) を用意し [Xcode](https://developer.apple.com/download/) にアクセス
    1. Xcode 8.2.1 を [Download] を選択、指示に従ってダウンロード
    1. Xcode を開き、指示に従いインストール

1. [Mono](http://www.mono-project.com/) のインストール
    1. http://www.mono-project.com/download/ にアクセス
    1. [Download Mono] を選択
    1. ダウンロードした .pkg ファイルをダブルクリック、指示に従ってインストール
    1. ターミナルでバージョン確認  
    $ mono --version ←Monoのバージョン確認  
    Mono JIT compiler version 4.8.0 (mono-4.8.0-branch/e4a3cf3 Fri Feb 17 15:57:45 EST 2017)  
    $ fsharpc --help  ←F#のバージョン確認  
    F# Compiler for F# 4.1

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から [Ionide](http://ionide.io/)-fsharp を検索＆インストール

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

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. test.fs ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/F#

1. コンパイル（.fs → .exe）  
$ fsharpc test.fs

1. test.fs ファイルと同階層に test.exe ファイルが生成されたのを確認

1. 実行  
$ mono test.exe  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月06日
