# COBOL（ Windows ）

## COBOLについて

* 1959年登場（アメリカ国防総省より開発を提案）
* FORTRAN についで国際的な標準化が行われた初期のプログラミング言語
* 英語に近い構文のため可読性が高い（但し冗長）
* 2002年版でオブジェクト指向に対応
* 現在もCOBOLで構築されたシステムも多く残っており、COBOLプログラマも意外に多い

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|開発環境|[MinGW](https://ja.wikipedia.org/wiki/MinGW) |ー|
|コンパイラ|[OpenCOBOL](https://en.wikipedia.org/wiki/GnuCOBOL) 1.0.0|ー|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能| cobol（bitlang）0.3.11|ー|

1. [MinGW](https://ja.wikipedia.org/wiki/MinGW) のインストール  
    1. http://www.mingw.org/ にアクセス
    1. [Download Installer] ボタンを選択、ダウンロード
    1. ダウンロードした mingw-get-setup.exe をダブルクリック、C:\MinGW にインストール
    1. [MinGW Installation Manager] が起動したら次の Package を選択  
        * mingw-developer-toolkit
        * mingw32-base
        * mingw32-gcc-g++
        * mingw32-gcc-objc
        * msys-base
    1. メニューの [Installation] → [Apply Changes] → [Apply] を選びインストール

1. [環境変数](http://bit.ly/2lCIAgK)の設定（１）  
    1. タスクバーのスタートボタンを右クリック → [コントロールパネル] → [システムとセキュリティ] → [システム] → [システムの詳細設定] → [環境変数] を開く
    1. [システム環境変数] で変数 "Path" を探して選択 → [編集] ボタンをクリック
    1. 変数値の最後に ;C:\MinGW\bin; を追加
    1. コマンドプロンプトでバージョン確認  
        \>mingw-get --version  
        mingw-get version 0.6.2-beta-20131004-1

1. [OpenCOBOL](https://en.wikipedia.org/wiki/GnuCOBOL) のインストール
    1. http://www.b-for-server.com/homepage/indexwin.html にアクセス
    1. [open-cobol-1.0-1.zip（バイナリー）のダウンロード] を選択、ダウンロード
    1. ダウンロードした gnu-cobol-2.0_rc-2_win.zip を Desktop に展開
    1. \Desktop\open-cobol-1.0-1 フォルダ内の全ファイルを C:\MinGW フォルダ内にコピー（cobc.exeが必要）
    1. コマンドプロントでバージョン確認  
        \>cobc --version  
        cobc (OpenCOBOL) 1.0.0  
        Copyright (C) 2001-2007 Keisuke Nishida

1. その他のインストール
    1. http://www.b-for-server.com/homepage/indexwin.html にアクセス
    1. 以下を選択し、ダウンロード＆解凍したものを上記同様、C:\MinGW フォルダ内にコピー
        * db-4.5.20-1.zip のダウンロード
        * gettext-0.16.1-1.zip のダウンロード
        * gmp-4.2.1-1.zip のダウンロード
        * libiconv-1.11-1.zip のダウンロード
        * pdcurses-3.1-1.zip のダウンロード

1. [環境変数](http://bit.ly/2lCIAgK)の設定（２）
    1. タスクバーのスタートボタンを右クリック → [コントロールパネル] → [システムとセキュリティ] → [システム] → [システムの詳細設定] → [環境変数] を開く
    1. [システム環境変数] を [新規(W)…] ボタンをクリック
    1. [新しいシステム変数] を次のように設定  
        * 変数名：COB_CONFIG_DIR
        * 変数値：C:\MinGW\share\open-cobol\config

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から cobol（bitlang）を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
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

1. コマンドプロンプトを起動

1. test.cpp ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\COBOL

1. コンパイル（.cob → .exe）  
\>cobc -x test.cob

1. test.cob ファイルと同階層に、指定した保存名のファイル（test.exe）が生成されているのを確認

1. 実行  
\>test.exe  
Hello,world! ←と表示されたら成功！

***
作成者: mubirou  
作成日: 2017年03月14日