# Objective-C（ macOS ）

## Objective-Cについて

* [C言語](https://github.com/TakashiNishimura/HelloWorld/blob/master/C/README.md)の上位互換言語
* [macOS](https://ja.wikipedia.org/wiki/MacOS) に標準付属の公式開発言語
* [iOS](http://bit.ly/2lw7f2p) アプリ開発に利用されてきたが徐々に [Swift](http://www.apple.com/jp/swift/) に移行されている

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|統合開発環境|[Xcode](https://developer.apple.com/download/) 8.2.1|2016年12月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|C/C++ Clang Command Adapter 0.2.2|ー|

1. [Xcode](https://ja.wikipedia.org/wiki/Xcode) のインストール  
    1. [Apple ID](https://appleid.apple.com/#!&page=signin) を用意し [Xcode](https://developer.apple.com/download/) にアクセス
    1. Xcode 8.2.1 を [Download] を選択、指示に従ってダウンロード
    1. Xcode を開き、引き続き指示に従いインストール

1. ターミナルでコンパイラの動作確認  
    $ gcc --version  
    Configured with: --prefix=/Applications/Xcode.app/Contents/Developer/usr  
    --with-gxx-include-dir=/usr/include/c++/4.2.1  
    Apple LLVM version 8.0.0 (clang-800.0.42.1)  
    Target: x86_64-apple-darwin16.4.0

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [機能拡張] から C/C++ Clang Command Adapter を検索＆インストール

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

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. test.m ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/ObjectiveC

1. コンパイル  
$ gcc test.m

1. test.m ファイルと同階層に a.out ファイルが生成されたのを確認

1. 実行  
$ ./a.out  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月07日
