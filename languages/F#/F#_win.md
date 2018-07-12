# F\#（ Windows ）

## F#について

* 2005年に登場した Microsoft 社開発のオブジェクト指向および[関数型](http://bit.ly/1KTmmNW)のプログラミング言語
* [.NET Framework](https://ja.wikipedia.org/wiki/.NET_Framework) 、[Mono](http://bit.ly/2l5Mzx1) 上で動作

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|開発環境|[.NET Framework](https://ja.wikipedia.org/wiki/.NET_Framework) 4.6.2|2016年8月|
|コンパイラ|[F#](https://ja.wikipedia.org/wiki/F_Sharp) Compiler 12.0.21005.1|2013年10月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|[Ionide](http://ionide.io/)-fsharp 2.24.0|2017年03月|

1. [.NET Framework](https://ja.wikipedia.org/wiki/.NET_Framework) のインストール
    1. [.NET Frameworkd のインストール](https://msdn.microsoft.com/ja-jp/library/5a4x27ek(v=vs.110).aspx) を開く
    1. [NET Framework 4.6.2 Dev Pack] を選択
    1. [日本語] を選択した状態で [ダウンロード] ボタンをクリック
    1. [ダウンロードするプログラムを選んでください。] 画面で次の2つを選択して [次へ]
        * NDP462-DevPack-KB3151934-ENU.exe 82.8MB
        * NDP462-DevPack-KB3151934-JPN.exe 13.4MB
    1. ダウンロードした上記の2つのファイルをそれぞれインストール

1. [環境変数](http://bit.ly/2lCIAgK)の設定  
    1. タスクバーのスタートボタンを右クリック → [コントロールパネル] → [システムとセキュリティ] → [システム] → [システムの詳細設定] → [環境変数] を開く
    1. [システム環境変数] で変数 "Path" を探して選択 → [編集] ボタンをクリック
    1. 変数値の最後に ;C:\Program Files (x86)\Microsoft SDKs\F#\3.1\Framework\v4.0 を追加（Fsc.exeが存在）
    1. コマンドプロンプトでバージョン確認  
        \>fsc --help  
        Microsoft (R) F# Compiler version 12.0.21005.1

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

1. コマンドプロンプトを起動

1. test.fs ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\F#

1. コンパイル（.fs → .exe）  
\>fsc test.fs

1. test.fs ファイルと同階層に test.exe ファイルが生成されたのを確認

1. 実行  
\>test.exe  
Hello,world! ←と表示されたら成功！

***
作成者: mubirou  
作成日: 2017年03月15日
