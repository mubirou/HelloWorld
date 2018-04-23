# Visual Basic .NET（ macOS ）

## Visual Basic .NETについて

* 2001年に登場した Microsoft が開発したプログラミング言語
* [Visual Basic](https://ja.wikipedia.org/wiki/Microsoft_Visual_Basic)（Ver.6.0 まで）と互換性は無い
* Visual Basic 2005 以降は名称自体には [.NET](https://ja.wikipedia.org/wiki/.NET_Framework) は付かない

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|統合開発環境|[Xcode](https://developer.apple.com/download/) 8.2.1|2016年12月|
|コンパイラ|[Mono](http://www.mono-project.com/) Framework 4.8.0|2017年02月|
|コンパイラ|Visual Basic.Net Compiler 0.0.0.5943|ー|
|エディタ|Visual Studio Code 1.10.1|2017年03月|

1. [Xcode](https://ja.wikipedia.org/wiki/Xcode) のインストール  
    1. [Apple ID](https://appleid.apple.com/#!&page=signin) を用意し [Xcode](https://developer.apple.com/download/) にアクセス
    1. Xcode 8.2.1 を [Download] を選択、指示に従ってダウンロード
    1. Xcode を開き、指示に従いインストール

1. [Mono](http://www.mono-project.com/) のインストール
    1. http://www.mono-project.com/download/ にアクセス
    1. [Download Mono] を選択
    1. ダウンロードした .pkg ファイルをダブルクリック、指示に従ってインストール
    1. ターミナルでバージョン確認  
    $ mono --version  
    Mono JIT compiler version 4.8.0 (mono-4.8.0-branch/e4a3cf3 Fri Feb 17 15:57:45 EST 2017)  
    $ vbnc --version  
    Visual Basic.Net Compiler version 0.0.0.5943 (Mono 4.6 - mono-4.8.0-branch/1ac96b5)

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に VisualBasic フォルダを作成）に test<b>.vb</b> という名で保存  

1. コードの記述
```
'test.vb
Imports System '省略可能

Module test '名前（test）は任意
    Sub Main() '名前（Main）は決め打ち
        Console.WriteLine("Hello,world!")
    End Sub
End Module
```

## コンパイル〜実行

1. Visual Studio Code で [表示] → [総合ターミナル] を選択（端末でも可）

1. test.vb ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/VisualBasic

1. コンパイル（.vb → .exe）  
$ vbnc test.vb

1. test.vb ファイルと同階層に test.exe （実行ファイル）が生成されたのを確認

1. 実行  
$ mono test.exe  
Hello,world! ←と表示されたら成功！

***
作成者: vvestvillage  
作成日: 2017年03月08日