# C#（ macOS ）

## C#について

* 2000年にアルファ版が登場、2002年に Ver.1.0 がリリース（現在 Ver.6.0）
* C/C++ から構文・キーワード・演算子を譲り受けつつ、文法は Java に大きな影響を受けている
* [.NET Framework](https://ja.wikipedia.org/wiki/.NET_Framework) 、[Mono](http://bit.ly/2l5Mzx1) 等のライブラリを使うことで最大限の力を発揮する
* [Ecma インターナショナル](http://bit.ly/2lLMUZZ)、[ISO](http://bit.ly/1VLZ5lB) により標準化され、[JIS](http://bit.ly/2lQk5vD) で標準プログラミング言語として制定されている
* [Unity](http://bit.ly/2l5GJMb) の開発言語して採用

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|統合開発環境|[Xcode](https://developer.apple.com/download/) 8.2.1|2016年12月|
|コンパイラ|[Mono](http://www.mono-project.com/) Framework 4.8.0|2017年02月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|C#（Microsoft） 1.7.0|ー|

1. [Xcode](https://ja.wikipedia.org/wiki/Xcode) のインストール  
    1. [Apple ID](https://appleid.apple.com/#!&page=signin) を用意し [Xcode](https://developer.apple.com/download/) にアクセス
    1. Xcode 8.2.1 を [Download] を選択、指示に従ってダウンロード
    1. Xcode を開き、引き続き指示に従いインストール

1. [Mono](http://www.mono-project.com/) のインストール
    1. http://www.mono-project.com/download/ にアクセス
    1. [Download Mono] を選択
    1. ダウンロードした .pkg ファイルをダブルクリック、指示に従ってインストール
    1. ターミナルでバージョン確認  
    $ mono --version  
    Mono JIT compiler version 4.8.0 (mono-4.8.0-branch/e4a3cf3 Fri Feb 17 15:57:45 EST 2017)

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [機能拡張] から C#（Microsoft） を検索＆インストール

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

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. test.cs ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/C#

1. コンパイル（.cs → .exe）  
$ mcs test.cs

1. test.cs ファイルと同階層に test.exe ファイルが生成されたのを確認

1. 実行  
$ mono test.exe  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月05日