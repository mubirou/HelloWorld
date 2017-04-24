# C++（ Linux ）

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
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|コンパイラ|G++ 5.4.0（ [GCC](http://bit.ly/2kOadCN) に同梱）|2016年06月|
|エディタ|Visual Studio Code 1.9.1|2017年01月|
|拡張機能|C/C++（Microsoft） 0.10.1|2017年02月|

1. 端末でコンパイラのバージョン確認  
    $ g++ --version  
    g++ (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609  

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から C/C++（Microsoft） を検索＆インストール

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

1. Visual Studio Code で [表示] → [総合ターミナル] を選択（端末でも可）

1. test.cpp ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/C++

1. コンパイル（.c → a.out）  
$ g++ -std=c++14 -o test test.cpp ←「g++ [-std=c++14] -o 保存名 xx.cpp」  
※「g++ --std=c++0x test.cpp」とすると a.out が生成される

1. test.cpp ファイルと同階層に、指定した保存名のファイル（test）が生成されているのを確認

1. 実行  
$ ./test  
Hello,world! ←と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年02月23日
