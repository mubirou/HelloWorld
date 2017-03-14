# C言語（ Windows ）

## C言語について

* 1972年に登場した汎用プログラミング言語
* クラスベースのオブジェクト指向ではないが、構造体を利用した高度なプログラミングが可能
* 比較的[低水準](http://bit.ly/2meoB4s)な言語のため、コンピュータの仕組みに詳しくなるという理由で「初心者が学ぶべき言語」とも言われる

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|開発環境|[MinGW](https://ja.wikipedia.org/wiki/MinGW) |ー|
|コンパイラ|[GCC](http://bit.ly/2kOadCN) 5.3.0 |2015年12月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|[C/C++（Microsoft）](http://bit.ly/2mughye) 0.10.3|2017年03月|

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
    1. 変数値の最後に ;C:\MinGW\bin を追加
    1. Windows を再起動
    1. コマンドプロンプトでバージョン確認  
        \>gcc --version  
        gcc (GCC) 5.3.0

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から [C/C++（Microsoft）](http://bit.ly/2mughye) を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に C フォルダを作成）に test<b>.c</b> という名で保存

1. コードの記述
```
//test.c
#include <stdio.h> //puts関数に必要

int main(void) {
    puts("Hello,world!");
    return 0;
}
```

## コンパイル〜実行

1. コマンドプロンプトを起動

1. test.c ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\C

1. コンパイル（.c → a.exe）  
\>gcc test.c

1. test.c ファイルと同階層に a.exe ファイルが生成されたのを確認

1. 実行  
\>a.exe  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月11日