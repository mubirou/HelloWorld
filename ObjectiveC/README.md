# Objective-C

## Objective-Cについて

* [C言語](https://github.com/TakashiNishimura/HelloWorld/blob/master/C/README.md)の上位互換言語
* [macOS](https://ja.wikipedia.org/wiki/MacOS) に標準付属の公式開発言語
* [iOS](http://bit.ly/2lw7f2p) アプリ開発に利用されてきたが徐々に [Swift](http://www.apple.com/jp/swift/) に移行されている

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|コンパイラ|gobjc（GNU Objective-C Compiler）4:5.3.1-1|不明|
|エディタ|Visual Studio Code 1.9.1|2017年01月|
|拡張機能|[C/C++ Clang](https://github.com/mitaki28/vscode-clang) 0.2.1|不明|

1. 端末でコンパイラ等のインストール  
    $ sudo apt-get update ←インストール済みパッケージのアップデート  
    $ sudo apt-get install build-essential  
    $ sudo apt-get install gobjc ←GNU Objective-C Compiler  
    $ sudo apt-get install libgnustep-base-dev  
    $ sudo apt-get install gnustep  
    $ sudo apt-get install gnustep-devel

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [機能拡張] から [C/C++ Clang](https://github.com/mitaki28/vscode-clang) を検索＆インストール

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

1. Visual Studio Code で [表示] → [総合ターミナル] を選択（端末でも可）

1. test.m ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/ObjectiveC

1. コンパイル  
$ gcc test.m

1. test.m ファイルと同階層に a.out ファイルが生成されたのを確認

1. 実行  
$ ./a.out  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月01日
