# アセンブリ言語（ Windows ）

## アセンブリ言語について

* 代表的な[低水準言語](http://bit.ly/2meoB4s)
* 多くのメモリを使えない環境などで利用
* プログラムの対象プロセッサのアーキテクチャの理解が必要（<b>CPUによって書き方が異なる</b>）
* アセンブル（assemble）とはアセンブリ言語を[機械語](http://bit.ly/2ma4xDp)に変換すること
* アセンブラ（Assembler）とはアセンブリ言語を機械語に変換するプログラムのこと

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|2017年01月|
|アセンブラ|[NASM](https://ja.wikipedia.org/wiki/Netwide_Assembler) 2.12.02|2016年07月|
|開発環境|[MinGW](https://ja.wikipedia.org/wiki/MinGW) |ー|
|コンパイラ|[GCC](http://bit.ly/2kOadCN) 5.3.0 |2015年12月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|[x86 and x86_64 Assembly](http://bit.ly/2lRBkO9) 2.2.9|2016年12月|

1. [NASM](https://ja.wikipedia.org/wiki/Netwide_Assembler) のインストール  
    1. http://www.nasm.us/ の DOWNLOAD を選択
    1. 最新版 2.12.02/ を選択（[RC版](http://bit.ly/2mgsS6X) 以外）
    1. win64 → nasm-2.12.02-win64.zip を選択しダウンロード → すべて展開 → 展開
    1. フォルダ名を nasm-2.12.02-win64 → nasm に変更
    1. その中のフォルダ名（nasm-2.12.02）を bin に変更
    1. C:\ に上記の nasm フォルダを移動

1. [MinGW](https://ja.wikipedia.org/wiki/MinGW) のインストール  
    1. http://www.mingw.org/ にアクセス
    1. [Download Installer] ボタンを選択、ダウンロード
    1. ダウンロードした mingw-get-setup.exe をダブルクリック、インストール
    1. [MinGW Installation Manager] が起動したら次の2つを選択  
        * mingw-developer-toolkit
        * mingw32-base
        * mingw32-gcc-g++
        * msys-base
    1. メニューの [Installation] → [Apply Changes] → [Apply] を選びインストール

1. [環境変数](http://bit.ly/2lCIAgK)の設定  
    1. タスクバーのスタートボタンを右クリック → [コントロールパネル] → [システムとセキュリティ] → [システム] → [システムの詳細設定] → [環境変数] を開く
    1. [システム環境変数] で変数 "Path" を探して選択 → [編集] ボタンをクリック
    1. 変数値の最後に ;C:\MinGW\bin および ;C:\nasm\bin を追加
    1. Windows を再起動
    1. コマンドプロンプトでバージョン確認  
        \>gcc --version  
        gcc (GCC) 5.3.0  
        >nasm -v  
        NASM version 2.12.02 compiled on Jul  6 2016

1. Visual Studio Codeに拡張機能の追加  
    1. [表示] → [機能拡張] で Assembly を検索
    1. ヒットした中から [x86 and x86_64 Assembly](http://bit.ly/2lRBkO9) を選んでインストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に Assembly フォルダを作成）に test<b>.asm</b> という名で保存

1. コードの記述（<b>CPUによって書き方が異なる</b>）
```
    global  _main
    extern  _printf
    section .text
_main:
    push    message
    call    _printf
    add     esp, 4
    ret
message:
    db  'Hello, World', 10, 0
```

## アセンブル〜実行

1. コマンドプロンプトを起動

1. test.c ファイルのあるディレクトリに移動  
    \>cd \Users\（ユーザー名）\Desktop\Assembly

1. コンパイル（.asm → .obj → a.exe）  
    \>nasm -fwin32 test.asm  
    \>gcc test.obj

1. test.asm ファイルと同階層に test.obj と a.exe ファイルが生成されたのを確認

1. 実行  
    \>a.exe  
    Hello,world! ←と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月13日