# Objective-C（ Windows ）

## Objective-Cについて

* [C言語](https://github.com/TakashiNishimura/HelloWorld/blob/master/languages/C/C_win.md)の上位互換言語
* [macOS](https://ja.wikipedia.org/wiki/MacOS) に標準付属の公式開発言語
* [iOS](http://bit.ly/2lw7f2p) アプリ開発に利用されてきたが徐々に [Swift](http://www.apple.com/jp/swift/) に移行されている

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|開発環境|[MinGW](https://ja.wikipedia.org/wiki/MinGW) |ー|
|コンパイラ|[GCC](http://bit.ly/2kOadCN) 5.3.0 |2015年12月|
|エディタ|Visual Studio Code 1.10.2|2017年03月|
|拡張機能|C/C++ Clang Command Adapter 0.2.2|ー|

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
    [表示] → [拡張機能] から C/C++ Clang Command Adapter を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に ObjectiveC フォルダを作成）に test<b>.m</b> という名で保存  

1. コードの記述
```
//test.m
#import <stdio.h> //printf関数に必要

int main() {
    printf("Hello,world!\n");
    return 0;
}
```

## コンパイル〜実行

1. コマンドプロンプトを起動

1. test.m ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\ObjectiveC

1. コンパイル（.m → a.exe）  
\>gcc test.m

1. test.m ファイルと同階層に a.exe ファイルが生成されたのを確認

1. 実行  
\>a.exe  
Hello,world! ←と表示されたら成功！

***
作成者: 夢寐郎  
作成日: 2017年03月16日