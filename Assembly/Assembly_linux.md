# アセンブリ言語（ Linux ）

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
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|コンパイラ|[GCC](http://bit.ly/2kOadCN) 5.4.0 |2016年06月|
|エディタ|Visual Studio Code 1.9.1|2017年01月|
|拡張機能|gas 0.0.1|不明|

1. 端末でコンパイラのバージョン確認  
    $ gcc --version  
    gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 ←Ubuntuのデフォルト  
    Copyright (C) 2015 Free Software Foundation, Inc.  
    This is free software; see the source for copying conditions.  There is NO  
    warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

1. Visual Studio Codeに拡張機能の追加  
    1. [表示] → [機能拡張] で Assembler を検索
    1. ヒットした中から gas（[GNUアセンブラ](http://bit.ly/2lI52nm)）を選んでインストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に Assembly フォルダを作成）に test<b>.s</b> という名で保存

1. コードの記述（<b>最後に空白行が必要</b>／<b>CPUによって書き方が異なる</b>）
```
.LC0:
    .string "Hello,world!"
    .text
    .globl main
main:
.LFB0:
    .cfi_startproc
    movl $.LC0, %edi
    call puts
    .cfi_endproc

```

## アセンブル〜実行

1. Visual Studio Code で [表示] → [総合ターミナル] を選択（端末でも可）

1. test.s ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/Assembly

1. コンパイル（.s → a.out）  
$ gcc test.s

1. test.c ファイルと同階層に a.out ファイルが生成されたのを確認

1. 実行  
$ ./a.out  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年02月23日
