# C++（ Windows ）

## C++について

* 1983年登場の汎用プログラミング言語
* シープラスプラス、シープラプラ、シープラと呼ばれる
* C言語にOOP（オブジェクト指向プログラミング）等の改良を加えたもの
* C言語との間に厳密な互換性は無い
* [ISO](http://bit.ly/1VLZ5lB) と [IEC](http://bit.ly/1InYqMk) によって標準化
* 最新版は通称 C++14（2014年12月）と呼ばれ、2017年に C++17 、2020年に C++20 が登場予定
* [Unreal Engine](https://ja.m.wikipedia.org/wiki/Unreal_Engine)（3Dゲームエンジン）でも採用

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[Windows](https://ja.wikipedia.org/wiki/Microsoft_Windows) 10（64bit）|ー|
|開発環境|[MinGW](https://ja.wikipedia.org/wiki/MinGW) |ー|
|コンパイラ|[G++](http://bit.ly/2kOadCN) 5.3.0 |2015年12月|
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
        \>g++  --version  
        g++ (GCC) 5.3.0

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から [C/C++（Microsoft）](http://bit.ly/2mughye) を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に C++ フォルダを作成）に test<b>.cpp</b> という名で保存

1. コードの記述
```
//test.cpp
#include <iostream> //coutに必要
using namespace std; //countに必要

int main() {
    cout << "Hello,world!" << endl;
    return 0; //関数main()の終了部分
}
```

## コンパイル〜実行

1. コマンドプロンプトを起動

1. test.cpp ファイルのあるディレクトリに移動  
\>cd \Users\（ユーザー名）\Desktop\C++

1. コンパイル（.cpp → .exe）  
\>g++ -o test test.cpp

1. test.cpp ファイルと同階層に、指定した保存名のファイル（test.exe）が生成されているのを確認

1. 実行  
\>test.exe  
Hello,world! ←と表示されたら成功！

***
作成者: MUBIROU  
作成日: 2017年03月13日
