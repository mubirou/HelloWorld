# Visual Basic .NET

## Visual Basic .NETについて

* 2001年に登場した Microsoft が開発したプログラミング言語
* [Visual Basic](https://ja.wikipedia.org/wiki/Microsoft_Visual_Basic)（Ver.6.0 まで）と互換性は無い
* Visual Basic 2005 以降は名称自体には [.NET](https://ja.wikipedia.org/wiki/.NET_Framework) は付かない

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|コンパイラ|Visual Basic.Net Compiler 0.0.0.5943|不明|
|実行エンジン|Mono C# compiler 4.2.1.0|2015年11月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|

* 端末でコンパイラの確認＆インストール  
    $ mcs --version  
    Mono C# compiler version 4.2.1.0  

    $ sudo apt-get update  
    $ sudo apt-get install mono-vbnc  
    $ vbnc --version  
    Visual Basic.Net Compiler version 0.0.0.5943 (Mono 4.0.1 - tarball)

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル]→[新規ファイル] を選択
    1. [ファイル]→[保存] を選択
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

1. Visual Studio Code で [表示]→[総合ターミナル] を選択（端末でも可）

1. test.vb ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/VisualBasic

1. コンパイル（.vb → .exe）  
$ vbnc test.vb

1. test.vb ファイルと同階層に test.exe （実行ファイル）が生成されたのを確認

1. 実行  
$ mono test.exe  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月02日
