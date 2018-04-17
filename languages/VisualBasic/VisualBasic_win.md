# Visual Basic .NET（ Windows ）

## Visual Basic .NETについて

* 2001年に登場した Microsoft が開発したプログラミング言語
* [Visual Basic](https://ja.wikipedia.org/wiki/Microsoft_Visual_Basic)（Ver.6.0 まで）と互換性は無い
* Visual Basic 2005 以降は名称自体には [.NET](https://ja.wikipedia.org/wiki/.NET_Framework) は付かない

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|コンパイラ|Visual Basic Compiler 14.0.0079|ー|
|エディタ|Visual Studio Code 1.10.2|2017年03月|

* コマンドプロンプトでコンパイラのバージョン確認  
\>vbc  
Microsoft (R) Visual Basic Compiler version 14.0.0079  
for Visual Basic 2012

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

1. コマンドプロンプトを起動

1. test.vb ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\VisualBasic

1. コンパイル（.vb → .exe）  
\>vbc test.vb

1. test.vb ファイルと同階層に test.exe ファイルが生成されたのを確認

1. 実行  
\>test.exe  
Hello,world! ←と表示されたら成功！

***
作成者: 夢寐郎  
作成日: 2017年03月14日