# C言語（ macOS ）

## C言語について

* 1972年に登場した汎用プログラミング言語
* クラスベースのオブジェクト指向ではないが、構造体を利用した高度なプログラミングが可能
* 比較的[低水準](http://bit.ly/2meoB4s)な言語のため、コンピュータの仕組みに詳しくなるという理由で「初心者が学ぶべき言語」とも言われる

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Catalina](https://ja.wikipedia.org/wiki/MacOS_Catalina) 10.15.6|2020年07月|
|統合開発環境|[Xcode](https://developer.apple.com/download/) 12.0 beta 4|2020年08月|
|エディタ|Visual Studio Code 1.47.3|2020年07月|
|拡張機能|C/C++（Microsoft） 0.29.0|ー|

1. [Xcode](https://ja.wikipedia.org/wiki/Xcode) のインストール  
    1. [Apple ID](https://appleid.apple.com/#!&page=signin) を用意し [Xcode](https://developer.apple.com/download/) にアクセス
    1. Xcode 12 beta 4 を [Download] を選択、指示に従ってダウンロード
    1. ダウンロードした Xcode_12_beta_4.xip をダブルクリックしインストール

1. ターミナルでコンパイラの動作確認  
    $ <b>gcc --version</b>  
    Configured with: --prefix=/Library/Developer/CommandLineTools/usr   --with-gxx-include-dir=/Library/Developer/CommandLineTools/SDKs/MacOSX10.15.sdk/usr/   include/c++/4.2.1  
    Apple clang version 12.0.0 (clang-1200.0.26.2)  
    Target: x86_64-apple-darwin19.6.0  
    Thread model: posix  
    InstalledDir: /Library/Developer/CommandLineTools/usr/bin  

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から C/C++（Microsoft） を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] → [テキストエディター] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に作成）に test<b>.c</b> という名で保存

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

1. Visual Studio Code で [表示] → [ターミナル] を選択

1. test.c ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop

1. コンパイル（.c → a.out）  
$ </b>gcc</b> test<b>.c</b>

1. test.c ファイルと同階層に a.out ファイルが生成されたのを確認

1. 実行  
$ <b>./a.out</b>  
Hello,world! ←と表示されたら成功！

***
作成者: 夢寐郎  
作成日: 2017年03月05日  
更新日: 2020年08月12日