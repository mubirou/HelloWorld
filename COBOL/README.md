# COBOL

## COBOLについて

* 1959年登場（アメリカ国防総省より開発を提案）
* FORTRAN についで国際的な標準化が行われた初期のプログラミング言語
* 英語に近い構文のため可読性が高い（但し冗長）
* 2002年版でオブジェクト指向に対応
* 現在もCOBOLで構築されたシステムも多く残っており、COBOLプログラマも意外に多い

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|コンパイラ| [OpenCOBOL](https://en.wikipedia.org/wiki/GnuCOBOL) 1.1.0|2016年02月|
|エディタ|Visual Studio Code 1.9.1|2017年01月|
|拡張機能|cobol 0.3.11|不明|

1. 端末でコンパイラのインストール  
    $ sudo apt-get update ←インストール済みパッケージのアップデート  
    $ sudo apt-get install open-cobol ←COBOLコンパイラのインストール  
    $ cobc --version ←バージョン確認  
    cobc (OpenCOBOL) 1.1.0  
    Copyright (C) 2001-2009 Keisuke Nishida / Roger While  
    Built    Feb 07 2016 10:28:13  
    Packaged Feb 06 2009 10:30:55 CET

1. Visual Studio Codeに拡張機能の追加  
    [表示]→[機能拡張] から cobol を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル]→[新規ファイル] を選択
    1. [ファイル]→[保存] を選択
    1. 任意の場所（今回はデスクトップ上に COBOL フォルダを作成）に test<b>.cob</b> という名で保存

1. コードの記述  
（注意）最初の7字は空白でも全て0でも可／PROGRAM-ID に TEST は不可
```
000010 IDENTIFICATION DIVISION.
000020 PROGRAM-ID. SAMPLE.
000030 PROCEDURE DIVISION.
000040 DISPLAY 'Hello,world!'.
000050 STOP RUN.
```

## コンパイル〜実行

1. Visual Studio Code で [表示]→[総合ターミナル] を選択（端末でも可）

1. test.cob ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/COBOL

1. コンパイル（.cob → 実行ファイル）
$ cobc -x test.cob

1. test.cob ファイルと同階層に test ファイルが生成されたのを確認

1. 実行  
$ ./test  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年02月24日
