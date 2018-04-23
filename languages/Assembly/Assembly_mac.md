# アセンブリ言語（ macOS ）

## アセンブリ言語について

* 代表的な[低水準言語](http://bit.ly/2meoB4s)
* 多くのメモリを使えない環境などで利用
* プログラムの対象プロセッサのアーキテクチャの理解が必要（<b>CPUによって書き方が異なる</b>）
* アセンブル（assemble）とはアセンブリ言語を[機械語](http://bit.ly/2ma4xDp)に変換すること
* アセンブラ（Assembler）とはアセンブリ言語を機械語に変換するプログラムのこと
* C言語のソースコード（.c）からアセンブリファイルを生成することが可能  
$ gcc -S xx.c → 同階層に xx.s が生成される

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|統合開発環境|[Xcode](https://developer.apple.com/download/) 8.2.1|2016年12月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|gas 0.0.1|ー|

1. [Xcode](https://ja.wikipedia.org/wiki/Xcode) のインストール  
    1. [Apple ID](https://appleid.apple.com/#!&page=signin) を用意し [Xcode](https://developer.apple.com/download/) にアクセス
    1. Xcode 8.2.1 を [Download] を選択、指示に従ってダウンロード
    1. Xcode を開き、指示に従いインストール

1. ターミナルでコンパイラの動作確認  
    $ gcc --version  
    Configured with: --prefix=/Applications/Xcode.app/Contents/Developer/usr  
    --with-gxx-include-dir=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Develope  
    r/SDKs/MacOSX10.12.sdk/usr/include/c++/4.2.1  
    Apple LLVM version 8.0.0 (clang-800.0.42.1)  
    Target: x86_64-apple-darwin16.4.0  

1. Visual Studio Codeに拡張機能の追加  
    1. [表示] → [機能拡張] で Assembler を検索
    1. ヒットした中から gas（[GNUアセンブラ](http://bit.ly/2lI52nm)）を選んでインストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に Assembly フォルダを作成）に test<b>.s</b> という名で保存

1. コードの記述（<b>CPUによって書き方が異なる</b>）
```
#test.s
    .globl    _main
_main:
    pushq    %rbp
Ltmp0:
    leaq    L_.str(%rip), %rdi
    callq    _puts
    popq    %rbp
    retq
L_.str:
    .asciz    "Hello,world!"
```

## アセンブル〜実行

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. test.s ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/Assembly

1. アセンブル（.s → a.out）  
$ gcc test.s

1. test.c ファイルと同階層に a.out ファイルが生成されたのを確認

1. 実行  
$ ./a.out  
Hello,world! ←と表示されたら成功！

***
作成者: vvestvillage  
作成日: 2017年03月04日
