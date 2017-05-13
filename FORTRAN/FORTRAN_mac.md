# FORTRAN（ macOS ）

## FORTRANについて

* 1957年に登場した世界初の[高水準言語](http://bit.ly/2muGA71)
* 科学技術計算向きの[手続き型プログラミング言語](http://bit.ly/1Kf0zk6)
* Fortran 2003 からオブジェクト指向プログラミングもサポート
* 非常に多くの数学関数が用意され[スーパーコンピュータ](http://bit.ly/2lWpgK7)でも活用されている
* 長い歴史を持つ言語でありながら現在も進化を続けている（最新は Fortran 2008 ）

## 開発環境の構築

|カテゴリ|ソフトウェア|リリース|
|:--:|:--:|:--:|
|OS|[macOS Sierra](https://ja.wikipedia.org/wiki/MacOS_Sierra) 10.12.3|2017年01月|
|パッケージ管理システム|[Homebrew](http://bit.ly/2mr4lzk) 1.1.10|2016年11月|
|コンパイラ|[GFortran](https://ja.wikipedia.org/wiki/GFortran) 6.3.0|2016年12月|
|エディタ|Visual Studio Code 1.10.1|2017年03月|
|拡張機能|fortran 0.1.0|ー|

1. [Homebrew](https://brew.sh/index_ja.html) にアクセス
1. 指示に従ってターミナルでインストール  
    $ /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"  
    $ brew --version ←バージョン確認  
    Homebrew 1.1.10

1. ターミナルでコンパイラのインストール  
    $ brew install gcc  
    $ gfortran --version  
    GNU Fortran (Homebrew GCC 6.3.0_1) 6.3.0

1. Visual Studio Codeに拡張機能の追加  
    [表示] → [拡張機能] から fortran を検索＆インストール

## コードの記述

1. Visual Studio Code を起動
    1. [ファイル] → [新規ファイル] を選択
    1. [ファイル] → [保存] を選択
    1. 任意の場所（今回はデスクトップ上に FORTRAN フォルダを作成）に test<b>.f</b> という名で保存

1. コードの記述（<b>7文字目から書き始めます＝6文字空白</b>）
```
      !test.f
      program hello
        print *, "Hello,world!"
      end program hello
```

## コンパイル〜実行

1. Visual Studio Code で [表示] → [総合ターミナル] → [端末] を選択（ターミナルでも可）

1. test.f ファイルのあるディレクトリに移動  
$ cd /Users/（ユーザー名）/Desktop/FORTRAN

1. コンパイル（test.f → test）  
$ gfortran -o test test.f

1. test.f ファイルと同階層に test ファイル（実行ファイル）が生成されたのを確認

1. 実行  
$ ./test  
 Hello,world! ←と表示されたら成功！

***
作成者: Takashi Nishimura  
作成日: 2017年03月06日