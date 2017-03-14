# C#（ Windows ）

## C#について

* 2000年にアルファ版が登場、2002年に Ver.1.0 がリリース（現在 Ver.6.0）
* C/C++ から構文・キーワード・演算子を譲り受けつつ、文法は Java に大きな影響を受けている
* [.NET Framework](https://ja.wikipedia.org/wiki/.NET_Framework) 、[Mono](http://bit.ly/2l5Mzx1) 等のライブラリを使うことで最大限の力を発揮する
* [Ecma インターナショナル](http://bit.ly/2lLMUZZ)、[ISO](http://bit.ly/1VLZ5lB) により標準化され、[JIS](http://bit.ly/2lQk5vD) で標準プログラミング言語として制定されている
* [Unity](http://bit.ly/2l5GJMb) の開発言語して採用

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|コンパイラ|Visual C# Compiler 4.6.0079.0|ー|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|C#（Microsoft） 1.7.0|ー|

1. [環境変数](http://bit.ly/2lCIAgK)の設定  
    1. タスクバーのスタートボタンを右クリック → [コントロールパネル] → [システムとセキュリティ] → [システム] → [システムの詳細設定] → [環境変数] を開く
    1. [システム環境変数] で変数 "Path" を探して選択 → [編集] ボタンをクリック
    1. 変数値の最後に ;C:\WINDOWS\Microsoft.NET\Framework\v4.0.30319 を追加
    1. Windows を再起動
    1. コマンドプロンプトでバージョン確認  
        \>>csc  
        Microsoft (R) Visual C# Compiler version 4.6.0079.0

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から C#（Microsoft） を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に C# フォルダを作成）に test<b>.cs</b> という名で保存

1. コードの記述
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

1. コマンドプロンプトを起動

1. test.cs ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\C#

1. コンパイル（.cs → .exe）  
\>csc test.cs

1. test.cs ファイルと同階層に test.exe ファイルが生成されたのを確認

1. 実行  
\>test.exe  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月13日
