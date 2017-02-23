# C言語

## C言語について

* 1972年に登場した汎用プログラミング言語
* クラスベースのオブジェクト指向ではないが、構造体を利用した高度なプログラミングが可能
* 比較的、[低水準](http://bit.ly/2meoB4s)な言語のためにコンピュータの仕組みに詳しくなるという理由で「初心者が学ぶべき言語」とも言われる

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|Ubuntu 16.04.2 LTS|2017年02月|
|コンパイラ|[GCC](http://bit.ly/2kOadCN) 5.4.0 |2016年06月|
|エディタ|Visual Studio Code 1.9.1|2017年01月|
|拡張機能|C/C++（Microsoft） 0.10.1|2017年02月|

1. 端末でコンパイラのバージョン確認  
    $ gcc --version  
    gcc (Ubuntu 5.4.0-6ubuntu1~16.04.4) 5.4.0 20160609 ←Ubuntuのデフォルト  
    Copyright (C) 2015 Free Software Foundation, Inc.  
    This is free software; see the source for copying conditions.  There is NO  
    warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

1. Visual Studio Codeに拡張機能の追加  
    [表示]→[機能拡張] から C/C++（Microsoft） を検索しインストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル]→[新規ファイル] を選択
    1. [ファイル]→[保存] を選択
    1. 任意の場所（今回はデスクトップ上に C フォルダを作成）に test.c という名で保存

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

1. Visual Studio Code で [表示]→[総合ターミナル] を選択（端末でも可）

1. test.c ファイルのあるディレクトリに移動  
$ cd /home/（ユーザー名）/デスクトップ/C

1. コンパイル（.c → a.out）  
$ gcc test.c

1. test.c ファイルと同階層に a.out ファイルが生成されたのを確認

1. 実行  
$ ./a.out  
Hello,world! ←…と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年02月23日
