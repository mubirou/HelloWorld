# C言語（ macOS ）

## C言語について

* 1972年に登場した汎用プログラミング言語
* クラスベースのオブジェクト指向ではないが、構造体を利用した高度なプログラミングが可能
* 比較的[低水準](http://bit.ly/2meoB4s)な言語のため、コンピュータの仕組みに詳しくなるという理由で「初心者が学ぶべき言語」とも言われる

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
    [表示] → [機能拡張] から C/C++（Microsoft） を検索＆インストール

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

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. test.c ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/C

1. コンパイル（.c → a.out）  
$ gcc test.c

1. test.c ファイルと同階層に a.out ファイルが生成されたのを確認

1. 実行  
$ ./a.out  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月05日
