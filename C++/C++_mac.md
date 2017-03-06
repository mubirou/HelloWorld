# C++（ macOS ）

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
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|統合開発環境|[Xcode](https://developer.apple.com/download/) 8.2.1|2016年12月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|C/C++（Microsoft） 0.10.2|2017年03月|

1. [Xcode](https://ja.wikipedia.org/wiki/Xcode) のインストール  
    1. [Apple ID](https://appleid.apple.com/#!&page=signin) を用意し [Xcode](https://developer.apple.com/download/) にアクセス
    1. Xcode 8.2.1 を [Download] を選択、指示に従ってダウンロード
    1. Xcode を開き、引き続き指示に従いインストール

1. ターミナルでコンパイラの動作確認  
    $ gcc --version  
    Configured with: --prefix=/Applications/Xcode.app/Contents/Developer/usr  
    --with-gxx-include-dir=/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Develope  
    r/SDKs/MacOSX10.12.sdk/usr/include/c++/4.2.1  
    Apple LLVM version 8.0.0 (clang-800.0.42.1)  
    Target: x86_64-apple-darwin16.4.0  

1. Visual Studio Codeに拡張機能の追加  
    [表示]→[機能拡張] から C/C++（Microsoft） を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル]→[新規ファイル] を選択
    1. [ファイル]→[保存] を選択
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

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. test.cpp ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/C++

1. コンパイル（.c → a.out）  
$ g++ -o test test.cpp ←「g++ -o 保存名 xx.cpp」  
※「g++ --std=c++0x test.cpp」とすると a.out が生成される

1. test.cpp ファイルと同階層に、指定した保存名のファイル（test）が生成されているのを確認

1. 実行  
$ ./test ←「./保存名」で実行  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月05日